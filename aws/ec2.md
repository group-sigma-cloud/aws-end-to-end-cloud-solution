# Amazon EC2 Documentation
 
## 1. Overview
 
Amazon Elastic Compute Cloud (EC2) provides virtual servers
for running applications in the AWS Cloud.
 
## 2. Purpose in Group Sigma
 
EC2 is intended to host the Group Sigma web application.
 
The planned architecture places EC2 behind an Application
Load Balancer, with CloudFront acting as the content delivery
layer in front of the application.
 
## 3. Intended Traffic Flow
 
User → CloudFront → Application Load Balancer → EC2
 
## 4. Configuration Record
 
Complete these details from the actual AWS Console:
 
| Setting | Actual value |
|---|---|
| AWS account/environment | To be recorded |
| AWS Region | To be recorded |
| Instance name | To be recorded |
| Instance ID | To be recorded |
| AMI / operating system | To be recorded |
| Instance type | To be recorded |
| Availability Zone | To be recorded |
| Public IP | To be recorded, if applicable |
| Private IP | To be recorded |
| Security group | To be recorded |
| Application port | To be recorded |
 
## 5. Network and Security
 
The EC2 security group should permit application traffic
from the Application Load Balancer security group.
 
Avoid exposing the application port directly to the public
internet unless there is a documented reason.
 
Administrative access should be restricted to authorized
users and approved access methods.
 
## 6. Application Deployment
 
Record:
 
- How the application files are transferred.
- What web server or application server is used.
- How the application service is started.
- How the application is restarted after a server reboot.
- Where application logs are stored.
 
## 7. Verification
 
Record the results of these checks:
 
- EC2 instance is running.
- Required application service is running.
- Application responds on its configured port.
- ALB target group reports the instance as healthy.
- Application can be reached through the intended public entry point.
 
## 8. Evidence
 
Add genuine screenshots of the EC2 instance, security group,
and relevant application verification results.
 
## 9. Current Status
 
Status: Documentation starter added.
EC2 deployment: Not yet verified.
 
## 10. Issues and Lessons Learned
 
Record implementation issues and their resolutions here.
