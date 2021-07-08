package example.logical_or

shell_accessible[server.id] {
    server := input.servers[_]
    server.protocols[_] == "telnet"
}

shell_accessible[server.id] {
    server := input.servers[_]
    server.protocols[_] == "ssh"
}