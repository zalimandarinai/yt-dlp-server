# Base image with Python
FROM python:3.11-slim

# Install ffmpeg and other necessary tools
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose the port Render will use
EXPOSE 10000

# Run the Flask app
CMD ["python", "app.py"]
