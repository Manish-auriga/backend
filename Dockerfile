# multi stage build --------------------------------------

FROM python
ENV PYTHONUNBUFFERED 1
WORKDIR /django
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .   


CMD ["sh", "-c", "python manage.py migrate && python manage.py shell < create_superuser.py && gunicorn backend.wsgi --bind 0.0.0.0:8000"]


    
# FROM python:3.10-alpine as base 

# RUN apk add --update --virtual .build-deps \
#     build-base \
#     postgresql-dev \
#     python3-dev \
#     libpq

# WORKDIR /app

# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt


# FROM python:3.10-alpine
# RUN apk add libpq
# COPY --from=base /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
# COPY --from=base /usr/local/bin/ /usr/local/bin/
# COPY . .

# EXPOSE 8000

# CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]




# single build --------------------------------------


# FROM python:3.10

# WORKDIR /app

# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# ENV DEBUG=True
# ENV DB_NAME=mydatabase
# ENV DB_USER=myuser
# ENV DB_PASSWORD=mypassword
# ENV DB_HOST=postgres_db
# ENV DB_PORT=5432

# EXPOSE 8000

# CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
