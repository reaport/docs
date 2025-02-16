# Базируемся на официальном swaggerapi/swagger-ui
FROM swaggerapi/swagger-ui:latest

# USER root

# Устанавливаем bash
RUN apk update && apk add --no-cache bash

# Создадим рабочую директорию для скриптов
# WORKDIR /usr/src/app

# Копируем наш кастомный entrypoint-скрипт
COPY docker/entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Копируем локальную папку с YAML-файлами
COPY openAPI /usr/share/nginx/html/openAPI

# Заменяем Entrypoint на наш скрипт
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]	