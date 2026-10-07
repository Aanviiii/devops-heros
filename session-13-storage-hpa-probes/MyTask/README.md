# Storage, HPA & Probes

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

## Task 1: Kubernetes Volumes

| Type | What it is | Data after pod delete |
|---|---|---|
| emptyDir | Temporary folder created with the pod | Lost |
| hostPath | Folder on the node mounted into the pod | Kept (same node only) |
| PersistentVolume (PV) | Storage resource in the cluster, created by admin | Kept |
| PersistentVolumeClaim (PVC) | Pod's request for storage, binds to a PV | Kept |
| StorageClass | Template that creates PVs automatically | Kept |

* Dynamic provisioning: PVC asks a StorageClass, and the PV is created automatically (no admin needed).

### emptyDir

![emptydir](image-1.png)

### hostPath

![hostpath](image-2.png)

### PersistentVolume & PersistentVolumeClaim

![pv-pvc](image-3.png)

### StorageClass & Dynamic Provisioning

![storageclass](image-4.png)

## Task 2: HPA

### Deploy app and HPA

![hpa-deploy](image-8.png)

### Load generator

![load-generator](image-9.png)

### CPU utilization and scaling

![hpa-watch](image-10.png)
![hpa-scaled](image-11.png)

### Scale down after load stops

![hpa-scale-down](image-16.png)

## Probes

### Liveness

![liveness](image-5.png)

### Readiness

![readiness](image-6.png)

### Startup

![startup](image-7.png)

## Task 3: Mini Project

![mini-project](image-12.png)

### Data persists after pod delete

![persistence](image-13.png)

### Access the app

![port-forward](image-14.png)
![browser](image-15.png)
