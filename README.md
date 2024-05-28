# Cloud Build Secret Env Test

A demo project for showing how to load a value into a cloud built container image using Google Cloud Build and the GCP Secret Manager.

This is surprisingly difficult, largely due to the special syntax used to pass the ENV as a build ARG - because the ENV secret is only available in the build script context and not in the container build context.

Some examples where it has happened before:

- https://stackoverflow.com/questions/66223475/google-cloud-build-pass-environment-variable-for-dockerfile
- https://stackoverflow.com/questions/71054568/access-gcp-secret-during-cloud-build-build-step
- https://stackoverflow.com/questions/74959972/cloud-build-does-not-recognize-build-directory-argument
- https://www.googlecloudcommunity.com/gc/Developer-Tools/Using-GCP-secrets-as-part-of-cloud-build/m-p/167538
- https://groups.google.com/g/google-cloud-dev/c/hS3Ef2PrCh0

For a simplistic alternative which simply echoes out the value from bash (without docker) see the [build-a-bash branch](https://github.com/zacharlie/cloud-build-secret-env-test/tree/build-a-bash).

Steps:

- Create your Google Cloud Project
- Enable the Cloud Build API and navigate to the [cloud build console](https://console.cloud.google.com/cloud-build/)
- Add a repository. You will need to create a new host connection.
- Create a manual trigger. Point it to your repository and select to use a dockerfile configuration.
- Add a new secret named `MY_PROJECT_SECRET_VALUE` with a secret value, e.g. `Super secure secret value: 29c7b3cb96a`
- Navigate to the Cloud Build Settings Page and enable Secret Manager and Cloud Build API Access for your default service account.
- Run your trigger to run the build.

If the build process was a success you should see the secret value echoed out in your build history log.