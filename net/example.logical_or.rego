package example.logical_or

default shell_accessible = false

shell_accessible = true {
    input.servers[_].protocols[_] == "telnet"
}

shell_accessible = true {
    input.servers[_].protocols[_] == "ssh"
}