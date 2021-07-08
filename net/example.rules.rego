package example.rules

any_public_networks = true {  # is true if...
    net := input.networks[_]  # some network exists and..
    net.public                # it is public.
}