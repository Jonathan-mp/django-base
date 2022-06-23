#!/bin/bash

uvicorn base.asgi:application --port 80 --host 0.0.0.0 --reload --log-level=debug
#/usr/local/bin/gunicorn base.asgi -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:80 --log-level=debug --timeout 240 --chdir=/app/src
