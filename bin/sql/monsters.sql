CREATE TABLE monsters(
    id serial,
    name varchar(50),
    personality varchar(50)
);

CREATE TABLE habitats(
    id serial,
    name varchar(50),
    climate varchar(50),
    temperature int
);

CREATE TABLE lives(
    name_monster varchar(50),
    name_habitat varchar(50)
);

INSERT INTO monsters(name, personality)
VALUES
('Fluffy', 'Aggressive'),
('Noodles', 'Irritable'),
('Boobles', 'Happy'),
('Cody', 'Impatient'),
('Rusty', 'Passionate');

INSERT INTO habitats(name, climate, temperature)
VALUES
('Desert', 'Dry', 40),
('Forest', 'Haunted', 25),
('Mountain', 'Icy', 2);

INSERT INTO lives(name_monster, name_habitat)
VALUES
('Fluffy', 'Desert'),
('Noodles', 'Forest'),
('Boobles', 'Mountain'),
('Cody', 'Desert'),
('Rusty', 'Mountain');