FROM python:3.7-slim

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker caching
COPY . /app/

# Install dependencies without cache to reduce image size
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "/app/app/main.py"]
