# Accounts:
aws organizations list-accounts

# Accounts under an organization:
aws organizations list-children \
--parent-id ou-fouu-xxfrpc6z \
--child-type ACCOUNT

# Service Control Policies
aws organizations list-policies --filter SERVICE_CONTROL_POLICY

aws organizations create-policy \
--content "file://s3-deny-policy.json" \
--name DeniedS3BucketCreationDev \
--type SERVICE_CONTROL_POLICY \
--description "Deny S3 Bucket Creation"

# Attach SCP to an account:
aws organizations attach-policy \
--policy-id p-1rmlf9f2 \
--target-id 309775168012

# Attach SCP to an organization:
aws organizations attach-policy \
--policy-id p-1rmlf9f2 \
--target-id ou-fouu-xxfrpc6z
