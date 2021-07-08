package example

servers:=[
    {"id": "app", "protocols": ["https", "ssh"], "ports": ["p1", "p2", "p3"]},
    {"id": "db", "protocols": ["mysql"], "ports": ["p3"]},
    {"id": "cache", "protocols": ["memcache"], "ports": ["p3"]},
    {"id": "ci", "protocols": ["http"], "ports": ["p1", "p2"]},
    {"id": "busybox", "protocols": ["telnet"], "ports": ["p1"]}
]

networks:=[
    {"id": "net1", "public": false},
    {"id": "net2", "public": false},
    {"id": "net3", "public": true},
    {"id": "net4", "public": true}
]

ports:=[
    {"id": "p1", "network": "net1"},
    {"id": "p2", "network": "net3"},
    {"id": "p3", "network": "net2"}
]

allow = true {                                      # allow is true if...
    count(violation) == 0                           # there are zero violations.
}

violation[server.id] {                              # a server is in the violation set if...
    some server
    public_server[server]                           # it exists in the 'public_server' set and...
    server.protocols[_] == "http"                   # it contains the insecure "http" protocol.
}

violation[server.id] {                              # a server is in the violation set if...
    server := input.servers[_]                      # it exists in the input.servers collection and...
    server.protocols[_] == "telnet"                 # it contains the "telnet" protocol.
}

public_server[server] {                             # a server exists in the public_server set if...
    some i, j
    server := input.servers[_]                      # it exists in the input.servers collection and...
    server.ports[_] == input.ports[i].id            # it references a port in the input.ports collection and...
    input.ports[i].network == input.networks[j].id  # the port references a network in the input.networks collection and...
    input.networks[j].public                        # the network is public.
}