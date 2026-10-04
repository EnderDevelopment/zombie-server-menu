# Zombie Server Menu

A versatile menu system for managing zombies in your FiveM server.

## Features

- Spawn zombies at player locations
- Adjust zombie health, damage, and spawn interval

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script from the repository.
2. Place the script in your FiveM server's resources folder.
3. Add `ensure zombie_server_menu` to your server.cfg file.
4. Run the provided SQL script to set up the database tables.

## Usage

- Press the E key to open the zombie menu.
- Use the menu to spawn zombies or adjust their settings.

## Configuration

The script can be configured in the `config.lua` file. Adjust the following settings:

- `MenuTitle`: The title of the menu.
- `MenuSubtitle`: The subtitle of the menu.
- `ZombieHealth`: The health of the zombies.
- `ZombieDamage`: The damage dealt by the zombies.
- `ZombieSpawnInterval`: The interval at which zombies spawn.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=zombie-server-menu&utm_content=bottom) — describe it in one sentence and get the full source code.
