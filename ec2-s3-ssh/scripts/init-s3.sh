touch file1.txt
aws s3 mb s3://nmikh-bucket
aws s3api put-bucket-versioning --bucket nmikh-bucket --versioning-configuration Status=Enabled
aws s3 cp file1.txt s3://nmikh-bucket/