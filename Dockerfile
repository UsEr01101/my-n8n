FROM node:20-slim

# Установка зависимостей ОС
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Создание директории приложения
WORKDIR /app

# Установка n8n как локальной зависимости
RUN npm install n8n

# Запуск от root (Render разрешает)
CMD ["sh", "-c", "npx n8n start --port $PORT --host 0.0.0.0 --tunnel false"]
