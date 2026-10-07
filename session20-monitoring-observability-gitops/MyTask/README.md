# Monitoring, Observability & GitOps

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

## Task 1: Monitoring

Stack: [monitoring](monitoring/) - Prometheus + node-exporter + Grafana (provisioned datasource and dashboard) + alert rules.

### Prometheus

![prometheus](image-1.png)
![targets](image-2.png)
![query](image-3.png)

### Monitoring stack, alert rules, datasource

![stack](image-4.png)
![alerts](image-5.png)

### Grafana - CPU, memory, health

![grafana](image-6.png)

### Alert firing (target down) and resolved

![alert-firing](image-7.png)
![alert-ui](image-8.png)
![alert-resolved](image-9.png)

### Kubernetes - logs, metrics, health

![k8s-logs](image-10.png)
![k8s-metrics](image-11.png)

## Task 2: Observability

| Pillar | Meaning | Example tool |
|---|---|---|
| Metrics | Numbers over time (CPU, memory, requests/s) | Prometheus |
| Logs | Text events from the app | Loki, ELK, `kubectl logs` |
| Traces | Path of one request across services | Jaeger, Tempo |

* Monitoring tells *what* is wrong, observability helps find *why*.
* Needed for microservices where one request touches many services.
* Common tools: Prometheus, Grafana, Loki, Jaeger, OpenTelemetry.
* Kubernetes: metrics-server (`kubectl top`), `kubectl logs`, events, probes, kube-prometheus-stack.

## Task 3: GitOps

* GitOps: Git is the single source of truth for the desired state.
* Declarative config: YAML describes *what* should run, not steps.
* Continuous reconciliation: ArgoCD keeps comparing Git with the cluster and fixes drift.
* Workflow: change YAML → commit → push → ArgoCD syncs → cluster updated.

### Git as source of truth

![git](image-12.png)

### ArgoCD application (repo: this GitHub repo, path `MyTask/gitops/app`)

![argocd-cli](image-13.png)
![argocd-apps](image-14.png)
![argocd-tree](image-15.png)

### Change in Git → auto sync (2 → 4 replicas)

![gitops-sync](image-16.png)

### Self-heal (manual scale to 1 is reverted to 4)

![self-heal](image-17.png)
![argocd-tree-4](image-18.png)
