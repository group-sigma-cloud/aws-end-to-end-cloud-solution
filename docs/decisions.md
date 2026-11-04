# Group Sigma Architecture and Technical Decisions
 
## 1. Purpose
 
This document records the main architecture and technical decisions made during the implementation of the Group Sigma AWS end-to-end cloud solution.
 
It explains the selected AWS services, their responsibilities, and the reasons behind the implementation choices.
 
## 2. Project Architecture
 
The solution uses AWS services to host, deliver, secure, deploy, and monitor a web application.
 
The main request flow is:
 
1. A user accesses the application through a web browser.

2. Amazon CloudFront receives the request over HTTPS.

3. CloudFront forwards application requests to the Application Load Balancer (ALB).

4. The ALB distributes requests to healthy EC2 instances.

5. Static assets are delivered from a private S3 bucket through CloudFront.

6. CloudWatch monitors application and infrastructure activity.

7. SNS sends notifications when configured alarms are triggered.

8. GitHub Actions automates application deployment.
 
## 3. Architecture Decisions
 
### Decision 1: Use Amazon CloudFront as the Application Entry Point
 
**Decision:** Use Amazon CloudFront as the public entry point for application traffic.
 
**Reasoning:**

- Provides HTTPS access for users.

- Provides a single entry point for the application.

- Supports different behaviours for application requests and static assets.

- Supports cache invalidation after deployment.
 
**Implementation:**

- The default behaviour forwards requests to the ALB.

- The `/static/*` behaviour forwards requests to the private S3 origin.

- The default CloudFront certificate provides HTTPS for the distribution domain.

- HTTP viewer requests are redirected to HTTPS.
 
### Decision 2: Use an Application Load Balancer
 
**Decision:** Use an Application Load Balancer between CloudFront and the EC2 application servers.
 
**Reasoning:**

- Distributes application requests across multiple EC2 instances.

- Supports health checks.

- Integrates with EC2 Auto Scaling.

- Helps prevent users from depending on a single application instance.
 
**Implementation:**

- The ALB listens on HTTP port 80.

- Requests are forwarded to the application target group.

- An origin verification header rule rejects requests that do not contain the expected header.

- The ALB security group restricts inbound traffic to the CloudFront managed prefix list.
 
### Decision 3: Use Amazon EC2 for Application Hosting
 
**Decision:** Host the web application on Amazon EC2 instances.
 
**Reasoning:**

- Provides control over the application hosting environment.

- Supports installation and configuration of the web server.

- Integrates with the ALB and Auto Scaling Group.

- Supports deployment through AWS Systems Manager.
 
**Implementation:**

- The application runs on EC2 instances.

- Nginx serves the application.

- The instances are registered with the ALB target group.

- AWS Systems Manager is used for deployment and administration.

- SSH access on port 22 is not permitted.
 
### Decision 4: Use an EC2 Auto Scaling Group
 
**Decision:** Use an Auto Scaling Group to manage the EC2 application instances.
 
**Reasoning:**

- Maintains the required number of application instances.

- Supports scaling based on CPU utilisation.

- Improves availability by distributing instances across Availability Zones.
 
**Implementation:**
 
| Setting | Value |

|---|---|

| Minimum capacity | 2 |

| Desired capacity | 2 |

| Maximum capacity | 3 |

| Availability Zones | 2 |

| Scaling policy | Target tracking |

| Target CPU utilisation | 50% |
 
### Decision 5: Use Amazon S3 for Static Assets
 
**Decision:** Store static application assets in Amazon S3.
 
**Reasoning:**

- Separates static content from application compute resources.

- Provides durable object storage.

- Integrates with CloudFront.

- Avoids making the S3 bucket publicly accessible.
 
**Implementation:**

- S3 Block Public Access is enabled.

- Server-side encryption uses SSE-S3.

- CloudFront accesses the bucket through Origin Access Control (OAC).

- The bucket policy restricts access to the intended CloudFront distribution.

- Static assets are delivered through the `/static/*` CloudFront behaviour.
 
### Decision 6: Use GitHub Actions for CI/CD
 
**Decision:** Use GitHub Actions to automate validation and deployment.
 
**Reasoning:**

- Keeps deployment automation alongside the application source code.

- Supports automated checks when changes are submitted.

- Reduces the need for manual deployment steps.

- Provides a visible deployment history.
 
**Implementation:**

- Workflow file: `.github/workflows/deploy.yml`

- Pull request checks are configured for the relevant branches.

- Pushes to `main` trigger deployment.

- Manual execution is supported through `workflow_dispatch`.

- The workflow validates HTML and shell script syntax and performs a simple secret scan.

- Static assets are synchronised to S3.

- The application is deployed to EC2 through SSM.

- CloudFront is invalidated after deployment.

- The deployed commit is recorded in `version.txt`.
 
### Decision 7: Use GitHub OIDC for AWS Authentication
 
**Decision:** Use GitHub OpenID Connect (OIDC) to authenticate GitHub Actions to AWS.
 
**Reasoning:**

- Avoids storing long-lived AWS access keys in GitHub.

- Allows AWS to validate the GitHub Actions identity.

- Supports restricted, temporary role credentials.

- Supports least-privilege deployment permissions.
 
**Implementation:**

