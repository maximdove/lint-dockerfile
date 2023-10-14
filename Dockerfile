# This is a very long comment that should trigger a linting error due to its length exceeding the recommended maximum length for a single line in a Dockerfile...............$
FROM python
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
