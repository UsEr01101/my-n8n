# Используем официальный Debian как базу
FROM debian:bookworm-slim

# Устанавливаем зависимости
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        gnupg \
        && rm -rf /var/lib/apt/lists/*

# Устанавливаем Node.js (n8n требует Node >= 18)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Устанавливаем n8n глобально
RUN npm install n8n -g

# Создаём директорию для данных (опционально)
RUN mkdir -p /home/node/.n8n

# Переключаемся на пользователя node (безопасность)
USER node
WORKDIR /home/node

# Запускаем n8n
CMD ["n8n", "start"]
