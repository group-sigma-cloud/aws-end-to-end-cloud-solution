# Group Sigma AWS Deployment Checklist
 
## 1. Purpose
 
This checklist documents the deployment, security, monitoring, and operational checks for the Group Sigma AWS end-to-end cloud solution.
 
Use it to verify that the application is deployed correctly, the AWS resources are configured as intended, and the project is ready for demonstration.
 
## 2. Deployment Overview
 
| Item | Configuration |
|---|---|
| Cloud provider | Amazon Web Services (AWS) |
| AWS Region | `eu-north-1` |
| Application delivery | Amazon CloudFront |
| Load balancing | Application Load Balancer (ALB) |
| Compute | Amazon EC2 |
| Scaling | EC2 Auto Scaling Group |
| Static asset storage | Amazon S3 |
| Deployment automation | GitHub Actions |
| AWS authentication for CI/CD | GitHub OIDC |
| Instance management | AWS Systems Manager (SSM) |
| Monitoring | Amazon CloudWatch |
| Notifications | Amazon SNS |
| Cost monitoring | AWS Budgets |
 
## 3. Application Availability
 
- [ ] The application is accessible through the CloudFront distribution.
- [ ] The CloudFront URL loads the application successfully.
- [ ] The application is served over HTTPS.
- [ ] HTTP requests redirect to HTTPS.
- [ ] The application displays correctly in a browser.
- [ ] Static assets load successfully.
- [ ] The application remains available when requests are distributed through the ALB.
- [ ] The EC2 instances registered with the target group report healthy status.
 
**Live application URL:**
 
`https://d94v8pn8slf9f.cloudfront.net`
 
## 4. CloudFront Verification
 
- [ ] The CloudFront distribution is enabled.
- [ ] The default CloudFront certificate is configured for HTTPS.
- [ ] The default behaviour forwards application requests to the ALB.
- [ ] The default behaviour does not cache dynamic application responses.
- [ ] The `/static/*` behaviour routes static assets to the S3 origin.
- [ ] The static asset behaviour uses the CachingOptimized cache policy.
- [ ] The viewer protocol policy redirects HTTP to HTTPS.
- [ ] The S3 origin uses Origin Access Control (OAC).
- [ ] The ALB origin includes the configured origin verification header.
- [ ] A CloudFront invalidation can be created after deployment.
 
## 5. Application Load Balancer Verification
 
- [ ] The ALB is active.
- [ ] The ALB listener is configured on HTTP port 80.
- [ ] The ALB forwards valid application requests to the target group.
- [ ] The origin verification header rule is configured.
- [ ] Requests without the expected origin verification header are rejected with HTTP 403.
- [ ] The ALB security group allows inbound traffic only from the CloudFront managed prefix list.
- [ ] The target group reports the expected EC2 instances as healthy.
- [ ] The ALB is not directly accessible through an unrestricted public route.
 
## 6. EC2 and Auto Scaling Verification
 
- [ ] The EC2 Auto Scaling Group is configured.
- [ ] Minimum capacity is 2 instances.
- [ ] Desired capacity is 2 instances.
- [ ] Maximum capacity is 3 instances.
- [ ] Instances are distributed across two Availability Zones.
- [ ] The target tracking scaling policy monitors average CPU utilization.
- [ ] The target CPU utilization is configured at 50%.
- [ ] The EC2 security group permits application traffic only from the ALB security group.
- [ ] No inbound SSH access on port 22 is permitted.
- [ ] AWS Systems Manager is used for instance management and deployment.
- [ ] The application is running on the EC2 instances.
 
## 7. Amazon S3 Verification
 
- [ ] The S3 bucket contains the required static assets.
- [ ] S3 Block Public Access is enabled.
- [ ] The bucket is not configured for public access.
- [ ] Server-side encryption using SSE-S3 is enabled.
- [ ] The bucket policy permits access through the intended CloudFront distribution using OAC.
- [ ] Static assets can be accessed through CloudFront.
- [ ] Direct access to the S3 object URL is denied with HTTP 403.
 
## 8. Security Verification
 
- [ ] The AWS account root user is not used for routine administration.
- [ ] MFA is enabled for relevant IAM users.
- [ ] IAM permissions follow the principle of least privilege.
- [ ] The GitHub Actions deployment role uses OpenID Connect (OIDC).
- [ ] The GitHub OIDC provider is configured with the expected audience: `sts.amazonaws.com`.
- [ ] The deployment role trusts the intended GitHub repository and workflow identity.
- [ ] Long-lived AWS access keys are not stored in the GitHub repository.
- [ ] GitHub Actions uses the required repository secrets and variables.
- [ ] The ALB security group restricts inbound access to the CloudFront managed prefix list.
- [ ] The EC2 security group accepts application traffic only from the ALB security group.
- [ ] Port 22 is not open to the internet.
- [ ] S3 Block Public Access remains enabled.
- [ ] The CloudFront-to-ALB origin verification header is configured.
 
