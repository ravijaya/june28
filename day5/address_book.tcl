# Source the Tk Package
package require Tk

# Configure the Window
wm title . "Address Book"

# Main Frame
frame .main -borderwidth 1 -relief solid -padx 10 -pady 10

# Entry Widgets 
entry .main.efirst -width 25
entry .main.elast -width 25
entry .main.eaddress -width 50
entry .main.ecity -width 25
entry .main.estate -width 3
entry .main.ezip -width 5
entry .main.ephone -width 25

# Label Widgets
label .main.first -text "First Name"
label .main.last -text "Last Name"
label .main.address -text "Address"  
label .main.city -text "City"
label .main.state -text "ST"
label .main.zip -text "Zip"
label .main.phone -text "Phone"
label .main.photo -text "Click to Update" -width 15

# Label for Photo Widget
label .main.picture -background black
# -width 15 -height 10

# Button Widgets
button .main.previous -text "Previous" -width 15 -command previousRecord
button .main.next -text "Next" -width 15 -command nextRecord
button .main.add -text "Add" -width 15  -command addRecord
button .main.save -text "Save" -width 15 -command saveRecord
button .main.delete -text "Delete" -width 15 -command deleteRecord
button .main.exit -text "Exit" -width 15 -command exit

# Pack command
pack .main

# Grid command
grid configure .main.efirst -row 0 -column 0 -sticky nw
grid configure .main.elast -row 0 -column 1 -columnspan 2 -sticky nw
grid configure .main.picture -row 0 -column 3 -rowspan 7 -sticky news
grid configure .main.first -row 1 -column 0  -sticky nw
grid configure .main.last -row 1 -column 1 -columnspan 2 -sticky nw
grid configure .main.eaddress -row 2 -column 0 -columnspan 3 -sticky nw
grid configure .main.address -row 3 -column 0 -columnspan 3 -sticky nw
grid configure .main.ecity -row 4 -column 0  -sticky nw
grid configure .main.estate -row 4 -column 1 -sticky nw
grid configure .main.ezip -row 4 -column 2 -sticky nw
grid configure .main.city -row 5 -column 0 -sticky nw
grid configure .main.state -row 5 -column 1 -sticky nw
grid configure .main.zip -row 5 -column 2 -sticky nw
grid configure .main.ephone -row 6 -column 0 -columnspan 2 -sticky nw
grid configure .main.phone -row 7 -column 0 -columnspan 2 -sticky nw
grid configure .main.photo -row 7 -column 3 -sticky nw
grid configure .main.previous -row 8 -column 0 -sticky ne
grid configure .main.next -row 8 -column 2 -sticky nw
grid configure .main.add -row 9 -column 0 -sticky ne
grid configure .main.save -row 9 -column 1 -sticky nw
grid configure .main.delete -row 9 -column 2 -sticky nw
grid configure .main.exit -row 9 -column 3 -sticky nw

# Menu Creation
menu .menubar
. configure -menu .menubar

# Add the first item
set File [menu .menubar.myfile]
.menubar add cascade -label File -menu .menubar.myfile

# Add entries
$File add command -label "Add Record" -command addRecord
$File add command -label "Save Record" -command saveRecord
$File add command -label "Delete Record" -command deleteRecord
$File add separator
$File add command -label "Quit" -command exit

# Add the second item
set Edit [menu .menubar.myedit]
.menubar add cascade -label Edit -menu .menubar.myedit

# Add entry
$Edit add command -label "Find" -command findRecord

# Bind the double mouse click to the picture label – See the Command Appendix for
# for more information on the bind command
bind .main.picture <B1-ButtonRelease> getPicture

# Global Variables
# Text file containing stored records
global addressFile
# Dictionary used for working with records
global addressInfo
# Current Record
global currentRecord
# Record Count
global recordCount
# Image File location
global pictureFile

# Initiaization of the address file
set addressFile "address.txt"

# Start of Procedures
# All procedures will be entered between these comments 

# Add a Record
proc addRecord {} {
	# Access the global variables
	global currentRecord
	global recordCount
	global addressInfo
	global pictureFile
	# Clear current entries
	clearRecord
	set pictureFile ""
	
	# Create a current record number by adding 1 to the total count
	set currentRecord [expr $recordCount +1]
}

