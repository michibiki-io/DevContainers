FROM ubuntu:24.10

# 非対話型でパッケージを入れる
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends vim fish git curl wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# デフォルトシェルを fish に
SHELL ["/usr/bin/fish", "-c"]
CMD ["sleep", "infinity"]
