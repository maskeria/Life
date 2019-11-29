public class Cell {
  int i;
  int j;
  int x;
  int y;
  int neighbors;
  boolean alive;
  int state;
  int previousState;

  public Cell(int i, int j, int w) {
    this.i = i;
    this.j = j;
    this.x = i*w;
    this.y = j*w;
    this.alive = false;
    this.state = 0;
    this.previousState = state;
  }

  void show() {
    noStroke();
    square(x, y, 20);
    if (state == 1) {
      if (state == previousState) {
        fill(0, 0, 255);
        square(x, y, 20);
      } else {
        fill(255, 0, 0);
        square(x, y, 20);
      }
    } else {
      fill(255);
      square(x, y, 20);
    }
  }
}
