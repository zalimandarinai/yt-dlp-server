# Use a Docker image that comes with Python and ffmpeg pre-installed
FROM ghcr.io/jrottenberg/ffmpeg:4.4-python311

# Set the working directory
WORKDIR /app

# Copy application files to the container
COPY . .

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the port for Render
ENV PORT 10000
EXPOSE $PORT

# Command to run the application
CMD ["python", "app.py"]
