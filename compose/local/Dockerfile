FROM python:3.7-alpine

ENV USER="django"
ENV PYTHONUNBUFFERED 1
ENV TZ=America/Tijuana

WORKDIR /app

RUN apk add --update --no-cache \
  && apk add --no-cache bash \
  && apk add py3-psycopg2 \
  && pip3 install --upgrade pip

RUN addgroup --system ${USER} \
  && adduser --system -g ${USER} ${USER}

COPY --chown=${USER}:${USER} ./requirements/ /requirements/
COPY --chown=${USER}:${USER} ./compose/local/entrypoint.sh /entrypoint.sh
COPY --chown=${USER}:${USER} ./src /app

RUN pip install --no-cache-dir -r /requirements/local.txt \
      && rm -rf /requirements

RUN sed -i 's/\r$//g' /entrypoint.sh \
      && chmod +x /entrypoint.sh

USER ${USER}

ENTRYPOINT ["/entrypoint.sh"]
