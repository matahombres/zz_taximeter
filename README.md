![|552x208, 75%](upload://j8N5fE05sjWFtx7eBJmMpDuhmcO.gif)

# Taximeter system :taxi:
---

![zz_scriptsGlow|690x262](upload://5jmII7oxjmqyerLvNMWnBtigZ13.png)

---

# Feactures :spiral_notepad: 
* Optimized 0.00 idle / 0.03ms highest (With baseevents config activated)
* Multiple languages already configured (Spanish, Italian, French, Czech, Brazilian, English, Chinese, German). Not a perfect translation
* Different currency formats (Decimal with `,` or with `.` and another configurations)
* Baseevents compatibility
* Restricted vehicles
* Diferentes rates
* One price when you move and another price when you are stop
* No loss of information when leaving the car or the game, once the driver exits the vehicle. It will stop automatically
* Full syncroniced with all players in vehicle
* RegisterKeyMapping (The user can change the configuration key as desired)
* Adds opacity when the pause menu is active (does not close the interface completely)

---
# Configuration :clipboard:

[details="Configuration"]
```
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
Config.baseevents = true

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

```
[/details]

---
# Keybind :control_knobs:

>Server owners can change this in the `config.lua`, alternatively, the player base can set their own menu keybind to open Taximeter.
>
>Esc > settings > keybinds > fivem > (TAXI) ...

Keys:

**Taximeter Key:** F7  
Change this to open the taximeter

----
**Key for actuating buttons**: Left Control
![image|508x89, 50%](upload://q01bfD4pDCQybP1BnBuwQ12DGE4.png)
You have **8 buttons** and to activate them you need to do `LCtrl+1, LCtrl+2, LCtrl+3`...
Remember: You can change LCtrl


---
# Full Preview :movie_camera:

https://streamable.com/vc6jdz


[details="Feactures Preview"]
* Animation for buttons and diferents taxes
![buttonAnim|548x232, 75%](upload://ndRoi2EqU0BOFReMDtfIztDbTnx.gif)

* Pause
![pause|562x252, 75%](upload://dQRBx2EbnOJl6wzCxTLkH9xZiHW.gif)

* Reset
![reset|554x240, 75%](upload://1WSY8TjYOtzZ6YY4RVFP8WEtsQp.gif)

* Keep when driver down or exit
![keepExit|690x339, 75%](upload://zveqv3oXOKEXiEpRyDHNLeY7fOa.gif)

* Save information when you exit from car
![saveInformationCompress|453x349, 75%](upload://xtiyb2Z68N73ovmdrg8AiknjJ49.gif)

* Optimization (**WITH BASEEVENT**)
![optimization|690x224, 75%](upload://xzs04ABOERVg4CE8TcFXFq6uJIU.gif)


[/details]


---
# Message from the author
This is my hobby and not my job, so I disclaim responsibility for anyone who downloads it. I will not help you to install or configure the script, do not expect long term support either. As I say, this is my hobby and I may not maintain the script in the future.
And if in the future I make more scripts, all will be free and will have the same conditions.

Also say that if someone considers my english a bit strange, I'm sorry my native language is not english.