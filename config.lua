Config = {}

-- Menu configuration
Config.MenuTitle = 'Zombie Server Menu'
Config.MenuSubtitle = 'Select an option'

-- Database configuration
Config.DatabaseName = 'zombie_server'

-- Zombie settings
Config.ZombieHealth = 200
Config.ZombieDamage = 20
Config.ZombieSpawnInterval = 30000 -- 30 seconds

-- Menu items
Config.MenuItems = {
    {label = 'Spawn Zombie', value = 'spawn_zombie'},
    {label = 'Zombie Settings', value = 'zombie_settings'},
    {label = 'Close Menu', value = 'close_menu'}
}