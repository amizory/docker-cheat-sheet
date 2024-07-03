#Dockerfiles

#1 WEB
FROM python:3.9-slim
RUN pip install -r requirement.txt 
COPY . /app
WORKDIR /app
ENV FLASK_APP=app.py
ENV FLASK_ENV=development
CMD ["flask", "run", "--host=0.0.0.0"]

#2 DB
FROM postgres:13
ENV POSTGRES_USER=user123
ENV POSTGRES_PASSWORD=simplepass0000
ENV POSTGRES_DB=awfulDB 
RUN initDB