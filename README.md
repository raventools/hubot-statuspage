# Hubot StatusPage

Interaction with the StatusPage.io API to open and update incidents, change component status.

[![Build Status](https://travis-ci.org/raventools/hubot-statuspage.png)](https://travis-ci.org/raventools/hubot-statuspage)

## Configuration

* Register the two values as environment variables when starting your bot (as usual with Hubot scripts).
 * `export HUBOT_STATUS_PAGE_ID=page_id_for_account`
 * `export HUBOT_STATUS_PAGE_TOKEN=token_for_status_page`
 * `export HUBOT_STATUS_PAGE_TWITTER_ENABLED=t_or_f`

If you are using Heroku to host your bot, replace `export ...` with `heroku set:config ...`.

## Adding to Your Hubot

See full instructions [here](https://github.com/github/hubot/blob/master/docs/scripting.md#npm-packages).

1. `npm install hubot-statuspage --save` (updates your `package.json` file)
2. Open the `external-scripts.json` file in the root directory (you may need to create this file) and add an entry to the array (e.g. `[ 'hubot-statuspage' ]`).

## Commands

- `hubot status?` - Display an overall status of all components
- `hubot status <component>?` - Display the status of a single component
- `hubot status <component>` (degraded performance|partial outage|major outage|operational) - Set the status for a component. You can also use degraded, partial or major as shortcuts.
- `hubot status incidents` - Show all unresolved incidents
- `hubot status open (investigating|identified|monitoring|resolved) <name>: <message>` - Create a new incident using the specified name and message, setting it to the desired status (investigating, etc.). The message can be omitted
- `hubot status update <status> <message>` - Update the latest open incident with the specified status and message.
