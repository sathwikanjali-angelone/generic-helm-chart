# Generic Helm Chart

This repository contains a **generic Helm chart** that can deploy any Kubernetes application using parameterized configuration.

## Repository Structure

```
generic-helm-chart
 └── app-chart
      ├── Chart.yaml
      ├── values.yaml
      └── templates
           ├── deployment.yaml
           └── service.yaml
```

## Helm Chart Design

The Helm chart is designed to deploy applications in Kubernetes by parameterizing configuration using **values.yaml**.

Supported parameters:

* Container image
* Replica count
* Service port
* Resource configuration

Storage configuration is intentionally **not supported** in this chart.

## Deployment Example

Install the application using Helm:

```
helm install test-app ./app-chart
```

Verify deployment:

```
kubectl get pods
```

## Updating Configuration

You can update configuration using Helm upgrade:

```
helm upgrade test-app ./app-chart --set replicaCount=2
```

This will scale the application.

## Helm Chart Workflow

1. Helm templates are stored in a Git repository.
2. Charts can be packaged and published to Helm repositories.
3. Applications deploy using Helm install or Helm upgrade.

Example:

```
helm repo add myrepo <helm-repository-url>
helm install myapp myrepo/app-chart
```

## Use Case

This Helm chart can deploy any application such as:

* Backend services
* Frontend services
* APIs
* Stateless workloads
