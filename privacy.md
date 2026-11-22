---
title: Privacy policy
---

# Privacy policy

Last updated: 22 November 2026

me-sim and me-studio are desktop tools that run only on the computer of the creator who uses them. They post
videos to that creator's own YouTube, Instagram and TikTok accounts. This policy explains what they do with
data. There is no server operated by the author, no analytics, no tracking, and no sharing of data with anyone
other than the platform you post to.

## YouTube

The tool uses YouTube API Services. By signing in you also agree to the
[YouTube Terms of Service](https://www.youtube.com/t/terms), and Google handles your data under the
[Google Privacy Policy](https://policies.google.com/privacy).

- **Access asked for.** The scopes `youtube.upload` and `youtube`, on your own channel only.
- **What is sent.** Your videos, their titles, descriptions, tags and privacy status, thumbnails, and requests
  to add a video to or remove it from one of your playlists, to change a video's details, or to create a
  playlist. These go to YouTube only, when you post or change a video.
- **What is read.** Your channel's uploads playlist and your own playlists with their items, the upload and
  processing status of your videos, each video's view, like and comment counts, and your channel's subscriber
  count. The subscriber count is a single aggregate number; the tools never read who your subscribers are. This
  is used to confirm that a post went through, to schedule the next one and to show you how your videos and
  audience perform. It does not read the text of comments, the list of subscribers or any other account data.
- **What is stored on your computer.** The access and refresh tokens Google issues, and a ledger of the
  videos posted (video ids, titles, times). The view, like and comment counts and the subscriber count are kept
  in a local database.
- **Use of Google data.** Data received from Google APIs is used only to provide and improve these tools'
  features for you. It is not transferred to anyone, not used for advertising, and not read by people. The
  tools' use of information received from Google APIs adheres to the
  [Google API Services User Data Policy](https://developers.google.com/terms/api-services-user-data-policy),
  including its Limited Use requirements.
- **Revoke access.** Remove the tool at
  [myaccount.google.com/permissions](https://myaccount.google.com/permissions).

## Instagram

- **Access asked for.** On the Instagram Login route, `instagram_business_basic` and
  `instagram_business_content_publish`. On the Facebook Login route, `instagram_basic`,
  `instagram_content_publish`, `pages_show_list`, `pages_read_engagement` and `business_management`.
- **What is sent.** Your videos and captions, to publish them as Reels on your own account.
- **What is read.** Your account id, your linked Facebook Pages (Facebook route only), the publishing status and
  quota, each Reel's link, time, view, like and comment counts, and your account's follower count. The follower
  count is a single aggregate number; the tools never read who your followers are. It does not read the text of
  comments, messages or the list of followers.
- **What is stored on your computer.** The access token, a ledger of posts and a log of publishing attempts.
  The Reel counts and the follower count are kept in the local database.
- **Revoke access.** In Instagram under Settings, Apps and websites, or in Facebook under Settings, Business
  integrations, remove the app.

## TikTok

- **Access asked for.** `user.info.basic`, `video.upload` and `video.publish`.
- **What is sent.** Your videos and captions, to post them to your own account.
- **What is read.** Your display name and the posting options your account allows, and the status of a post.
  The tool does not read view, like or comment counts from TikTok.
- **What is stored on your computer.** The access and refresh tokens, and the ledger of posts.
- **Revoke access.** In TikTok under Settings and privacy, Security and permissions, Apps and services.

## Where data is kept and how to delete it

Everything the tools store is on your own computer. The access and refresh tokens are kept in one of two
places, depending on a setting: token files in your user folder (`~/.config/me-sim`), or the Windows Credential
Manager. The ledger of posts is in the project folder, and a local database holds the video counts and the
audience counts (subscribers and followers). Delete these files, and the tokens from either place, to remove
everything the tools hold, and revoke access in the platform's settings as above to invalidate the tokens. Videos already
posted stay on the platforms until you delete them there.

## Changes

This policy may change; the date above says when it last did.

Contact: kornasevich@gmail.com
