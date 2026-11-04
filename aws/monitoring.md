# AWS Monitoring Documentation
 
## 1. Overview
 
Amazon CloudWatch provides monitoring and observability
for AWS resources and applications.
 
## 2. Purpose in Group Sigma
 
CloudWatch is intended to help the team monitor the
availability, performance, and operational health of
the deployed application and its infrastructure.
 
## 3. Monitoring Scope
 
| Resource | Monitoring area |
|---|---|
| EC2 | CPU utilization, network and status checks |
| ALB | Request count, response time, target health |
| CloudFront | Requests, data transfer, error rates |
| Application | Logs and application errors, if configured |
 
## 4. Configuration Record
 
| Setting | Actual value |
|---|---|
| AWS Region | To be recorded |
| CloudWatch dashboard | To be recorded |
| Log groups | To be recorded |
| Metrics | To be recorded |
| Alarms | To be recorded |
| Notification destination | To be recorded |
 
## 5. Alarms
 
Document each configured alarm:
 
- Alarm name.
- Metric and namespace.
- Threshold.
- Evaluation period.
- Alarm actions.
- Notification destination.
 
## 6. Verification
 
- Confirm metrics are being received.
- Confirm the dashboard displays the intended resources.
- Confirm configured alarms change state when appropriate.
- Confirm notifications are delivered, if configured.
 
## 7. Evidence
 
Add genuine screenshots of the dashboard, metrics,
alarms, and notification tests.
 
## 8. Current Status
 
Status: Documentation starter added.
CloudWatch configuration: Not yet verified.
 
## 9. Issues and Lessons Learned
 
Record findings and resolutions here.
