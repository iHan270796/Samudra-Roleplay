Config = {}

Config.PaymentType = "cash"
Config.UseHistory = true

Config.Paket = {
    ["paket_hemat"] = {
        label = "Paket Hemat",
        image = "moneybag",
        hargaJual = 120000,
        isi = {
            { item = "cheese_burger", qty = 1 },
            { item = "chicken_burger", qty = 1 },
            { item = "burger", qty = 1 },
            { item = "buble_tea_orange", qty = 1 },
            { item = "milkshake_strawberry", qty = 1 },
            { item = "squash_lemon", qty = 1 }
        }
    },
    ["paket_family"] = {
        label = "Paket Family",
        image = "moneybag",
        hargaJual = 200000,
        isi = {
           { item = "cheese_burger", qty = 2 },
            { item = "chicken_burger", qty = 2 },
            { item = "burger", qty = 1 },
            { item = "buble_tea_orange", qty = 2 },
            { item = "milkshake_strawberry", qty = 2 },
            { item = "squash_lemon", qty = 1 }
        }
    }
}

Config.Makanan = {
    ["chiken_wings"] = {
        label = "Chiken Wings",
        image = "chiken_wings",
        hargaJual = 30000,
        bahan = {
            {
                item = "ayam_packing",
                label = "Ayam Packing",
                image = "ayam_packing",
                harga = 250
            },
            {
                item = "cutted_onion",
                label = "Cutted Onion",
                image = "cutted_onion",
                harga = 250
            },
            {
                item = "cutted_cucumber",
                label = "Cutted Bun",
                image = "cutted_bun",
                harga = 250
            }
        }
    },
    ["chiken_teriyaki"] = {
        label = "Chiken Teriyaki",
        image = "chiken_teriyaki",
        hargaJual = 30000,
        bahan = {
            {
                item = "ayam_packing",
                label = "Ayam Packing",
                image = "ayam_packing",
                harga = 250
            },
            {
                item = "cutted_onion",
                label = "Cutted Onion",
                image = "cutted_onion",
                harga = 250
            },
            {
                item = "cutted_cucumber",
                label = "Cutted Bun",
                image = "cutted_bun",
                harga = 250
            },
            {
                item = "cutted_tomato",
                label = "Cutted Tomato",
                image = "cutted_tomato",
                harga = 250
            }
        }
    },
    ["cheese_burger"] = {
        label = "Cheese Burger",
        image = "cheese_burger",
        hargaJual = 30000,
        bahan = {
            {
                item = "cutted_tomato",
                label = "Cutted Tomato",
                image = "cutted_tomato",
                harga = 250
            },
            {
                item = "cutted_onion",
                label = "Cutted Onion",
                image = "cutted_onion",
                harga = 250
            },
            {
                item = "cutted_bun",
                label = "Cutted Bun",
                image = "cutted_bun",
                harga = 250
            },
            {
                item = "cutted_meat",
                label = "Cutted Meat",
                image = "cutted_meat",
                harga = 250
            },
            {
                item = "cheese_slice",
                label = "Cheese Slice",
                image = "cheese_slice",
                harga = 250
            }
        }
    },
    ["chicken_burger"] = {
        label = "Chiken Burger",
        image = "chicken_burger",
        hargaJual = 30000,
        bahan = {
            {
                item = "cutted_bun",
                label = "Cutted Bun",
                image = "cutted_bun",
                harga = 250
            },
            {
                item = "cutted_tomato",
                label = "Cutted tomato",
                image = "cutted_tomato",
                harga = 250
            },
            {
                item = "cutted_chicken",
                label = "Cutted Chicken",
                image = "cutted_chicken",
                harga = 250
            }
        }
    },
    ["burger"] = {
        label = "Beef Burger",
        image = "burger",
        hargaJual = 30000,
        bahan = {
            {
                item = "cutted_cucumber",
                label = "Cutted Cucumber",
                image = "cutted_cucumber",
                harga = 250
            },
            {
                item = "cutted_lettuce",
                label = "Cutted Lettuce",
                image = "cutted_lettuce",
                harga = 250
            },
            {
                item = "cutted_bun",
                label = "Cutted Bun",
                image = "cutted_bun",
                harga = 250
            },
            {
                item = "cutted_onion",
                label = "Cutted Onion",
                image = "cutted_onion",
                harga = 250
            }
        }
    },
    ["buble_tea_orange"] = {
        label = "Buble Tea Orange",
        image = "buble_tea_orange",
        hargaJual = 10000,
        bahan = {
            {
                item = "tea",
                label = "Tea",
                image = "tea",
                harga = 250
            },
            {
                item = "boba",
                label = "Boba",
                image = "boba",
                harga = 250
            },
            {
                item = "sugar",
                label = "Sugar",
                image = "sugar",
                harga = 250
            },
            {
                item = "cutted_orange",
                label = "Cutted Orange",
                image = "cutted_orange",
                harga = 250
            },
            {
                item = "water_bottle",
                label = "Bottle Of Water",
                image = "water_bottle",
                harga = 250
            }
        }
    },
    ["milkshake_strawberry"] = {
        label = "Milkshake strawberry",
        image = "milkshake_strawberry",
        hargaJual = 10000,
        bahan = {
            {
                item = "milkshake_formula",
                label = "Milkshake Formula",
                image = "milkshake_formula",
                harga = 250
            },
            {
                item = "cutted_strawberry",
                label = "Cutted Strawberry",
                image = "cutted_strawberry",
                harga = 250
            },
            {
                item = "sugar",
                label = "Sugar",
                image = "sugar",
                harga = 250
            },
            {
                item = "milk",
                label = "Milk",
                image = "milk",
                harga = 250
            },
            {
                item = "water_bottle",
                label = "Bottle Of Water",
                image = "water_bottle",
                harga = 250
            }
        }
    },
    ["squash_lemon"] = {
        label = "Squash Lemon",
        image = "squash_lemon",
        hargaJual = 10000,
        bahan = {
            {
                item = "cutted_lemon",
                label = "Cutted Lemon",
                image = "cutted_lemon",
                harga = 250
            },
            {
                item = "cutted_orange",
                label = "Cutted Orange",
                image = "cutted_orange",
                harga = 250
            },
            {
                item = "sugar",
                label = "Sugar",
                image = "sugar",
                harga = 250
            },
            {
                item = "water_bottle",
                label = "Bottle Of Water ",
                image = "water_bottle",
                harga = 250
            }
        }
    }
}