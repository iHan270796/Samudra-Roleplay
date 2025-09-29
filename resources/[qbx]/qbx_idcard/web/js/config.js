// config.js
const config = {
    idCardSettings: {
        closeKey: 'Backspace',
        autoClose: {
            status: false, // or true
            time: 3000
        }
    },
    licenses: {
        'id_card': {
            header: 'Identity',
            // background: '#ebf7fd',            
            backgroundImage: 'https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/ktp_deanix.png',
            prop: 'prop_franklin_dl'
        },
        'driver_license': {
            header: 'Deanix',
            // background: '#febbbb',
            backgroundImage: 'https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/deanix_sim_a.png',
            prop: 'prop_franklin_dl',
        },
        'driver_licenseb': {
            header: 'Deanix',
            // background: '#febbbb',
            backgroundImage: 'https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/deanix_sim_b.png',
            prop: 'prop_franklin_dl',
        },
        'driver_licensec': {
            header: 'Deanix',
            // background: '#febbbb',
            backgroundImage: 'https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/deanix_sim_c.png',
            prop: 'prop_franklin_dl',
        },
        'weaponlicense': {
            header: 'Weapon License',
            background: '#c7ffe5',
            backgroundImage: 'https://i.ibb.co/vxvGzg1/card.png',
            prop: 'prop_franklin_dl',
        },
        'lawyerpass': {
            header: 'Lawyer Pass',
            background: '#f9c491',
            backgroundImage: 'https://i.ibb.co/vxvGzg1/card.png',
            prop: 'prop_cs_r_business_card'
        },
        'licensehunting': {
            header: 'Hunting License',
            background: '#ea6969ff',
            prop: 'prop_franklin_dl',
        }
    }
};

export default config;
