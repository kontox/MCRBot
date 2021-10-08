# Docker build
Clone the content `git clone https://github.com/Thornsnake/MCRBot.git`
Navigate into the bot folder and build docker container using `docker build -t mcrbot .`

# Create config file
Create a copy of the _config.ts file called config.ts and place it in a different folder for example $HOME/mcrbot

`mkdir $HOME/mcrbot`
`cp _config.ts $HOME/mcrbot/config.ts` 

Edit the config file and add your API keys and other settings. Verify that the content is correct. 

# Run docker container
You can run the container detached with the config folder mounted
`docker run --name mcrbot -d --restart always --mount "type=bind,source=$HOME/mcrbot,destination=/home/mcrbot/conf/,readonly" mcrbot:latest`

# Check logs
Use the following command for checking the logs. The --timestamps parameter is important otherwise you'll not see the time
`docker logs --timestamps mcrbot`

# Updating the docker container
To update the container, stop it using `docker stop mcrbot` and then run again the build process as stated above. After that run the docker container again using the command above.

# Deleting the container
Stop the container `docker stop mcrbot`and delete it `docker container rm mcrbot`
