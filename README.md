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
docker cp 2910789961bc:/srv/data_client/Pipfile.lock . \
docker cp 2910789961bc:/srv/data_client/Pipfile .
```

# CI/CD

Настроена сборка в [Docker Hub](https://hub.docker.com/repository/docker/adzhumurat/workshop-image/builds).

Чтобы запустить сборку в `hub.docker.com`, на локальной машинe нужно выполнить `bash assets/create_tag.sh`.

В github будет запушен тэг, который инициирует сборку образа в Docker Hub.