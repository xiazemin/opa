opa run --server ./example.rego
curl -X PUT http://localhost:8181/v1/data/demo/acl --data-binary @network.json

curl  http://localhost:8181/v1/data
curl localhost:8181/v1/data/example/violation -d @input.servers.json -H 'Content-Type: application/json'
curl localhost:8181/v1/data/example/allow -d @input.servers.json -H 'Content-Type: application/json'