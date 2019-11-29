int w = 15;
int cols; 
int rows;
Cell[][] board;


void setup() {
  frameRate(15);
  size(1000, 1000);
  background(100);
  cols = width / w;
  rows = height / w;
  board = new Cell[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      board[i][j] = new Cell(i, j, w);
    }
  }

  randomize(board);
}

void evolve(Cell[][] board) {
  int[][] next = new int[rows][cols];
  for (int p = 0; p < rows; p++) {
    for (int q = 0; q < cols; q++) {
      next[p][q] = board[p][q].state;
    }
  }

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {

      int neighbors = 0;

      for (int a = -1; a <= 1; a++) {     
        for (int b = -1; b <= 1; b++) {
          if (!(a == 0 && b == 0)) {
            int col = (i+a+cols)%cols;
            int row = (j+b+rows)%rows;
            neighbors += next[col][row];
          }
        }
      }
      board[i][j].previousState = board[i][j].state;

      if (next[i][j] == 1) {
        if (neighbors < 2 || (neighbors > 3)) {
          board[i][j].state = 0;
        }
      } else {
        if (neighbors == 3) {
          board[i][j].state = 1;
        }
      }
    }
  }
}

void randomize(Cell[][] board) {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j].state = (int)random(2);
    }
  }
}

void draw() {
  for (int i =0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      board[i][j].show();
    }
  }
  evolve(board);
}
