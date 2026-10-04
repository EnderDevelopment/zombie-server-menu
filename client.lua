local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 38) then -- E key
            OpenZombieMenu()
        end
    end
end)

function OpenZombieMenu()
    local elements = {}
    
    for i=1, #Config.MenuItems, 1 do
        table.insert(elements, {label = Config.MenuItems[i].label, value = Config.MenuItems[i].value})
    end
    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'zombie_menu', {
        title    = Config.MenuTitle,
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'spawn_zombie' then
            TriggerServerEvent('zombie_server:spawnZombie')
        elseif data.current.value == 'zombie_settings' then
            OpenZombieSettingsMenu()
        elseif data.current.value == 'close_menu' then
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

function OpenZombieSettingsMenu()
    local elements = {
        {label = 'Health: ' .. Config.ZombieHealth, value = 'health'},
        {label = 'Damage: ' .. Config.ZombieDamage, value = 'damage'},
        {label = 'Spawn Interval: ' .. (Config.ZombieSpawnInterval / 1000) .. ' seconds', value = 'spawn_interval'},
        {label = 'Back', value = 'back'}
    }
    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'zombie_settings_menu', {
        title    = 'Zombie Settings',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'health' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'zombie_settings_health', {
                title = 'Set Zombie Health'
            }, function(data2, menu2)
                local health = tonumber(data2.value)
                if health then
                    TriggerServerEvent('zombie_server:updateZombieSettings', 'health', health)
                    menu2.close()
                else
                    ESX.ShowNotification('Invalid input!')
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.value == 'damage' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'zombie_settings_damage', {
                title = 'Set Zombie Damage'
            }, function(data2, menu2)
                local damage = tonumber(data2.value)
                if damage then
                    TriggerServerEvent('zombie_server:updateZombieSettings', 'damage', damage)
                    menu2.close()
                else
                    ESX.ShowNotification('Invalid input!')
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.value == 'spawn_interval' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'zombie_settings_spawn_interval', {
                title = 'Set Zombie Spawn Interval (seconds)'
            }, function(data2, menu2)
                local spawnInterval = tonumber(data2.value)
                if spawnInterval then
                    TriggerServerEvent('zombie_server:updateZombieSettings', 'spawn_interval', spawnInterval * 1000)
                    menu2.close()
                else
                    ESX.ShowNotification('Invalid input!')
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.value == 'back' then
            menu.close()
            OpenZombieMenu()
        end
    end, function(data, menu)
        menu.close()
        OpenZombieMenu()
    end)
end