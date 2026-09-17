# Kubernetes Notes

## Deployment
- Used to run stateless applications.
- Ensures the required number of Pods are running.
- Supports rolling updates and rollbacks.
- Example: Web applications, APIs.

## ReplicaSet
- Maintains a specified number of identical Pod replicas.
- Automatically creates new Pods if one fails.
- Usually managed by a Deployment.
- Example: Keeping 3 copies of a Pod running.

## DaemonSet
- Runs one Pod on every node in the cluster.
- New nodes automatically get the Pod.
- Used for node-level services.
- Example: Log collectors, monitoring agents.

## StatefulSet
- Used for stateful applications that need persistent data.
- Provides stable Pod names and storage.
- Pods are created and deleted in order.
- Example: MySQL, PostgreSQL, MongoDB.

## Quick Difference

| Resource | Purpose |
|-----------|---------|
| Deployment | Manage stateless applications |
| ReplicaSet | Maintain a fixed number of Pods |
| DaemonSet | Run one Pod on every node |
| StatefulSet | Manage stateful applications with persistent storage |