# radar-helm-charts

[![Build](https://github.com/RADAR-base/radar-helm-charts/actions/workflows/lint-test.yaml/badge.svg)](https://github.com/RADAR-base/radar-helm-charts/actions/workflows/lint-test.yaml)
[![Apache Licensed](https://img.shields.io/github/license/radar-base/radar-kubernetes)](LICENSE)
[![Join our community Slack](https://img.shields.io/badge/slack-radarbase-success.svg?logo=slack)](https://docs.google.com/forms/d/e/1FAIpQLScKNZ-QonmxNkekDMLLbP-b_IrNHyDRuQValBy1BAsLOjEFpg/viewform)

The helm charts of the RADAR-base platform. Installation of these charts is best managed via [RADAR-Kubernetes](https://github.com/RADAR-base/RADAR-Kubernetes). Use the releases in this repository by referencing helm repository `radar` with URL <https://radar-base.github.com/radar-helm-charts>.

## About

RADAR-base is an open-source platform designed to support remote clinical trials by collecting continuous data from wearables and mobile applications. RADAR-Kubernetes enables installing the RADAR-base platform onto Kubernetes clusters. RADAR-base platform can be used for wide range of use-cases. Depending on the use-case, the selection of applications need to be installed can vary. Please read the [component overview and breakdown](https://radar-base.atlassian.net/wiki/spaces/RAD/pages/2673967112/Component+overview+and+breakdown) to understand the role of each component and how components work together.

The radar-helm-charts setup uses [Helm 3](https://github.com/helm/helm) charts to package necessary Kubernetes resources for each component.

This documentation assumes familiarity with all referenced Kubernetes concepts, utilities, and procedures and familiarity with Helm charts.

## Prerequisites

The following tools should be installed in your local machine to install the RADAR-Kubernetes on your Kubernetes cluster.

| Component                                          | Description                                                             |
| -------------------------------------------------- | ----------------------------------------------------------------------- |
| [helm 3](https://github.com/helm/helm#install)     | Helm Charts are used to package Kubernetes resources for each component |
| kubernetes                                         | The charts support Kubernetes versions 1.19 up to 1.22.                 |
| [helm-docs](https://github.com/norwoodj/helm-docs) | README generator for each chart.                                        |

Installation of these charts is best managed via [RADAR-Kubernetes](https://github.com/RADAR-base/RADAR-Kubernetes).

## Usage

The radar-helm-charts Github project publishes a Helm repository `radar` with URL <https://radar-base.github.com/radar-helm-charts>. Any time a commit to the `main` branch is made that modified one of the helm charts, a new Github release is created for that chart. It is also published to the Helm repository. For that reason, ensure that the `Chart.yaml` file of the respective Helm chart is up to date for any commit made to `main`. In general, the `main` branch should only be updated via Github pull requests.

Before making a PR back to the `main`, ensure that the README of the chart is up to date using the command:

```
helm-docs -s file --template-files=charts/_templates.gotmpl --template-files=DOCS.md.gotmpl --template-files=README.md.gotmpl --chart-search-root=charts
```

or, when using Docker:

```
HELMDOCS_IMAGE=jnorwood/helm-docs:v1.8.1
docker run --rm -v "$(pwd):/helm-docs" $HELMDOCS_IMAGE -s file --template-files=charts/_templates.gotmpl --template-files=DOCS.md.gotmpl --template-files=README.md.gotmpl --chart-search-root=charts
```

For general usage and instructions view the [helm-docs](https://github.com/norwoodj/helm-docs) README. Below is a short summary.

In each chart directory use the following files to define what the README contents should be.

1. In `README.md.gotmpl` define which sections should be printed to README, with syntax

   ```
   {{ template "chart.header" . }}
   {{ template "chart.deprecationWarning" . }}

   {{ template "chart.badgesSection" . }}

   {{ template "chart.description" . }}

   {{ template "chart.homepageLine" . }}

   {{ template "chart.maintainersSection" . }}

   {{ template "chart.sourcesSection" . }}

   {{ template "common.prerequisites" . }}

   {{ template "chart.requirementsSection" . }}

   {{ template "chart.valuesSection" . }}
   ```

2. In `DOCS.md.gotmpl`, define any sections not part of helm-docs:

   ```
   {{ define "mychart.usageSection" -}}
   {{- end }}
   ```

3. In `Chart.yaml` define as many metadata fields as possible, including at least the description, homepage, maintainer, sources, and requirements.
4. In the `values.yaml` file, put a comment line before each variable with two dashes `--`. Any text after the two dashes will be used as documentation for that variable.

## Updating external charts
External charts can be updated by running `make update-<chart-name>`. At the moment there are a few manual steps are needed which should be automated.
The external charts that have a depedency need manual steps:
- The external dependency should be mirrored in the this repository with `helm pull` commands that are in the `Makefile`, make sure the mirrored version is same as the one specified in the `Chart.yaml`.
- The external dependency should be relased on the main branch first so there will be a valid release of it in our chart repository.
- In the `Chart.yaml` the repository should be changd to `https://radar-base.github.io/radar-helm-charts`.
- The `Chart.lock` file should be removed and then run `helm dependency build` to recreate the file with new repository URL and remove any `.tgz` files that gets created.

## Feedback and Contributions

Enabling RADAR-base community to use RADAR-Kubernetes is important for us. If you have troubles setting up the platform using provided instructions, you can create an issue with exact details to reproduce and the expected behaviour.
You can also reach out to the RADAR-base community via RADAR-base Slack on **[radar-kubernetes channel](https://radardevelopment.slack.com/archives/C021AGGESC9)**. The RADAR-base developers support the community on a voluntary basis and will pick up your requests as time permits.
