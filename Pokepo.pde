boolean acabou = false;
int personagem; // (1 - gigalith; 2 - arcanince; 3 - leafeon; 4 - mowak; 5 - accelgor;)
int inimigo;
int menu = 1;
int espera = 0;
PImage gigalith;
PImage gigalithPersonagem;
PImage arcanine;
PImage arcaninePersonagem;
PImage leafeon;
PImage leafeonPersonagem;
PImage mowak;
PImage mowakPersonagem;
PImage accelgor;
PImage accelgorPersonagem;
PImage hotbar;
PImage seta;
PImage regras;
PImage logo;
PImage menuImagem;
PImage regrasJogo;
PImage batalhaEscolhas;
PImage batalha;
PImage escolha;
PFont minecraft;
PImage ganhou;
void setup() {
  size(680, 383);
  background(0, 0, 100);
  accelgorPersonagem = loadImage("inseto-aliado.png");
  accelgor = loadImage("inseto.png");
  mowakPersonagem = loadImage("pedra-aliado.png");
  mowak = loadImage("pedra.png");
  leafeonPersonagem = loadImage("planta-aliado.png");
  leafeon = loadImage("planta.png");
  arcaninePersonagem = loadImage("fogo-aliado.png");
  gigalithPersonagem = loadImage("terrestre-aliado.png");
  regras = loadImage("Group 1.png");
  logo = loadImage("text-1684032360979 (1).png");
  menuImagem = loadImage("inicio.png");
  regrasJogo = loadImage("regras.png");
  batalhaEscolhas = loadImage("batalhaEscolhas.png");
  batalha = loadImage("batalha.jpg");
  hotbar = loadImage("hotbar.png");
  seta = loadImage("seta.png");
  gigalith = loadImage("terrestre.png");
  arcanine = loadImage("fogo.png");
  escolha = loadImage("escolher.png");
  minecraft = createFont("Minecraft.ttf", 12);
  ganhou = loadImage("ganhou.png");
  colorMode(HSB, 360, 100, 100);
  textFont(minecraft);
}

void draw() {
  drawMenu();
  jogar();
  regras();
  pokemons();
  batalha();
  if (menu == 1) {
    if (mouseX <= 440 && mouseX >= 240 && mouseY >= 140 && mouseY <= 190 && mousePressed) {
      menu = 2;
    }
    if (mouseX <= 440 && mouseX >= 240 && mouseY >= 210 && mouseY <= 260 && mousePressed) {
      menu = 3;
    }
    if (mouseX <= 440 && mouseX >= 240 && mouseY >= 280 && mouseY <= 330 && mousePressed) {
      menu = 4;
    }
  }
}


//Desenha o menu
void drawMenu() {
  if (menu != 1) {

    return;
  }
  image(menuImagem, 0, 0);
  image(logo, 250, 50);
  rectMode(CENTER);
  stroke(240, 100, 100);
  strokeWeight(4);
  fill(60, 100, 90);
  rect(340, 165, 200, 50);
  rect(340, 235, 200, 50);
  rect(340, 305, 200, 50);
  fill(0);

  text("JOGAR", 320, 170);
  text("REGRAS", 318, 240);
  text("POKEMONS", 310, 310);
  espera = 0; //Zera a espera pra não ter double-click
}


//Parte onde o jogador vai decidir qual pokemon vai usar
void jogar() {
  if (menu != 2) {
    return;
  }
  if (mouseX <= 50 && mouseY <= 40 && mousePressed) {
    menu = 1;
    return;
  }
  fill(60, 100, 90);
  image(menuImagem, 0, 0);

  triangle(50, 20, 30, 30, 50, 40);
  image(escolha, 190, 20, 300, 60);
  rect(257, 150, 76, 79); //Botão gigalith
  rect(404, 150, 76, 79); //Botão arcanine
  rect(425, 246, 80, 79); //Botão leafeon
  rect(329, 246, 76, 79); //Botão morowak
  rect(228, 246, 90, 79); //Botão accelgor
  image(batalhaEscolhas, 180, 90);
  espera = espera +1;
  if (espera >= 10) {
    escolhaPersonagem();
  }
}

//Explica as regras do jogo
void regras() {
  if (menu != 3) {
    return;
  }
  if (mouseX <= 50 && mouseY <= 40 && mousePressed) {
    menu = 1;
    return;
  }
  fill(60, 100, 90);
  image(menuImagem, 0, 0);
  image(regrasJogo, 255, 100);
  triangle(50, 20, 30, 30, 50, 40);
}


//Explica as relações das escolhas
void pokemons() {
  if (menu != 4) {
    return;
  }
  if (mouseX <= 50 && mouseY <= 40 && mousePressed) {
    menu = 1;
    return;
  }
  fill(60, 100, 90);
  image(menuImagem, 0, 0);
  triangle(50, 20, 30, 30, 50, 40);
  image(regras, 200, 50);
}


//Diz qual pokemon está sendo esocolhido com base no click
void escolhaPersonagem() {
  if (mouseX >= 220 && mouseX <= 297 && mouseY >= 108 && mouseY <= 188 && mousePressed) {
    menu = 5;
    personagem = 1;
    inimigo = int(random(1, 6));
  }

  if (mouseX >= 365 && mouseX <= 442 && mouseY >= 108 && mouseY <= 188 && mousePressed) {
    menu = 5;
    personagem = 2;
    inimigo = int(random(1, 6));
  }

  if (mouseX >= 384 && mouseX <= 466 && mouseY >= 205 && mouseY <= 285 && mousePressed) {
    menu = 5;
    personagem = 3;
    inimigo = int(random(1, 6));
  }

  if (mouseX >= 290 && mouseX <= 368 && mouseY >= 205 && mouseY <= 285 && mousePressed) {
    menu = 5;
    personagem = 4;
    inimigo = int(random(1, 6));
  }

  if (mouseX >= 182 && mouseX <= 274 && mouseY >= 205 && mouseY <= 285 && mousePressed) {
    menu = 5;
    personagem = 5;
    inimigo = int(random(1, 6));
  }
}
