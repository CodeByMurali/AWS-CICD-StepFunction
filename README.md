# 🛠️ CI/CD Pipeline with AWS Step Functions Orchestration

## Overview

This project implements a robust CI/CD pipeline using **AWS CodePipeline** and **AWS Step Functions** to automate and orchestrate application testing and deployment workflows for the `Numerix-webapp`.

![image](https://github.com/user-attachments/assets/c8d8f186-a7aa-41a0-bc67-654345679233)



## Pipeline Workflow

![image](https://github.com/user-attachments/assets/5143c751-6122-470e-adcb-55d959073d7e)


1. **Trigger:**

   * A code change (commit or pull request) to the `main` branch of the source repository triggers **AWS CodePipeline**.

2. **Step Functions Execution:**

   * CodePipeline invokes a **Step Function**, which acts as the orchestration layer for running multiple CI/CD stages.

3. **Stages in the Step Function:**
   

![image](https://github.com/user-attachments/assets/f135b997-afb7-4c01-8fa3-efc0c42b8fa3)

   * `SetInputParameters`: Initializes commit details and repository info.
   * `ParallelValidation`:

     * Runs **Unit Tests** and **Static Code Analysis** in parallel using CodeBuild.
   * `CheckParallelResults`:

     * If either validation fails, it triggers a **Lambda** to notify failure and exits.
   * `BuildFeatureImage`:

     * If validation passes, builds a Docker image or artifact.
   * `RunSecurityScans`:

     * Executes security scans (e.g., Trivy, Snyk) via CodeBuild.
   * `RunIntegrationTests`:

     * Runs full integration tests in a CodeBuild project.
   * `CheckIntegrationTestResults`:

     * If tests fail, notifies via Lambda.
     * If successful, proceeds to mark PR as ready.
   * `MarkPRReadyForMerge`:

     * Final Lambda to update PR status with success.

5. **Deployment:**

   * Upon success, CodeBuild handles the deployment to an **EC2 instance**, completing the CI/CD flow.

## 🔧 Components Used

* **AWS CodePipeline** – For source tracking and triggering.
* **AWS Step Functions** – For orchestrating test and validation stages.
* **AWS CodeBuild** – For running builds, tests, scans.
* **AWS Lambda** – For notifications and status marking.
* **Amazon EC2** – Target for final deployment.

## ✅ Benefits

* Parallel execution of validations = faster feedback loop.
* Error handling with graceful failover and detailed notifications.
* Modular and extensible architecture using native AWS services.
* Clear status reporting for merge-readiness.