## 9. CI/CD Verification
 
- [ ] The GitHub Actions workflow file exists at `.github/workflows/deploy.yml`.
- [ ] Pull request checks run for the configured branches.
- [ ] The deployment workflow runs when changes are pushed to `main`.
- [ ] The workflow supports manual execution through `workflow_dispatch`.
- [ ] HTML validation completes successfully.
- [ ] Shell script syntax checks complete successfully.
- [ ] The configured secret scan completes successfully.
- [ ] GitHub Actions authenticates to AWS using OIDC.
- [ ] Static assets are synchronised to S3.
- [ ] The application is deployed to EC2 through AWS Systems Manager.
- [ ] The deployed application version is recorded in `version.txt`.
- [ ] A CloudFront invalidation is created after deployment.
- [ ] The latest deployment workflow completes successfully.
- [ ] The deployed version matches the expected Git commit.
- [ ] A visible application change has been successfully deployed through the pipeline.
 
## 10. Monitoring and Logging Verification
 
- [ ] The CloudWatch log group `/sigma/webapp/nginx-access` exists.
- [ ] The CloudWatch log group `/sigma/webapp/nginx-error` exists.
- [ ] Log retention is configured for 7 days.
- [ ] The EC2 CPU utilisation alarm is configured.
- [ ] The CPU alarm threshold is greater than 80%.
- [ ] The ALB 5xx error-rate alarm is configured.
- [ ] The ALB 5xx alarm threshold is greater than 5%.
- [ ] The SNS topic `sigma-alerts` exists.
- [ ] Required email subscriptions are confirmed.
- [ ] The CPU alarm has been tested.
- [ ] A test alarm notification has been received by email.
 
## 11. AWS Budget Verification
 
- [ ] The monthly recurring AWS budget is configured.
- [ ] The monthly budget amount is USD $5.
- [ ] Actual-spend alerts are configured at 50%, 80%, and 100%.
- [ ] A forecast-spend alert is configured at 100%, if supported.
- [ ] The zero-spend budget is configured.
- [ ] Budget notifications are configured for the intended recipients.
 
## 12. GitHub Repository and Team Verification
 
- [ ] The README documents the architecture and deployment.
- [ ] The architecture diagram is included in the repository.
- [ ] The deployment checklist is committed.
- [ ] The architecture decisions document is committed.
- [ ] Feature branches have been merged through pull requests.
- [ ] The final `develop` to `main` pull request has been merged.
- [ ] Each team member has completed at least one reviewed pull request.
- [ ] Pull request reviews and merge evidence are available.
- [ ] Trello project cards have been moved to Done where work is complete.
- [ ] Relevant screenshots and evidence are available for the presentation.
 
## 13. Final Readiness
 
Before presenting the project, confirm the following:
 
- [ ] The live CloudFront application URL works.
- [ ] HTTPS is working.
- [ ] The application is healthy behind the ALB.
- [ ] The EC2 instances are healthy.
- [ ] Private S3 access through CloudFront works.
- [ ] The CI/CD workflow is green.
- [ ] The deployed version matches the expected commit.
- [ ] Monitoring alarms and SNS notifications have been tested.
- [ ] AWS Budgets are active.
- [ ] The README and architecture diagram are available.
- [ ] The team has prepared its presentation and demonstration.
 
## 14. Evidence to Capture
 
Capture screenshots or other suitable evidence of:
 
1. CloudFront distribution configuration and application URL.
2. ALB listener rules and target group health.
3. EC2 Auto Scaling Group configuration and instance health.
4. S3 Block Public Access and bucket policy.
5. GitHub Actions successful deployment.
6. The deployed application version.
7. CloudWatch alarms and log groups.
8. SNS email notification.
9. AWS Budgets configuration.
10. GitHub pull requests and reviews.
 
## 15. Important Deployment Note
 
The viewer connects to CloudFront over HTTPS. The CloudFront-to-ALB origin connection uses HTTP on port 80, with an origin verification header and network restrictions.
 
This is not end-to-end TLS encryption between the viewer and the ALB. Describe the connection accurately during the project presentation.
 
---
 
**Project:** Group Sigma AWS End-to-End Cloud Solution  
**AWS Region:** `eu-north-1`  
**Application delivery:** Amazon CloudFront
