oo::class create Account

oo::define Account {
	variable AccountNumber Balance

    constructor {account_no} {
        puts "Reading account data for $account_no from database"
        set AccountNumber $account_no
        set Balance 1000000
    }

	method UpdateBalance {change} {

        incr Balance $change
        return $Balance
    }

    method balance {} { 
		return $Balance 
	}

    method withdraw {amount} {
        return [my UpdateBalance -$amount]
    }

    method deposit {amount} {
        return [my UpdateBalance $amount]
    }

}

Account create acc v4004
# acc UpdateBalance 100
puts [acc balance]
acc deposit 1234
puts [acc balance]
acc withdraw 12
puts [acc balance]
