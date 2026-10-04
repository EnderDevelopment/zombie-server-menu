local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('zombie_server:getZombieSettings', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM zombie_server.zombie_settings', {}, function(result)
        if result[1] then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

RegisterServerEvent('zombie_server:spawnZombie')
AddEventHandler('zombie_server:spawnZombie', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local coords = GetEntityCoords(GetPlayerPed(source))
        MySQL.Async.execute('INSERT INTO zombie_server.zombie_spawns (x, y, z, heading) VALUES (@x, @y, @z, @heading)', {
            ['@x'] = coords.x,
            ['@y'] = coords.y,
            ['@z'] = coords.z,
            ['@heading'] = GetEntityHeading(GetPlayerPed(source))
        }, function(rowsChanged)
            TriggerClientEvent('zombie_server:spawnZombieClient', -1, coords.x, coords.y, coords.z, GetEntityHeading(GetPlayerPed(source)))
        end)
    end
end)

RegisterServerEvent('zombie_server:updateZombieSettings')
AddEventHandler('zombie_server:updateZombieSettings', function(setting, value)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.execute('UPDATE zombie_server.zombie_settings SET ' .. setting .. ' = @value', {
            ['@value'] = value
        }, function(rowsChanged)
            TriggerClientEvent('zombie_server:updateZombieSettingsClient', -1, setting, value)
        end)
    end
end)