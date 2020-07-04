oo::class create Account

oo::define Account {
	variable AccountNumber Balance

    constructor {account_no} {
        puts "Reading account data for $account_no from database"
        set AccountNumber $account_no
        set Balance 1000000
    }
    destructor {  
        puts "[self] saving account data to database"
    }
}

Account create acc v4004
acc destroy