- GitHub OIDC provider URL: `https://token.actions.githubusercontent.com`

- Expected audience: `sts.amazonaws.com`

- An IAM deployment role is configured for the intended GitHub identity.

- The deployment role has permissions required by the deployment workflow.
 
### Decision 8: Use AWS Systems Manager Instead of SSH
 
**Decision:** Use AWS Systems Manager for instance administration and application deployment.
 
**Reasoning:**

- Avoids opening SSH access to the EC2 instances.

- Supports remote commands through AWS-managed services.

- Integrates with the GitHub Actions deployment workflow.
 
**Implementation:**

- The deployment workflow uses SSM RunShellScript.

- The application is downloaded and installed on the EC2 instances.

- Port 22 is not opened for inbound access.
 
### Decision 9: Use Amazon CloudWatch for Monitoring
 
**Decision:** Use CloudWatch metrics, logs, and alarms to monitor the application and infrastructure.
 
**Reasoning:**

- Provides visibility into application and infrastructure activity.

- Helps identify high CPU utilisation and application errors.

- Supports alarm-based notifications.
 
**Implementation:**

- Nginx access logs are stored in `/sigma/webapp/nginx-access`.

- Nginx error logs are stored in `/sigma/webapp/nginx-error`.

- Log retention is configured for 7 days.

- A CPU alarm is configured for utilisation greater than 80%.

- An ALB 5xx error-rate alarm is configured for a rate greater than 5%.
 
### Decision 10: Use Amazon SNS for Notifications
 
**Decision:** Use SNS to deliver monitoring alarm notifications by email.
 
**Reasoning:**

- Provides a notification mechanism when configured alarms are triggered.

- Allows multiple email subscribers to receive alerts.
 
**Implementation:**

- SNS topic: `sigma-alerts`

- Email subscriptions are configured and confirmed.

- The CPU alarm has been tested and an email notification received.
 
### Decision 11: Use AWS Budgets for Cost Monitoring
 
**Decision:** Use AWS Budgets to monitor project spending.
 
**Reasoning:**

- Helps the team monitor cloud expenditure.

- Provides notifications when spending reaches defined thresholds.

- Supports early identification of unexpected costs.
 
**Implementation:**

- A recurring monthly budget of USD $5 is configured.

- Actual-spend alerts are configured at 50%, 80%, and 100%.

- A forecast-spend alert is configured at 100%, if supported.

- A separate zero-spend budget is configured.
 
## 4. Security Design Principles
 
The project follows these security principles:
 
1. **Least privilege:** IAM roles and policies should grant only the permissions required.

2. **Restricted network access:** The ALB accepts inbound traffic from the CloudFront managed prefix list, while EC2 application traffic is restricted to the ALB security group.

3. **No public SSH:** EC2 instances are managed through Systems Manager rather than inbound SSH.

4. **Private object storage:** S3 Block Public Access is enabled, with CloudFront OAC providing access to static assets.

5. **Origin verification:** The ALB checks for the configured CloudFront origin verification header.

6. **Secure CI/CD authentication:** GitHub Actions uses OIDC rather than long-lived AWS access keys.

7. **HTTPS for viewers:** Users access the CloudFront distribution over HTTPS.
 
## 5. Known Trade-offs and Limitations
 
### CloudFront to ALB uses HTTP
 
The viewer-to-CloudFront connection uses HTTPS, but the CloudFront-to-ALB origin connection uses HTTP on port 80.
 
The origin verification header and network restrictions provide additional access controls, but they do not encrypt that origin connection.
 
### Default CloudFront domain
 
The project uses the CloudFront-provided domain and default certificate rather than a custom domain.
 
A custom domain and corresponding certificate would require additional configuration.
 
### Fixed monthly budget
 
The USD $5 budget is a monitoring threshold, not a guarantee that AWS spending cannot exceed that amount. Budget notifications do not automatically stop AWS resources.
 
### Log retention
 
CloudWatch log retention is set to 7 days to limit retained log data and support project monitoring requirements. Longer retention would require a separate decision.
 
## 6. Future Improvements
 
Potential improvements, subject to project requirements and available budget, include:
 
- Configure a custom domain and suitable HTTPS certificate.

- Use HTTPS between CloudFront and the ALB.

- Add more comprehensive application health checks and automated tests.

- Improve deployment rollback and recovery procedures.

- Add dashboards for application and infrastructure metrics.

- Review log retention and centralised logging requirements.

- Expand automated security and dependency scanning.

- Review budget thresholds as the project grows.
 
## 7. Decision Summary
 
| Area | Selected approach |

|---|---|

| Application delivery | Amazon CloudFront |

| Load balancing | Application Load Balancer |

| Compute | Amazon EC2 |

| Scaling | EC2 Auto Scaling Group |

| Static storage | Private Amazon S3 |

| Deployment automation | GitHub Actions |

| AWS authentication | GitHub OIDC |

| Instance management | AWS Systems Manager |

| Monitoring | Amazon CloudWatch |

| Notifications | Amazon SNS |

| Cost monitoring | AWS Budgets |
 
---
 
**Project:** Group Sigma AWS End-to-End Cloud Solution  

**AWS Region:** `eu-north-1`  

**Repository:** `group-sigma-cloud/aws-end-to-end-cloud-solution`
 
