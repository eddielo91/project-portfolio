--------------------------------------------------------------------------------
-- Up
--------------------------------------------------------------------------------

CREATE TABLE RunestatUpgrade (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  stat TEXT NOT NULL,
  grade INTEGER NOT NULL,
  min INTEGER NOT NULL,
  max INTEGER NOT NULL
);

CREATE TABLE Grindstone (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  stat TEXT NOT NULL,
  quality TEXT NOT NULL,
  min INTEGER NOT NULL,
  max INTEGER NOT NULL
);

CREATE TABLE EnchantedGem (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  stat TEXT NOT NULL,
  quality TEXT NOT NULL, -- magic, rare, hero, legend
  min INTEGER NOT NULL,
  max INTEGER NOT NULL
);

-- INSERT RunestatUpgrade DATA
INSERT INTO RunestatUpgrade (id, uuid, stat, grade, min, max)
VALUES
  (NULL, '3ce24dcc-f9aa-41e2-9d51-20952adf4131', 'HP flat', 6, 135, 375),
  (NULL, 'f09031d0-c8e1-451e-923e-a46cb1597fec', 'HP%', 6, 5, 8),
  (NULL, '63bab155-fdf8-4807-b14f-bd4462c21a03', 'ATK flat', 6, 10, 20),
  (NULL, '922d40f0-9a75-4a20-a373-96de4b822c5d', 'ATK%', 6, 5, 8),
  (NULL, '49bd6cf4-e00b-49db-b199-cbf479a859e7', 'DEF flat', 6, 10, 20),
  (NULL, '2374828c-69f1-45b7-b181-f2f84c337d4e', 'DEF%', 6, 5, 8),
  (NULL, 'f9f5a1b6-1426-495c-a37f-a9db902d4763', 'SPD', 6, 4, 6),
  (NULL, 'b48dabe7-0057-4eb7-992c-c0266784c0da', 'CRate', 6, 4, 6),
  (NULL, 'a87c5471-18f1-42cf-a3b2-a715e410c898', 'CDmg', 6, 4, 7),
  (NULL, '758a1556-9458-4610-95ce-54926df877cb', 'RES', 6, 4, 8),
  (NULL, 'a728eb87-5363-46d5-8096-83fbe325681d', 'ACC', 6, 4, 8);

INSERT INTO Grindstone (id, uuid, stat, quality, min, max)
VALUES
  (NULL, 'd431c836-5164-4be6-b213-7496f7444d85', 'HP flat', 'Hero', 230, 450),
  (NULL, '598ebf25-b3d9-4d28-a8d0-c1fd5b850470', 'HP%', 'Hero', 4, 7),
  (NULL, '88ace181-85e7-4bff-84a3-0c43da8e25f4', 'ATK flat', 'Hero', 12, 22),
  (NULL, 'cec6beee-b655-4bed-98f1-6ad7fbb759a1', 'ATK%', 'Hero', 4, 7),
  (NULL, '5119f366-9f5a-4f9e-a79e-46218fec9334', 'DEF flat', 'Hero', 12, 22),
  (NULL, 'fb3e72fe-d0b3-4fbc-9aeb-2e2653e8685a', 'DEF%', 'Hero', 4, 7),
  (NULL, 'f3dd5822-9a05-4b4e-b36c-4dc2f7273c04', 'SPD', 'Hero', 3, 4),
  (NULL, 'ea73162d-ccdf-477f-803c-0ef4e11c6d0e', 'HP flat', 'Legend', 430, 550),
  (NULL, '0b18e00b-6fff-41ef-bc65-f5f7d5b28d0f', 'HP%', 'Legend', 5, 10),
  (NULL, 'e0e15140-51e8-4e3c-905f-9199f653da3b', 'ATK flat', 'Legend', 18, 30),
  (NULL, '17976540-6f77-44d1-8926-430473525658', 'ATK%', 'Legend', 5, 10),
  (NULL, '26a20fd1-f382-4d6b-8521-56bb3e9dc1cc', 'DEF flat', 'Legend', 18, 30),
  (NULL, 'e77057af-f672-4024-940a-c86e643c2320', 'DEF%', 'Legend', 5, 10),
  (NULL, '6bc9c9e5-3edd-4294-a58b-b2786d3c1fb1', 'SPD', 'Legend', 4, 5);

--------------------------------------------------------------------------------
-- Down
--------------------------------------------------------------------------------

DROP TABLE EnchantedGem;
DROP TABLE Grindstone;
DROP TABLE RunestatUpgrade;
