import { RuneStatUpgradeEntity, GrindstoneTargetEntity } from '../@types/entity';
import { open } from 'sqlite';
import sqlite3 from 'sqlite3';

interface Entity {
  [key: string]: unknown;
}

export const connect = async () => {
  return await open({
    filename: './apps/summoners-war-helper/services/database/swh.db',
    driver: sqlite3.cached.Database,
  });
}

export const migrate = async () => {
  try {
    const db = await connect();
    await db.migrate({
      force: true,
      migrationsPath: './apps/summoners-war-helper/services/database/migrations',
    });
  } catch (e) {
    console.error(e.stack);
  }
}

export async function resetTables (tableNames: string[]) {
  const db = await connect();
  await Promise.all(tableNames.map(async (tableName) => {
    await db.exec(`DELETE FROM ${tableName}`);
    await db.exec(`UPDATE sqlite_sequence SET seq = 0 WHERE name = "${tableName}"`);
  }));
  return db.exec('VACUUM');
}

export async function batchInsert (tableName: string, entities: Entity[], max = 3000) {
  for (let currentCount = 0; currentCount < entities.length; currentCount += max) {
    const db = await connect();
    const parameterizedEntities = entities
      .slice(currentCount, currentCount + max)
      .map((entity) => Object.values(entity));
    const [values, parameterizedValues] = extractParameterizedValues(parameterizedEntities);
    const keys = extractKeys(entities[0]);
    await db.run(`INSERT INTO ${tableName} (${keys}) VALUES (${values})`, ...parameterizedValues);
  }
}

function extractKeys (entity: Entity): string {
  return Object.keys(entity)
    .join(',');
}

function extractParameterizedValues (parameterizedValues: unknown[][]): [string, unknown[]] {
  const keys: string = parameterizedValues
    .map((value) => value.map(() => '?').join(','))
    .join('),\n(');
  const values = parameterizedValues.reduce((acc, next) => [...acc, ...next], []);
  return [keys, values];
}

export async function getRuneStatUpgrades (): Promise<RuneStatUpgradeEntity[]> {
  const db = await connect();
  return db.all(`SELECT r.stat, r.max FROM RunestatUpgrade as r WHERE r.grade = 6`);
}

export async function getGrindstoneTargets (): Promise<GrindstoneTargetEntity[]> {
  const db = await connect();
  return db.all(`SELECT r.stat, r.target FROM GrindstoneTarget as r WHERE r.quality = 'Hero'`);
}
