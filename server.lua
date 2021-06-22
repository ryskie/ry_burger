ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('prp-sidejobs:add')
AddEventHandler('prp-sidejobs:add', function(type, amount, name)
	local xPlayer  = ESX.GetPlayerFromId(source)

	if type == 'money' then
		xPlayer.addMoney(amount)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You recieved $'..amount, length = 2500, style = { ['background-color'] = '#b6a815', ['color'] = '#ffffff' } })
	elseif type == 'item' then
		xPlayer.addInventoryItem(name, amount)
	end
end)

RegisterServerEvent('prp-sidejobs:remove')
AddEventHandler('prp-sidejobs:remove', function(type, amount, name)
	local xPlayer  = ESX.GetPlayerFromId(source)

	if type == 'money' then
		xPlayer.removeMoney(amount)
	elseif type == 'item' then
		xPlayer.removeInventoryItem(name, amount)
	end
end)

RegisterServerEvent('prp-sidejobs:check')
AddEventHandler('prp-sidejobs:check', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem(Config.Item).count
	local b = false
	if item > 0 then
		b = true
	end
	TriggerClientEvent('prp-sidejobs:check', b)
end)

RegisterServerEvent('prp-sidejobs:server')
AddEventHandler('prp-sidejobs:server', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.StartBurgerRuns then
		xPlayer.removeMoney(Config.StartBurgerRuns)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You paid '..Config.StartBurgerRuns..' to start the Burger Runs', length = 2500, style = { ['background-color'] = '#b6a815', ['color'] = '#ffffff' } })
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You don\'t have enough money to start a run!', length = 2500, style = { ['background-color'] = '#e03232', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('prp-sidejobs:PutBurgerToStocks')
AddEventHandler('prp-sidejobs:PutBurgerToStocks', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem('burgerpack').count

	if quantity >= 1 then
		TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco', function(inventory)
			xPlayer.removeInventoryItem('burgerpack', 1)
			inventory.addItem('burgerpack', 1)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You put a burger bag out for delivery.', length = 2500, style = { ['background-color'] = '#b6a815', ['color'] = '#ffffff' } })
		end)
		xPlayer.addMoney(Config.RewardMoneyPut)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You recieved ₱'..Config.RewardMoneyPut, length = 2500, style = { ['background-color'] = '#b6a815', ['color'] = '#ffffff' } })
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You don\'t have enough Packaged Burger to deliver!', length = 2500, style = { ['background-color'] = '#e03232', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('prp-sidejobs:getStockItem')
AddEventHandler('prp-sidejobs:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
		
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Invalid Quantity', length = 2500, style = { ['background-color'] = '#b6a815', ['color'] = '#ffffff' } })

			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You have withdrawn '.. count .. ' ' .. inventoryItem.label, length = 2500, style = { ['background-color'] = '#b6a815', ['color'] = '#ffffff' } })
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Invalid Quantity', length = 2500, style = { ['background-color'] = '#b6a815', ['color'] = '#ffffff' } })
		end
	end)

end)

ESX.RegisterServerCallback('prp-sidejobs:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('prp-sidejobs:HasItem', function(source, cb, item, count)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    cb(xPlayer.getInventoryItem(item)["count"] >= (count or 1))
end)

RegisterServerEvent('burgershot:order')
AddEventHandler('burgershot:order', function()
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' or 'taco' or 'milker' or 'burgershot' or 'ambulance' or 'unemployed' or 'avera' or 'golda' then
            TriggerClientEvent('burger:call', xPlayers[i])
        end
    end
end)
