# Kubernetes Storage Concepts

## Objective

The purpose of this document is to understand and document the following Kubernetes storage concepts:

* emptyDir
* hostPath
* PersistentVolume (PV)
* PersistentVolumeClaim (PVC)
* StorageClass
* Dynamic Provisioning

---

# 1. emptyDir

## What is emptyDir?

`emptyDir` is a temporary storage volume that is created when a Pod starts.

The volume exists as long as the Pod is running. If the Pod is deleted, all data inside the `emptyDir` is lost.

It is mainly used for:

* Temporary files
* Caching
* Sharing files between containers inside the same Pod

---

## How it works

1. Pod starts.
2. Kubernetes creates an empty directory.
3. Containers in the Pod can read/write data.
4. Pod is deleted.
5. Data is permanently removed.

---

## Example

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: emptydir-demo
spec:
  containers:
  - name: app
    image: nginx
    volumeMounts:
    - mountPath: /data
      name: temp-storage

  volumes:
  - name: temp-storage
    emptyDir: {}
```

---

## Use Case

Suppose two containers in the same Pod need to share files.

Container A writes logs to `/data`.

Container B reads logs from `/data`.

Both containers can access the same `emptyDir` volume.

---

## Advantages

* Easy to use
* Fast
* Good for temporary storage

## Disadvantages

* Data is lost when Pod is deleted
* Not suitable for permanent storage

---

# 2. hostPath

## What is hostPath?

`hostPath` mounts a directory or file from the Kubernetes node into a Pod.

This allows a Pod to access files stored directly on the host machine.

---

## How it works

Node:

```text
/var/log/myapp
```

Pod:

```text
/data/logs
```

The Pod can access the host directory through the mounted path.

---

## Example

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-demo
spec:
  containers:
  - name: app
    image: nginx
    volumeMounts:
    - mountPath: /data
      name: host-storage

  volumes:
  - name: host-storage
    hostPath:
      path: /tmp/data
      type: DirectoryOrCreate
```

---

## Use Case

* Accessing host logs
* Accessing host configuration files
* Development and testing environments

---

## Advantages

* Can access host files directly
* Easy for local testing

## Disadvantages

* Not portable
* Tightly coupled to a specific node
* Security risks if misused

---

# 3. PersistentVolume (PV)

## What is a PersistentVolume?

A PersistentVolume (PV) is a storage resource in Kubernetes.

Unlike `emptyDir`, a PV exists independently of Pods.

Even if a Pod is deleted, the data can remain.

---

## Why do we need PV?

Imagine a database Pod:

```text
Database writes customer data
↓
Pod crashes
↓
Pod recreated
```

Without persistent storage, all customer data would be lost.

A PV ensures the data survives Pod restarts.

---

## Example PV

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 1Gi

  accessModes:
    - ReadWriteOnce

  hostPath:
    path: /mnt/data
```

---

## Important Properties

### Capacity

```yaml
capacity:
  storage: 1Gi
```

Defines storage size.

---

### Access Modes

#### ReadWriteOnce (RWO)

One node can read and write.

#### ReadOnlyMany (ROX)

Many nodes can read.

#### ReadWriteMany (RWX)

Many nodes can read and write.

---

## Advantages

* Data survives Pod deletion
* Reusable storage resource

## Disadvantages

* Requires manual management

---

# 4. PersistentVolumeClaim (PVC)

## What is a PVC?

A PersistentVolumeClaim is a request for storage by a Pod.

Think of it as:

```text
PV = Actual Storage

PVC = Request for Storage
```

A Pod uses a PVC rather than directly using a PV.

---

## Example PVC

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc

spec:
  accessModes:
    - ReadWriteOnce

  resources:
    requests:
      storage: 500Mi
```

---

## Using PVC in a Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pvc-demo

spec:
  containers:
  - name: app
    image: nginx

    volumeMounts:
    - mountPath: /data
      name: storage

  volumes:
  - name: storage
    persistentVolumeClaim:
      claimName: my-pvc
```

---

## Workflow

```text
PersistentVolume
        ↓
PersistentVolumeClaim
        ↓
       Pod
```

PVC requests storage and Kubernetes binds it to a suitable PV.

---

# 5. StorageClass

## What is a StorageClass?

A StorageClass defines how storage should be created.

Instead of manually creating PersistentVolumes, administrators can define storage templates.

---

## Why is it useful?

Without StorageClass:

```text
Admin creates PV manually
↓
User creates PVC
↓
PVC uses PV
```

With StorageClass:

```text
User creates PVC
↓
Storage automatically created
↓
PVC gets storage
```

---

## Example StorageClass

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass

metadata:
  name: fast-storage

provisioner: kubernetes.io/no-provisioner

volumeBindingMode: WaitForFirstConsumer
```

---

## Common Use Cases

* SSD storage
* High-performance databases
* Cloud disks
* Shared file systems

---

## Advantages

* Automation
* Standardization
* Easier management

---

# 6. Dynamic Provisioning

## What is Dynamic Provisioning?

Dynamic Provisioning automatically creates PersistentVolumes when a PVC requests storage.

The user only creates a PVC.

Kubernetes creates the PV automatically.

---

## Traditional Provisioning

```text
Step 1: Admin creates PV

Step 2: User creates PVC

Step 3: PVC binds to PV
```

---

## Dynamic Provisioning

```text
Step 1: StorageClass exists

Step 2: User creates PVC

Step 3: Kubernetes automatically creates PV

Step 4: PVC binds to new PV
```

---

## Example PVC Using StorageClass

```yaml
apiVersion: v1
kind: PersistentVolumeClaim

metadata:
  name: dynamic-pvc

spec:
  accessModes:
    - ReadWriteOnce

  storageClassName: fast-storage

  resources:
    requests:
      storage: 1Gi
```

---

## What happens?

```text
PVC Created
      ↓
StorageClass Detected
      ↓
Provisioner Creates PV
      ↓
PVC Bound to PV
      ↓
Pod Uses Storage
```

---

# Comparison Table

| Feature              | emptyDir | hostPath | PV/PVC                  |
| -------------------- | -------- | -------- | ----------------------- |
| Persistent Data      | No       | Yes      | Yes                     |
| Pod Restart Safe     | No       | Yes      | Yes                     |
| Node Dependent       | No       | Yes      | Usually No              |
| Production Use       | Limited  | Rarely   | Yes                     |
| Dynamic Provisioning | No       | No       | Yes (with StorageClass) |

---

# Key Takeaways

1. `emptyDir` provides temporary storage and is deleted when the Pod is removed.
2. `hostPath` mounts a directory from the host machine into a Pod.
3. `PersistentVolume (PV)` provides persistent storage independent of Pods.
4. `PersistentVolumeClaim (PVC)` is a request for storage made by applications.
5. `StorageClass` defines how storage should be provisioned.
6. `Dynamic Provisioning` automatically creates storage resources when needed.
7. In production Kubernetes environments, PVCs combined with StorageClasses are the preferred approach for managing persistent storage.

## Conclusion

Kubernetes offers multiple storage options depending on application requirements. Temporary workloads can use `emptyDir`, local node access can use `hostPath`, and production applications should use `PersistentVolumes`, `PersistentVolumeClaims`, and `StorageClasses` with Dynamic Provisioning to ensure scalable, reliable, and persistent storage management.
