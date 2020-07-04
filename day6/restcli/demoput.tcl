package require rest
package require http 2
package require tls 1.7

http::register https 443 [list ::tls::socket -autoservername true]

set uri https://reqres.in/api/users/2

set data [list name sarah job clerk]

set res [rest::simple $uri $data {
        method put
        format json
}]


puts $res
