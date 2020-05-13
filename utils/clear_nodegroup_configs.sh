# Cleans up all parameters for node group creation in Systems Manager Parameter Store

aws ssm delete-parameters --names "ClusterControlPlaneSecurityGroup" "VpcId" "Subnets"