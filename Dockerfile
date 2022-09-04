FROM python:3.8

RUN git clone --branch sqlite3 https://github.com/Vernik-S/NetStockProductDeploy code

WORKDIR /code

RUN pip install --no-cache-dir -r  requirements.txt

ARG ALLOWED_HOSTS
ARG SECRET_KEY


RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8080

CMD gunicorn stocks_products.wsgi -b 0.0.0.0:8080
#CMD sh