# Clear any contents from the entry widgets
proc clearRecord {} {
	.main.efirst delete 0 end	
	.main.elast delete 0 end
	.main.eaddress delete 0 end
	.main.ecity delete 0 end
	.main.estate delete 0 end
	.main.ezip delete 0 end	
	.main.ephone delete 0 end	
	.main.picture configure -image ""	
}

# Associate a photo with the entry
proc getPicture {} {
	# Access the global variables
	global currentRecord
	global addressInfo
	global pictureFile

	# Set the types of images allowed
	set types {
		{{GIF} {.gif}	}
		{{PPM} {.ppm}	}
		{{All Files} *	}
	}

	# Obtain the image file information by using the Open File 
	# Dialog widget
	set filename [tk_getOpenFile -filetypes $types]

	# If an image file was selected then…
	if {$filename != ""} {
		# Now that we have the path to the desired picture
		# we copy it to the working directory.  This is to both illustrate the 
		# file command and to put our images in a safe location
		
		# Get the destination filename by splitting the fullpath into
		# elements and retrieving the last one 
		set listFile [file split $filename]
		set listCount [llength $listFile]
		set listIndex [expr $listCount - 1]

		# Set the picture file variable.
		set pictureFile [lindex $listFile $listIndex]
		
		# If the pictureFile already exists within the working directory 
		# we do not copy it again
		if { [file exists $pictureFile] == 0 } {
			# Copy the image to the current directory
			if {[catch {file copy -force "$filename" $pictureFile} sError]} {
				tk_messageBox -message "File Copy Error $filename to $pictureFile"
			}
		}
		
		# Update the dictionary entry 

		dict set addressInfo $currentRecord PHOTO $pictureFile

		# Display the image onscreen
		image create photo newPicture -file $pictureFile
		.main.picture configure -image newPicture
	}
}
		

# Save the current record
proc saveRecord {} {
	# Access the global variables
	global currentRecord
	global recordCount
	global addressFile
	global addressInfo	
	global pictureFile

	# If the user has entered a record with no data file or the data file
	# has no entries, setup the current record and record count variables
	if { $currentRecord == 0 } {
		incr currentRecord
		incr recordCount
	}
	
	# Add the contents of the entry widgets to the dictionary
	dict set addressInfo $currentRecord ID "$currentRecord"
	dict set addressInfo $currentRecord FNAME "[.main.efirst get]"
	dict set addressInfo $currentRecord LNAME "[.main.elast get]" 
	dict set addressInfo $currentRecord ADDRESS "[.main.eaddress get]" 
	dict set addressInfo $currentRecord CITY "[.main.ecity get]" 
	dict set addressInfo $currentRecord STATE "[.main.estate get]" 
	dict set addressInfo $currentRecord ZIP "[.main.ezip get]" 
	dict set addressInfo $currentRecord PHONE "[.main.ephone get]" 
	dict set addressInfo $currentRecord PHOTO "$pictureFile"
	
	# Write the records to the file
	set fp [open $addressFile w+]
	
	dict for {id info} $addressInfo {
		dict with info {
			# Create an entry for the file
			set data "$ID,$FNAME,$LNAME,$ADDRESS,$CITY,$STATE,$ZIP,$PHONE,$PHOTO\n"
			# Write the entry to the file
	       		puts -nonewline $fp $data
       		}
 	}

	# Set the record count
	set recordCount [dict size $addressInfo]
	# Close the file
	close $fp
}


# This procedure is used to load and display a record 
# from the dictionary
proc loadRecord { } {
	# Access the global variables
	global currentRecord
	global addressInfo

	.main.efirst insert 0 [dict get $addressInfo $currentRecord FNAME]
	.main.elast insert 0 [dict get $addressInfo $currentRecord LNAME]
	.main.eaddress insert 0 [dict get $addressInfo $currentRecord ADDRESS]
	.main.ecity insert 0 [dict get $addressInfo $currentRecord CITY]
	.main.estate insert 0 [dict get $addressInfo $currentRecord STATE]
	.main.ezip insert 0 [dict get $addressInfo $currentRecord ZIP]
	.main.ephone insert 0 [dict get $addressInfo $currentRecord PHONE]
	
	# Load the photo
	if {[dict get $addressInfo $currentRecord PHOTO] > 0} {
		set pictureFile [dict get $addressInfo $currentRecord PHOTO]
		image create photo addressPhoto -file $pictureFile  
		.main.picture configure -image addressPhoto
	}
}

