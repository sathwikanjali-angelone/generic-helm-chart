# Generic Helm Chart

A reusable Helm chart to deploy Kubernetes applications using parameterized configuration.

This chart allows you to deploy applications by customizing values in `values.yaml` without modifying Kubernetes templates directly.

---

## 📦 Overview

This repository contains a **generic Helm chart** built using **Helm** to deploy applications on **Kubernetes**.

The chart is designed to be reusable and configurable through `values.yaml`.

---

## 📁 Repository Structure

```
generic-helm-chart
│
├── Chart.yaml
├── values.yaml
├── templates/
│   ├── deployment.yaml
│   └── service.yaml
│
├── tests/
│   └── test-values.yaml
│
└── README.md
```

### Description

| File / Folder | Purpose                       |
| ------------- | ----------------------------- |
| Chart.yaml    | Helm chart metadata           |
| values.yaml   | Default configuration values  |
| templates/    | Kubernetes resource templates |
| tests/        | Test configuration values     |
| README.md     | Project documentation         |

---

## ⚙️ Prerequisites

Make sure the following tools are installed:

* Kubernetes cluster
* Helm 3+
* kubectl

---

## 🚀 Installing the Chart

Clone the repository:

```
git clone https://github.com/sathwikanjali-angelone/generic-helm-chart.git
cd generic-helm-chart
```

Install the chart:

```
helm install my-release .
```

---

## 🔧 Customizing Values

You can override default values using a custom values file:

```
helm install my-release -f values.yaml .
```

Example parameters:

| Parameter        | Description                | Default   |
| ---------------- | -------------------------- | --------- |
| replicaCount     | Number of pod replicas     | 1         |
| image.repository | Container image repository | nginx     |
| image.tag        | Container image tag        | latest    |
| service.type     | Kubernetes service type    | ClusterIP |
| service.port     | Service port               | 80        |

---

## 🧪 Testing the Chart

Test rendering the Kubernetes manifests:

```
helm template my-release .
```

Validate the chart:

```
helm lint .
```

Use test values:

```
helm template my-release -f tests/test-values.yaml .
```

---

## 🔖 Versioning

This chart follows **semantic versioning**.

The version defined in `Chart.yaml` matches the Git tag used in the repository.

Example:

```
version: 0.1.1
git tag: v0.1.1
```

---

## 📜 License

This project is open source and available under the MIT License.

---
