oo::class create Account

oo::define Account {

    variable AccountNumber Balance ;  # memeber variables 

    method UpdateBalance {change} {
		# private method
        incr Balance $change
        return $Balance
    }
    method balance {} { return $Balance }
    method withdraw {amount} {
        return [my UpdateBalance -$amount]
    }
    method deposit {amount} {
        return [my UpdateBalance $amount]
    }
}

puts ::Account
Account create acc
puts [acc balance]


