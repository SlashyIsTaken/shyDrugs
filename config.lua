Config = {}

-- To change the webhook, please do so in server/main.lua, line 3

Config.SQLBan = false -- Enable if using SQLban. CAUTION: Do check if the trigger matches yours. server/main.lua, line 129

Config.lbphone = true -- True: enable lb_phone messages as notifications. False: use the notify.lua

Config.dealerPed = 'a_m_m_hasjew_01'
Config.dealerPos = {970.7463, -1144.4193, 25.2000, 153.79}

Config.PedType = 'a_m_o_soucent_03'

Config.EnableSnitch = true -- Enable or disable snitching deals to gangs
Config.SnitchTime = 30000 -- If enabled, time before the gangs get the notification
Config.Random = 5 -- Higher = less chance, lower = higher chance
Config.GangJobs = {
    [1] = 'mc',
    [2] = 'saints',
    -- etc
}

Config.MaxSell = 50 -- How many units can be sold at one location
Config.DealDuration = 15000 -- 15 seconds

Config.cokeItem = 'coke_brick'
Config.cokePriceMax = 2500 -- Price per coke brick
Config.cokePriceMin = 2100

Config.methItem = 'methbag'
Config.methPriceMax = 1000 -- Price per meth pouch
Config.methPriceMin = 500

Config.weedItem = 'weedbag'
Config.weedPriceMax = 700 -- Price per weed pouch
Config.weedPriceMin = 500

Config.Translations = { -- don't change the blue variables, do change the text between "".
    name = 'Mohammed',
    talk = 'Talk with Mohammed',
    talk2 = 'Talk with the dealer',
    busy = 'You are already dealing!',
    busydesc = 'Real men can only do one thing at a time!',
    junk = 'Crack Junk',
    sellprompt = 'What do you want to sell me, you little twat?',
    stopsell = 'Click me if you want to stop selling after this dealer',
    dontwant = 'I want the real shit, not those pieces of trash!',
    backtoboss = 'Go back to my boss.',
    nothing = 'Wasting my time, not even filling my form in!',

    go = 'Go to the next location:',
    goNotify = 'Go to the next location. Waypoint set!',
    pouchfull = 'Your pouches are full. Come prepared next time!',
    minimum = 'You need a minimum of 10 units. No less.',
    serious = 'You kidding me? COME. PREPARED.',
    ty = 'Thanks for the business, kid. Come again next time!',
    bruh = 'Missed chance. Idiot.'
}

Config.DealerCoords = { -- don't change the numbers, do change the coords.
    [1] = {-1112.2235, -1578.3495, 8.6795, 34.5854},
    [2] = {-947.3383, -1551.0868, 5.1775, 18.8852},
    [3] = {-1323.1718, -1025.5245, 7.7498, 118.6097},
    [4] = {-1267.7577, -811.9387, 17.1076, 126.3459},
    [5] = {-604.2888, -802.5153, 25.4038, 87.1480},
    [6] = {-1339.4940, -245.7167, 42.6821, 121.8465},
    [7] = {-2009.2489, 367.4658, 94.8244, 269.6546},
    [8] = {-908.7746, 693.6542, 151.4360, 358.6388},
    [9] = {-747.1613, 808.2271, 215.0322, 286.5634},
    [10] = {128.0333, 565.9805, 183.9595, 5.4494},
    [11] = {385.6542, 66.8961, 97.9780, 157.8943},
    [12] = {50.3483, -108.3785, 55.9989, 338.4030},
    [13] = {880.3788, -205.0714, 71.9764, 148.8010},
    [14] = {1262.3716, -429.9174, 70.0146, 292.1860},
    [15] = {1125.2587, -1010.4827, 44.6704, 94.6886},
    [16] = {264.2839, -1026.7739, 29.2169, 178.1410},
    [17] = {46.1077, -1864.2095, 23.2783, 133.6780},
    [18] = {557.7040, -1759.6436, 29.3130, 244.4929},
    [19] = {454.9207, -1580.2998, 32.8249, 319.4289},
    [20] = {-716.4196, -864.7766, 23.2069, 268.3452},
    [21] = {-2205.8032, -373.8559, 13.3205, 317.3353},
    [22] = {-2963.4587, 432.1765, 15.2764, 85.9255},
    [23] = {-1134.4933, 2682.9070, 18.5140, 130.1854},
    [24] = {1880.5118, 3920.5779, 33.2150, 105.2056},
    [25] = {1142.4220, 2651.1428, 38.1409, 87.6662},
    [26] = {-315.5080, 6193.9585, 31.5608, 43.1369},
    [27] = {149.1231, 6362.6528, 31.5343, 116.5292},
    [28] = {1510.4498, 6326.0059, 24.6071, 59.2007},
    [29] = {2243.3835, 5154.3574, 57.8871, 148.2164},
    [30] = {1654.7974, 4862.0815, 41.9917, 278.5166},
    [31] = {-1.9994, -1442.0236, 30.9631, 180.3844},
    [32] = {-161.1723, -1638.8488, 34.0289, 317.7120},
    [33] = {-528.5319, -1784.7839, 21.5939, 329.2796},
    [34] = {-1579.0557, 185.0768, 58.8584, 201.2085},
    [35] = {-3229.1326, 927.2899, 13.9697, 299.0905},
    [36] = {173.6171, 2778.9685, 46.0773, 186.1874},
    [37] = {1373.3118, -555.7847, 74.6857, 66.7257},
    [38] = {327.0433, -1258.5889, 32.1053, 273.2522},
    [39] = {-500.5667, -731.5366, 33.2119, 268.1176},
    [40] = {-174.3667, -1273.2094, 32.5980, 79.3122}
}

