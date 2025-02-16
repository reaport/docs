# Reaport Docs

[![Swagger-UI](https://img.shields.io/badge/Swagger-UI-brightgreen?logo=swagger)](https://docs.reaport.ru/)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-black?logo=github)](https://github.com/reaport)
[![Miro](https://img.shields.io/badge/Miro-Board-blue?logo=miro)](https://miro.com/app/board/uXjVLlFVjVE=)
[![Kaiten](https://img.shields.io/badge/Kaiten-Tasks-red?logo=kaiten)](https://julia89649117555.kaiten.ru/space/530676/boards?focus=card&focusId=44921545)

Описание API для всех модулей аэропорта.

---

### Полезные ссылки:

- **Swagger Editor**:  
  [![Swagger](https://img.shields.io/badge/Swagger-Editor-brightgreen?logo=swagger)](https://editor.swagger.io/)  
  Редактор для работы с OpenAPI-спецификациями.

---

### Для локального запуска swagger-ui:
1. Склонируйте репозиторий
```bash
git clone https://github.com/reaport/docs.git
```
2. Перейдите в папку с репозиторием
```bash
cd docs
```
3. Соберите образ
```bash
docker build -t my-swagger-ui -f ./docker/Dockerfile .
```
4. Запустите контейнер
```bash
docker run -p 8080:8080 my-swagger-ui
```

---

**Примечание:**  
Если у вас есть вопросы или предложения, свяжитесь с командой разработчиков через GitHub или Kaiten.
