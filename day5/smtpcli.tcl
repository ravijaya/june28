proc send_simple_message {recipient email_server subject body} {
    package require smtp
    package require mime
    set token [mime::initialize -canonical text/plain -string $body]
    mime::setheader $token Subject $subject
    smtp::sendmessage $token -recipients $recipient -servers $email_server
    mime::finalize $token
}
send_simple_message training@localhost localhost "This is the subject." "This is the message."
