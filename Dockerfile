# Use a slim Python image as the base
FROM python:3.11-slim

# Disable interactive prompts in the container
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Copy app files to the container
COPY . .

# Update package lists and install ffmpeg
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port for Render
ENV PORT 10000
EXPOSE $PORT

# Run the app
CMD ["python", "app.py"]
