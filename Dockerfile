# docker run -v $(PWD)/test:/data $(IMAGE_NAME) \
#   validate \
#   -s schema.json \
#   -d doc.json
FROM node:14.2.0-alpine3.11

ARG AJV_CLI_VERSION=3.3.0
RUN npm install -g ajv-cli@${AJV_CLI_VERSION}

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/ajv"]
