ESX								= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

function loadDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     Citizen.Wait(5)
    end
end

RegisterNetEvent("burgershot:startprocess3")
AddEventHandler("burgershot:startprocess3", function()
    local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'burgershot' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then
				TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BBQ", 0, true)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 2, 'patty')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'packaged_pig')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Raw Pig to make Patties')
			end
		end, 'packaged_pig')
	else
		exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end
end)

RegisterNetEvent("burgershot:craft")
AddEventHandler("burgershot:craft", function()
    local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'burgershot' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then
				loadDict("anim@amb@business@coc@coc_unpack_cut_left@")
				TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v1_coccutter", 1.0, -1.0, -1, 1, 0, false, false, false)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 1, 'hamburger')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'patty')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 2, 'buns')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Patty and buns to make Burger')
			end
		end, 'patty' and 'buns')
	else
		exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end
end)

RegisterNetEvent("burgershot:startfryer")
AddEventHandler("burgershot:startfryer", function()
	local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'burgershot' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then
				loadDict("anim@amb@business@coc@coc_unpack_cut_left@")
				TaskPlayAnim(PlayerPedId(), "anim@amb@business@coc@coc_unpack_cut_left@", "coke_cut_v1_coccutter", 1.0, -1.0, -1, 1, 0, false, false, false)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 2, 'frenchfries')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'potato')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Potato to Fries')
			end
		end, 'potato')
	else
		exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end
end)

RegisterNetEvent("burgershot:makeshake")
AddEventHandler("burgershot:makeshake", function()
    local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'burgershot' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then   
				loadDict("anim@mp_player_intupperspray_champagne")
				TaskPlayAnim(PlayerPedId(), "anim@mp_player_intupperspray_champagne", "idle_a", 1.0, -1.0, -1, 1, 0, false, false, false)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 2, 'milkshake')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'milk_can')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Milk to make Milk Shake')
			end
		end, 'milk_can')
	else
		exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end
end)

RegisterNetEvent("burgershot:getcola")
AddEventHandler("burgershot:getcola", function()
    local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'burgershot' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then   
				loadDict("anim@mp_player_intupperspray_champagne")
				TaskPlayAnim(PlayerPedId(), "anim@mp_player_intupperspray_champagne", "idle_a", 1.0, -1.0, -1, 1, 0, false, false, false)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 2, 'cocacola')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'powdered_ingredient')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Powdered Ingredients to make Cola')
			end
		end, 'powdered_ingredient')
	else
		exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end
end)

RegisterNetEvent('burger:cook2')
AddEventHandler('burger:cook2', function()
    local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'taco' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then
				TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BBQ", 0, true)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				local finished = exports["np-taskbarskill"]:taskBar(2000, math.random(5, 7))
					if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				local finished = exports["np-taskbarskill"]:taskBar(1500, math.random(5, 7))
					if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 2, Config.Item)
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'packaged_pig')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Raw Pig to Make Taco')
			end
		end, 'packaged_pig')
	else
		exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end
end)

RegisterNetEvent('burger:cook3')
AddEventHandler('burger:cook3', function()
	local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'taco' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then
				TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BBQ", 0, true)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				local finished = exports["np-taskbarskill"]:taskBar(2000, math.random(5, 7))
					if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				local finished = exports["np-taskbarskill"]:taskBar(1500, math.random(5, 7))
					if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 2, 'burrito')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'packaged_chicken')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Raw Chicken to Make Burito')
			end
		end, 'packaged_chicken')
	else
		exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end
end)

RegisterNetEvent('burger:cook4')
AddEventHandler('burger:cook4', function()
	local xPlayer = ESX.GetPlayerData()

    if xPlayer.job.name == 'taco' then
		ESX.TriggerServerCallback('prp-sidejobs:HasItem', function(HasItem)
			if HasItem then
				loadDict("anim@mp_player_intupperspray_champagne")
				TaskPlayAnim(PlayerPedId(), "anim@mp_player_intupperspray_champagne", "idle_a", 1.0, -1.0, -1, 1, 0, false, false, false)
				local finished = exports["np-taskbarskill"]:taskBar(13500, math.random(5, 7))
				if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				local finished = exports["np-taskbarskill"]:taskBar(5000, math.random(5, 7))
					if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				local finished = exports["np-taskbarskill"]:taskBar(4000, math.random(5, 7))
					if finished <= 0 then
					exports['mythic_notify']:DoLongHudText('error', 'You Failed.')
					ClearPedTasksImmediately(PlayerPedId())
					return
				end 
				Citizen.Wait(2000)
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('prp-sidejobs:add', 'item', 1, 'icetea')
				TriggerServerEvent('prp-sidejobs:remove', 'item', 1, 'powdered_ingredient')
				TriggerServerEvent('prp-sidejobs:add', 'money', Config.RewardMoneyCook)
			else
				exports['mythic_notify']:DoLongHudText('error', 'You don\'t have enough Powdered Ingredient to Make Iced Tea')
			end
		end, 'powdered_ingredient')
	else
		 exports['mythic_notify']:DoLongHudText('inform', 'You dont work here bro!')
	end	 
end)

RegisterNetEvent('taco:tray')
AddEventHandler('taco:tray', function()
    TriggerEvent('inventory:stash', 'tacoshop')
end)

RegisterNetEvent('burger:tray1')
AddEventHandler('burger:tray1', function()
    TriggerEvent('inventory:stash', 'burgershot1')
end)

RegisterNetEvent('burger:tray2')
AddEventHandler('burger:tray2', function()
    TriggerEvent('inventory:stash', 'burgershot2')
end)

RegisterNetEvent('burger:tray3')
AddEventHandler('burger:tray3', function()
    TriggerEvent('inventory:stash', 'burgershot3')
end)

RegisterNetEvent('burger:front')
AddEventHandler('burger:front', function()
    TriggerEvent('inventory:stash', 'burger_front')
end)

RegisterNetEvent('burger:storage')
AddEventHandler('burger:storage', function()
    TriggerEvent('inventory:stash', 'burgershot_storage')
end)

RegisterNetEvent('burger:call')
AddEventHandler('burger:call', function()
	TriggerEvent('phone:addnotification', 'EMAIL', 'Burgershot is buying packaged chicken/pig')

    TriggerEvent('InteractSound_CL:PlayOnOne', 'email', 1.0)
end)

RegisterNetEvent('inventory:secret')
AddEventHandler('inventory:secret', function()
	TriggerEvent('inventory:shop', 'Secret Market')
end)

RegisterNetEvent('burger:ordering')
AddEventHandler('burger:ordering', function()
	TriggerServerEvent('burgershot:order')
end)

RegisterNetEvent('taco:foodmenu')
AddEventHandler('taco:foodmenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Tacos",
            txt = "Cook Food"
        },
        {
            id = 2,
            header = "Open Food Menu",
            txt = "Menu",
            params = {
                event = "nh-context:submenu",
                args = {
                    number = 1,
                    id = 2,
                }
            }
        },
    })
end)

RegisterNetEvent('nh-context:submenu')
AddEventHandler('nh-context:submenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "Menu",
            params = {
                event = "taco:foodmenu"
            }
        },
        {
            id = 2,
            header = "Cook Taco",
            txt = "Taco",
            params = {
                event = "burger:cook2",
            }    
        },
        {
            id = 3,
            header = "Cook Burrito",
            txt = "Burrito",
            params = {
                event = "burger:cook3",
            }    
        },
    })
end)

RegisterCommand('reloadchars', function(source, args)
    TriggerEvent("multicharacter:client:WelcomePage")    
end)