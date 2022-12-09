# Create an EBS (Elastic Block Store) volume
# gp2 is the default volume-type
aws ec2 create-volume \
--availability-zone us-east-1b \
--volume-type gp2 \
--size 2

# Attach an EBS volume to an EC2 instance
aws ec2 attach-volume \
--device /dev/sdf \
--instance-id i-065c32b85e0c329d4 \
--volume-id vol-0f205a3acc660aa6f

# Create a snapshot of an EBS volume
aws ec2 create-snapshot \
--volume-id vol-0f205a3acc660aa6f \
--description 'Demo Snapshot'

# Copy a snapshot
aws ec2 copy-snapshot \
--source-region us-east-1 \
--source-snapshot-id snap-098343a2abf8d45b8 \
--destination-region eu-west-1b

# Archive a snapshot
aws ec2 modify-snapshot-tier \
--snapshot-id snap-00c778341b6bb0314 \
--storage-tier archive

# Delete a snapshot
aws ec2 delete-snapshot \
--snapshot-id snap-098343a2abf8d45b8

# Detach an EBS volume from an EC2 instance
# This is needed before deleting the volume
aws ec2 detach-volume \
--volume-id vol-0f205a3acc660aa6f

# Delete an EBS volume
aws ec2 delete-volume \
--volume-id vol-0f205a3acc660aa6f