# Move to the next record
proc nextRecord {} {
	# Access the global variables
	global currentRecord
	global recordCount
	
	# Increment the current record counter IF it is less than the record count
	if { $currentRecord < $recordCount } {
		# Clear current entries
		clearRecord
		# Increment the counter
		incr currentRecord
		# Display the record
		loadRecord
	}
}

# Move to the previous record
proc previousRecord {} {
	# Access the global variables
	global currentRecord
	global recordCount

	# Decrement the record counter IF it is more than 1
	if { $currentRecord > 1 } {
		# Clear current entries
		clearRecord
		# Decrement the record counter
		set currentRecord [expr $currentRecord - 1]
		# Display the record
		loadRecord
	}
}


# Delete a record
proc deleteRecord {} {
	# Access the global variables
	global addressFile
	global addressInfo
	global currentRecord
	global recordCount
	
	# If we have records then confirm the users actions with a TK Dialog
	if { $recordCount > 0 } {
		set myTitle "Confirm Request"
		set myMessage "Select OK to delete the current record"
		set response [tk_messageBox -message $myMessage \
			-title myTitle \
			-type okcancel \
			-icon warning]
		
		# If the user selects OK…
		if { $response == "ok" } {
			# Create a temporary containing the new record set
			set tempDict [dict remove $addressInfo $currentRecord]
			
			# Clear the record from the screen
			clearRecord
			
			# Open the file and truncate the contents
			set fp [open $addressFile w+]

			# Setup a local record ID
			set recnum 0
			
			# Cycle through the dictionary and write it to the file 
			dict for {id info} $tempDict {
				dict with info {
					incr recnum
					# Create an entry for the file
					set data \
					"$recnum,$FNAME,$LNAME,$ADDRESS,$CITY,$STATE,$ZIP,$PHONE,$PHOTO\n"
					# Write the entry to the file
	       				puts -nonewline $fp $data
				}
			}
			# Ensure all data is written to the file
			flush $fp
			
			# Close the file
			close $fp
		
			# Clean up the dictionary files
			unset addressInfo
			unset tempDict

			# If we deleted the last record this avoids trying to read in an empty file
			if { [file size $addressFile] > 0 } {
				# Open the file
				set fp [open $addressFile r+]

				# Configure the file to line buffering
				fconfigure $fp -buffering line
	
				# Get the data
				gets $fp data
				
				# Set the local record number to 0 again
				set recno 0

				# Cycle through the file and populate the global dictionary
				while { $data > 0 } {
					# Split the input line on the comma character
					set data2 [split $data ","]

					# Increment the local record counter
					incr recno
		
					# Populate the dictionary
					dict set addressInfo $recno ID [lindex $data2 0]
					dict set addressInfo $recno FNAME [lindex $data2 1]
					dict set addressInfo $recno LNAME [lindex $data2 2] 
					dict set addressInfo $recno ADDRESS [lindex $data2 3] 
					dict set addressInfo $recno CITY [lindex $data2 4] 
					dict set addressInfo $recno STATE [lindex $data2 5] 
					dict set addressInfo $recno ZIP [lindex $data2 6] 
					dict set addressInfo $recno PHONE [lindex $data2 7] 
					dict set addressInfo $recno PHOTO [lindex $data2 8]

					# Update the picture file variable 
					set pictureFile [dict get $addressInfo $recno PHOTO]

					# Get the next line
					gets $fp data
					}
				
				# Update the record counter		
				set recordCount [dict size $addressInfo]

				# Set the current record to be 1
				set currentRecord 1
	
				# Load the first record
				loadRecord
			} else {

				# Advise the user that no records exists
				set myTitle "Missing Records"
				set myMessage "No records exist, please add an entry and click save"
				tk_messageBox -message $myMessage \
				-title $myTitle \
				-type ok \
				-icon warning
				
				# Set the current record and record counter variables
				set currentRecord 0
				set recordCount 0

				# Clear the picture file variable
				set pictureFile ""
			}
		}
	}
}

