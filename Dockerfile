# The image for Fly: wand, git and ssh, and deploy/boot.wand, which starts
# the server on the game's checkout in the volume at /data.
FROM debian:bookworm-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl git openssh-client \
  && rm -rf /var/lib/apt/lists/*

# The wand that runs the game. wand.pkg names the oldest one it accepts.
ARG WAND_VERSION=0.112.0
RUN curl -fsSL https://raw.githubusercontent.com/wand-lang/wand/main/install.sh \
  | WAND_VERSION=$WAND_VERSION WAND_INSTALL_DIR=/usr/local/bin sh

COPY --chmod=755 deploy/boot.wand /app/
COPY deploy/known_hosts /app/

# The package cache is on the volume, so a restart fetches nothing again.
ENV XDG_CACHE_HOME=/data/cache

CMD ["/app/boot.wand"]
