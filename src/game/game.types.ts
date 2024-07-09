export type PlayerSymbol = 'X' | 'O';

export type GameStatus = 'win' | 'draw' | 'continue';

export type PlayerId = string;

export type Player = {
  clientId: PlayerId;
  symbol: PlayerSymbol;
};

export type Game = {
  players: [Player, Player];
  board: (PlayerSymbol | null)[];
  currentPlayer: PlayerId;
  gameOver: boolean;
};

export type MoveResult = {
  status: GameStatus | null;
  board: PlayerSymbol[];
  currentPlayer: PlayerId;
  playerIds: PlayerId[];
} | null;
