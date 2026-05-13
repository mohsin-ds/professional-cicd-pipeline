
---

# Lab 10: Professional CI/CD Pipelines and Release Engineering

## 1. Project Overview

This project implements a professional **Deployment Assembly Line** using GitHub Actions. It focuses on automating the software lifecycle through **Pipeline-as-Code**, ensuring that every change is verified through rigorous quality gates before reaching production.

## 2. Lab Objectives

* Design and implement a multi-stage CI/CD pipeline using **Pipeline-as-Code**.


* Establish **Quality Gates** including linting, testing, and security scans to protect the production branch.


* Manage **Environment-specific Secrets** and configurations securely.


* Implement advanced **Deployment Strategies** such as Canary releases.


* Automate Release Engineering using **Semantic Versioning (SemVer)** and Conventional Commits.



## 3. Quality Gates

To ensure only high-quality code is deployed, the pipeline includes the following checkpoints:

* **Linting**: Verifies code style using ESLint to maintain consistency.


* **Unit Testing**: Runs isolated tests to verify functions with a goal of high coverage.


* **Security Scanning**: Uses Trivy to scan the filesystem and dependencies for known vulnerabilities.



---

## 4. Task 3: Deployment Strategy Simulation (Canary Release)

As part of this lab, we have documented the implementation of a **Canary Deployment** strategy.

### Implementation Plan

In a Canary release, we deploy the new version of the application to a small, initial subset of users before a full rollout.

* We route **10% of traffic** to the new "canary" version while the remaining 90% stays on the stable version.


* The canary environment is monitored in real-time to detect any regressions before they affect the entire user base.



### Monitoring and Rollout

The "canary" version is monitored using specific health metrics:

* **Error Rates**: We closely monitor for any spike in error rates; if errors exceed a defined threshold, the deployment is immediately halted.


* **Performance**: Latency and response times are compared against the stable version.


* **Rollout**: If the canary remains stable for a set period, traffic is gradually increased to **100% of users**
