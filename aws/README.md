# AWS Infrastructure Documentation
 
This directory contains documentation for the AWS architecture and services used in the Group Sigma project.
 
## Services
 
- Amazon EC2

- Application Load Balancer (ALB)

- Amazon S3

- Amazon CloudFront

- AWS Certificate Manager (ACM)

- AWS Identity and Access Management (IAM)

- Amazon CloudWatch

- AWS Budgets
 
## Architecture
 
The intended application traffic flow is:
 
CloudFront → Application Load Balancer → EC2
 
Amazon S3 may be used as a separate storage or content origin, depending on the implemented design.
 
## Implementation Evidence
 
Configuration details, diagrams, and screenshots will be added as the AWS implementation progresses.
 
## Status
 
Infrastructure configuration: To be verified.
 
