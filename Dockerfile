# Stage 1: Build stage for installing dependencies
FROM python:3.11-bullseye as builder

# Set up environment
ENV DEBIAN_FRONTEND=noninteractive

# Install ffmpeg and other system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Stage 2: Final container
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy application files to the container
COPY . .

# Copy ffmpeg from builder stage to the final container
COPY --from=builder /usr/bin/ffmpeg /usr/bin/ffprobe /usr/bin/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port for Render
ENV PORT 10000
EXPOSE $PORT

# Run the application
CMD ["python", "app.py"]
