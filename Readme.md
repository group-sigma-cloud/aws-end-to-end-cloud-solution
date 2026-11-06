# \# AWS End-to-End Cloud Solution

# 

# \## Project Overview

# 

# This repository documents Group Sigma's end-to-end cloud solution project using Amazon Web Services (AWS).

# 

# The project demonstrates cloud application development, infrastructure planning, security considerations, monitoring, cost management, version control, and automated quality checks.

# 

# \## Project Objectives

# 

# \- Design and deploy a web application on AWS.

# \- Configure an Application Load Balancer (ALB).

# \- Run application workloads on Amazon EC2.

# \- Use Amazon S3 for applicable storage needs.

# \- Configure Amazon CloudFront for content delivery.

# \- Apply AWS IAM and appropriate network security controls.

# \- Implement GitHub Actions for automated application validation.

# \- Document monitoring and cost management.

# \- Apply collaborative Git workflows using feature branches and pull requests.

# 

# \## Architecture

# 

# \*\*Planned architecture:\*\*

# 

# CloudFront → Application Load Balancer → EC2

# 

# Amazon S3 is considered for additional storage or content delivery, depending on the implemented design.

# 

# \*\*Architecture diagram:\*\* To be added.

# 

# Infrastructure components and their configurations will be marked as verified only when supporting evidence is available.

# 

# \## AWS Services

# 

# | Service | Intended role | Status |

# |---|---|---|

# | Amazon EC2 | Application compute | Verification pending |

# | Application Load Balancer | Traffic distribution | Verification pending |

# | Amazon CloudFront | Content delivery | Verification pending |

# | Amazon S3 | Object storage | Verification pending |

# | AWS Certificate Manager | TLS certificates | Verification pending |

# | AWS IAM | Access management | Verification pending |

# | Amazon CloudWatch | Monitoring | Documentation present; configuration verification pending |

# | AWS Budgets | Cost monitoring | Documentation present; configuration verification pending |

# 

# \## Application

# 

# The application is maintained in the `application/` directory.

# 

# Current application files:

# 

# \- `index.html` — application structure.

# \- `style.css` — application styling.

# \- `script.js` — application interactions.

# \- `README.md` — application documentation.

# 

# The local application validation script confirms that the required files, local references, and expected HTML sections are present.

# 

# \## Repository Structure

# 

# ```text

# aws-end-to-end-cloud-solution/

# │

# ├── .github/

# │   └── workflows/

# │       ├── ci.yml

# │       └── README.md

# │

# ├── application/

# │   ├── index.html

# │   ├── style.css

# │   ├── script.js

# │   └── README.md

# │

# ├── aws/

# │   ├── alb.md

# │   ├── budget-management.md

# │   ├── monitoring.md

# │   └── README.md

# │

# ├── docs/

# │   └── README.md

# │

# ├── screenshots/

# │   └── README.md

# │

# ├── scripts/

# │   ├── validate\_site.py

# │   ├── create-feature.ps1

# │   ├── commit-changes.ps1

# │   └── push-feature.ps1

# │

# ├── GIT\_WORKFLOW.md

# └── Readme.md

# ```

# 

# \## GitHub Actions and CI

# 

# The repository includes a GitHub Actions workflow at:

# 

# `.github/workflows/ci.yml`

# 

# The workflow automatically validates the application and checks the presence of key project documentation.

# 

# The validation script is:

# 

# ```powershell

# python scripts\\validate\_site.py

# ```

# 

# The local validation checks include:

# 

# \- Required application files.

# \- CSS and JavaScript file references.

# \- Expected HTML sections.

# \- Project documentation files.

# 

# \*\*Current status:\*\* Local validation passes, and the GitHub Actions workflow has recorded successful runs.

# 

# Note: This workflow performs quality checks. It is not currently being presented as an automated AWS deployment workflow.

# 

# \## Git Automation and Collaboration

# 

# Group Sigma uses feature branches and pull requests to manage changes.

# 

# The repository includes three PowerShell automation scripts:

# 

# | Script | Purpose |

# |---|---|

# | `create-feature.ps1` | Creates feature branches from updated `develop`. |

# | `commit-changes.ps1` | Stages and commits changes using a supplied message. |

# | `push-feature.ps1` | Pushes feature branches to GitHub. |

# 

# The `GIT\_WORKFLOW.md` file documents the team's Git collaboration process.

# 

# \### Merged Pull Requests

# 

# | Pull Request | Contribution | Status |

# |---|---|---|

# | #10 | Application asset structure correction | Merged |

# | #11 | GitHub Actions CI workflow | Merged |

# | #12 | Git automation scripts and team workflow guide | Merged |

# 

# \## Security

# 

# Security documentation and implementation evidence will cover:

# 

# \- IAM access management.

# \- Network security controls.

# \- Application and infrastructure access.

# \- TLS configuration.

# \- Appropriate AWS permissions.

# 

# Configuration claims will be updated as implementation evidence becomes available.

# 

# \## Monitoring and Cost Management

# 

# The `aws/` directory contains documentation covering:

# 

# \- Application Load Balancer.

# \- AWS Budgets.

# \- Monitoring.

# 

# Actual CloudWatch alarms, notifications, and budget configurations must be verified against the AWS environment before being marked as completed.

# 

# \## Screenshots and Evidence

# 

# The `screenshots/` directory is reserved for project implementation evidence, including:

# 

# \- AWS infrastructure configuration.

# \- Application deployment.

# \- GitHub Actions workflow results.

# \- Pull requests and code reviews.

# \- Monitoring and cost management configurations.

# 

# \## Project Status

# 

# \*\*Current status:\*\* Application source, GitHub Actions validation, and Git automation have been implemented and merged into the `develop` branch.

# 

# The local website validator passes, and the GitHub Actions workflow has recorded successful runs.

# 

# AWS infrastructure implementation and deployment verification remain separate project milestones.

# 

# Project activities will be classified as:

# 

# \- Planned

# \- In progress

# \- Completed

# \- Verified

# 

# \## Team

# 

# \*\*Group:\*\* Group Sigma

# 

# Individual team contributions will be documented as project evidence is consolidated.

# 

# \## Final Deployment URL

# 

# To be confirmed and documented alongside current deployment verification evidence.

