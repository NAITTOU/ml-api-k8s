FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app
## Step 2:
# Copy source code to working directory
COPY requirements.txt app.py /app/
COPY model_data /app/model_data
## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013

RUN pip install --upgrade --no-cache-dir pip &&\
		pip install --no-cache-dir -r requirements.txt

## Step 4:
# Expose port 80
Expose 80
## Step 5:
# Run app.py at container launch
CMD ["python" , "/app/app.py"]

