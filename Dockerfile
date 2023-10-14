# I'll start by using an official Python runtime as a base image
FROM python:3.8-slim-buster

# I'll set the working directory in the container to /app
WORKDIR /app

# Now, I'll copy the contents of the current directory into the container at /app
COPY . /app

# I'll install any necessary packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
