# workshop-image

Python-окружение для курса "Работа с данными"

Запуск контейнера

```shell
 docker run -it --rm adzhumurat/workshop-image:release-20.12.6 bash
```

# Локальная сборка

```shell
docker build -t workshop_image:dev .
```

Запускаем собранный контейнер и подключаемся в терминал:

```shell
docker run -it --rm workshop_image:dev bash
```

Запускаем обновление пакета

```shell
pipenv install requests==2.20.0
```

Копируем обновлённые файлы с зависимостями
```shell
DOCKER_CONTAINER=$(docker ps -q --filter "ancestor=workshop_image:dev") && docker cp "$DOCKER_CONTAINER:/srv/data_client/Pipfile.lock" ./assets && docker cp "$DOCKER_CONTAINER:/srv/data_client/Pipfile" ./assets
```

# CI/CD

Настроена сборка в [Docker Hub](https://hub.docker.com/repository/docker/adzhumurat/workshop-image/builds).

Чтобы запустить сборку в `hub.docker.com`, на локальной машинe нужно

* закоммитить изменения в своей ветке
* переключиться в мастер-ветку `git checkout main`
* замержить ветку `git merge --no-ff ВЕТКА_С_ИЗМЕНЕНИЯМИ` 
* выполнить `bash assets/create_tag.sh`.

В github будет запушен тэг, который инициирует сборку образа в Docker Hub.