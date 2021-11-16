#!/bin/bash

yum -y update 
yum -y install java-1.8.0-openjdk
aws s3api get-object --bucket ${bucket_name} --key ${calc_jar} ${calc_jar}
java -jar ${calc_jar}