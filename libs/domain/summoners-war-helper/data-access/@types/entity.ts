export enum RuneStatType {
  Main = 'main',
  Prefix = 'prefix',
  Sub = 'sub',
}

export enum RuneStat {
  HpFlat = 'HP flat',
  HpPercent = 'HP%',
  AtkFlat = 'ATK flat',
  AtkPercent = 'ATK%',
  DefFlat = 'DEF flat',
  DefPercent = 'DEF%',
  Spd = 'SPD',
  CRate = 'CRate',
  CDmg = 'CDmg',
  Res = 'RES',
  Acc = 'ACC',
}

export enum RuneSet {
  Energy = 'Energy',
  Guard = 'Guard',
  Swift = 'Swift',
  Blade = 'Blade',
  Rage = 'Rage',
  Focus = 'Focus',
  Endure = 'Endure',
  Fatal = 'Fatal',
  Despair = 'Despair',
  Vampire = 'Vampire',
  Violent = 'Violent',
  Nemesis = 'Nemesis',
  Will = 'Will',
  Shield = 'Shield',
  Revenge = 'Revenge',
  Destroy = 'Destroy',
  Fight = 'Fight',
  Determination = 'Determination',
  Enhance = 'Enhance',
  Accuracy = 'Accuracy',
  Tolerance = 'Tolerance',
}

export enum RuneQuality {
  Unknown = 'Unknown',
  Common = 'Common',
  Magic = 'Magic',
  Rare = 'Rare',
  Hero = 'Hero',
  Legend = 'Legend',
}

export type RuneSlot = 1 | 2 | 3 | 4 | 5 | 6;
export type RuneUpgrade = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15;
export type RuneGrade = 1 | 2 | 3 | 4 | 5 | 6;

export interface RuneEntity {
  id: number;
  uuid: string;
  rset: RuneSet;
  slot: RuneSlot;
  upgrade: RuneUpgrade;
  unit: string;
  unitId: number;
  unitCount: number;
  quality: RuneQuality;
  isAncient: boolean;
  grade: RuneGrade;
  efficiency: number;
}

export interface RuneStatEntity {
  id: number;
  uuid: string;
  runeId: number;
  stat: RuneStat;
  type: RuneStatType;
  baseValue: number;
  grindValue: number;
  isGemmed: boolean;
  efficiency: number;
}

export interface RuneJoinRuneStatEntity {
  // RUNE
  id: number;
  uuid: string;
  rset: RuneSet;
  slot: RuneSlot;
  upgrade: RuneUpgrade;
  unit: string;
  unitId: number;
  unitCount: number;
  quality: RuneQuality;
  isAncient: boolean;
  grade: RuneGrade;
  efficiency: number;
  // RUNE STAT
  rs_uuid: string;
  stat: RuneStat;
  type: RuneStatType;
  baseValue: number;
  grindValue: number;
  isGemmed: boolean;
  rs_efficiency: number;
}

export interface RuneStatUpgradeEntity {
  id: number;
  uuid: string;
  stat: RuneStat;
  grade: RuneGrade;
  min: number;
  max: number;
}

export interface GrindstoneTargetEntity {
  id: number;
  uuid: string;
  stat: RuneStat;
  quality: RuneQuality;
  target: number;
}
