# Mini project

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

## Project Overview

TaskBoard - task management app (React frontend, FastAPI backend, PostgreSQL) taken from code to a monitored Kubernetes deployment.

## Architecture

```mermaid
flowchart TD
    DEV[Developer] --> GH[Git / GitHub]
    GH --> CI[GitHub Actions]
    CI --> T[pytest + frontend build]
    T --> D[Docker build]
    D --> S[Trivy scan + security gate]
    S --> R[GHCR registry]
    R --> H[Helm deploy]
    TF[Terraform: VPC + EKS] -.-> K
    H --> K[Kubernetes]
    K --> I[Ingress taskboard.local]
    I --> FE[Frontend - nginx]
    I --> BE[Backend - FastAPI, HPA]
    BE --> PG[(PostgreSQL + PVC)]
    BE --> P[Prometheus ServiceMonitor]
    P --> G[Grafana]
```

## Technologies Used

| Area | Tools |
|---|---|
| App | React + Vite, FastAPI, SQLAlchemy, Alembic, PostgreSQL |
| Testing | pytest |
| Containers | Docker, Docker Compose |
| CI/CD | GitHub Actions, GHCR |
| DevSecOps | Trivy scan + security gate |
| Kubernetes | Helm, Ingress, HPA, probes, ConfigMap, Secret, PVC |
| Monitoring | kube-prometheus-stack (Prometheus + Grafana) |
| IaC | Terraform (AWS VPC + EKS modules) |

My files: [helm chart](helm/taskboard/) - [values-local.yaml](values-local.yaml) - [compose-healthcheck.yml](compose-healthcheck.yml) - [frontend.Dockerfile](frontend.Dockerfile) - [terraform](terraform/) - [manifests](manifests/) - [workflow](../../.github/workflows/session21-taskboard.yml)

## Application Setup (Docker Compose)

![ui](image-1.png)
![api](image-2.png)
![database](image-3.png)

## Testing

* Test failed: `TestClient` does not run startup, so the `tasks` table was missing. Fix: run `alembic upgrade head` before `pytest`.

![test-fail](image-4.png)
![test-pass](image-5.png)

## Docker Setup

![docker](image-6.png)

## Kubernetes + Helm Deployment

![helm](image-7.png)
![resources](image-8.png)

### ConfigMap, Secret, Probes

![config-secret-probes](image-9.png)

### Ingress

![ingress](image-10.png)
![ingress-browser](image-11.png)

### HPA

![hpa](image-12.png)

## Terraform Infrastructure

* Course `terraform/` files used multi-argument single-line blocks (invalid HCL) - rewritten in `MyTask/terraform`.
* No AWS account: `validate` passes, `plan` stops at credentials.

![tf-error](image-22.png)
![tf-validate](image-23.png)
![tf-plan](image-24.png)

## CI/CD Pipeline

![pipeline](image-19.png)
![pipeline-graph](image-25.png)

## DevSecOps Implementation

* Trivy security gate blocked the frontend image (2 fixable CRITICAL OpenSSL CVEs in `nginx:1.27-alpine`).
* Fix: `apk upgrade` in [frontend.Dockerfile](frontend.Dockerfile). Next run passed.

![gate-blocked](image-15.png)

## Monitoring

![prometheus-targets](image-13.png)
![prometheus-graph](image-14.png)
![grafana](image-16.png)

## GitOps

* Same flow as Session 20: ArgoCD watches the Git repo and syncs the cluster ([session 20](../../session20-monitoring-observability-gitops/MyTask/README.md)).
* Here every push to `main` runs the pipeline and deploys the new image tag with Helm.

## Troubleshooting

| Issue | Root cause | Fix |
|---|---|---|
| Backend `Exited (1)` in Compose | Started before PostgreSQL was ready | Healthcheck + `depends_on: service_healthy` |
| `ImagePullBackOff` | Image tag does not exist | Use built image `taskboard-backend:local` |
| Service with no endpoints | Selector `label-that-does-not-exist` | Selector `app: taskboard-backend`, `targetPort: 8000` |
| Pytest failure | Tables not created in test DB | Run migrations first |
| Image blocked by gate | CRITICAL CVEs in base image | `apk upgrade` |

### Compose startup race

![compose-before](image-20.png)
![compose-after](image-21.png)

### Broken image and broken service

![before](image-17.png)
![after](image-18.png)

## Lessons Learned

* Readiness of dependencies (DB) must be handled - healthchecks, probes, restarts.
* Security gates catch real issues in base images, not just in our code.
* Helm values make the same chart work locally (minikube) and in CI (kind).
* Metrics + dashboards make HPA scaling visible.
