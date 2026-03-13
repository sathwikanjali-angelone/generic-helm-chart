# Generic Helm Chart

A reusable **generic Helm chart** for deploying Kubernetes applications.

This repository provides a base Helm chart template that can be reused for deploying containerized applications on Kubernetes. It includes common Kubernetes resources such as **Deployment** and **Service**, and can be customized using Helm values.

---

## Repository Structure

```
generic-helm-chart
│
├── .github/
│   └── workflows/
│       └── release.yml          # GitHub Actions pipeline for versioning and tagging
│
├── templates/
│   ├── deployment.yaml          # Kubernetes Deployment template
│   └── service.yaml             # Kubernetes Service template
│
├── tests/                       # Helm chart tests
│
├── Chart.yaml                   # Helm chart metadata
├── Values.yml                   # Default configuration values
└── README.md                    # Documentation
```

---

## Prerequisites

Before installing this Helm chart ensure you have:

* Kubernetes cluster
* Helm 3 installed

Install Helm if needed:

```
https://helm.sh/docs/intro/install/
```

---

## Installing the Chart

Install the Helm chart:

```
helm install my-release .
```

Example:

```
helm install demo-app .
```

---

## Upgrading the Chart

To upgrade an existing release:

```
helm upgrade my-release .
```

Example:

```
helm upgrade demo-app .
```

---

## Configuration

Configuration values can be customized using **Values.yml**.

Example values:

| Parameter        | Description                | Default   |
| ---------------- | -------------------------- | --------- |
| replicaCount     | Number of pod replicas     | 1         |
| image.repository | Container image repository | nginx     |
| image.tag        | Container image tag        | latest    |
| service.type     | Kubernetes service type    | ClusterIP |
| service.port     | Service port               | 80        |

You can override values using:

```
helm install my-release . -f Values.yml
```

or

```
helm install my-release . --set image.tag=1.0.0
```

---

## Versioning

This Helm chart follows **Semantic Versioning (SemVer)**.

The **GitHub Actions pipeline automatically manages chart versioning and git tags**.

Pipeline workflow:

1. The pipeline reads the chart version from `Chart.yaml`
2. The chart is validated and packaged
3. A Git tag is created using the same version

Example:

```
Chart.yaml
version: 0.1.4

Git Tag
v0.1.2
```

This ensures the **version defined in `Chart.yaml` always matches the Git tag in the repository**.

---

## Packaging the Chart

To manually package the Helm chart:

```
helm package .
```

This will generate a package like:

```
generic-helm-chart-0.1.2.tgz
```

---

## Linting the Chart

Validate the chart before deploying:

```
helm lint .
```

---

## Running Helm Tests

You can run Helm chart tests using:

```
helm test <release-name>
```

Example:

```
helm test demo-app
```

---

## Maintainers

Maintained by the DevOps team.
