# Use a base image that includes Python and ffmpeg
FROM python:3.11-slim-bullseye

# Set environment variable to disable interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install ffmpeg using a direct URL download method without apt-get
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L https://john
