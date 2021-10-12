FROM alpine

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh 

RUN apk --no-cache add nodejs npm su-exec; \
    mkdir -p /mcrbot/data ; \
    chmod +x /usr/local/bin/docker-entrypoint.sh
    
VOLUME /mcrbot/data
WORKDIR /mcrbot

COPY . .

# install dependencies
RUN npm install; \
# workaround for automatic update to avoid throwing an error
    touch update.sh 

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD [ "node", "index.js" ]
