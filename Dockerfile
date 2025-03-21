# Use an official Python runtime as the base image
FROM python:3.12-slim

# Python dependencies
RUN pip install --no-cache-dir prometheus_client

# Prometheus exporter script for bitcoind
COPY lnd-exporter.py /

# -u: force the stdout and stderr streams to be unbuffered
CMD ["python", "-u", "/lnd-exporter.py"]
