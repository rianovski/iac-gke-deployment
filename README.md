# B2B Reimbursements Platform Repository

This repository is structured to support the B2B reimbursements platform with a clear separation of frontend, backend, infrastructure, and CI/CD configurations.

## Folder Structure

- **code/frontend/**: Contains the frontend code, which is built using Next.js 13 with Server-Side Rendering (SSR). All components, pages, styles, and configurations related to the frontend application can be found here.

- **code/backend/**: Houses the backend server code, developed with Fastify. This folder includes server routes, API handlers, middleware, and configurations for connecting to PostgreSQL and Redis databases.

- **infrastructure/**: Contains the Infrastructure as Code (IaC) scripts, primarily Terraform configurations, that provision and manage infrastructure resources on Google Kubernetes Engine (GKE) in the East Asia Pacific (Jakarta) region. This folder enables consistent, automated environment setup.

- **.github/workflows/**: Holds the CI/CD pipeline configurations for GitHub Actions. The workflow files define the steps for building, testing, and deploying the application to the GKE environment. This also includes steps for managing infrastructure with Terraform.

## Overview

The project is organized to facilitate development, testing, deployment, and infrastructure management. Each folder is modular, making it easier to collaborate and maintain the application as it scales.

For setup instructions and detailed usage, refer to the individual **README.md** files within each subfolder.
