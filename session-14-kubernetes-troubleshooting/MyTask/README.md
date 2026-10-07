# Kubernetes Troubleshooting

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

## Task 1: Kubernetes Commands

### kubectl get

![get](image-4.png)

### kubectl describe

![describe](image.png)

### kubectl logs

![logs](image-1.png)

### kubectl exec

![exec](image-2.png)

### kubectl events

![events](image-3.png)

### kubectl get -o wide, top, explain

![wide-top-explain](image-8.png)

## Task 2: Troubleshoot Common Issues

### CrashLoopBackOff

![CrashLoopBackOff](image-5.png)

* Root cause: app exits with code 1. Fix: corrected command.

![crashloop-fix](image-9.png)

### ImagePullBackOff / ErrImagePull

![ImagePullBackOff](image-6.png)

* Root cause: image tag does not exist. Fix: valid tag `nginx:1.27`.

![imagepull-fix](image-10.png)

### Pending

![Pending](image-7.png)

* Root cause: nodeSelector matches no node. Fix: removed nodeSelector.

![pending-fix](image-11.png)

### ContainerCreating

* Root cause: mounted ConfigMap missing. Fix: created the ConfigMap.

![containercreating](image-12.png)

### Service connectivity

![service-broken](image-13.png)

* Root cause: Service selector `app: web-ahsgdf` matches no pods (ENDPOINTS `<none>`). Fix: selector `app: web`.

![service-fixed](image-14.png)

### DNS

* Root cause: wrong service name. Fix: use `<service>.<namespace>.svc.cluster.local`.

![dns](image-15.png)

### Pod networking

* Root cause: Service `targetPort: 8080` but nginx listens on 80. Fix: `targetPort: 80`.

![networking](image-16.png)

### Configuration issue

* Root cause: env refers to key `MODE`, but the ConfigMap key is `APP_MODE` (CreateContainerConfigError). Fix: correct key.

![config](image-17.png)

### Triage gauntlet (scenarios 1-5)

![triage](image-18.png)

| Scenario | Problem | Root cause | Fix |
|---|---|---|---|
| 1 | CrashLoopBackOff | `DATABASE_URL` env missing, exit 1 | Added env |
| 2 | ImagePullBackOff | Image does not exist | Valid image |
| 3 | Pending | Requests 500 CPU / 1000Gi | Realistic requests |
| 4 | DNS failure | Wrong service name/namespace | Correct FQDN |
| 5 | OOMKilled (exit 137) | 20Mi memory limit | Limit 256Mi |

![scenario-1](image-19.png)
![scenario-2](image-20.png)
![scenario-3](image-21.png)
![scenario-4](image-22.png)
![scenario-5](image-23.png)

## Task 3: Mini Project

### Deploy and verify

![mini-project](image-24.png)

### Broken pod - investigate and fix

![mini-project-fix](image-25.png)
