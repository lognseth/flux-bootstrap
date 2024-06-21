package kubernetes.admission

import rego.v1

deny contains msg if {
	input.kind == "Pod"
	container := input.spec.containers[_]
	not container.resources.limits.cpu
	msg = "Pod must have CPU limits specified"
}

deny contains msg if {
	input.kind == "Pod"
	container := input.spec.containers[_]
	not container.resources.limits.memory
	msg = "Pod must have memory limits specified"
}
