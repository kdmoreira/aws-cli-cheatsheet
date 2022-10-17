# Starting point
aws cli configure

# Not an IAM command, but useful to know which user is in control
aws sts get-caller-identity

# Users:
aws iam list-users
aws iam create-user --user-name blabla
aws iam delete-user --user-name blabla

# Groups:
aws iam list-groups
aws iam create-group --group-name bla-group

aws iam add-user-to-group \
--user-name blabla \
--group-name bla-group

aws iam delete-group --group-name bla-group

# User Policies:
aws iam attach-user-policy \
--user-name blabla \
--policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# Group Policies:
aws iam attach-group-policy \
--group-name bla-group \
--policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess
