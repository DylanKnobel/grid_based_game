//Enemy Falling in Grid
//CS30
//Nov 1, 2017

//globals
int[][] board;
int[][] enemy;
int cols, rows;
float cellWidth, cellHeight;
int charX, charY;

void setup() {
  size(800, 800);

  cols = 100;
  rows = 100;

  initializeValues();
  spawnEnemy();
}

void draw() {
  moveEnemy();
  displayBoard();
}

void keyPressed() {
  if (key == 'a') {
    characterMoveLeft();
  } else if (key == 'd') {
    characterMoveRight();
  } 
  if (key == 'w') {
    characterMoveUp();
  } else if (key == 's') {
    characterMoveDown();
  }
}

void mousePressed() {
  spawnEnemy();
  spawnEnemy();
  spawnEnemy();
  spawnEnemy();
  spawnEnemy();
  spawnEnemy();
  spawnEnemy();
}

void moveEnemy() {
  if (frameCount % 30 == 0) {

    for (int x=cols-1; x>=0; x--) {
      for (int y=rows-1; y>=0; y--) {
        if (board[x][y] == 2) {  //enemy spot
          board[x][y] = 0;
          if (x > 0) {
            if (y < rows-1) {  //don't go below the grid
              board[x][y+1] = 2;
            }
          } else if (y > 0) {
            if (x < cols-1) {  //don't go below the grid
              board[x+1][y] = 2;
            }
          }
        }
      }
    }
  }
}

//for enemy movement can use noise function
void spawnEnemy() {
  int x = int(random(cols));
  int y = int(random(rows));
  board[0][y] = 2;
  board[x][0] = 2;
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

void characterMoveUp() {
  if (charY > 1) {
    board[charX][charY] = 0;
    charY--;
    board[charX][charY] = 1;
  }
}

void characterMoveDown() {
  if (charY < rows-1) {
    board[charX][charY] = 0;
    charY++;
    board[charX][charY] = 1;
  }
}


void displayBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1) {
        fill(0);  //character
      } else if (board[x][y] == 2) {
        fill(255, 0, 0);
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