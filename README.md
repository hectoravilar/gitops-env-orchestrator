# gitops-env-orchestrator: Multi-Environment GitOps Orchestrator

## 🎯 The Problem

In modern software engineering, managing multiple environments (Development, Staging, Production) often leads to a critical issue known as **Configuration Drift**. When infrastructure and deployments are handled manually, environments fall out of sync, leading to the classic "it works on my machine" syndrome, deployment anxiety, and unexpected downtime. Furthermore, developers face bottlenecks waiting for operations teams to provision resources, slowing down the delivery lifecycle.

## 💡 The Solution

**gitops-env-orchestrator** is a robust, automated infrastructure-as-code and deployment platform built around the **GitOps** philosophy. By treating the Git repository as the single source of truth for both infrastructure and application state, this project guarantees consistency across all environments.

Instead of pushing changes directly to servers, our CI/CD pipelines and in-cluster agents automatically synchronize the AWS EKS clusters to match the desired state declared in Git. This architecture eliminates manual interventions, accelerates delivery (Developer Experience), and ensures highly available, self-healing environments.

## 📦 The Workload: Target Microservice

To prove the resilience and automation of the platform, this repository also houses a custom-built, cloud-native microservice (developed in Java/Spring Boot or Python). This application acts as the target workload and is specifically engineered to validate the infrastructure by:

- Exposing `/health` and `/ready` endpoints to test Kubernetes self-healing capabilities.
- Generating application and performance metrics exposed on a `/metrics` route for Prometheus scraping.
- Simulating computational stress to trigger and validate Horizontal Pod Autoscaling (HPA).

## 🛠️ Technology Stack

This project leverages a modern, cloud-native toolchain:

- **Cloud Provider:** AWS (Amazon Web Services)
- **Infrastructure as Code (IaC):** Terraform
- **Container Orchestration:** Kubernetes (Amazon EKS)
- **Containerization:** Docker
- **Application Language:** Java (Spring Boot) / Python
- **CI/CD & Automation:** GitHub Actions
- **Observability & Monitoring:** Prometheus
- **Operating System:** Linux (Target environment for container workloads)

## 🚀 Core Features

- **Modular Infrastructure Provisioning:** Automated setup of secure networking (VPCs, private/public subnets) and Kubernetes clusters via Terraform.
- **Multi-Environment Parity:** Strict separation and parity between Dev and Prod environments, driven by parameterized Terraform modules.
- **GitOps Deployment Workflow:** Pull-based continuous delivery model ensuring the EKS cluster state always matches the repository main branch.
- **Proactive Observability:** Built-in metrics collection and alerting via Prometheus to monitor cluster health, node performance, and deployment drift.

## 📚 Official References & Documentation

This project was built following the official guidelines and best practices from the respective technology maintainers.

### Infrastructure (Terraform & AWS)

- [Terraform AWS VPC Module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest): Networking foundation with highly available subnets and NAT Gateway cost optimizations.
- [Terraform AWS EKS Module](https://registryterraform.io/modules/terraform-aws-modules/eks/aws/latest): Managed Kubernetes control plane and node group provisioning.

### Application Workload (Python & Containerization)

- [FastAPI Documentation](https://fastapi.tiangolo.com/tutorial/first-steps/): High-performance, asynchronous web framework utilized for the target workload.
- [Uvicorn ASGI Web Server](https://www.uvicorn.org/): Lightning-fast ASGI server implementation.
- [Docker: Multi-stage Builds](https://docs.docker.com/build/building/multi-stage/): Optimization strategy to keep the final production images extremely lean.
- [Docker: Python Best Practices](https://docs.docker.com/language/python/build-images/): Official guidelines for containerizing Python applications securely (including non-root user execution).

### Continuous Integration (GitHub Actions)

- [Docker Login Action](https://github.com/marketplace/actions/docker-login): Secure authentication to the GitHub Container Registry (GHCR).
- [Docker Metadata Action](https://github.com/marketplace/actions/docker-metadata-action): Dynamic generation of Git SHA-based image tags for deployment traceability.
- [Docker Build and Push Action](https://github.com/marketplace/actions/build-and-push-docker-images): Automated container build processes integrated directly into the CI pipeline.

### Kubernetes Orchestration

- [Amazon EKS Kubeconfig](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html): AWS CLI configuration to connect local environments to the managed EKS control plane.
- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/): Declarative updates for Pods and ReplicaSets, ensuring high availability of the target workload.
- [Liveness and Readiness Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/): HTTP-based health checks configured to monitor application state and automate self-healing.
- [Kubernetes Services (LoadBalancer)](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer): Network abstraction utilized to expose the application to the internet via an automatically provisioned AWS Elastic Load Balancer.
