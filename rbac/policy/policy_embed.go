// +build go1.16

package policy

import (
	_ "embed"
)

//go:embed authz.rego
var policy []byte

func ReadPolicy(path string) ([]byte, error) {
	return policy, nil
}
