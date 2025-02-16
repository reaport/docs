#!/usr/bin/env bash
set -e

# Папка в контейнере, где лежат OpenAPI YAML-файлы
OPENAPI_DIR="/usr/share/nginx/html/openAPI"

if [ ! -d "$OPENAPI_DIR" ]; then
  echo "Directory $OPENAPI_DIR does not exist!"
  echo "You may want to mount or copy your YAML files there."
fi

# Формируем массив JSON для переменной URLS:
#
#   [
#     { url: "/openAPI/registration.yaml", name: "registration" },
#     { url: "/openAPI/login.yaml",        name: "login" },
#     ...
#   ]
#
URLS_ARRAY="["

# Перебираем все файлы с расширением .yaml или .yml
for file_path in "$OPENAPI_DIR"/*.yaml "$OPENAPI_DIR"/*.yml; do
  # Если файла нет (сценарий: *.yml не найдено), идём дальше
  if [ ! -f "$file_path" ]; then
    continue
  fi
  filename="$(basename "$file_path")"
  name="${filename%%.*}"

  # Добавляем запятую, если это не первый элемент массива
  if [ "$URLS_ARRAY" != "[" ]; then
    URLS_ARRAY="$URLS_ARRAY, "
  fi

  URLS_ARRAY="$URLS_ARRAY{ url: \"/openAPI/$filename\", name: \"$name\" }"
done

URLS_ARRAY="$URLS_ARRAY ]"

# Если переменная URLS не задана извне, используем сформированный список
if [ -z "$URLS" ]; then
  export URLS="$URLS_ARRAY"
fi

echo "Swagger UI будет запущен с URLS=$URLS"

# ВАЖНО: вызываем нативный entrypoint образа swaggerapi/swagger-ui,
# чтобы он в конце запустил nginx
exec /docker-entrypoint.sh "$@"