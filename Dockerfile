FROM debian:bookworm-slim

# Установка зависимостей
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        gnupg \
        && rm -rf /var/lib/apt/lists/*

# Установка Node.js 20.x
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Установка n8n
RUN npm install n8n -g

# Установка пользователя node
USER node
WORKDIR /home/node

# Запуск n8n с поддержкой PORT из окружения
CMD ["sh", "-c", "n8n start --port $PORT"]
