--------------------------------------------------------------------------------
-- Up
--------------------------------------------------------------------------------

-- WHERE Rune.unitId NOT IN (SELECT unitId FROM LockedUnit)
CREATE TABLE LockedUnit (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  unitId INTEGER NOT NULL
);

-- TODO: Maybe move this to a property in the rune
-- WHERE Rune.id NOT IN (SELECT runeId FROM LockedRune)
CREATE TABLE LockedRune (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid TEXT NOT NULL UNIQUE,
  runeId INTEGER NOT NULL
);

--------------------------------------------------------------------------------
-- Down
--------------------------------------------------------------------------------

DROP TABLE LockedUnit;
