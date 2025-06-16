# radar-helm-charts

[![Build](https://github.com/RADAR-base/radar-helm-charts/actions/workflows/lint-test.yaml/badge.svg)](https://github.com/RADAR-base/radar-helm-charts/actions/workflows/lint-test.yaml)
[![Apache Licensed](https://img.shields.io/github/license/radar-base/radar-kubernetes)](LICENSE)
[![Join our community Slack](https://img.shields.io/badge/slack-radarbase-success.svg?logo=slack)](https://docs.google.com/forms/d/e/1FAIpQLScKNZ-QonmxNkekDMLLbP-b_IrNHyDRuQValBy1BAsLOjEFpg/viewform)

The helm charts of the RADAR-base platform. Installation of these charts is best managed
via [RADAR-Kubernetes](https://github.com/RADAR-base/RADAR-Kubernetes). Use the releases in this repository by
referencing helm repository `radar` with URL <https://radar-base.github.com/radar-helm-charts>.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [About](#about)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Contributions](#contributions)
  - [Adding a new chart](#adding-a-new-chart)
  - [Charts for external dependencies](#charts-for-external-dependencies)
    - [Adding external charts](#adding-external-charts)
    - [Updating external charts](#updating-external-charts)
      - [kube-prometheus-stack](#kube-prometheus-stack)
- [Feedback](#feedback)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## About

RADAR-base is an open-source platform designed to support remote clinical trials by collecting continuous data from
wearables and mobile applications. RADAR-Kubernetes enables installing the RADAR-base platform onto Kubernetes clusters.
RADAR-base platform can be used for wide range of use-cases. Depending on the use-case, the selection of applications
need to be installed can vary. Please read
the [component overview and breakdown](https://radar-base.atlassian.net/wiki/spaces/RAD/pages/2673967112/Component+overview+and+breakdown)
to understand the role of each component and how components work together.

The radar-helm-charts setup uses [Helm](https://github.com/helm/helm) charts to package necessary Kubernetes resources
for each component.

This documentation assumes familiarity with all referenced Kubernetes concepts, utilities, and procedures and
familiarity with Helm charts.

## Prerequisites

The following tools should be installed in your local machine to install the RADAR-Kubernetes on your Kubernetes
cluster.

| Component                                          | Description                                                             |
|----------------------------------------------------|-------------------------------------------------------------------------|
| [helm 3](https://github.com/helm/helm#install)     | Helm Charts are used to package Kubernetes resources for each component |
| Kubernetes                                         | The charts support Kubernetes versions older than 1.30.                 |
| [kubectl](https://kubernetes.io/docs/tasks/tools/) | Command line interface to interact with Kubernetes                      |

Installation of these charts is best managed via [RADAR-Kubernetes](https://github.com/RADAR-base/RADAR-Kubernetes).

## Usage

The radar-helm-charts Github project publishes a Helm repository `radar` with
URL <https://radar-base.github.com/radar-helm-charts>. Any time a commit to the `main` branch is made that modified one
of the helm charts, a new Github release is created for that chart. It is also published to the Helm repository. For
that reason, ensure that the `Chart.yaml` file of the respective Helm chart is up to date for any commit made to `main`.
In general, the `main` branch should only be updated via Github pull requests.

## Contributions

The dependencies and linting tools are managed via Devbox, you need
to [install it](https://jetify-com.vercel.app/docs/devbox/installing_devbox/#install-devbox) before proceeding. Once
that is done you can run:

```
devbox shell
```

This download all of the dependencies and install to Git hooks to lint the configuration before it is committed. To
check if the commit hooks succeed before making a comment you can run this command:

```
devbox run check
```

This project also uses [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) to have a standardized
commit message. Please have a look and make sure your commit message follows that.

### Adding a new chart

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

3. In `Chart.yaml` define as many metadata fields as possible, including at least the description, homepage, maintainer,
   sources, and requirements.
4. In the `values.yaml` file, put a comment line before each variable with two dashes `--`. Any text after the two
   dashes will be used as documentation for that variable.

### Charts for external dependencies

The charts for external dependencies are located in the `external` directory. These charts are used to install
components that are not part of the RADAR-base platform but are required for the platform to function correctly. The
external charts are maintained separately and should be updated as needed. It is current practice to have a copy of
any external chart in the `external` directory to ensure that the RADAR-base platform can be installed without the
parent chart being available in the Helm repository.

#### Adding external charts

1. Clone the external chart into the `external` directory. This can be done by running the following command:

   ```bash
   helm pull <chart-name> --untar -d external
   ```

   This will create a new directory in the `external` directory with the name of the chart. See `Makefile` for
   examples.
2. Add helm chart as a new `update-<chart-name>` section in the `Makefile`.
3. Register the new chart in the `.github/workflows/scheduled-snyk-docker.yaml` for vulnerability scanning by adding the
   chart name to the `INCLUDE_CHARTS` environmental variable in the _set-matrix_ step.

#### Updating external charts

External charts can be updated by running `make update-<chart-name>`. At the moment there are a few manual steps are
needed which should be automated.
The external charts that have a dependency need manual steps:

- The external dependency should be mirrored in the this repository with `helm pull` commands that are in the
  `Makefile`, make sure the mirrored version is same as the one specified in the `Chart.yaml`.
- The external dependency should be released on the main branch first so there will be a valid release of it in our
  chart repository.
- In the `Chart.yaml` the repository should be changed to `https://radar-base.github.io/radar-helm-charts`.
- The `Chart.lock` file should be removed and then run `helm dependency build` to recreate the file with new repository
  URL and remove any `.tgz` files that gets created.

##### kube-prometheus-stack

For this chart, `Chart.yaml` needs to be updated to the latest version, remove `Chart.lock` and run
`helm dependency build`. Make sure to copy the CRDs from
https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack/charts/crds/crds
to
https://github.com/RADAR-base/RADAR-Kubernetes/blob/main/etc/kube-prometheus-stack/files/crds.yaml

## Feedback

Enabling RADAR-base community to use RADAR-Kubernetes is important for us. If you have troubles setting up the platform
using provided instructions, you can create an issue with exact details to reproduce and the expected behaviour.
You can also reach out to the RADAR-base community via RADAR-base Slack on *
*[radar-kubernetes channel](https://radardevelopment.slack.com/archives/C021AGGESC9)**. The RADAR-base developers
support the community on a voluntary basis and will pick up your requests as time permits.
