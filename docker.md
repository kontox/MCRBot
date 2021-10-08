[![Build Status](https://app.travis-ci.com/kontox/MCRBot.svg?branch=master)](https://app.travis-ci.com/kontox/MCRBot)

# Create config file
Create a copy of the _config.ts (found in the repo) called config.ts and place it in a different folder for example $HOME/mcrbot

`mkdir $HOME/mcrbot`

`mkdir $HOME/mcrbot/data`

`cp _config.ts $HOME/mcrbot/config.ts` 

Edit the config file and add your API keys and other settings. Verify that the content is correct. 

# Run docker container
You can run the container detached with the config folder mounted

`docker run --name mcrbot -d --restart always \\`

`--mount "type=bind,source=$HOME/mcrbot,destination=/home/mcrbot/conf/,readonly" \\`

`--mount "type=bind,source=$HOME/mcrbot/data,destination=/home/mcrbot/data/" \\`

` kontox/mcrbot:latest`

# Check logs
Use the following command for checking the logs. The --timestamps parameter is important otherwise you'll not see the time

`docker logs --timestamps mcrbot`

# Updating the docker container
To update the container, stop it using `docker stop mcrbot` and delete the image using `docker image rm kontox/mcrbot` . After that just run it again. It should fetch the latest version.

# Deleting the container
Stop the container `docker stop mcrbot`and delete it `docker container rm mcrbot`
