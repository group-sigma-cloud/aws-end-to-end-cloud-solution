# Group Sigma – AWS End-to-End Cloud Solution
 
## 1. Project Overview
 
Group Sigma's AWS End-to-End Cloud Solution is a cloud computing project focused on designing, documenting, implementing, and testing a secure, scalable, and reliable web application infrastructure using Amazon Web Services (AWS).
 
The project demonstrates how different AWS services can work together to host and deliver a web application while supporting security, performance, monitoring, and cost management.
 
The solution is developed collaboratively using GitHub for source-code management, documentation, version control, and team collaboration.
 
## 2. Project Objectives
 
The main objectives of this project are to:
 
- Design and implement an end-to-end cloud architecture using AWS.

- Host a sample web application on AWS infrastructure.

- Use Amazon EC2 to provide application computing capacity.

- Use an Application Load Balancer (ALB) to distribute incoming application traffic.

- Use Amazon CloudFront to improve content delivery and application performance.

- Use Amazon S3 for object storage where required by the architecture.

- Apply AWS security best practices, including IAM and security groups.

- Use Amazon CloudWatch to monitor infrastructure and application performance.

- Use AWS Budgets to monitor estimated cloud expenditure.

- Use GitHub to manage application source code, documentation, branches, and pull requests.
 
## 3. Proposed Architecture
 
The proposed architecture uses AWS services to deliver application traffic securely and efficiently.
 
### Architecture flow
 
```text

                    End Users

                        |

                        v

                 Amazon CloudFront

                        |

                        v

              Application Load Balancer

                        |

                        v

                  Amazon EC2

                        |

                        v

                 Web Application
 
             Supporting AWS Services

             -----------------------

             Amazon S3

             AWS IAM

             Amazon CloudWatch

             AWS Budgets

             AWS Certificate Manager

```
 
### Architecture explanation
 
1. **End Users:** Users access the web application through a browser.

2. **Amazon CloudFront:** Delivers content through AWS edge locations and can provide HTTPS for viewer connections.

3. **Application Load Balancer:** Receives application traffic and forwards it to healthy registered targets.

4. **Amazon EC2:** Hosts and runs the web application.

5. **Amazon S3:** Provides object storage for project assets or static content where required.

6. **AWS IAM:** Controls access to AWS resources through users, roles, and policies.

7. **AWS Certificate Manager (ACM):** Manages SSL/TLS certificates for HTTPS connections.

8. **Amazon CloudWatch:** Collects monitoring data, metrics, and logs.

9. **AWS Budgets:** Helps monitor estimated project expenditure.
 

 
## 4. AWS Services Used
 
| AWS Service | Purpose |

|---|---|

| Amazon EC2 | Hosts the web application |

| Application Load Balancer | Distributes incoming application traffic |

| Amazon CloudFront | Provides content delivery and caching |

| Amazon S3 | Stores objects and static assets where required |

| AWS IAM | Manages access and permissions |

| AWS Certificate Manager | Provides SSL/TLS certificate management |

| Amazon CloudWatch | Monitors AWS resources and application performance |

| AWS Budgets | Tracks estimated cloud costs |
 
## 5. Application Description
 
The project includes a sample responsive web application developed using:
 
- HTML for page structure.

- CSS for styling and responsive layouts.

- JavaScript for basic client-side interaction.
 
The application is intended to demonstrate how a web application can be hosted and delivered through AWS infrastructure.
 
### Application features
 
- Responsive web page layout.

- Project introduction and overview.

- Proposed cloud architecture information.

- AWS services description.

- Basic JavaScript interaction.
 
### Application files
 
```text

application/

├── index.html

├── style.css

└── script.js

```
 
The application source code is maintained in this repository.
 
## 6. Security Approach
 
Security is an important part of the project.
 
The solution follows these security principles:
 
### Identity and Access Management (IAM)

- Apply least-privilege access.

- Use appropriate IAM roles and policies.

- Avoid unnecessary administrative permissions.

- Do not store AWS access keys or passwords in the GitHub repository.
 
### EC2 and ALB Security

- Configure security groups to allow only required traffic.

- Allow application traffic to EC2 from the ALB security group rather than exposing the application port directly to the public internet.

- Restrict administrative access to authorized users and approved IP addresses where appropriate.
 
### S3 Security

- Keep S3 buckets private by default.

- Enable S3 Block Public Access unless public access is explicitly required and approved.

- Enable encryption and consider bucket versioning.

- Use CloudFront Origin Access Control when connecting CloudFront to a private S3 origin.
 
### HTTPS and Encryption

- Use HTTPS to protect connections.

- Manage certificates using AWS Certificate Manager.

- Use the appropriate certificate region for CloudFront and the ALB.
 
### GitHub Security

- Do not commit credentials, private keys, tokens, or sensitive configuration files.

- Review changes before merging pull requests.

- Give contributors only the repository permissions they need.
 
## 7. Monitoring and Budget Management
 
### Amazon CloudWatch
 
CloudWatch will be used to monitor the performance and health of the AWS infrastructure.
 
