# Set image
ARG tag=lts
FROM node:$tag

#Add user, copy the default _config.ts  and change owner
RUN useradd -m -s /bin/bash mcrbot && \
    mkdir /home/mcrbot/data && \
    chown -R mcrbot:mcrbot /home/mcrbot

VOLUME /home/mcrbot/data
USER mcrbot:mcrbot
WORKDIR /home/mcrbot

# Copy content
COPY --chown=mcrbot:mcrbot . .

# install dependencies
RUN cp /home/mcrbot/template/_config.ts /home/mcrbot/config.ts && \
    chmod +x docker-entrypoint.sh && \
    npm install

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD [ "node", "index.js" ]
