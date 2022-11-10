# Create a key-pair (credentials to connect to an EC2 instance):
aws ec2 create-key-pair \
--key-name EC2KeyPair
# Defaults to: --key-type rsa --key-format pem

# Create a security group (controls inbound/outbound traffic):
aws ec2 create-security-group \
--group-name my-ec2-security-group \
--description "My security group"
# Will return an ID such as sg-0e29366401074db7e

# Allow inbound SSH from anywhere:
aws ec2 authorize-security-group-ingress \
--group-id sg-0e29366401074db7e \
--protocol tcp \
--port 22 \
--cidr 0.0.0.0/0

# Allow inbound HTTP traffic from anywhere:
aws ec2 authorize-security-group-ingress \
--group-id sg-0e29366401074db7e \
--protocol tcp \
--port 80 \
--cidr 0.0.0.0/0

# Create an EC2 instance with the above key-pair and security-group:
aws ec2 run-instances \
--image-id ami-026b57f3c383c2eec \
--instance-type t2.micro \
--security-group-ids sg-0e29366401074db7e \
--key-name EC2KeyPair \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=kdm-instance}]' \
--block-device-mappings 'DeviceName=/dev/xvda,Ebs={DeleteOnTermination=true,VolumeSize=8,VolumeType=gp2,SnapshotId=snap-07bb85133b158fe99,Encrypted=false}' \
--user-data 'file://aws-ec2-user-data.sh'
