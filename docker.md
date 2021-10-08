[![Build Status](https://app.travis-ci.com/kontox/MCRBot.svg?branch=master)](https://app.travis-ci.com/kontox/MCRBot)

# Create config file
Create a copy of the _config.ts (found in the repo) called config.ts in $HOME/mcrbot and edit the config file and add your API keys and other settings. Verify that the content is correct. 

Create a folder called data in $HOME/mcrbot

# Run docker container
You can run the container detached with the config folder mounted

`docker run --name mcrbot -d --restart always -v $HOME/mcrbot/config.ts:/home/mcrbot/config.ts -v $HOME/mcrbot/data/:/home/mcrbot/data/ kontox/mcrbot:latest`


# Check logs
Use the following command for checking the logs. The --timestamps parameter is important otherwise you'll not see the time

`docker logs --timestamps mcrbot`


# Updating the docker container
To update the container, stop it using `docker stop mcrbot`,delete the container using `docker rm mcrbot` and also the image using `docker image rm kontox/mcrbot` . After that just run it again. It should fetch the latest version.

# Deleting the container
Stop the container `docker stop mcrbot`and delete it `docker container rm mcrbot`
