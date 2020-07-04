proc getEnv {} {
	# procedure definition 

	foreach name [array names ::env] {
		puts "$name: $::env($name)"
	}
}

getEnv;  # procedure call
