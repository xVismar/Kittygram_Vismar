![Workflow Status](https://github.com/xVismar/kittygram_final/actions/workflows/main.yml/badge.svg)
![](https://repository-images.githubusercontent.com/860526781/7c04e35a-5628-4b51-bdb6-8586ed1711d0)
# О проекте

### Что можно в Kittygram?
- Регистрироваться на сайте
- Добавлять котиков (с картинкой!)
- Просматривать профили отдельных котиков
- API функционал также доступен, помимо Frontend версии сайта


# Проект контейнеры и CI/CD для Kittygram

Проект настройки и запуска проектов в контейнерах, настройки автоматического тестирования и деплоя на удалённый сервер.

# Стек технологий
- Python
- Django
- Gunicorn
- Djangorestframework
- Postgresql

Полный перечень библиотек, модулей и их версии можно посмотреть в `backend/requirements.txt`

# Инструкция по запуску
1. Форкнуть репозиторий проекта: xvismar/kittygram_final на свой аккаунт GitHub
2. Клонировать форкнутый репозиторий на локальную машину или VM сервер.
3. В репозитории проекта - Во вкладке ```Settings - Secrets and variables - Actions``` обозначить и сохранить следующие не публичные данные:

```

Логин и пароль вашего профиля на Docker.com:
- DOCKER_USERNAME  -- # Имя профиля на DockerHub
- DOCKER_PASSWORD  -- # Пароль от профиля на DockerHub

Данные удалённого сервера:
- HOST  -- # IP-адрес вашего сервера
- USER  -- # Имя пользователя для подключения к удаленному серверу
- SSH_KEY  -- # Приватный SSH-ключ (Сам текст из ключа, весь)
- SSH_PASSPHRASE -- # passphrase для приватного ключа SSH

Данные для отправки сообщения о деплое проекта:
- TELEGRAM_TO -- # ID пользователя, которому отправляется сообщение об успешном деплое проекта (Ваш Telegram ID)
- TELEGRAM_TOKEN -- # Bot API Token (токен вашего Бота в телеграм , через которого отправляется сообщение, получить можно через @botfather)
```

4. На сервере:
Создайте файл-окружения для секретных переменных (`.env`)

```
cd
mkdir kittygram/
cd kittygram
touch .env
```
В файл `.env` поместить:
SECRET_KEY # - Секретный ключ Вашего Джанго проекта
ALLOWED_HOSTS # - Через запятую, без ковычек Ваши разрешенные хосты


- Определить базовые настройки `location` и `server` в секции в файле `/etc/nginx/sites-enabled/default`:

```
server {
    server_name <IP-адрес вашего сервера> <доменное имя вашего сайта>;
    location / {
        proxy_set_header Host $http_host;
        proxy_pass http://127.0.0.1:9000;
    }
}

```

5. После добавления всех необходимых переменных и секретов - сделайте `push` в Ваш `GitHub` репозиторий
```
git add .
git commit -m "<ваше сообщение коммита>"
git push
```

# Авторы
[Команда Яндекс Практикума [yandex-praktikum]](https://github.com/yandex-praktikum)
[Aлексеев Алексей (Vismar)](https://github.com/xVismar)    
