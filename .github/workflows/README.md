# GitHub Actions CI/CD Setup

This directory contains GitHub Actions workflows for automated building of the Healora app.

## Workflows

### build.yml
Builds Android APK and iOS app on every push to `main` or `develop` branches.

## Required Secrets

You need to add the following secrets to your GitHub repository:

### 1. ENV_FILE
Contains the `.env` file content. To add:
1. Go to your repo → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Name: `ENV_FILE`
4. Value: Copy the entire content of your `.env` file

### 2. FCM_JSON
Contains the FCM service account JSON file content. To add:
1. Go to your repo → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Name: `FCM_JSON`
4. Value: Copy the entire content of `assets/keys/healora-32e1e-526d13230635.json`

## How to Add Secrets

```bash
# Step 1: Go to your GitHub repository
# Step 2: Settings → Secrets and variables → Actions
# Step 3: Click "New repository secret"
# Step 4: Add each secret with the exact names above
```

## Testing the Workflow

The workflow runs automatically on push/PR to main or develop branches.
You can also trigger it manually from the Actions tab.

## Build Artifacts

After a successful build:
- Android APK: Available in the workflow artifacts as `android-apk`
- iOS Build: Available in the workflow artifacts as `ios-build` (unsigned)

Artifacts are retained for 7 days.
