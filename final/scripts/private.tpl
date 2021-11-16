#!/bin/bash

sudo su
export RDS_HOST=${rds_hostname}
echo $RDS_HOST
yum -y update 
yum -y install java-1.8.0-openjdk
aws s3api get-object --bucket ${bucket_name} --key ${persist_jar} ${persist_jar}
java -jar ${persist_jar}