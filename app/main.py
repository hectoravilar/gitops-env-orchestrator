from fastapi import FastAPI

# FastAPI Instance
# Initialize the application with metadata for auto-generated documentation (Swagger/OpenAPI).
app = FastAPI(
    title="gitops-env-orchestrator API",
    description="Target workload microservice for the GitOps Kubernetes cluster.",
    version="1.0.0"

)
# Routes


@app.get("/")
async def root():
    return {"message": "gitops-env-orchestrator API is running!"}


@app.get("/health")
async def health_check():
    """
    Health check endpoint utilized by Kubernetes Liveness and Readiness probes.
    Returns an HTTP 200 OK status if the application is healthy and ready to accept traffic.
    """
    return {"status": "ok"}
