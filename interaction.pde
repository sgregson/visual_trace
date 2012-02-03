void keyPressed() {
  keys[keyCode] = true;
  if(key == 'q') {client1.addPoint( millis(), rW(0),rH(0) );}
  else if(key == 'w') {client1.addPoint( millis(), rW(1),rH(0) );}
  else if(key == 'e') {client1.addPoint( millis(), rW(2),rH(0) );}
  else if(key == 'r') {client1.addPoint( millis(), rW(3),rH(0) );}
  else if(key == 't') {client1.addPoint( millis(), rW(4),rH(0) );}
  else if(key == 'y') {client1.addPoint( millis(), rW(5),rH(0) );}
  else if(key == 'u') {client1.addPoint( millis(), rW(6),rH(0) );}
  else if(key == 'i') {client1.addPoint( millis(), rW(7),rH(0) );}
  else if(key == 'o') {client1.addPoint( millis(), rW(8),rH(0) );}
  else if(key == 'p') {client1.addPoint( millis(), rW(9),rH(0) );}
  
  else if(key == 'a') {client2.addPoint( millis(), rW(0),rH(1) );}
  else if(key == 's') {client2.addPoint( millis(), rW(1),rH(1) );}
  else if(key == 'd') {client2.addPoint( millis(), rW(2),rH(1) );}
  else if(key == 'f') {client2.addPoint( millis(), rW(3),rH(1) );}
  else if(key == 'g') {client2.addPoint( millis(), rW(4),rH(1) );}
  else if(key == 'h') {client2.addPoint( millis(), rW(5),rH(1) );}
  else if(key == 'j') {client2.addPoint( millis(), rW(6),rH(1) );}
  else if(key == 'k') {client2.addPoint( millis(), rW(7),rH(1) );}
  else if(key == 'l') {client2.addPoint( millis(), rW(8),rH(1) );}
  else if(key == ';') {client2.addPoint( millis(), rW(9),rH(1) );}
  
  else if(key == 'z') {client3.addPoint( millis(), rW(0),rH(2) );}
  else if(key == 'x') {client3.addPoint( millis(), rW(1),rH(2) );}
  else if(key == 'c') {client3.addPoint( millis(), rW(2),rH(2) );}
  else if(key == 'v') {client3.addPoint( millis(), rW(3),rH(2) );}
  else if(key == 'b') {client3.addPoint( millis(), rW(4),rH(2) );}
  else if(key == 'n') {client3.addPoint( millis(), rW(5),rH(2) );}
  else if(key == 'm') {client3.addPoint( millis(), rW(6),rH(2) );}
  else if(key == ',') {client3.addPoint( millis(), rW(7),rH(2) );}
  else if(key == '.') {client3.addPoint( millis(), rW(8),rH(2) );}
  else if(key == '/') {client3.addPoint( millis(), rW(9),rH(2) );}
  
  if(key == '1') {
    int[][] theCluster = {  {floor(random(0,width)),floor(random(0,height))},
                            {floor(random(0,width)),floor(random(0,height))},
                            {floor(random(0,width)),floor(random(0,height))}  };
    client1.addCluster( millis(), theCluster );
  } else if(key == '2') {
    int[][] theCluster = {  {floor(random(0,width)),floor(random(0,height))},
                            {floor(random(0,width)),floor(random(0,height))},
                            {floor(random(0,width)),floor(random(0,height))}  };
    client2.addCluster( millis(), theCluster );
  } else if(key == '3') {
    int[][] theCluster = {  {floor(random(0,width)),floor(random(0,height))},
                            {floor(random(0,width)),floor(random(0,height))},
                            {floor(random(0,width)),floor(random(0,height))}  };
    client3.addCluster( millis(), theCluster );
  }
}

void keyReleased() {
  keys[keyCode] = false;
}
int rW(int k) {return( floor(random(k*width/10, (k+1)*width/10)) );}
int rH(int k) {return( floor(random(k*height/3 + 40, (k+1)*height/3) - 40) );}
