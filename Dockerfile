FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g n8n

USER node
WORKDIR /home/node

# Запускаем n8n с правильными параметрами
CMD ["sh", "-c", "n8n start --port $PORT --host 0.0.0.0 --tunnel false"]
