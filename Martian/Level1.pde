int[][] platforms = new int[][] {{500,400,200},{800,400,200}};
int[][] clothes = new int[][] {{500,350,0,0},{400,350,1,0}};

int collected = 0;

void level1(){
  for(int i = 0; i<3; i+=1){
    image(spaceBg, -x+i*spaceBg.width,0);
  }
  if(x>=0 && speed<0){
    x+=speed;
  }else if(x<1000 && speed>0){
    x+=speed;
  }
  
  textFont(font, 40);
  fill(0,255,0);
  text("x"+str(collected), 800, 50);
  
  
  //Drawing Clothes and Collecting Clothes
  for(int i = 0; i<clothes.length; i+=1){
    //Drawing
    if(clothes[i][3] == 0){
      image(clothesPics[clothes[i][2]], clothes[i][0]-x,clothes[i][1]);
    }
    //Collecting
    if(clothes[i][3]==0 && martianX > clothes[i][0]-x && martianX < clothes[i][0]-x + clothesPics[clothes[i][2]].width && martianY > clothes[i][1] && martianY < clothes[i][1] + clothesPics[clothes[i][2]].height){
      clothes[i][3] = 1;
      collected++;
    }
  }
  
  //Drawing platforms
  for(int i = 0; i<platforms.length; i+=1){
    rect(platforms[i][0]-x,platforms[i][1],platforms[i][2],30);
  }
  
  rect(martianX, martianY, 10,10);
  
  drawAlien(false);
}


boolean onPlatform(){
  boolean onPlatform = false;
  for(int i = 0; i<platforms.length; i+=1){
    if(martianX>platforms[i][0]-x-platforms[i][2]/2 && martianX<platforms[i][0]-x+platforms[i][2]/2 && martianY > platforms[i][1] && martianY < platforms[i][1]+30 && currentScreen == "level1"){
      onPlatform = true;
    }
  }
  
  return onPlatform;
}
