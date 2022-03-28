FROM python:3.9.12-alpine
LABEL maintainer='John Lee john791016@gmail.com'

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN apk update \
    && apk add libpq-dev gcc

RUN pip install -r /requirements.txt

# create a directory for the app in the container.
RUN mkdir /app 
# def the app directory as the working directory.
WORKDIR /app
# copy the app to the container.
COPY ./app /app/

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
#create user called 'user' to run the app only.
# If not doing this app will run in root account which is not recommand. 
# RUN adduser -D user
# USER user


#after setting up the dockerfile
# run the dockerfile to build the image.
#type "docker build ." in terminal. 