#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

external=0
in_container=0
for arg in "$@"; do
    case "$arg" in
        --external) external=1 ;;
        --in-container) in_container=1 ;;
        *) echo "usage: scripts/check.sh [--external]" >&2; exit 2 ;;
    esac
done

run_hygiene() {
    if command -v typos >/dev/null; then
        echo "== typos"
        typos
    else
        echo "== typos not installed here; CI runs it" >&2
    fi
    if command -v gitleaks >/dev/null; then
        echo "== gitleaks"
        gitleaks git --no-banner .
    else
        echo "== gitleaks not installed here; CI runs it" >&2
    fi
}

if ! command -v bundle >/dev/null && [ "$in_container" = 0 ]; then
    if ! command -v docker >/dev/null; then
        echo "check.sh needs Ruby with bundler, or Docker" >&2
        exit 1
    fi
    echo "== no Ruby here; running the gate in the ruby:3.3 container"
    forward=(--in-container)
    [ "$external" = 1 ] && forward+=(--external)
    root=$(pwd -W 2>/dev/null || pwd)
    MSYS_NO_PATHCONV=1 docker run --rm \
        -v "$root:/srv" -w /srv \
        -v me-sim-site-bundle:/usr/local/bundle \
        ruby:3.3 bash scripts/check.sh "${forward[@]}"
    status=$?
    for tool in typos gitleaks; do
        command -v "$tool" >/dev/null || echo "== $tool not installed here; CI runs it" >&2
    done
    command -v typos >/dev/null && typos
    command -v gitleaks >/dev/null && gitleaks git --no-banner .
    exit "$status"
fi

echo "== bundle install"
bundle install --quiet

echo "== jekyll build"
rm -rf _site
bundle exec jekyll build --strict_front_matter --trace

echo "== TikTok signature files"
shopt -s nullglob
signatures=(tiktok*.txt)
if [ "${#signatures[@]}" = 0 ]; then
    echo "no tiktok*.txt signature file at the root" >&2
    exit 1
fi
for file in "${signatures[@]}"; do
    cmp "$file" "_site/$file"
    echo "ok $file"
done

echo "== links"
proofer_args=(--enforce-https --ignore-missing-alt)
if [ "$external" = 0 ]; then
    proofer_args+=(--disable-external)
fi
bundle exec htmlproofer "${proofer_args[@]}" _site

if [ "$in_container" = 1 ]; then
    exit 0
fi
run_hygiene
echo "== gate passed"
