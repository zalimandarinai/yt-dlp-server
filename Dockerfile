# Use a pre-built image with Python and ffmpeg
FROM python:3.11-bullseye

# Disable interactive prompts in the container
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Copy app files to the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port for Render
ENV PORT 10000
EXPOSE $PORT

# Run the app
CMD ["python", "app.py"]
