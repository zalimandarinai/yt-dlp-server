# Use an image that includes ffmpeg and Python
FROM jrottenberg/ffmpeg:4.4-python

# Set the working directory in the container
WORKDIR /app

# Copy the entire content of your project to the working directory
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port for the application
ENV PORT 10000
EXPOSE $PORT

# Start the application
CMD ["python", "app.py"]
