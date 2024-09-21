python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic
gunicorn backend.wsgi:aplication --bind 0.0.0.0:9000