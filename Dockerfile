# Use an existing Python + ffmpeg base image
FROM jrottenberg/ffmpeg:4.4-python3-alpine

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port
ENV PORT 10000
EXPOSE $PORT

# Run the app
CMD ["python", "app.py"]
