PRAGMA user_version = 1;
CREATE TABLE items (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL,
    rarity TEXT NOT NULL,
    price INTEGER NOT NULL CHECK (price >= 0)
);
INSERT INTO items (name, category, rarity, price) VALUES
    ('Copper Sword', 'weapon', 'common', 12),
    ('Oak Shield', 'armor', 'common', 16),
    ('Healing Draught', 'consumable', 'common', 8),
    ('Frost Lantern', 'tool', 'rare', 45),
    ('Ember Bow', 'weapon', 'rare', 65),
    ('Moonstone Ring', 'accessory', 'legendary', 120);
