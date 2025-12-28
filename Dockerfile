# Dockerfile
FROM python:3.13-slim

WORKDIR /app

# Basic apt update
RUN apt update

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt