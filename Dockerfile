# Set image
ARG tag=lts
FROM node:$tag

#Add user, copy the default _config.ts  and change owner
RUN useradd -m -s /bin/bash mcrbot && \
    mkdir /home/mcrbot/conf && \
    chown -R mcrbot:mcrbot /home/mcrbot

VOLUME /home/mcrbot/conf
VOLUME /home/mcrbot/data
USER mcrbot:mcrbot
WORKDIR /home/mcrbot

# Copy content
COPY --chown=mcrbot:mcrbot . .

# install dependencies
RUN cp /home/mcrbot/template/_config.ts /home/mcrbot/config.ts && \
    chmod +x docker-entrypoint.sh && \
    npm install && \
    ./node_modules/.bin/tsc 

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD [ "node", "index.js" ]
