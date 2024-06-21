package kubernetes.admission

import rego.v1

deny contains msg if {
	input.kind == "HelmRelease"
	not input.spec.interval
	msg = "Kustomization resource must have an interval specified"
}

deny contains msg if {
	# input.kind == "HelmRelease"
	input.request.kind.kind == "HelmRelease"
	not input.spec.driftdetection.enabled
	msg = "Kustomization resource must have driftdetection specified"
}
