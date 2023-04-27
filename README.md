# shyDrugs
ESX Drugs run script for Fivem Roleplay servers<br>

This script features a run-like system, where the drug seller (player) has to interact with a main dealer/broker, to get locations of his subdealers. The player then has to drive to those subdealers, to sell a configurable amount of drugs there. After the sale, the player can either choose to continue the run or to stop selling drugs. <br>

A configurable option is also to alert people with certain jobs (police, or gangs) of the deal. In a configurable probability of occasionality, a phone message or a notification, depending on configuration, is sent to the players with the specified jobs.

# How it works
- Player drives to the location where the main dealer or broker is standing.<br>
- Player talks with the broker, player now gets a message giving him details on where to go.<br><br>
![image](https://user-images.githubusercontent.com/105020169/234815854-d1f270e8-db02-4275-9ad6-3aa67df82e69.png)<br><br>
- Player now drives to the specified location, and talks with the dealer there.<br><br>
![image](https://user-images.githubusercontent.com/105020169/234815255-77ee4bba-b8db-4edb-a01a-f33a6934555a.png)<br><br>
- Depending on the player's choice to continue dealing, the system will either repeat itself or the broker will message him that the run has ended.<br>

# Performance:
0.01ms when standing within 2 meters of the NPC's, for the rest 0.00ms throughout the whole script. <br>

# Dependencies:
As of right now, the script is still a work-in-progress and thus is not fully configurable yet. If you don't have one of the requirements, you'll have to modify the script in order for it to work. Feel free to open an issue if you need help adjusting the script. <br>
- es_extended <br>
- ox_lib & ox_inventory <br>
- lb_phone or any notification system. <br>

# Installation:
- Clone the repository, and configure the config.lua & notify.lua to your liking.

Feel free to recommend me updates, or to leave some constructive criticism. Would love that.<br>