Config.Strings = { -- don't change the numbers, do change the text.
    [1] = "Someone just sold me some whack-ass drugs. Help me beat them up!",
    [2] = "This idiot wants to sell me junk-ass drugs. Get him!",
    [3] = "IM INNOCENT! SOMEONE IS TRYING TO ROB ME!",
    [4] = "Someone is sniffing coke right in front of me, grab his ass!",
    [5] = "These drugs are as lame as my grannies teeth, get his stupid ass!",
    [6] = "HELP!!!!!!!!!!",
    [7] = "This dude says he is the biggest player in the game. True or nahh??",
    [8] = "These motherfuckers are trying to sell me poor quality drugs. Get their booties!",
    [9] = "My grandma cooks better meth than this shit. Help me get them!",
    [10] = "Even whipped cream is nicer to snort, holy shit. Lend me a hand catching these fools, will ya?",
    [11] = "Someone just sold me some whack-ass drugs. Help me beat them up!",
    [12] = "This idiot wants to sell me junk-ass drugs. Get him!",
    [13] = "IM INNOCENT! SOMEONE IS TRYING TO ROB ME!",
    [14] = "Someone is sniffing coke right in front of me, grab his ass!",
    [15] = "These drugs are as lame as my grannies teeth, get his stupid ass!",
    [16] = "HELP!!!!!!!!!!",
    [17] = "This dude says he is the biggest player in the game. True or nahh??",
    [18] = "These motherfuckers are trying to sell me poor quality drugs. Get their booties!",
    [19] = "My grandma cooks better meth than this shit. Help me get them!",
    [20] = "Even whipped cream is nicer to snort, holy shit. Lend me a hand catching these fools, will ya?",
    [21] = "Someone just sold me some whack-ass drugs. Help me beat them up!",
    [22] = "This idiot wants to sell me junk-ass drugs. Get him!",
    [23] = "IM INNOCENT! SOMEONE IS TRYING TO ROB ME!",
    [24] = "Someone is sniffing coke right in front of me, grab his ass!",
    [25] = "These drugs are as lame as my grannies teeth, get his stupid ass!",
    [26] = "HELP!!!!!!!!!!",
    [27] = "This dude says he is the biggest player in the game. True or nahh??",
    [28] = "These motherfuckers are trying to sell me poor quality drugs. Get their booties!",
    [29] = "My grandma cooks better meth than this shit. Help me get them!",
    [30] = "Even whipped cream is nicer to snort, holy shit. Lend me a hand catching these fools, will ya?",
    [31] = "Someone just sold me some whack-ass drugs. Help me beat them up!",
    [32] = "This idiot wants to sell me junk-ass drugs. Get him!",
    [33] = "IM INNOCENT! SOMEONE IS TRYING TO ROB ME!",
    [34] = "Someone is sniffing coke right in front of me, grab his ass!",
    [35] = "These drugs are as lame as my grannies teeth, get his stupid ass!",
    [36] = "HELP!!!!!!!!!!",
    [37] = "This dude says he is the biggest player in the game. True or nahh??",
    [38] = "These motherfuckers are trying to sell me poor quality drugs. Get their booties!",
    [39] = "My grandma cooks better meth than this shit. Help me get them!",
    [40] = "Even whipped cream is nicer to snort, holy shit. Lend me a hand catching these fools, will ya?"
}