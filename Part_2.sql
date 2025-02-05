-- EXERCISE 1
-- A
CREATE TABLE brands (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand TEXT UNIQUE NOT NULL
);

CREATE TABLE OS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE tech_inf (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    catalog_number TEXT UNIQUE NOT NULL,
    brand_id INTEGER NOT NULL,
    model TEXT NOT NULL,
    screen_size INTEGER CHECK(screen_size BETWEEN 10 AND 99),
    resolution TEXT NOT NULL,
    price REAL NOT NULL,
    stock_quantity INTEGER NOT NULL DEFAULT 0,
    release_year INTEGER CHECK(release_year BETWEEN 2000 AND 2025),
    smart_tv BOOLEAN NOT NULL,     -- 1 -> smart, 0 -> regular
    os_id INTEGER,
    panel_type TEXT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brands(id) ON DELETE CASCADE,
    FOREIGN KEY (os_id) REFERENCES OS(id) ON DELETE SET NULL
);

-- B
INSERT INTO brands (brand) VALUES
    ('Samsung'),
    ('LG'),
    ('Sony'),
    ('Electra'),
    ('Philips'),
    ('Xiaomi'),
    ('TOSHIBA');

INSERT INTO OS (name) VALUES
    ('Tizen OS'),
    ('WebOS'),
    ('Android TV');

INSERT INTO tech_inf (catalog_number, brand_id, model, screen_size, resolution, price, stock_quantity,
            release_year, smart_tv, os_id, panel_type)
VALUES ('QE50Q60D', 1, 'QLED 4K', 50, '4K Ultra HD', 2379.00, 10, 2024, 1, 'NULL', 'QLED'),
	   ('EL430HK', 4, 'LED 43DI', 43, '4K', 1190.00, 23, 2023, 1, 4, 'LED'),
	   ('OLED77C46LA', 2, '4K OLED', 77, '4K Ultra HD', 13221.00, 4, 2024, 1, 2, 'OLED'),
	   ('L32M8-A2ME', 6, 'TV A Pro', 32, 'HD', 849.00, 28, 2020, 1, 'NULL', 'LED'),
	   ('75PUT7129/98', 5, '4K UHD LED', 75, '4K Ultra HD', 3690.00, 9, 2020, 1, 5, 'LED'),
	   ('43V35', 7, 'Smart TV - LED', 43, 'Full HD', 1189.00, 2, 2022, 1, 4, 'LED'),
	   ('XR-98X90LAEP', 3, '4K Full Array LED', 98, '4K', 24990.00, 1, 2024, 1, 3, 'FULL ARRAY LED');
