# DevSecOps

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

Project: [devsecops-project](devsecops-project/) - Workflow: [session17-devsecops.yml](../../.github/workflows/session17-devsecops.yml)

## Pipeline Flow

Code → Build → Unit Test → SAST → SCA → Secret Scan → Docker Build → Image Scan → Security Gate → Push Image → Deploy to Kubernetes

| Stage | Tool |
|---|---|
| Unit test | pytest + coverage |
| SAST | CodeQL |
| SCA | pip-audit |
| Secret scanning | Gitleaks |
| Container image scanning | Trivy |
| Security gate | Trivy `exit-code: 1` on fixable CRITICAL |
| Container registry | GitHub Container Registry (GHCR) |
| Kubernetes deployment | kind cluster in the runner |

## Build & Unit Test

![unit-tests](image-1.png)

## SCA - Dependency Scan

![sca](image-2.png)

## Secret Scanning

![gitleaks](image-3.png)

## Docker Build

![docker-build](image-4.png)
![docker-run](image-6.png)
![browser](image-7.png)

## Container Image Scan & Security Gate

![trivy](image-5.png)

## Kubernetes Deployment

![k8s](image-8.png)

## DevSecOps Pipeline

![pipeline](image-9.png)
![scans](image-10.png)
![pipeline-graph](image-12.png)

## SAST - CodeQL finding and fix

* CodeQL flagged `app.run(debug=True)` on `0.0.0.0` (`py/flask-debug`, high).
* Fix: debug only when `FLASK_DEBUG=1`. Alert closed on the next run.

![codeql-alert](image-13.png)
![codeql-fixed](image-14.png)

## Push Image & Deploy

![deploy](image-11.png)
![deploy-job](image-15.png)
