import { RuneGrade, RuneQuality, RuneSet, RuneSlot, RuneStat, RuneUpgrade } from './entity';

export interface RuneDTO {
  uuid: string;
  set: RuneSet;
  slot: RuneSlot;
  upgrade: RuneUpgrade;
  unit: string;
  unitId: number;
  unitCount: number;
  quality: RuneQuality;
  isAncient: boolean;
  grade: RuneGrade;
  mainStat: RuneStatDTO;
  prefixStat: RuneStatDTO;
  subStats: RuneStatDTO[];
  efficiency: number;
}

export interface RunesResponseDTO {
  runes: RuneDTO[];
  count: number;
}

export interface RuneStatDTO {
  uuid: string;
  stat: RuneStat;
  baseValue: number;
  grindValue?: number;
  isGemmed?: boolean;
  isGrindable?: boolean;
  efficiency: number;
}

export interface PatchRuneStatDTO {
  uuid: string;
  stat: RuneStat;
  action: 'grind' | 'gem';
}
