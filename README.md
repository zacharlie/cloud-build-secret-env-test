# Cloud Build Secret Env Test

A demo project for showing how to load a value into a build process using Google Cloud Build and the Secret Manager.

Steps:

- Create you Google Cloud Project
- Enable the Cloud Build API and navigate to the [cloud build console](https://console.cloud.google.com/cloud-build/)
- Add a repository. You will need to create a new host connection 
- Create a manual trigger. Point it to your repository and select to use a cloudbuild.yaml configuration
- Add a new secret named `MY_PROJECT_SECRET_VALUE` with a secret value, e.g. `Super secure secret value: 29c7b3cb96a`
- Navigate to the Cloud Build Settings Page and enable Secret Manager and Cloud Build API Access for your default service account
- Run your trigger to run the build

If the build process was a success you should see the secret value echoed out in your build history log.

![build result](https://github.com/zacharlie/cloud-build-secret-env-test/assets/64078329/7e53ab79-463d-45af-92bf-f5f5c5e0d388)