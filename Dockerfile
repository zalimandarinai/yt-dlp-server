# Use a pre-built Python image with ffmpeg installed
FROM jrottenberg/ffmpeg:4.4-python3.11

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
