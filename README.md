![|552x208, 75%](https://forum.cfx.re/uploads/default/original/4X/8/6/2/8627b8cb47c92eef0021f73128b5e83c8d09a72a.gif)

# Taximeter system :taxi:
---

![zz_scriptsGlow|690x262](https://forum.cfx.re/uploads/default/original/4X/2/5/3/253b4d6851a26c58ad0e765b477bf6bf4d0b48f5.png)

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
![image|508x89, 50%](https://forum.cfx.re/uploads/default/original/4X/b/6/3/b639131bf586a2cc445dfc64461316165d824d24.png)
You have **8 buttons** and to activate them you need to do `LCtrl+1, LCtrl+2, LCtrl+3`...
Remember: You can change LCtrl


---
# Full Preview :movie_camera:

https://streamable.com/vc6jdz


### Feactures Preview

* Animation for buttons and diferents taxes

![buttonAnim|548x232, 75%](https://forum.cfx.re/uploads/default/original/4X/a/2/c/a2c31e96d953423609e00cf2b63565a9b4da1ec7.gif)

* Pause

![pause|562x252, 75%](https://forum.cfx.re/uploads/default/original/4X/6/1/1/611612a26dda90ff350dfc3720b8e7870ab3d0b4.gif)

* Reset

![reset|554x240, 75%](https://forum.cfx.re/uploads/default/original/4X/0/d/a/0daa407a408626cfafe0747299bd05a6ad720df9.gif)

* Keep when driver down or exit

![keepExit|690x339, 75%](https://forum.cfx.re/uploads/default/original/4X/f/8/d/f8d3e8ec01d528fe10dff48afede016f76213c6a.gif)

* Save information when you exit from car

![saveInformationCompress|453x349, 75%](https://forum.cfx.re/uploads/default/original/4X/e/a/9/ea979c30954a07d55df445efe72174889fc0528d.gif)

* Optimization (**WITH BASEEVENT**)

![optimization|690x224, 75%](https://forum.cfx.re/uploads/default/original/4X/e/b/4/eb49a68c5f7ee5e547b682053f5b11ab6b791684.gif)



---
# Message from the author
This is my hobby and not my job, so I disclaim responsibility for anyone who downloads it. I will not help you to install or configure the script, do not expect long term support either. As I say, this is my hobby and I may not maintain the script in the future.
And if in the future I make more scripts, all will be free and will have the same conditions.

Also say that if someone considers my english a bit strange, I'm sorry my native language is not english.
