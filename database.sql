CREATE TABLE IF NOT EXISTS zombie_server.zombie_spawns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL,
    heading FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS zombie_server.zombie_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    health INT NOT NULL,
    damage INT NOT NULL,
    spawn_interval INT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO zombie_server.zombie_settings (health, damage, spawn_interval) VALUES (200, 20, 30000);