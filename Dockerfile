# Используем официальный образ n8n (Debian-based)
FROM n8nio/n8n:latest

# Устанавливаем curl через apt (не apk!)
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Не меняем пользователя — n8n уже работает от node
EXPOSE 5678

# Команда по умолчанию уже задана в базовом образе
# CMD ["start"] — не нужно дублировать
