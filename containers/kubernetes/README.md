## Containers/Kubernetes

### Overview

We're deploying an EKS cluster using **CloudFormation**, additionally you'll find some YAML files in this directory that we're actaully deploying to the cluster via Kustomize. This is currently in-progress, and I'd like to swtich over to GitOps on the cluster eventually.

### CloudFormation

* We're using the **layered** methodology here to deploy our CloudFormation:
* We're setting up all Parameters, whenever possible, in the Containers account SSM Parameter Store.
* We deploy using `aws cloudformation deploy` as our means of deploying single-stack files - this is mainly to take advantage of being able to apply stack-wide tags using the `--tags` option on the fly.
* We have cross-account dependencies with the Storage account (see aws-env/storage) - this is deploying EFS as a backing storage for our Cluster.

Certain Stacks need to be run in a specific order, those whose order can be switched will be separated by a `|` in the list below, in this case, you still need to deploy ALL stacks on that line - otherwise, Stacks need to be deployed in the numerical order they're listed in:

1. parameters.yml
2. iam.yml | networking.yml 
3. securitygroups.yml
4. iam-cross-account-parameters-policy.yml
5. iam-cross-account-parameters.yml
6. eks.yml


