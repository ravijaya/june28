package require rest
package require http 2
package require tls 1.7

http::register https 443 [list ::tls::socket -autoservername true]
# set token [http::geturl https://reqres.in]

set url http://google.com
set file response.out
set out [open $file a]
::http::geturl $url -channel stdout  -blocksize 1024
close $out


