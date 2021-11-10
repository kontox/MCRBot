# MCRBot
**This bot has both a DCA feature (Dollar Cost Averaging) and will also keep your portfolio balanced automatically. The coins in your portfolio can be either chosen manually, or automatically by market cap ranking. It is also supporting Webhooks for Discord.**

## Requirements
The bot is running on NodeJS and it is presumed you will want to run it with a process manager such as PM2, to automatically restart it in case of failure and keep it running when you detach from the terminal session. The following steps will make sure you have all prerequisits installed and the repository downloaded.
##### Install NodeJS
Both the bot itself as well as the process manager will be run on NodeJS. You can install NodeJS with `apt-get install nodejs`.

After NodeJS is installed, check the version with `node -v`. The required minimum version is 14. If the version shown is lower than that, you can upgrade it by executing the following command:

`curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -`

After you have done that, you can install the new NodeJS version by executing `apt-get install nodejs` again.
##### Install PM2
PM2 is a process manager that will keep your bot running as well as restart it after failure. It can be installed with `npm install pm2 -g`.
##### Install Logrotate
The log file generated by the process manager will grow indefinitely. To prevent that, we are going to install logrotate, which will neatly split up our log file into several log files (one for each day) and delete files that are older than 30 days. It can be installed with `pm2 install pm2-logrotate`.
##### Install Git
Git will be used to clone the repository and keep the bot up to date. You can install it with `apt-get install git`.

## Setup
We now need to download and compile the source code and install the package requirements. The following steps will lead you through that process.
##### Clone MCRBot
Navigate to the folder you want MCRBot to be located in. Then run `git clone https://github.com/Thornsnake/MCRBot.git` to clone the repository.
##### Compile the Bot
Navigate into the bot folder and run `sh install.sh` to download all package requirements and compile the source code. You will be asked to give this bot a unique name, so the process manager can tell them apart, in case you want to run more than one.

## Configuration
To configure the bot, open the `config.ts` file with your favorite file editor and you should see the following list of configuration options.

| Option                     | Type     | Description
| -------------------------- | -------- | ---
| APIKEY                     | string   | The API key from the crypto.com exchange.
| SECRET                     | string   | The secret key from the crypto.com exchange.
| SCHEDULE > TRAILING_STOP   | string   | The interval for the trailing stop check in cron format. Defaults to `every minute at the 30 second mark`.
| SCHEDULE > INVESTING       | string   | The interval for the DCA investing in cron format. Defaults to `every day, 3 minutes after midnight`.
| SCHEDULE > REBALANCE       | string   | The interval for the portfolio rebalancing in cron format. Defaults to `every 5 minutes`.
| QUOTE                      | string   | The quote currency used on the exchange. Can be `USDT`, `USDC`, `BTC` or `CRO`.
| INVESTMENT                 | number   | The amount of quote currency invested during each investment interval. This will be split over all coins.
| TOP                        | number   | The top X coins by market cap to invest into and rebalance. Set this to `0` if you want to manually manage all coins.
| REMOVAL                    | number   | The number of hours the bot should wait before selling a coin that has fallen out of the top x coins by market cap.
| INCLUDE                    | string[] | A list of coins to always invest in and rebalance, even if they are not within the market cap.
| EXCLUDE                    | string[] | A list of coins to never invest in or rebalance, even if they are within the market cap.
| THRESHOLD                  | number   | The threshold in percent that a coin's value can deviate from the average before being rebalanced.
| WEIGHT                     | object   | The weight in percent a coin should have in the portfolio. The remaining weight will be split over all other coins.
| TRAILING_STOP > ACTIVE     | boolean  | Whether the trailing stop is active or not.
| TRAILING_STOP > MIN_PROFIT | number   | The minimum amount of profit the bot must make before the trailing stop is switched to active. If this is not triggered, the bot will just keep doing DCA.
| TRAILING_STOP > MAX_DROP   | number   | The maximum amount of value the portfolio is allowed to lose from its all time high before the trailing stop triggers and your portfolio is sold.
| TRAILING_STOP > RESUME     | number   | The amount of hours to wait before resuming to DCA and rebalance after the trailing stop has been triggered.
| IDLE_MESSAGE               | string   | A message that will be shown when the bot had nothing to rebalance, as opposed to just logging nothing.
| WEBHOOKS                   | object   | Post messages to social media platforms via webhooks when there is a new investment, rebalance or trailing stop hit.
| AUTO_UPDATE                | boolean  | Automatically check for updates every 24 hours and (if one was found) install them. Will restart the bot automatically after the update.
| DRY                        | boolean  | Dry run. Don't execute the orders on the exchange. This is a debug feature.

If you need more detailed explanations what each option does, read the comments in the configuration file. They should explain things well enough. When you are done, save the file.

## Starting, Restarting and Stopping
You can easily start, restart and stop the bot by executing the corresponding scripts, either with `sh start.sh`, `sh restart.sh` or `sh stop.sh`.

## Monitoring and Logs
To monitor your currently running bot, enter `pm2 monit` and select it with the arrow keys in the list on the left.
If you would like to check the log files, you can usually find them under `/root/.pm2/logs/` or you can check the latest log lines with `pm2 logs MCRBot`. For more PM2 commands, visit the [Quick Start Page](https://pm2.keymetrics.io/docs/usage/quick-start/).

## Updating the Bot
To update the bot to the newest version, execute `sh update.sh`. This will also automatically restart your bot after the update. Your current configuration will remain the same.

You can also activate the `AUTO_UPDATE` option in the config file for automatic updates from Github every 24 hours.