FROM python:3.7-slim
LABEL maintainer="ookiisan@gmail.com"

## Step 1:
# Create a working directory
WORKDIR /strings-dowser

## Step 2:
# Copy source code to working directory
COPY ./strings-dowser/*.py /strings-dowser/
COPY ./strings-dowser/requirements.txt /strings-dowser/
COPY ./strings-dowser/test /strings-dowser/test
COPY ./strings-dowser/templates /strings-dowser/templates
RUN ls -la .

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 30001
EXPOSE 30001

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
