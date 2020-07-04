# configuration of e-mail sending
# is read from a separate file
source configuration.tcl

# actual code
package require mime

# create actual HTML part
# (1.2.1.2.1 from diagram)
set part_html [mime::initialize -canonical "text/html" \
    -encoding quoted-printable -file message.html]

# create logo as inlined image
# (1.2.1.2.2 from diagram)
set part_logo [mime::initialize -canonical "image/gif" \
    -encoding base64 -file companylogo.gif \
    -header [list Content-Disposition "inline"] \
    -header [list Content-ID "companylogo.gif"] \
    ]

# build part that has HTML and logo as multipart/related
# (1.2.1.2 from diagram)
set part_htmlrelated [mime::initialize \
    -canonical multipart/related \
    -parts [list $part_html $part_logo]]

# create plain text version of the message
# (1.2.1.1 from diagram)
set part_txt [mime::initialize \
    -canonical "text/plain" \
    -encoding quoted-printable -file message.txt]

# build multipart/alternative part
# (1.2.1 from diagram)
set part_alternative [mime::initialize \
    -canonical multipart/alternative \
    -parts [list $part_txt $part_htmlrelated]]

# create part for the attachment
# (1.2.2 from diagram)
set part_attachment [mime::initialize \
    -canonical "image/jpeg" \
    -header [list Content-Disposition \
        "attachment; filename=attachment.jpg"] \
    -header [list Content-ID "attachment.jpg"] \
    -encoding base64 -file attachment.jpg]

# build up final version of the message
# (1.2 from diagram)
set all [mime::::initialize -canonical multipart/mixed \
    -parts [list $part_alternative $part_attachment]]

# send message to specified recipient and
# add appropriate headers needed for e-mail 
package require smtp

smtp::sendmessage $all \
    -recipients $recipient -originator $sender \
    -header [list Subject $mailsubject] \
    -header [list From "\"$senderName\" <$sender>"] \
    -header [list To "\"$recipientName\" <$recipient>"] \
    -servers $smtpservers

exit 0

