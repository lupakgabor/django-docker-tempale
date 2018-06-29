#!/usr/bin/env bash

# Print all environment variable in container
printenv

python manage.py migrate --noinput

# python manage.py collectstatic --noinput

# python manage.py compilemessages

if [ "$ENV" = "dev" ]
then
    echo "Dev environment"
    exec "$@"
else
    echo "Prod environment"
    exec /usr/local/bin/gunicorn admin.wsgi:application -w 2 -b :8000 --chdir /src
fi
