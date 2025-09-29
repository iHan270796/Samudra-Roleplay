-- Add translations by MC
local Translations = {
    headers = {
        ['bsm'] = 'Boss Menu - ',
    },
    body = {
        ['manage'] = 'Manage Employees',
        ['managed'] = 'Check your Employees List',
        ['hire'] = 'Hire Employees',
        ['hired'] = 'Hire Nearby Civilians',
        ['storage'] = 'Storage Access',
        ['storaged'] = 'Open Storage',
        ['outfits'] = 'Outfits',
        ['outfitsd'] = 'See Saved Outfits',
        ['money'] = 'Money Management',
        ['moneyd'] = 'Check your Company Balance',
        ['mempl'] = 'Manage Employees - ',
        ['mngpl'] = 'Manage ',
        ['grade'] = 'Grade: ',
        ['fireemp'] = 'Fire Employee',
        ['hireemp'] = 'Hire Employees - ',
        ['cid'] = 'Citizen ID: ',
        ['balance'] = 'Balance: $',
        ['deposit'] = 'Deposit',
        ['depositd'] = 'Deposit Money into account',
        ['withdraw'] = 'Withdraw',
        ['withdrawd'] = 'Withdraw Money from account',
        ['depositm'] = 'Deposit Money <br> Available Balance: $',
        ['withdrawm'] = 'Withdraw Money <br> Available Balance: $',
        ['submit'] = 'Confirm',
        ['amount'] = 'Amount',
        ['return'] = 'Return',
        ['exit'] = 'Return',
    },
    drawtext = {
        ['label'] = '[E] Open Job Management',
    },
    target = {
        ['label'] = 'Boss Menu',
    },
    headersgang = {
        ['bsm'] = 'Gang Management  - ',
    },
    bodygang = {
        ['manage'] = 'Manage Gang Members',
        ['managed'] = 'Recruit or Fire Gang Members',
        ['hire'] = 'Recruit Members',
        ['hired'] = 'Hire Gang Members',
        ['storage'] = 'Storage Access',
        ['storaged'] = 'Open Gang Stash',
        ['outfits'] = 'Outfits',
        ['outfitsd'] = 'Change Clothes',
        ['money'] = 'Money Management',
        ['moneyd'] = 'Check your Gang Balance',
        ['mempl'] = 'Manage Gang Members - ',
        ['mngpl'] = 'Manage ',
        ['grade'] = 'Grade: ',
        ['fireemp'] = 'Fire',
        ['hireemp'] = 'Hire Gang Members - ',
        ['cid'] = 'Citizen ID: ',
        ['balance'] = 'Balance: $',
        ['deposit'] = 'Deposit',
        ['depositd'] = 'Deposit Money into account',
        ['withdraw'] = 'Withdraw',
        ['withdrawd'] = 'Withdraw Money from account',
        ['depositm'] = 'Deposit Money <br> Available Balance: $',
        ['withdrawm'] = 'Withdraw Money <br> Available Balance: $',
        ['submit'] = 'Confirm',
        ['amount'] = 'Amount',
        ['return'] = 'Return',
        ['exit'] = 'Exit',
    },
    drawtextgang = {
        ['label'] = '[E] Open Gang Management',
    },
    targetgang = {
        ['label'] = 'Gang Menu',
    },

    --qb-cityhall
    error = {
        not_in_range = 'Too far from the city hall'
    },
    success = {
        recived_license = 'You have recived your %{value} for $50'
    },
    info = {
        new_job_app = 'Your application was sent to the boss of (%{job})',
        bilp_text = 'City Services',
        city_services_menu = '~g~E~w~ - City Services Menu',
        id_card = 'ID Card',
        driver_license = 'Drivers License',
        weaponlicense = 'Firearms License',
        new_job = 'Congratulations with your new job! (%{job})',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Thank you for applying to %(job).",
        jobAppMsg = "Hello %{gender} %{lastname}<br /><br />%{job} has received your application.<br /><br />The boss is looking into your request and will reach out to you for an interview at their earliest convenience.<br /><br />Once again, thank you for your application.",
        mr = 'Mr',
        mrs = 'Mrs',
        sender = 'Township',
        subject = 'Driving lessons request',
        message = 'Hello %{gender} %{lastname}<br /><br />We have just received a message that someone wants to take driving lessons<br />If you are willing to teach, please contact us:<br />Name: <strong>%{firstname} %{lastname}</strong><br />Phone Number: <strong>%{phone}</strong><br/><br/>Kind regards,<br />Township Los Santos'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
