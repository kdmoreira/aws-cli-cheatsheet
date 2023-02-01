# Create DB instance
aws rds create-db-instance \
--db-instance-identifier kdm-db \
--allocated-storage 20 \
--db-instance-class db.t2.micro \
--engine mysql \
--master-username admin \
--master-user-password 12345678 \
--backup-retention-period 0

# Describe DB instances
aws rds describe-db-instances \
--db-instance-identifier kdm-db

# Create DB snapshot
aws rds create-db-snapshot \
--db-snapshot-identifier kdm-snapshot \
--db-instance-identifier kdm-db

# Describe DB snapshots
aws rds describe-db-snapshots \
--db-instance-identifier kdm-db

# Delete DB snapshot
aws rds delete-db-snapshot \
--db-snapshot-identifier kdm-snapshot

# Delete DB instance
# A final snapshot is created by default,
# so it needs the parameter to create it,
# unless it's skipped (the case below)
aws rds delete-db-instance \
--db-instance-identifier kdm-db \
--skip-final-snapshot
