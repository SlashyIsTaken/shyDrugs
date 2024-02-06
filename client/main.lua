ESX = exports['es_extended']:getSharedObject()

local isDealing = false
local List = {}

-- Distance loop
Citizen.CreateThread(function()
    local show = false
    local coords = vector3(Config.dealerPos[1], Config.dealerPos[2], Config.dealerPos[3])
    while true do
        local shortestDistance = math.huge
        local playerPos = GetEntityCoords(PlayerPedId())
        local distance = #(playerPos - coords)

        if distance < shortestDistance then
            shortestDistance = distance
        end

        if distance <= 2 then
            if not show then
                lib.showTextUI('[E] - '..Config.Translations.talk)
                show = true
            end
            while distance <= 2 do
                if IsControlJustPressed(0, 38) and not isDealing then
                    isDealing = true
                    SendToBuyer()
                elseif IsControlJustPressed(0, 38) and isDealing then
                    lib.notify({
                        title = Config.Translations.busy,
                        description = Config.Translations.busydesc,
                        type = 'error'
                    })
                end
                Citizen.Wait(1)
                playerPos = GetEntityCoords(PlayerPedId())
                distance = #(playerPos - coords)
            end
        elseif show then
            lib.hideTextUI()
            show = false
        end
        Citizen.Wait(100 + math.floor(shortestDistance * 10))
    end
end)

-- Dealer NPC
Citizen.CreateThread(function()
    local hash = GetHashKey(Config.dealerPed)
	RequestModel(hash)
	while not HasModelLoaded(hash) do
		Citizen.Wait(1)
	end	
	dealerNPC = CreatePed(1, hash, Config.dealerPos[1], Config.dealerPos[2], Config.dealerPos[3]-1, Config.dealerPos[4], false, true)
	SetBlockingOfNonTemporaryEvents(dealerNPC, true)
	SetPedDiesWhenInjured(dealerNPC, false)
	SetPedCanPlayAmbientAnims(dealerNPC, true)
	SetPedCanRagdollFromPlayerImpact(dealerNPC, false)
	SetEntityInvincible(dealerNPC, true)
	FreezeEntityPosition(dealerNPC, true)
    TaskStartScenarioInPlace(dealerNPC, 'WORLD_HUMAN_SMOKING_POT', 0, true)
end)

-- Functions
function SendToBuyer()
    if isDealing then
        if Config.EnableSnitch then
            if math.random(1, Config.Random) == 1 then
                TriggerServerEvent('shyDrugs:placeOrder', true)
            else
                TriggerServerEvent('shyDrugs:placeOrder', false)
            end
        else
            TriggerServerEvent('shyDrugs:placeOrder', false)
        end
    end
end

-- Net Events
RegisterNetEvent('shyDrugs:SyncNPC')
AddEventHandler('shyDrugs:SyncNPC', function(coords, nr)
    local hash = GetHashKey(Config.PedType)
	RequestModel(hash)
	while not HasModelLoaded(hash) do
		Citizen.Wait(1)
	end	
	NPC = CreatePed(1, hash, coords[1], coords[2], coords[3]-1, coords[4], false, true)
	SetBlockingOfNonTemporaryEvents(NPC, true)
	SetPedDiesWhenInjured(NPC, false)
	SetPedCanPlayAmbientAnims(NPC, true)
	SetPedCanRagdollFromPlayerImpact(NPC, false)
	SetEntityInvincible(NPC, true)
	FreezeEntityPosition(NPC, true)
    TaskStartScenarioInPlace(NPC, 'WORLD_HUMAN_DRUG_DEALER_HARD', 0, true)
    List[nr] = NPC
end)

RegisterNetEvent('shyDrugs:DelNPC')
AddEventHandler('shyDrugs:DelNPC', function(nr)
    SetEntityAsNoLongerNeeded(List[nr])
    FreezeEntityPosition(List[nr], false)
end)

RegisterNetEvent('shyDrugs:DistCheck')
AddEventHandler('shyDrugs:DistCheck', function(coords, nr)
    local show = false
    local amount = "NoCheating"
    local pos = vector3(coords[1], coords[2], coords[3])
    while true do
        if isDealing then
            local shortestDistance = math.huge
            local playerPos = GetEntityCoords(PlayerPedId())
            local distance = #(playerPos - pos)

            if distance < shortestDistance then
                shortestDistance = distance
            end

            if distance <= 2 then
                if not show then
                    lib.showTextUI('[E] - '..Config.Translations.talk2)
                    show = true
                end
                while distance <= 2 do
                    if IsControlJustPressed(0, 38) then
                        local input = lib.inputDialog(Config.Translations.junk, {
                            {type = 'number', label = Config.Translations.sellprompt, description = '1 = Coke, 2 = Meth, 3 = Weed', icon = 'hashtag'},
                            {type = 'checkbox', label = Config.Translations.stopsell}
                        })
                        if input then
                            if input[1] > 0 and input[1] < 4 then
                                FreezeEntityPosition(PlayerPedId(), true)
                                if lib.progressCircle({
                                    duration = Config.DealDuration,
                                    position = 'bottom',
                                    useWhileDead = false,
                                    canCancel = false,
                                    disable = {
                                        car = true,
                                    },
                                    anim = {
                                        dict = 'mp_weapons_deal_sting',
                                        clip = 'crackhead_bag_loop'
                                    },
                                }) then
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    TriggerServerEvent('shyDrugs:SellBatch', amount, input[1], not input[2], nr)
                                end
                            else
                                isDealing = false
                                lib.notify({
                                    title = Config.Translations.dontwant,
                                    description = Config.Translations.backtoboss,
                                    type = 'error'
                                })
                                SetEntityAsNoLongerNeeded(List[nr])
                                FreezeEntityPosition(List[nr], false)
                                Citizen.Wait(5000)
                                DeleteEntity(List[nr])
                            end
                        else
                            isDealing = false
                            lib.notify({
                                title = Config.Translations.nothing,
                                description = Config.Translations.backtoboss,
                                type = 'error'
                            })
                            SetEntityAsNoLongerNeeded(List[nr])
                            FreezeEntityPosition(List[nr], false)
                            Citizen.Wait(5000)
                            DeleteEntity(List[nr])
                        end
                        return
                    end
                    Citizen.Wait(1)
                    playerPos = GetEntityCoords(PlayerPedId())
                    distance = #(playerPos - pos)
                end
            elseif show then
                lib.hideTextUI()
            end
            Citizen.Wait(100 + math.floor(shortestDistance * 10))
        end
    end
end)

RegisterNetEvent('shyDrugs:NextOrder')
AddEventHandler('shyDrugs:NextOrder', function(success, again)
    Citizen.Wait(5000)
    if again then
        SendToBuyer()
    else
        isDealing = false
        TriggerServerEvent('shyDrugs:EndDeal', success)
    end
end)

RegisterNetEvent('shyDrugs:notify')
AddEventHandler('shyDrugs:notify', function(title, text, style)
    Notify(title, text, style)
end)

RegisterNetEvent('shyDrugs:waypoint')
AddEventHandler('shyDrugs:waypoint', function(coords)
    DeleteWaypoint()
    SetNewWaypoint(coords)
end)