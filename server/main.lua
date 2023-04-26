ESX = nil
lastloc = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('shyDrugs:placeOrder')
AddEventHandler('shyDrugs:placeOrder', function(bool)
    local src = source
    local dealer = math.random(1, #Config.DealerCoords)
    
    if lastloc[src] then
        if dealer == lastloc[src] then
            if dealer ~= 1 then
                dealer = dealer - 1
            else
                dealer = dealer + 1
            end
        end
        lastloc[src] = dealer
    else
        lastloc[src] = dealer
    end

    local coords = vector2(Config.DealerCoords[dealer][1], Config.DealerCoords[dealer][2])

    exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.go, nil, cb, nil)
    Citizen.Wait(5000)
    exports["lb-phone"]:SendCoords('Mohammed', exports["lb-phone"]:GetEquippedPhoneNumber(src), coords)
    TriggerClientEvent('shyDrugs:SyncNPC', -1, Config.DealerCoords[dealer], dealer)
    TriggerClientEvent('shyDrugs:DistCheck', src, Config.DealerCoords[dealer], dealer)
    if bool then
        local players = ESX.GetPlayers()
        Citizen.Wait(Config.SnitchTime)
        for i = 1, #players do
            local player = ESX.GetPlayerFromId(players[i])
            if GangCheck(player.getJob().name) then
                exports["lb-phone"]:SendMessage("COKE JUNKIE", exports["lb-phone"]:GetEquippedPhoneNumber(players[i]), Config.Translations[dealer], nil, cb, nil)
                Citizen.Wait(1000)
                exports["lb-phone"]:SendCoords('COKE JUNKIE', exports["lb-phone"]:GetEquippedPhoneNumber(players[i]), coords)
            end
        end
    end
end)

RegisterServerEvent('shyDrugs:SellBatch')
AddEventHandler('shyDrugs:SellBatch', function(amount, sort, again, coords)
    local success = false
    local src = source
    if amount == "NoCheating" then
        if sort == 1 then
            local qty = exports.ox_inventory:GetItem(src, Config.cokeItem, nil, true)
            if qty >= Config.MaxSell then
                local reward = (math.random(Config.cokePriceMin, Config.cokePriceMax)*Config.MaxSell)
                if exports.ox_inventory:CanCarryItem(src, 'black_money', reward) then
                    exports.ox_inventory:RemoveItem(src, Config.cokeItem, Config.MaxSell)
                    exports.ox_inventory:AddItem(src, 'black_money', reward)
                    success = true
                else
                    exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.pouchfull, nil, cb, nil)
                end
            elseif qty >= 10 then
                local reward = (math.random(Config.cokePriceMin, Config.cokePriceMax)*10)
                if exports.ox_inventory:CanCarryItem(src, 'black_money', reward) then
                    exports.ox_inventory:RemoveItem(src, Config.cokeItem, 10)
                    exports.ox_inventory:AddItem(src, 'black_money', reward)
                    success = true
                else
                    exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.pouchfull, nil, cb, nil)
                end
            else
                exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.minimum, nil, cb, nil)
            end
            TriggerClientEvent('shyDrugs:NextOrder', src, success, again)
            TriggerClientEvent('shyDrugs:DelNPC', -1, coords)
        elseif sort == 2 then
            local qty = exports.ox_inventory:GetItem(src, Config.methItem, nil, true)
            if qty >= Config.MaxSell then
                local reward = (math.random(Config.methPriceMin, Config.methPriceMax)*Config.MaxSell)
                if exports.ox_inventory:CanCarryItem(src, 'black_money', reward) then
                    exports.ox_inventory:RemoveItem(src, Config.methItem, Config.MaxSell)
                    exports.ox_inventory:AddItem(src, 'black_money', reward)
                    success = true
                else
                    exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.serious, nil, cb, nil)
                end
            elseif qty >= 10 then
                local reward = (math.random(Config.methPriceMin, Config.methPriceMax)*10)
                if exports.ox_inventory:CanCarryItem(src, 'black_money', reward) then
                    exports.ox_inventory:RemoveItem(src, Config.methItem, 10)
                    exports.ox_inventory:AddItem(src, 'black_money', reward)
                    success = true
                else
                    exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.serious, nil, cb, nil)
                end
            else
                exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.minimum, nil, cb, nil)
            end
            TriggerClientEvent('shyDrugs:NextOrder', src, success, again)
            TriggerClientEvent('shyDrugs:DelNPC', -1, coords)
        elseif sort == 3 then
            local qty = exports.ox_inventory:GetItem(src, Config.weedItem, nil, true)
            if qty >= Config.MaxSell then
                local reward = (math.random(Config.weedPriceMin, Config.weedPriceMax)*Config.MaxSell)
                if exports.ox_inventory:CanCarryItem(src, 'black_money', reward) then
                    exports.ox_inventory:RemoveItem(src, Config.weedItem, Config.MaxSell)
                    exports.ox_inventory:AddItem(src, 'black_money', reward)
                    success = true
                else
                    exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.serious, nil, cb, nil)
                end
            elseif qty >= 10 then
                local reward = (math.random(Config.weedPriceMin, Config.weedPriceMax)*10)
                if exports.ox_inventory:CanCarryItem(src, 'black_money', reward) then
                    exports.ox_inventory:RemoveItem(src, Config.weedItem, 10)
                    exports.ox_inventory:AddItem(src, 'black_money', reward)
                    success = true
                else
                    exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.serious, nil, cb, nil)
                end
            else
                exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(src), Config.Translations.minimum, nil, cb, nil)
            end
            TriggerClientEvent('shyDrugs:NextOrder', src, success, again)
            TriggerClientEvent('shyDrugs:DelNPC', -1, coords)
        end
    else
        print('Hacker detected: shyDrugs-A'..src)
        if Config.SQLBan then
            TriggerEvent("BanSql:ICheat", "Automatic ban for cheating (shyDrugs-A)", src)
        end
    end
end)

RegisterServerEvent('shyDrugs:EndDeal')
AddEventHandler('shyDrugs:EndDeal', function(success)
    if success then
        exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(source), Config.Translations.ty, nil, cb, nil)
    else
        exports["lb-phone"]:SendMessage("Mohammed", exports["lb-phone"]:GetEquippedPhoneNumber(source), Config.Translations.bruh, nil, cb, nil)
    end
end)

function GangCheck(job)
    for i = 1, #Config.GangJobs do
        if job == Config.GangJobs[i] then
            return true
        end
    end
    return false
end