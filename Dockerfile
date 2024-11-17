# Use a slim version of Python 3.10 as the base image
FROM python:3.10-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir flask

# Set the working directory inside the container
WORKDIR /app

# Copy the local directory contents to the container
COPY . /app

# Define the command to run the app
ENTRYPOINT ["python"]
CMD ["app.py"]
