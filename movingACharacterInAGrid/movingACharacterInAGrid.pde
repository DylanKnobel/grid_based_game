//Moving a Character on a Grid
//CS30
//Oct 31, 2017

//globals
int[][] board;
int cols, rows;
float cellWidth, cellHeight;
int charX, charY;

void setup() {
  size(800, 800);

  cols = 100;
  rows = 100;

  initializeValues();
}

void draw() {
  displayBoard();
}

void keyPressed() {
  if (key == 'a') {
    characterMoveLeft();
  }
  else if (key == 'd') {
    characterMoveRight();
  }
}

void characterMoveLeft() {
  if (charX >= 1) {
    board[charX][charY] = 0;
    charX--;
    board[charX][charY] = 1;
  }
}

void characterMoveRight() {
  if (charX < cols-1) {
    board[charX][charY] = 0;
    charX++;
    board[charX][charY] = 1;
  }
}


void displayBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1) {
        fill(0);  //character
      } else if (board[x][y] == 0) {
        fill(255); //empty
      }
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
    }
  }
}

void initializeValues() {
  board = new int[cols][rows];
  cellWidth = width/cols;
  cellHeight = height/rows;
  
  //put player on last row, middle column
  charX = cols/2;
  charY = rows-1;
  board[charX][charY] = 1;
}