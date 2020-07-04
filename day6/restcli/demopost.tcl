package require rest
package require http 2
package require tls 1.7

http::register https 443 [list ::tls::socket -autoservername true]


set appid APPID
set uri https://reqres.in/api/users

set data [list name ravi job manager]

set res [rest::simple $uri $data {
        method post
        format json
}]


puts $res
