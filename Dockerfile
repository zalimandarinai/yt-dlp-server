# Use a Docker image that includes ffmpeg and Python pre-installed
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11

# Set the working directory in the container
WORKDIR /app

# Copy application files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the port environment variable for Render
ENV PORT 10000
EXPOSE $PORT

# Command to run the application
CMD ["python", "app.py"]
