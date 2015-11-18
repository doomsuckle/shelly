LOG_LOCATION=s3://bucketname/gwar/logs
BOOTSTRAP_SCRIPT_LOCATION=s3://bucketname/code/bootstrap
SCRIPT_LOCATION=s3://bucketname/code/bootstrap


aws emr create-cluster 
        --name bears 
        --release-label emr-4.1.0 
        --auto-terminate --use-default-roles
        --applications Name=HIVE Name=PIG Name=SPARK 
        --instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m3.xlarge InstanceGroupType=CORE,InstanceCount=2,InstanceType=m3.xlarge 
        --log-uri ${LOG_LOCATION}
        --bootstrap-actions Path=${BOOTSTRAP_SCRIPT_LOCATION},Args=[],Name=bootstrap 
        --tags Name=clitest 
        --steps Type=Spark,Name="Spark Program",Args=[--deploy-mode,cluster,${SCRIPT_LOCATION},--dest,<SOME DAMN PARAMETER>,Jar="command-runner.jar",ActionOnFailure="CONTINUE
