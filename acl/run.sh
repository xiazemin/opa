go get -u github.com/open-policy-agent/opa
#brew install opa
opa version

opa run -s

#数据文件加载到OPA:
curl -X PUT http://localhost:8181/v1/data/demo/acl --data-binary @acl.json

#加载策略:
curl -X PUT http://localhost:8181/v1/policies/demo --data-binary @acl.rego

#以input1.json文件来查询策略规则allow，判断alice是否具备write权限:

curl -s -X POST http://localhost:8181/v1/data/demo/policy/allow --data-binary @input1.json |jq

curl -s -X POST http://localhost:8181/v1/data/demo/policy/allow --data-binary @input2.json |jq

#查询具备read权限的所有用户:
curl -s -X POST http://localhost:8181/v1/data/demo/policy/whocan --data-binary '{"input":{"access":"read"}}' |jq