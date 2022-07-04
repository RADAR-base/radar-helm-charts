---
layout: page
title: radar-helm-charts
tagline: Helm charts of the RADAR-base platform components.
description: Helm charts of the RADAR-base platform components.
---

# radar-helm-charts

The helm charts of the RADAR-base platform. Installation of these charts is best managed via [RADAR-Kubernetes](https://github.com/RADAR-base/RADAR-Kubernetes). Use the releases in this repository by referencing helm repository `radar` with URL <https://radar-base.github.io/radar-helm-charts>.

## About

RADAR-base is an open-source platform designed to support remote clinical trials by collecting continuous data from wearables and mobile applications. RADAR-Kubernetes enables installing the RADAR-base platform onto Kubernetes clusters. RADAR-base platform can be used for wide range of use-cases. Depending on the use-case, the selection of applications need to be installed can vary. Please read the [component overview and breakdown](https://radar-base.atlassian.net/wiki/spaces/RAD/pages/2673967112/Component+overview+and+breakdown) to understand the role of each component and how components work together. 

The radar-helm-charts setup uses [Helm 3](https://github.com/helm/helm) charts to package necessary Kubernetes resources for each component.

This documentation assumes familiarity with all referenced Kubernetes concepts, utilities, and procedures and familiarity with Helm charts.

## Prerequisites

The following tools should be installed in your local machine to install the RADAR-Kubernetes on your Kubernetes cluster.

| Component | Description |
|-----|------|
| [helm 3](https://github.com/helm/helm#install)| Helm Charts are used to package Kubernetes resources for each component|
| kubernetes | The charts support Kubernetes versions 1.19 up to 1.23. |

Installation of these charts is best managed via [RADAR-Kubernetes](https://github.com/RADAR-base/RADAR-Kubernetes).

## Usage

The radar-helm-charts Github project publishes a Helm repository `radar` with URL <https://radar-base.github.com/radar-helm-charts>. Any time a commit to the `main` branch is made that modified one of the helm charts, a new Github release is created for that chart. It is also published to the Helm repository. For that reason, ensure that the `Chart.yaml` file of the respective Helm chart is up to date for any commit made to `main`. In general, the `main` branch should only be updated via Github pull requests.

## Feedback and Contributions

Enabling RADAR-base community to use RADAR-Kubernetes is important for us. If you have troubles setting up the platform using provided instructions, you can create an issue with exact details to reproduce and the expected behaviour.
You can also reach out to the RADAR-base community via RADAR-base Slack on **[radar-kubernetes channel](https://radardevelopment.slack.com/archives/C021AGGESC9)**. The RADAR-base developers support the community on a voluntary basis and will pick up your requests as time permits. 
