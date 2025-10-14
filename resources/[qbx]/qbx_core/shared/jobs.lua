---Job names must be lower case (top level table key)
---@type table<string, Job>
return {
    ['unemployed'] = {
        label = 'Warga',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Pengangguran',
                payment = 2000
            },
        },
    },
    ['police'] = {
        label = 'Polisi',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Tamtama',
                payment = 4500
            },
            [1] = {
                name = 'BRIPDA',
                payment = 4800
            },
            [2] = {
                name = 'BRIPTU',
                payment = 5000
            },
            [3] = {
                name = 'BRIGPOL',
                payment = 5200
            },
            [4] = {
                name = 'BRIPKA',
                payment = 5500
            },
            [5] = {
                name = 'AIPDA',
                payment = 5800
            },
            [6] = {
                name = 'AIPTU',
                payment = 6200
            },
            [7] = {
                name = 'IPDA',
                payment = 6500
            },
            [8] = {
                name = 'IPTU',
                payment = 6800
            },
            [9] = {
                name = 'AKP',
                payment = 7000
            },
            [10] = {
                name = 'Kompol',
                payment = 7200
            },
            [11] = {
                name = 'AKBP',
                payment = 7500
            },
            [12] = {
                name = 'Kombes',
                payment = 7800
            },
            [13] = {
                name = 'Brigjen',
                payment = 8000
            },
            [14] = {
                name = 'Irjen',
                payment = 8500
            },
            [15] = {
                name = 'Komjen',
                isboss = true,
                payment = 9500
            },
            [16] = {
                name = 'Jenderal',
                isboss = true,
                bankAuth = true,
                payment = 10000
            },
        },
    },
    ['pemerintah'] = {
        label = 'Pemerintah',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'PNS Magang',
                payment = 3500
            },
            [1] = {
                name = 'Staff Umum',
                payment = 4000
            },
            [2] = {
                name = 'Staff Kemendag',
                payment = 4500
            },
            [3] = {
                name = 'Staff Dukcapil',
                payment = 5000
            },
            [4] = {
                name = 'Staff BKPM',
                payment = 5500
            },
            [5] = {
                name = 'Menteri Kemendag',
                payment = 6000
            },
            [6] = {
                name = 'Menteri Dukcapil',
                payment = 6500
            },
            [7] = {
                name = 'Menteri BKPM',
                payment = 7000
            },
            [8] = {
                name = 'Menteri SDM',
                payment = 7500
            },
            [9] = {
                name = 'Menteri Pertahanan',
                payment = 8000
            },
            [10] = {
                name = 'Wakil Presiden',
                isboss = true,
                payment = 9000
            },
            [11] = {
                name = 'Presiden',
                isboss = true,
                bankAuth = true,
                payment = 10000
            },
        },
    },
    ['sasp'] = {
        label = 'SASP',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Officer',
                payment = 75
            },
            [2] = {
                name = 'Sergeant',
                payment = 100
            },
            [3] = {
                name = 'Lieutenant',
                payment = 125
            },
            [4] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['ambulance'] = {
        label = 'EMS',
        type = 'ems',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Magang',
                payment = 3500
            },
            [1] = {
                name = 'Staff',
                payment = 4800
            },
            [2] = {
                name = 'Dokter',
                payment = 5300
            },
            [3] = {
                name = 'Dokter Spesialis',
                payment = 6300
            },
            [4] = {
                name = 'Wakil Direktur',
                isboss = true,
                payment = 7300
            },
            [5] = {
                name = 'Direktur',
                isboss = true,
                bankAuth = true,
                payment = 10000
            },
        },
    },
    ['realestate'] = {
        label = 'Real Estate',
        type = 'realestate',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'House Sales',
                payment = 75
            },
            [2] = {
                name = 'Business Sales',
                payment = 100
            },
            [3] = {
                name = 'Broker',
                payment = 125
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['taxi'] = {
        label = 'Taxi',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Driver',
                payment = 75
            },
            [2] = {
                name = 'Event Driver',
                payment = 100
            },
            [3] = {
                name = 'Sales',
                payment = 125
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['bus'] = {
        label = 'Bus',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Driver',
                payment = 50
            },
        },
    },
    ['cardealer'] = {
        label = 'Vehicle Dealer',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Showroom Sales',
                payment = 75
            },
            [2] = {
                name = 'Business Sales',
                payment = 100
            },
            [3] = {
                name = 'Finance',
                payment = 125
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['mechanic'] = {
        label = 'Mechanic',
        type = 'mechanic',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Apprentice',
                payment = 3500
            },
            [1] = {
                name = 'Junior Mechanic',
                payment = 4800
            },
            [2] = {
                name = 'Certified Mechanic',
                payment = 5500
            },
            [3] = {
                name = 'Lead Mechanic',
                payment = 6500
            },
            [4] = {
                name = 'Garage Manager',
                isboss = true,
                payment = 7500
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 10000
            },
        },
    },
    ['judge'] = {
        label = 'Honorary',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Judge',
                payment = 100
            },
        },
    },
    ['lawyer'] = {
        label = 'Law Firm',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Associate',
                payment = 50
            },
        },
    },
    ['reporter'] = {
        label = 'Reporter',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Journalist',
                payment = 50
            },
        },
    },
    ['trucker'] = {
        label = 'Trucker',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Driver',
                payment = 50
            },
        },
    },
    ['tow'] = {
        label = 'Towing',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Driver',
                payment = 50
            },
        },
    },
    ['garbage'] = {
        label = 'Garbage',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Collector',
                payment = 50
            },
        },
    },
    ['vineyard'] = {
        label = 'Vineyard',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Picker',
                payment = 50
            },
        },
    },
    ['bahamas'] = {
        label = 'Bahamas',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Apprentice',
                payment = 3500
            },
            [1] = {
                name = 'Junior Chef',
                payment = 4800
            },
            [2] = {
                name = 'Senior Chef',
                payment = 6300
            },
            [3] = {
                name = 'Manager',
                payment = 8800
            },
            [4] = {
                name = 'Assistaant Boss',
                isboss = true,
                payment = 9200
            },
            [5] = {
                name = 'Boss',
                isboss = true,
                bankAuth = true,
                payment = 10000
            },
        },
    },
}
