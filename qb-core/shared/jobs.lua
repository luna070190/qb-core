QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = '平民',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '自由業',
                payment = 10
            },
        },
	},
    ['bestbuds'] = {
        label = 'Bestbuds',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Bud 銷售員',
                payment = 550
            },
            ['1'] = {
                name = '整理者',
                payment = 600
            },
            ['2'] = {
                name = '處理者',
                payment = 750
            },
            ['3'] = {
                name = "管理者",
                isboss = true,
                payment = 1250
            },
        },
    },

    ["uwu"] = {
		label = "uWu Cafe",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = "咖啡師",
				payment = 18
			},
			['1'] = {
				name = "廚師",
				payment = 21
			},
			['2'] = {
				name = "管理者",
				payment = 33,
				isboss = true
			},
			['3'] = {
				name = "擁有者",
				payment = 33,
				isboss = true
			},
		},
	},

	['lspd'] = {
		label = 'LSPD',
        type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '實習警員 Cadet',
                payment = 25
            },
			['1'] = {
                name = '單人實習警員 Solo Cadet',
                payment = 50
            },
			['2'] = {
                name = '警員 Officer',
                payment = 75
            },
			['3'] = {
                name = '警士 Corporal',
                payment = 100
            },
            ['4'] = {
                name = '警長 Sergeant',
                payment = 125
            },
			['5'] = {
                name = '警督 Lieutenant',
                payment = 150
            },
			['6'] = {
                name = '助理總警監 Assistant Chief',
                isboss = true,
                payment = 175
            },
			['7'] = {
                name = '總警監 Chief of Police',
                isboss = true,
                payment = 200
            },
        },
	},
    ['bcso'] = {
		label = 'BCSO',
        type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '實習警員 Cadet',
                payment = 25
            },
			['1'] = {
                name = '單人實習警員 Solo Cadet',
                payment = 50
            },
			['2'] = {
                name = '警員 Deputy',
                payment = 75
            },
			['3'] = {
                name = '警士 Corporal',
                payment = 100
            },
            ['4'] = {
                name = '警長 Sergeant',
                payment = 125
            },
			['5'] = {
                name = '警督 Lieutenant',
                payment = 150
            },
            ['6'] = {
                name = '副警長 Undersheriff',
                isboss = true,
                payment = 225
            },
			['7'] = {
                name = '總警長 Sheriff',
				isboss = true,
                payment = 250
            },
        },
	},

	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '新進人員',
                payment = 50
            },
			['1'] = {
                name = '護理人員',
                payment = 75
            },
			['2'] = {
                name = '醫生',
                payment = 100
            },
			['3'] = {
                name = '外科醫生',
                payment = 125
            },
			['4'] = {
                name = '院長',
				isboss = true,
                payment = 150
            },
        },
	},
	['realestate'] = {
		label = '真實房仲',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '新進人員',
                payment = 50
            },
			['1'] = {
                name = '房屋銷售',
                payment = 75
            },
			['2'] = {
                name = '商務銷售',
                payment = 100
            },
			['3'] = {
                name = '經紀人',
                payment = 125
            },
			['4'] = {
                name = '管理者',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = '計程車',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '新進人員',
                payment = 50
            },
			['1'] = {
                name = '駕駛',
                payment = 75
            },
			['2'] = {
                name = '資深駕駛',
                payment = 100
            },
			['3'] = {
                name = '銷售員',
                payment = 125
            },
			['4'] = {
                name = '管理者',
				isboss = true,
                payment = 150
            },
        },
	},
     ['bus'] = {
		label = '巴士',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '駕駛',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = '車輛經銷商',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '新進人員',
                payment = 50
            },
			['1'] = {
                name = '展示銷售員',
                payment = 75
            },
			['2'] = {
                name = '商務銷售員',
                payment = 100
            },
			['3'] = {
                name = '金融專員',
                payment = 125
            },
			['4'] = {
                name = '管理者',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic'] = {
		label = '技師',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '新進人員',
                payment = 50
            },
			['1'] = {
                name = '初學者',
                payment = 75
            },
			['2'] = {
                name = '有經驗的',
                payment = 100
            },
			['3'] = {
                name = '進階',
                payment = 125
            },
			['4'] = {
                name = '管理者',
				isboss = true,
                payment = 150
            },
        },
	},
	['judge'] = {
		label = '法院',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '法官',
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = '法律公司',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '律師',
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = '新聞局',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '記者',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = '卡車公司',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '駕駛',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = '託運公司',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '駕駛',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = '垃圾車',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '回收員',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = '葡萄園',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '採收者',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = '熱狗攤',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = '銷售員',
                payment = 50
            },
        },
	},
    ["burgershot"] = {
		label = "Burgershot",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "實習人員",
                payment = 50
            },
			['1'] = {
                name = "一般人員",
                payment = 75
            },
			['2'] = {
                name = "煎台人員",
                payment = 100
            },
			['3'] = {
                name = "管理者",
                payment = 125
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 150
            },
        },
	},

    -- ["tuner"] = {
	-- 	label = "Tuner",
	-- 	defaultDuty = true,
	-- 	grades = {
    --         ['0'] = {
    --             name = "Trainee",
    --             payment = 50
    --         },
	-- 		['1'] = {
    --             name = "Employee",
    --             payment = 75
    --         },
	-- 		['2'] = {
    --             name = "Tuner Boss",
	-- 			isboss = true,
    --             payment = 150
    --         },
    --     },
	-- },
    ["tuner"] = {
		label = "Tuner",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "新人",
                payment = 50
            },
			['1'] = {
                name = "正式員工",
                payment = 75
            },
			['2'] = {
                name = "資深員工",
                payment = 100
            },
			['3'] = {
                name = "經理",
                payment = 125
            },
			['4'] = {
                name = "大老闆",
				isboss = true,
                payment = 150
            },
        },
	},
    
}