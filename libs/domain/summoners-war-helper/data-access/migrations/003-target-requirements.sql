--------------------------------------------------------------------------------
-- Up
--------------------------------------------------------------------------------

CREATE TABLE GrindstoneTarget (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  stat TEXT NOT NULL UNIQUE,
  quality TEXT NOT NULL,
  target INTEGER NOT NULL
);

CREATE TABLE EnchantedGemTarget (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  stat TEXT NOT NULL UNIQUE,
  quality TEXT NOT NULL,
  target INTEGER NOT NULL
);

CREATE TABLE RunestatTarget (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  slot TEXT NOT NULL,
  stat TEXT NOT NULL,
  statEfficiency INTEGER NOT NULL,
  runeEfficiency INTEGER
);

CREATE TABLE EfficiencyTarget (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  rset TEXT NOT NULL,
  slot TEXT NOT NULL,
  stat TEXT NOT NULL,
  target INTEGER NOT NULL
);

CREATE TABLE ReappTarget (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  rset TEXT NOT NULL,
  slot TEXT NOT NULL,
  stat TEXT NOT NULL,
  minGrade INTEGER NOT NULL
);

-- CREATE TABLE Build (

-- );

INSERT INTO GrindstoneTarget (id, uuid, stat, quality, target)
VALUES
  (NULL, '4733e840-b07b-4797-b459-e0b3c11f8b38', 'HP flat', 'Hero', 405),
  (NULL, 'b6364cd0-94b0-4918-93a0-6a5f52072c1b', 'HP%', 'Hero', 7),
  (NULL, '009e38e6-542e-4c64-9393-c12d9b347d18', 'ATK flat', 'Hero', 20),
  (NULL, 'f6fccfbf-b54a-4e98-9330-c55a12a826df', 'ATK%', 'Hero', 7),
  (NULL, 'abbdcea1-0580-4435-a573-5205ac4d4039', 'DEF flat', 'Hero', 20),
  (NULL, '2355fa58-89da-4254-93c2-a2cd217a80ca', 'DEF%', 'Hero', 7),
  (NULL, '75bdbf18-ec8b-481c-bdaa-2243e4baf2c1', 'SPD', 'Hero', 4);

INSERT INTO EnchantedGemTarget (id, uuid, stat, quality, target)
VALUES
  (NULL, '0ec8c451-389d-44e1-9108-3b8dc10989d9', 'HP flat', 'Hero', 380),
  (NULL, '66ef8e90-e299-450e-9727-04782d8d9f2e', 'HP%', 'Hero', 10),
  (NULL, '292578ec-f647-4910-a900-09af65305097', 'ATK flat', 'Hero', 27),
  (NULL, 'd49932bc-3417-4579-a5b6-2d5df2563f51', 'ATK%', 'Hero', 10),
  (NULL, 'b1889fdb-6d2b-4e3c-9cfe-78510f2de4eb', 'DEF flat', 'Hero', 27),
  (NULL, '2890e011-aee5-40b8-ab76-8e5b7370681e', 'DEF%', 'Hero', 10),
  (NULL, '9831cf5b-2136-45ef-a3ab-db07e32977db', 'SPD', 'Hero', 7),
  (NULL, 'a18270a9-519f-4f26-bf12-fb12b2649bd6', 'CRate', 'Hero', 6),
  (NULL, '6b8ec6b5-0d96-43f0-9730-e0d5a708c293', 'CDmg', 'Hero', 7),
  (NULL, 'a5ca35d0-63ee-40a5-9c23-8135cfe96b92', 'ACC', 'Hero', 8),
  (NULL, '7233313b-5b17-4df3-995c-ff35b24587f6', 'RES', 'Hero', 8);

INSERT INTO RunestatTarget (id, uuid, slot, stat, statEfficiency, runeEfficiency)
VALUES
  (NULL, '98e51f89-d79d-4006-ab15-566ca721e4ac', '13456', 'SPD', 65, 0),
  (NULL, 'dc4c5476-4d5e-4cf0-85a4-de8885e449bd', '135', 'CDmg', 57, 75),
  (NULL, 'c5f81281-3526-44aa-9d9f-87b011dd772f', '246', 'CDmg', 57, 0),
  (NULL, 'c0a18f15-4f2a-412e-ab96-204c79e941fa', '135', '*', 65, 75),
  (NULL, 'aad2ce2b-7377-46dc-9ef3-95b16c69a558', '246', '*', 65, 0);

INSERT INTO EfficiencyTarget (id, uuid, rset, slot, stat, target)
VALUES
  (NULL, '21892597-298b-44fc-9bc4-0d6aad6604ed', '*', '135', '*', 110),
  (NULL, '44bca7d3-41d5-4c1a-9f5c-423d69be9e3a', '*', '24', '*', 85),
  (NULL, '09bd4a72-2368-47a8-b608-dabea0946d9b', '*', '6', '*', 80);

INSERT INTO ReappTarget (id, uuid, rset, slot, stat, minGrade)
VALUES
  (NULL, '351b14f7-0198-4172-8603-f9e42065e86c', 'Violent,Despair,Fatal,Rage,Fight,Will,Blade','2','SPD,HP%,DEF%,ATK%', 6),
  (NULL, '6d7cc7b6-8606-4208-b3ee-ee2b7fb4d755', 'Swift', '2', 'SPD', 6),
  (NULL, '154bbb89-8751-40ea-86f8-8643f4c446e5', 'Violent,Swift,Despair,Fatal,Rage,Fight,Will,Blade','4','HP%,DEF%,CRate,CDmg', 6),
  (NULL, 'a2eea9e5-3cd0-43f3-8157-102380466ff6', 'Violent,Swift,Despair,Fatal,Rage,Fight,Will,Blade','6','HP%,DEF%,ATK%,ACC', 6);

--------------------------------------------------------------------------------
-- Down
--------------------------------------------------------------------------------

DROP TABLE ReappTarget;
DROP TABLE EfficiencyTarget;
DROP TABLE RunestatTarget;
DROP TABLE EnchantedGemTarget;
DROP TABLE GrindstoneTarget;
