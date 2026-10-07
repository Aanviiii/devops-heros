# Github Actions

Name: Aanvi Solanki     Roll no.: 24bcs10170        Group: A

Demo project: [demo-project](demo-project/) - Workflow: [session16-cicd.yml](../../.github/workflows/session16-cicd.yml)

## Concepts

| Term | Meaning |
|---|---|
| CI | Every push is automatically built and tested |
| CD | Tested code is automatically packaged and deployed |
| Pipeline | Ordered stages: test → build → docker → deploy |
| Workflow | YAML file in `.github/workflows/` |
| Job | Group of steps on one runner (`test`, `build`, `docker`, `deploy`) |
| Step | One command or action inside a job |
| Runner | Machine that runs the job (`ubuntu-latest`) |
| Secrets | Encrypted values, e.g. `secrets.GITHUB_TOKEN` for GHCR login |
| Artifacts | Files saved from a run (`calculator-build`) |

## Run locally

### Test

![test](image-1.png)

### Build

![build](image-2.png)

### Docker

![docker](image-3.png)
![browser](image-4.png)

## GitHub Actions Workflow

![workflow](image-5.png)

## Pipeline Execution

![gh-run](image-6.png)
![logs-artifacts](image-7.png)
![pipeline](image-8.png)
![deploy-job](image-9.png)
![actions](image-10.png)

## Earlier practice (aanvi-cicd)

![aanvi-cicd](image-11.png)
