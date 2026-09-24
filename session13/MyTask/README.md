# Ingress vs Ingress Controller

| Ingress                                         | Ingress Controller                      |
| ----------------------------------------------- | --------------------------------------- |
| Kubernetes resource that defines routing rules  | Component that implements those rules   |
| Specifies how external traffic reaches services | Receives and routes the traffic         |
| Configuration only                              | Running software (e.g., NGINX, Traefik) |
| Does not handle traffic itself                  | Handles traffic based on Ingress rules  |

**In short:**

* **Ingress** = Rules for routing traffic.
* **Ingress Controller** = Software that enforces those rules.

Without an Ingress Controller, an Ingress resource has no effect.
