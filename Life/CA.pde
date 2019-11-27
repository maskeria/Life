boolean conwaysLife(boolean alive, int neighbors) {
  if (alive) {
    if (neighbors < 2 || (neighbors > 3)) {
      return false;
    }
  } else {
    if (neighbors == 3) {
      return true;
    }
  }
  return alive;
}

boolean mandala(boolean alive, int neighbors) {
  if (alive) {
    if (neighbors < 2 || (neighbors > 3 && neighbors < 6)) {
      return false;
    }
  } else {
    if (neighbors == 3) {
      return true;
    }
  }
  return alive;
}
