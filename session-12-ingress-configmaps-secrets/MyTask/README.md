# Ingress, Configmaps, Secrets

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

## Port achitecture

![port architecture](image-1.png)

## ClusterIP

![clusterIP](image-2.png)

## Nodeport

![nodeport](image-3.png)

## Configmaps, secrets, replicaset

![Configmaps, secrets, replicaset](image.png)

## Task 1: ConfigMap

![configmap](image-4.png)
![configmap-in-pod](image-6.png)

## Task 2: Secret

![secret](image-5.png)
![secret-in-pod](image-7.png)

* Secrets are only base64 encoded, not encrypted - anyone with the repo can decode them, so they should not be committed to Git.

## Task 3: Ingress

![ingress](image-8.png)
![frontend](image-9.png)
![backend](image-10.png)

## Task 4: Ingress vs Ingress Controller

| | Ingress | Ingress Controller |
|---|---|---|
| What | YAML rules (host/path → Service) | Pod that reads the rules and routes traffic |
| Type | Kubernetes resource | Application (nginx, Traefik, HAProxy) |
| Works alone? | No, just config | Needs Ingress rules to act on |
| Example | `yatri-ingress` | `ingress-nginx-controller` |

* Both are required: Ingress defines the routing, the Controller actually does it.

## Task 5: Troubleshooting (Secret base64 newline)

### Before
![before](image-11.png)

### After
![after](image-12.png)

* Root cause: `echo` adds `\n`, so the password becomes 15 bytes instead of 14.
* Fix: use `echo -n` (or `--from-literal`).
