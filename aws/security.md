# AWS Security Documentation
 
## 1. Overview
 
This document records the security controls used

to protect the Group Sigma AWS environment.
 
## 2. Security Objectives
 
- Protect AWS resources against unauthorized access.

- Apply least-privilege access.

- Restrict unnecessary network exposure.

- Protect application traffic using HTTPS.

- Protect stored data.

- Avoid exposing credentials and secrets.
 
## 3. IAM Access Management
 
Record:
 
| Setting | Actual value |

|---|---|

| IAM roles | To be recorded |

| IAM policies | To be recorded |

| Administrative users | To be recorded |

| Application roles | To be recorded |

| GitHub Actions role | To be recorded, if used |
 
Use roles and least-privilege policies wherever possible.
 
Do not commit AWS access keys, passwords, private keys,

or tokens into this repository.
 
## 4. Security Groups
 
Document the actual inbound and outbound rules.
 
Intended application traffic:
 
- ALB: Allow approved inbound application traffic.

- EC2: Allow application traffic from the ALB security group.

- Administrative access: Restrict to approved access methods

  and authorized sources.
 
Do not use unrestricted inbound rules without a documented

and justified requirement.
 
## 5. HTTPS and Certificates
 
Record:
 
- ALB listener certificate.

- CloudFront viewer certificate.

- Certificate domains.

- Certificate validation status.

- HTTP-to-HTTPS redirect behaviour, if configured.
 
CloudFront viewer certificates must be in us-east-1.

ALB certificates must be in the ALB's AWS Region.
 
## 6. S3 Security
 
Record:
 
- Block Public Access settings.

- Bucket policy.

- Encryption.

- IAM access.

- CloudFront Origin Access Control, if used.
 
## 7. GitHub Repository Security
 
- Use appropriate organization and repository permissions.

- Review Pull Requests.

- Protect the main branch.

- Keep credentials out of source code.

- Use GitHub Actions secrets or OIDC where appropriate.

- Review workflow permissions.
 
## 8. Security Verification
 
Record the results of:
 
- IAM permission review.

- Security group review.

- HTTPS tests.

- S3 access tests.

- Repository secret review.

- Application access tests.
 
## 9. Evidence
 
Add genuine screenshots or other suitable evidence.

Do not expose credentials or sensitive account information.
 
## 10. Current Status
 
Status: Documentation starter added.

Security configuration: Not yet verified.
 
## 11. Issues and Lessons Learned
 
Record findings and resolutions here.
 
