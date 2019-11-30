/*
mouse clicks to paint while paused
 make glider objects
 use mouse clicks to shoot gliders in any direction
 */
int w = 20;
int cols; 
int rows;
Cell[][] board;
int[][] copy;
boolean paused = false;

void setup() {
  //frameRate(15);
  size(1500, 1500);
  background(100);
  cols = width / w;
  rows = height / w;
  board = new Cell[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      board[i][j] = new Cell(i, j, w);
    }
  }
  copy = new int[rows][cols];
  randomize(board);
}

void draw() {
  for (int i =0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      board[i][j].show();
    }
  }
  if (!paused) {
    evolve(board);
  }
  if (paused && mousePressed) {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        Cell current = board[i][j];
        if (mouseX<current.x+w && mouseX>current.x && mouseY<current.y+w && mouseY>current.y) {
          if (mouseButton == LEFT) {
            current.state = 1;
          }
          if (mouseButton == RIGHT) {
            current.state = 0;
          }
        }
      }
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    randomize(board);
  }
  if (key == ' ') {
    paused = !paused;
  }
  if (key == 'c' || key == 'C') {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j].state = 0;
      }
    }
  }
}

void evolve(Cell[][] board) {
  for (int p = 0; p < rows; p++) {
    for (int q = 0; q < cols; q++) {
      copy[p][q] = board[p][q].state;
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
            neighbors += copy[col][row];
          }
        }
      }
      board[i][j].previousState = board[i][j].state;

      if (copy[i][j] == 1) {
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
