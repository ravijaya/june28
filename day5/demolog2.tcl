package require log

set availableLevels [log::levels]

set availableLevels [lsort -command log::lvCompare -decreasing $availableLevels]
log::lvSuppressLE alert 0


foreach level $availableLevels {
	log::log $level "message logged on $level level"
}

foreach level $availableLevels {
	puts "---"
	puts "Level name: $level"
	puts "Is suppressed: [log::lvIsSuppressed $level]"
}

