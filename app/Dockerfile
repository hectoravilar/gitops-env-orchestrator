# --- Stage 1: Build Stage ---
FROM python:3.11-slim AS builder

WORKDIR /app

# Install system-level build tools (e.g., GCC for C-based packages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create and use a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# --- Stage 2: Runtime Stage ---
FROM python:3.11-slim

WORKDIR /app
# Create a non-root user for security (Kubernetes / DevOps Best Practice)
RUN useradd -m -s /bin/bash appuser

# Copy the pre-installed virtual environment from the builder
COPY --from=builder /opt/venv /opt/venv
# Ensure the runtime environment uses the copied venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy only the necessary application source code
COPY . .

# Change ownership of the app directory to the non-root user
RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser

# Document the port exposed by the application
EXPOSE 8000
# Run the FastAPI application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
