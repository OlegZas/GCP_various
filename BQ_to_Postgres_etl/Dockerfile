t# Use a slim version of Python to keep the image small
FROM python:3.11-slim

# Install system dependencies required for PostgreSQL and GCC
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r properties.txt

# Copy the rest of your code
COPY . .

# Cloud Run Jobs will execute this command when the job starts
CMD ["python", "main.py"]
