package require smtp
  package require mime


set recipient_list [list training@localhost]
set cc_list [list training@localhost]
set subject {a sample mail}
set body {a sample message}

  set token [mime::initialize -canonical text/plain -string $body]
  smtp::sendmessage $token \
          -header [list Subject $subject] \
          -header [list To [join $recipient_list ","]] \
          -header [list Cc [join $cc_list ","]]
  mime::finalize $token
