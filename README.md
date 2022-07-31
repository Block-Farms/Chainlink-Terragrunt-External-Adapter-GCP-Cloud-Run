# Terragrunt Chainlink External Adapter GCP Cloud Run

## Prerequisites
[1] Google Cloud SDK installed

[2] GCP Account & Project Created

[3] Docker installed locally

## Getting Started via `localhost` workflow

* [Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install). After installation, run `terraform --version` to ensure it works.

* [Install Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/). After installation, run `terragrunt --version` to ensure it works.

* [Prepare Google Cloud SDK]

Login to Google Cloud SDK to allow terragrunt & terraform access
```
gcloud auth application-default login
```
Enable depedent GCP services
```
gcloud services enable containerregistry.googleapis.com
gcloud auth configure-docker
```
## Add Chainlink External Adapter Coingecko image to your GCP container registry
Within Google Cloud SDK:
```
docker pull public.ecr.aws/chainlink/adapters/coingecko-adapter:1.9.1
docker tag public.ecr.aws/chainlink/adapters/coingecko-adapter:1.9.1 gcr.io/chainlink-test-external-adapter/docker/coingecko-adapter:1.9.1
docker push gcr.io/chainlink-test-external-adapter/docker/coingecko-adapter:1.9.1
```

* If the GCS bucket does not exist yet, run this once:
```
terragrunt init --terragrunt-working-dir="C:\your\local\directory\path\Terragrunt-Chainlink-External-Adapter-GCP-Cloud-Run" --terragrunt-non-interactive
```
Note: Once the GCS bucket is created, there is no need to run this command again.

* To determine changes needed to be applied to the infrastructure:
```
terragrunt run-all plan --terragrunt-working-dir="C:\your\local\directory\path\Terragrunt-Chainlink-External-Adapter-GCP-Cloud-Run" --terragrunt-non-interactive
```

* To provision the entire infrastructure by running each module and resolving any module dependencies:
```
terragrunt apply-all --terragrunt-working-dir="C:\your\local\directory\path\Terragrunt-Chainlink-External-Adapter-GCP-Cloud-Run" --terragrunt-non-interactive
```

* To deprovision the entire infrastructure:
```
terragrunt destroy-all --terragrunt-working-dir="C:\your\local\directory\path\Terragrunt-Chainlink-External-Adapter-GCP-Cloud-Run" --terragrunt-non-interactive
```

Test the cloud run URL
```
curl --header "Content-Type: application/json" -d '{"id":"2","data": {"base": "LINK", "to": "USD"}}' https://output-trigger-url
```

The Coingecko External Adapter is now ready to be added to a Chainlink Server via:

GUI `http://localhost:6688` -> Bridge -> New Bridge 


# References
[1] https://cloud.google.com/container-registry/docs/quickstart?hl=en-GB

[2] https://github.com/smartcontractkit/external-adapters-js/tree/develop/packages/sources/coingecko

[3] https://gallery.ecr.aws/chainlink/adapters/coingecko-adapter

[4] https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service

[5] https://www.terraform.io/language/modules/sources#generic-git-repository
