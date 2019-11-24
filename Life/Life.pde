int w = 20;
int cols; 
int rows;
Cell[][] board;


void setup() {
  frameRate(20);
  size(800, 800);
  background(255);
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
  boolean[][] next = new boolean[rows][cols];
  for (int p = 1; p < rows - 1; p++) {
    for (int q = 1; q < cols - 1; q++) {
      next[p][q] = board[p][q].alive;
    }
  }

  for (int i = 1; i < rows - 1; i++) {
    for (int j = 1; j < cols - 1; j++) {

      int neighbors = 0;

      for (int a = -1; a <= 1; a++) {
        for (int b = -1; b <= 1; b++) {
          
          if (!(a == 0 && b == 0)) {
            if (next[i+a][j+b]) {
              neighbors++;
            }
          }
          
        }
      }
      if(next[i][j]) {
        if(neighbors < 2 || neighbors > 3) {
          board[i][j].alive = false;
        }
      } else {
        if(neighbors == 3) {
          board[i][j].alive = true;
        }
      }
    }
  }

  
}

void randomize(Cell[][] board) {
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      board[i][j].alive = (int)random(2) == 1 ? true : false;
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
