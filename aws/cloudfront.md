# Amazon CloudFront Documentation
 
## 1. Overview
 
Amazon CloudFront is a content delivery network that
distributes content to users through edge locations.
 
It can cache content and forward requests to configured
origins.
 
## 2. Purpose in Group Sigma
 
CloudFront is intended to serve as the public content
delivery layer for the Group Sigma application.
 
The planned primary application origin is the
Application Load Balancer.
 
An S3 origin may be configured separately if required
for static assets or other stored content.
 
## 3. Intended Architecture
 
User → CloudFront → Application Load Balancer → EC2
 
If S3 is configured as an additional origin, document
its separate origin and cache behaviour.
 
## 4. Distribution Configuration
 
| Setting | Actual value |
|---|---|
| AWS Region of distribution | Global service |
| Distribution ID | To be recorded |
| Distribution domain | To be recorded |
| Distribution status | To be recorded |
| Origin domain | To be recorded |
| Origin type | To be recorded |
| Default root object | To be recorded |
| Cache policy | To be recorded |
| Viewer protocol policy | To be recorded |
| Alternate domain name | To be recorded, if used |
 
## 5. Origins and Behaviours
 
Document:
 
- The ALB origin.
- Any S3 origin.
- Default cache behaviour.
- Additional path-based behaviours.
- Origin protocol policy.
- Allowed HTTP methods.
- Cache policy and origin request policy.
 
## 6. HTTPS and Certificates
 
For a custom domain served through CloudFront,
the viewer TLS certificate must be provisioned in
US East (N. Virginia), us-east-1.
 
Record the actual certificate and domain configuration.
 
## 7. Security
 
- Use HTTPS for viewer connections.
- Configure the origin connection securely.
- Restrict direct access to the ALB origin where required.
- Use S3 Origin Access Control for a private S3 origin,
  if S3 is used as an origin.
 
S3 Origin Access Control does not secure an ALB origin.
 
## 8. Verification
 
- Distribution is deployed.
- Origin is reachable.
- HTTPS works for the configured domain.
- The application responds through CloudFront.
- Cache behaviour is tested.
- Origin restrictions work as intended.
 
## 9. Evidence
 
Add genuine screenshots of the distribution,
origins, behaviours, certificate, and tests.
 
## 10. Current Status
 
Status: Documentation starter added.
CloudFront deployment: Not yet verified.
 
## 11. Issues and Lessons Learned
 
Record findings and resolutions here.