# Find a record

# First we create and display the new toplevel
proc findRecord { } {
	# Create a local variable to contain the search criteria
	set strLast ""	

	# Create the toplevel 
	toplevel .find

	# Create a main frame
	frame .find.f -borderwidth 1 -relief solid -padx 10 -pady 10

	# Create Entry
	entry .find.f.e -borderwidth 5 -relief solid 
	
	# Create Buttons
	button .find.f.ok -text "Find" -command { set strLast [.find.f.e get]; lookup $strLast }
	button .find.f.cancel -text "Cancel" -command {destroy .find}

	# Pack Command
	pack .find.f

	# Grid command
	grid .find.f.e -row 0 -column 0 -columnspan 2 -sticky news
	grid .find.f.ok -row 1 -column 0 -sticky news
	grid .find.f.cancel -row 1 -column 1 -sticky news
}
 
# Based on the user action we perform a search	
proc lookup { strLast } {
	# Access the global variables
	global addressInfo
	global currentRecord
		
	# Cycle through the dictionary
	dict for {id info} $addressInfo {
		dict with info {
			# Perform a string comparison for the match
       			if { "$strLast" == "$LNAME" } {
				# Set the current record variable
			set currentRecord "$ID"

			# Clear the screen
				clearRecord

				# Display the record
				loadRecord
			}
		}
	}
}

# End of Procedures

# Determine if the address book file exists
if { [file exists $addressFile]} {

	# If the file exists check that it has contents
	# Since we are managing the file through the application we can assume
	# for the sake of our application that it is in the correct format
	if { [file size $addressFile] > 0 } {
		# Open the file
		set fp [open $addressFile r+]
		# Using the fconfigure command (see Command Appendix) we set our
		# buffering to read line by line
		fconfigure $fp -buffering line
		# Read the data using the gets (see Command Appendix) 
		gets $fp data

		# While we are reading the file…
		while {$data >0} {
			# Split the entries on the comma character
			set data2 [split $data ","]

			# Set the record number
			set recno [lindex $data2 0]
		
			# Using the record number as a key, add the data to the dictionary
			dict set addressInfo $recno ID [lindex $data2 0]
			dict set addressInfo $recno FNAME [lindex $data2 1]
			dict set addressInfo $recno LNAME [lindex $data2 2] 
			dict set addressInfo $recno ADDRESS [lindex $data2 3] 
			dict set addressInfo $recno CITY [lindex $data2 4] 
			dict set addressInfo $recno STATE [lindex $data2 5] 
			dict set addressInfo $recno ZIP [lindex $data2 6] 
			dict set addressInfo $recno PHONE [lindex $data2 7] 
			dict set addressInfo $recno PHOTO [lindex $data2 8] 
			set pictureFile [dict get $addressInfo $recno PHOTO]
			gets $fp data
		}
		
		# Close the file
		close $fp
		
		# Determine and set the record count and current record variables
		set recordCount [dict size $addressInfo]
		set currentRecord 1
	
		# Load the first record using a procedure 
		loadRecord
	       	} else {
			# Notify the end user that there are no records to display
			set myTitle "Missing Records"
			set myMessage "No records exist, please add an entry and click save"
			tk_messageBox -message $myMessage \
			-title $myTitle \
			-type ok \
			-icon warning

			# Set the current record variable to 0
			set currentRecord 0

			# Set the record to 0
			set recordCount 0

			# Clear the picture file variable
			set pictureFile ""

		}
} else {
	# Advise the user that there is no address file
	set myTitle "Missing configuration file"
	set myMessage "No address file exists, please add an entry and click save."
	tk_messageBox -message $myMessage \
		-title myTitle \
		-icon warning

			# Set the current record variable to 0
			set currentRecord 0

			# Set the record to 0
			set recordCount 0

			# Clear the picture file variable
			set pictureFile ""
}

