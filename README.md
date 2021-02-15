## Nmap Slack Bot

Get oAuth token from slack:
 1. https://api.slack.com/apps
 2. Create New App
 3. Provide App name and Workspace
 4. It will naviagte you to https://api.slack.com/apps/<app-id>
 5. Now click `OAuth & Permissions` under `Features` from left menu https://api.slack.com/apps/<app-id>/oauth?
 6. Under Scopes 'Bot Token Scopes' click on  `Add an OAuth Scope`
 7. Add `files:write`
 8. Reinstall to workspace
 9. Before that create a channel where you want to get notification of bot
10. Assign the bot to your channel
11. Now go back to https://api.slack.com/apps/<app-id>/oauth?
12. Copy the `Bot User OAuth Access Token`

## modification for this code
change the `<channel-id>` to your channel name like `#alerts`

on the `xxxx-xxxx-xxxx-xxxx` replace it with your `Bot User OAuth Access Token`

## Usage
```
$ nmapBot.sh domains.txt
```
