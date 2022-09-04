FROM python:3.8

RUN git clone --branch sqlite3 https://github.com/Vernik-S/NetStockProductDeploy code

WORKDIR /code

RUN pip install --no-cache-dir -r  requirements.txt

ARG ALLOWED_HOSTS
ARG SECRET_KEY



EXPOSE 8080

COPY entrypoint.sh /code/entrypoint.sh

RUN chmod +x /code/entrypoint.sh
ENTRYPOINT /code/entrypoint.sh

