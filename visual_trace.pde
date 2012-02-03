boolean[] keys = new boolean[255];
TraceRoute client1, client2, client3;

HashMap traceMap = new HashMap();
int DURATION = 3000;

void setup() {
  size(screen.width-200, screen.height-200);
  smooth();
  
  client1 = new TraceRoute();
  client2 = new TraceRoute();
  client3 = new TraceRoute();
  
  //  traceMap.put(Connection, client1);
  //  traceMap.put(Connection, client2);
  //  traceMap.put(Connection, client3);
}

void draw() {
  background(255);
  println("----" + frameRate);
  client1.drawTargets();
  client2.drawTargets();
  client3.drawTargets();
  
  client1.drawCables();
  client2.drawCables();
  client3.drawCables();
}


class TraceRoute {
  ArrayList collection;
  color base;
  int priorX, priorY;
  
  TraceRoute() {
    collection = new ArrayList();
    //base = #0084A5;
    base = color(random(0,255),random(0,255),random(0,255));  // assign based on connection
  }
  
  void addPoint(int _s, int _x, int _y) {
    if(collection.size() >= 1) {
      collection.add( new TracePoint(base, _s,_x,_y, priorX, priorY) );
    } else {
      collection.add( new TracePoint(base, _s,_x,_y) );  //  if collection is empty
    }
    priorX = _x;
    priorY = _y;
  }
  void addCluster(int _s, int[][] _cluster) {
    // connect each of the clusters to the prior node
    for(int i=0; i < _cluster.length; i++) {
      collection.add( new TracePoint(base, _s, _cluster[i][0] , _cluster[i][1] , priorX, priorY) );
    }
  }
  
  
  void drawTargets() {
    for (int i = 0; i < collection.size(); i++) {
      TracePoint trace = (TracePoint) collection.get(i);
      text(i, trace.x() + 15, trace.y() - 15);
      
      if( trace.update() ) {trace.drawPoint();}
      else {collection.remove(i);}
    }
    
    println(collection.size());
  }
  
  void drawCables() {
    for (int i = 0; i < collection.size(); i++) {
      TracePoint trace = (TracePoint) collection.get(i);
      trace.drawCable();
    }
  }
  
}


class TracePoint {
  int init, theX, theY;
  int pX, pY;
  int s, mS;
  float amt, amt2;
  color base, baseTrans, fade, fade2;
  
  TracePoint(color _c, int _i, int _x, int _y, int _pX, int _pY) {
    base = _c;
    baseTrans = color( base, 0);
    init = _i;
    theX = floor(_x);
    theY = floor(_y);
    pX = _pX;
    pY = _pY;
    
    s = floor(30 * (sin((PI - 1)*(1 - map(init + DURATION - millis(), 0, DURATION, 0, 1) ) + 1) ));
    mS = s;
  }
  
  TracePoint(color _c, int _i, float _x, float _y) {
    base = _c;
    baseTrans = color( base, 0);
    init = _i;
    theX = floor(_x);
    theY = floor(_y);
    pX = theX;
    pY = theY;
    
    s = floor(30 * (sin((PI - 1)*(1 - map(init + DURATION - millis(), 0, DURATION, 0, 1) ) + 1) ));
    mS = s;
  }
  
  int x() {return theX;}
  int y() {return theY;}
  
  boolean update() {
    if(init + DURATION - millis() >= -DURATION) {return true;}
    else {return false;}
  }
  
  void drawPoint() {
    amt = map(init + DURATION - millis(), 0, DURATION, 0, 1);
    amt2 = map(init + 2*DURATION - millis(), 0, 2*DURATION, 0, 1);

    fade = lerpColor( baseTrans, base , amt );
    fade2 = lerpColor( baseTrans, base , amt2 );
    s = floor( 30 * (sin((PI - 1)*(1-amt) + 1)) );
    mS = max(mS, s);
    
    if(s>=0){
      fill(fade);
      noStroke();
      ellipse(theX,theY, s, s);
    }
    
    noFill();
    stroke(fade2);
    ellipse(theX,theY, mS, mS);
  }
  
  void drawCable() {
      int di = floor( sqrt(pow(theX-pX,2) + pow(theY-pY,2)) );
      stroke(fade2);
      
      //line(theX,theY,pX,pY);
      
      beginShape();
      vertex(theX,theY);
      bezierVertex(theX, theY-(.5*di) ,pX, pY-(.5*di) ,pX,pY);
      endShape();
      
  }
  
  
}
