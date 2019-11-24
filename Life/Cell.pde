public class Cell {
  int i;
  int j;
  int x;
  int y;
  int neighbors;
  boolean alive;

  public Cell(int i, int j, int w) {
    this.i = i;
    this.j = j;
    this.x = i*w;
    this.y = j*w;
    this.alive = false;
  }

  void show() {
    stroke(255);
    square(x, y, 20);
    if (alive) {
      fill(0,255,0);
      square(x, y, 20);
    } else {
      fill(0);
      square(x, y, 20);
    }
  }
}
