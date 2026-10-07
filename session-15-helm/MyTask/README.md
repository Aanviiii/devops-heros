# Helm

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

## What is Helm?

* Package manager for Kubernetes - apps are packaged as Charts.
* Benefits: reusable templates, easy upgrades and rollbacks, version history, per-environment values.

## Task 1: Helm Commands

![Multiple commands](image.png)

![alt text](image-1.png)

### helm repo, helm search

![repo-search](image-2.png)

### helm create, lint, template

![create](image-3.png)

### helm install, list, status

![install](image-4.png)

### helm get

![get](image-5.png)

### helm uninstall

![uninstall](image-6.png)

## Task 2: Helm Rollback

Install (nginx 1.24) → Upgrade (nginx 1.25) → Verify → Upgrade again (bad tag) → Verify → Rollback to 2 → Verify

### Install, upgrade, verify

![upgrade](image-7.png)

### Upgrade again with bad image

![bad-upgrade](image-8.png)

### Rollback and verify

![rollback](image-9.png)
![cleanup](image-10.png)

## Task 3: Mini Project (notes-chart)

### Lint and template

![lint-template](image-11.png)

### Install

![install](image-12.png)

### Upgrade with production values

![upgrade-prod](image-13.png)

### Break and rollback

![rollback](image-14.png)

### Uninstall

![uninstall](image-15.png)
