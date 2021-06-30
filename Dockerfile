# Dependency Image
FROM devanggaur7/terrascan:sarif-test-1 as terrascan

# Base Image
FROM alpine:3.13

RUN apk update && \
    apk add git

# Install Terrascan
COPY --from=terrascan /go/bin/terrascan /usr/bin/
RUN terrascan init

# Handles entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
