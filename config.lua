Config = {}

Config.lang = "en"

-- MP = MILLES, KM = KILOMETERS
Config.distanceMeasurement = "MP" 

-- es-ES = EUROPEAN, en-US = AMERICAN,   zh-Hans-CN-u-nu-hanidec = CHINESE NUMBERS,    ar-EG = Arabic numbers,   ru-RU = RUSSIAN
-- EXAMPLE: 87445.54     EUROPEAN = 87.445,54    AMERICAN = 87,445.54
Config.formatMoney = "en-US" 

Config.debug = false

-- DEFAULT KEYS FOR CONFIGURATION
Config.taximeterDefaultKey = "F7"
Config.taximeterBtnDefaultKey = "LCONTROL"

-- IF YOU HAVE BASEEVENTS, I RECOMMENDED TURN TRUE
Config.baseevents = false

-- Vehicles to working taximeter
Config.AuthorizedVehicles = {
    'taxi',
    'rentalbus',
    'stretch',
    'patriot2'
}

-- ONLY CAN ADD 6. 6 Rates for 6 buttons
Config.Rates = {
    
	[1] = {
		base = 100.00, -- Base of money
		inMotion = 100, -- Money in motion, price in 1 KM/MP
		onStop = 20.0 -- Money when you stand still, for second.
	},
	[2] = {
		base = 200.00, -- Base of money
		inMotion = 200, -- Money in motion, price in 1 KM/MP
		onStop = 30.0 -- Money when you stand still, for second.
	},
	[3] = {
		base = 300.00, -- Base of money
		inMotion = 300, -- Money in motion, price in 1 KM/MP
		onStop = 40.0 -- Money when you stand still, for second.
	},
	[4] = {
		base = 500.00, -- Base of money
		inMotion = 500, -- Money in motion, price in 1 KM/MP
		onStop = 50.0 -- Money when you stand still, for second.
	},
	[5] = {
		base = 750.00, -- Base of money
		inMotion = 750, -- Money in motion, price in 1 KM/MP
		onStop = 75.0 -- Money when you stand still, for second.
	},
	[6] = {
		base = 1000.00, -- Base of money
		inMotion = 1000, -- Money in motio, price in 1 KM/MP
		onStop = 100.0 -- Money when you stand still, for second.
	}
}
