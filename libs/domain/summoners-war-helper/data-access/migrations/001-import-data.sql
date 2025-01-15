--------------------------------------------------------------------------------
-- Up
--------------------------------------------------------------------------------

CREATE TABLE Rune (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  rset TEXT NOT NULL,
  slot INTEGER NOT NULL,
  upgrade INTEGER NOT NULL,
  unit TEXT,
  unitId INTEGER,
  unitCount INTEGER,
  quality TEXT NOT NULL,
  isAncient INTEGER NOT NULL DEFAULT 0,
  grade INTEGER NOT NULL,
  efficiency REAL NOT NULL,
  CONSTRAINT Rune_ck_isAncient CHECK (isAncient IN (0, 1))
);

CREATE TABLE Runestat (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  runeId INTEGER NOT NULL,
  stat TEXT NOT NULL,
  type TEXT NOT NULL,
  baseValue INTEGER NOT NULL,
  grindValue INTEGER,
  isGemmed INTEGER DEFAULT 0,
  efficiency REAL,
  CONSTRAINT Runestat_fk_runeId FOREIGN KEY (runeId)
    REFERENCES Rune (id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Runestat_ck_isGemmed CHECK (isGemmed IN (0, 1))
);

CREATE INDEX Runestat_ix_runeId ON Runestat (runeId);

-- CREATE TABLE Artifact

--------------------------------------------------------------------------------
-- Down
--------------------------------------------------------------------------------

DROP INDEX Runestat_ix_runeId;
DROP TABLE Runestat;
DROP TABLE Rune;
