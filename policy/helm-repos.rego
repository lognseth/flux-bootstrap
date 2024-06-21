package kubernetes.admission

import rego.v1

deny contains msg if {
	input.kind == "HelmRepository"
	not input.spec.url
	msg = "HelmRepository resources must have a URL set."
}
