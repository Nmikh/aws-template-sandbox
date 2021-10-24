aws dynamodb list-tables --region us-west-2

aws dynamodb put-item --table-name FruitsTable --item '{ "product_id": { "N": "1" }, "name":{ "S": "apple" }, "amount": { "N": "100" } }' --region us-west-2
aws dynamodb put-item --table-name FruitsTable --item '{ "product_id": { "N": "2" }, "name":{ "S": "orange" }, "amount": { "N": "200" } }' --region us-west-2
aws dynamodb put-item --table-name FruitsTable --item '{ "product_id": { "N": "3" }, "name":{ "S": "banana" }, "amount": { "N": "300" } }' --region us-west-2

aws dynamodb get-item --table-name FruitsTable --key '{"product_id": {"N": "1"}}' --region us-west-2
aws dynamodb get-item --table-name FruitsTable --key '{"product_id": {"N": "2"}}' --region us-west-2
aws dynamodb get-item --table-name FruitsTable --key '{"product_id": {"N": "3"}}' --region us-west-2