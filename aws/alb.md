# Application Load Balancer (ALB)
 
## 1. Overview
 
An Application Load Balancer is an AWS service that distributes incoming application traffic across registered targets, such as EC2 instances.
 
## 2. Purpose in the Project
 
The ALB is intended to receive application traffic forwarded from Amazon CloudFront and distribute requests to the EC2 application server.
 
## 3. Intended Architecture
 
CloudFront → Application Load Balancer → EC2
 
## 4. Configuration
 
The following details will be recorded after implementation:
 
- AWS Region:

- Load balancer name:

- Load balancer type:

- Scheme:

- Listener configuration:

- Target group:

- Target health status:

- Health check path:
 
## 5. Security
 
The intended security configuration includes:
 
- HTTPS where configured.

- Appropriate security group restrictions.

- Traffic forwarding to the registered application targets.

- Restricted access to the EC2 application server through the ALB security group.
 
## 6. Verification
 
The following checks will be recorded after implementation:
 
- Load balancer state.

- Listener status.

- Target group health.

- Application accessibility through the ALB endpoint.
 
## 7. Evidence
 
Actual AWS Console screenshots will be added after configuration and verification.
 
## 8. Current Status
 
**Status: Documentation started. AWS implementation not yet verified.**
 
## 9. Issues and Lessons Learned
 
To be updated during implementation.
 
