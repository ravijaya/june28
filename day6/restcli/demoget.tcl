package require rest
package require http 2
package require tls 1.7

http::register https 443 [list ::tls::socket -autoservername true]
# set token [http::geturl https://reqres.in]

set appid APPID
set uri https://reqres.in/api/users

set res [rest::get $uri [list page 2]]
set res [rest::format_json $res]
puts $res
