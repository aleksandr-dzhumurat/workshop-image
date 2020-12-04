#!/bin/bash -e

case "$1" in
  load)
    pipenv run python3 load_data.py
    ;;
  service)
    pipenv run python3 src/simple_service.py
    ;;
  psql)
    psql -h postgres_host -U postgres
    ;;
  jupyter)
    pipenv run jupyter notebook jupyter_notebooks --ip 0.0.0.0 --port 8888 --no-browser --allow-root
    ;;
  *)
    exec "$@"
esac