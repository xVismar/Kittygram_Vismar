python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic
gunicorn backend.wshi:aplication --bind 0.0.0.0:8000