Monitoring areas include:
 
- EC2 instance CPU utilization and status checks.

- Application Load Balancer request and target health metrics.

- Application logs where configured.

- CloudFront request and error metrics where configured.

- CloudWatch alarms for important performance or availability conditions.
 
### AWS Budgets
 
AWS Budgets will help the team monitor estimated cloud expenditure.
 
The budget management approach includes:
 
- Creating a project budget.

- Monitoring actual and forecasted costs.

- Configuring alerts at selected spending thresholds.

- Reviewing AWS costs regularly.

- Avoiding unnecessary running resources.
 

 
## 8. Deployment Status
 
The project is being developed in stages.
 
| Component | Status |

|---|---|

| GitHub repository | Created |

| Project README | Documentation in progress |

| Feature branches | Created for project components |

| Pull requests | Used for team collaboration |

| Sample web application | Source code prepared |

| EC2 deployment | Not yet verified |

| Application Load Balancer | Not yet verified |

| Amazon S3 | Not yet verified |

| CloudFront | Not yet verified |

| IAM security configuration | Not yet verified |

| HTTPS configuration | Not yet verified |

| CloudWatch monitoring | Not yet verified |

| AWS Budgets | Not yet verified |
 

 
## 9. Screenshots and Project Evidence
 
Screenshots and other evidence will be maintained in the `screenshots/` directory.
 
Suggested evidence includes:
 
1. GitHub repository and branch structure.

2. Successful pull request and merge history.

3. Sample application running in a browser.

4. EC2 instance configuration and running status.

5. Application Load Balancer configuration and healthy targets.

6. S3 bucket configuration.

7. CloudFront distribution configuration.

8. HTTPS connection in a browser.

9. CloudWatch dashboard and alarms.

10. AWS Budgets configuration and alerts.
 
Example folder structure:
 
```text

screenshots/

├── github/

├── application/

├── ec2/

├── alb/

├── s3/

├── cloudfront/

├── security/

└── monitoring/

```
 
Only add genuine screenshots from the actual project. Do not include credentials, account-sensitive information, or private keys.
 
## 10. GitHub Collaboration and Workflow
 
GitHub is used to manage project development and team collaboration.
 
The team workflow includes:
 
1. The `main` branch contains the reviewed project version.

2. The `develop` branch is used for integrating project contributions.

3. Feature branches are used for individual components.

4. Contributors commit their work to their assigned feature branches.

5. Pull requests are created from feature branches into `develop`.

6. Team members review proposed changes before merging.

7. Once the work is integrated and reviewed, a final pull request is created from `develop` into `main`.
 
### Main branches
 
- `main` – reviewed project version.

- `develop` – integration branch.

- `feature/application` – application development.

- `feature/ec2-documentation` – EC2 documentation.

- `feature/alb-documentation` – ALB documentation.

- `feature/s3-documentation` – S3 documentation.

- `feature/cloudfront-documentation` – CloudFront documentation.

- `feature/security-documentation` – security documentation.

- `feature/monitoring-documentation` – monitoring and budget documentation.
 
## 11. Team Contributions
 
Group Sigma works collaboratively to design, document, and implement the cloud solution.
 
| Team Member | Responsibility | Contribution |

|---|---|---|

| Sharon | Project Lead | Coordination, architecture, and integration |

| Daniel | Application Developer | Web application development |

| Winfred | EC2 and Infrastructure | EC2 setup and documentation |

| Jonathan | Load Balancing | ALB configuration and documentation |

| Shadrack | Storage and Content Delivery | S3 and CloudFront |

| Harold | Security and Monitoring | IAM, security, CloudWatch, and budgets |
 

 
## 12. Project Challenges and Lessons Learned
 
During the project, the team aims to develop practical experience in:
 
- Designing cloud infrastructure using AWS.

- Managing access and permissions securely.

- Configuring communication between AWS services.

- Managing source code through GitHub branches.

- Reviewing and merging pull requests.

- Monitoring cloud infrastructure.

- Managing cloud expenditure.

- Documenting technical work and implementation evidence.
 
## 13. Future Improvements
 
Potential improvements include:
 
- Automating application deployment using GitHub Actions.

- Using IAM roles and GitHub OIDC for secure deployment automation.

- Adding additional monitoring and alerting.

- Improving application availability and scalability.

- Implementing infrastructure as code.

- Expanding application functionality.
 
 
## 14. Conclusion
 
Group Sigma's AWS End-to-End Cloud Solution demonstrates the process of designing and developing a cloud-hosted web application using AWS services.
 
The project combines application development, cloud infrastructure, security, monitoring, cost management, and collaborative software development practices.
 
The final project documentation will be updated with verified AWS configurations, deployment results, screenshots, and implementation evidence.
 
---
 
**Project:** Group Sigma – AWS End-to-End Cloud Solution  

**GitHub Organization:** [group-sigma-cloud](https://github.com/group-sigma-cloud)  

**Repository:** [aws-end-to-end-cloud-solution](https://github.com/group-sigma-cloud/aws-end-to-end-cloud-solution)
 
