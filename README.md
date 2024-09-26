# github-actions
This repository is managed by the Ybor Platform Team in order to provide Github Actions templates. This allows Ybor's Platform Team to improve the pipelines over time and seamlessly integrate updates into the respective projects.

## Example

Here is an example of leveraging this resource from another repository. The `uses` keyword allows the external project to reference a specific implementation within this repository as well as feed in values from their own project, organization, etc. 

File: `.github/workflows/build-dev.yml`
```yaml
name: DEV Environment Build

on:
  - push
  - workflow_dispatch
  
jobs:
  build_and_deploy:
    uses: ybor-platform/github-actions/.github/workflows/build-deploy-maven.yaml@main
    secrets:
      ARTIFACTORY_USERNAME: ${{ secrets.ARTIFACTORY_USERNAME }}
      ARTIFACTORY_IDENTITY_TOKEN: ${{ secrets.ARTIFACTORY_IDENTITY_TOKEN }}
      UPDATE_MANIFEST_TOKEN: ${{ secrets.UPDATE_MANIFEST_TOKEN }}
```

The above example utilizes 3 secrets defined in the project hosting this file, these secrets can be from the Github Environment, Respository, Organization level.

If you are having trouble with the secrets, you can check to make sure the names are assigned correctly in the respective repository's settings. Inside of the repository settings, go to "Secrets and variables" and select "Actions". This will display all of the secret keys which you can confirm align with the github actions definition. 

If the keys are correct and you suspect that the secret values are incorrect please reach out to the Platform Team so that we can go over the keys from the different  services being leveraged through github actions.
