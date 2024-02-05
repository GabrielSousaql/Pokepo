int posSeta = 306;
int xpers = 50;
int ypers = 30;
int xinim = 300;
int yinim = -30;


void batalha() {


  if (menu != 5) {
    return;
  }

  acabou = false;
  image(batalha, 0, 0);
  exibir();


  //Controlando se o jogador vai lutar ou selecionar outro Pokemon
  if (keyCode == DOWN) {
    posSeta = 342;
  }

  // Fugir
  if (posSeta == 342 && keyCode == ENTER) {
    menu = 2;
    posSeta = 306;
    keyCode = RIGHT;
    xpers = 50;
    ypers = 30;
    xinim = 300;
    yinim = -30;
  }

  if (keyCode == UP) {
    posSeta = 306;
  }

  if (posSeta == 306  && keyCode == ENTER ) {
    if (personagem == inimigo) {
      empate();
    } else {
      switch(personagem) {
      case 1:
        if (inimigo==2 || inimigo==4) {
          vitoria();
        } else if (inimigo==3 || inimigo==5) {
          derrota();
        }
        break;
      case 2:
        if (inimigo == 3 || inimigo == 5) {
          vitoria();
        } else if (inimigo == 1  || inimigo == 4) {
          derrota();
        }
        break;
      case 3:
        if (inimigo == 1 || inimigo == 4) {
          vitoria();
        } else if (inimigo == 2  || inimigo == 5) {
          derrota();
        }
        break;
      case 4:
        if (inimigo == 2 || inimigo == 5) {
          vitoria();
        } else if (inimigo == 1  || inimigo == 3) {
          derrota();
        }
        break;
      case 5:
        if (inimigo == 3 || inimigo == 1) {
          vitoria();
        } else if (inimigo == 2  || inimigo == 4) {
          derrota();
        }
        break;
      }
    }
  }
  
  //Mostrar Hot bar
  if (acabou == false){
  image(hotbar, 0, 283);
  image(seta, 472, posSeta);
  fill(0,0,40);
  textSize(9);
  text("(Aperte ENTER para selecionar e UP ou DOWN para escolher)", 150,357);
  }
  // Lutar
}

void exibir() {


  switch(inimigo) {
  case 1:
    image(gigalith, xinim, yinim);
    break;
  case 2:
    image(arcanine, xinim, yinim);
    break;
  case 3:
    image(leafeon, xinim, yinim);
    break;
  case 4:
    image(mowak, xinim, yinim);
    break;
  case 5:
    image(accelgor, xinim, yinim);
    break;
  default:
    println("ERRO INIMIGO");   // Does not execute
    break;
  }
  switch(personagem) {
  case 1:
    image(gigalithPersonagem, xpers, ypers);
    break;
  case 2:
    image(arcaninePersonagem, xpers, ypers);
    break;
  case 3:
    image(leafeonPersonagem, xpers, ypers);
    break;
  case 4:
    image(mowakPersonagem, xpers, ypers);
    break;
  case 5:
    image(accelgorPersonagem, xpers, ypers);
    break;
  default:
    println("ERRO PERSONAGEM");   // Does not execute
    break;
  }
}

void empate() {

  xpers += 2 ;
  ypers -= 1;
  xinim -= 1;
  yinim += 1;
  if (xpers >= 150) {
    xpers = 150;
  }
  if (ypers <= 0) {
    ypers = 0;
  }
  if (xinim <= 260) {
    xinim = 260;
  }
  if (yinim >= 0) {
    yinim = 0;
  }

if (xinim == 260 && yinim == 0 && xpers == 150 && ypers == 0) {
    fill(240, 100, 100, 40);
    rect(300, 300, 900, 600);
    fill(120, 100, 100);
    textSize(50);
    text("EMPATOU :/", 200, 100);
    textSize(20);
    text("APERTE LEFT PARA REINICIAR", 190, 350);
    keyPressed();
    textSize(12);
    acabou = true;
  }

  if (xpers == 200 && xinim == 230) {
    keyCode = DOWN;
  }
}

//O que acontece quando Ganha
void vitoria() {
  xpers += 3;
  ypers -= 2;
  if (xpers >= 200) {
    xpers = 200;
  }
  if (ypers <= -30) {
    ypers = -30;
  }
  if (xpers == 200 && ypers == -30) {
    fill(240, 100, 100, 50);
    rect(300, 300, 900, 600);
    fill(60, 100, 100);
    textSize(50);
    text("VOCE GANHOU!!", 150, 100);
    textSize(20);
    text("APERTE LEFT PARA REINICIAR", 190, 350);
    keyPressed();
    textSize(12);
    acabou = true;
  }
}
//O que acontece quando Perde
void derrota() {
  xinim -= 3;
  yinim += 2;

  if (xinim <= 180) {
    xinim = 180;
  }
  if (yinim >= 30) {
    yinim = 30;
  }
  if (xinim == 180 && yinim == 30) {
    fill(240, 100, 100, 40);
    rect(300, 300, 900, 600);
    fill(240, 100, 50);
    textSize(50);
    text("VOCE PERDEU :(", 150, 100);
    textSize(20);
    text("APERTE LEFT PARA REINICIAR", 190, 350);
    keyPressed();
    textSize(12);
    acabou = true;
  }
}

void keyPressed() {
  if (acabou == true  && keyCode == LEFT || acabou == true && keyCode == UP || acabou == true && keyCode == DOWN) {
    menu = 1;
    xpers = 50;
    ypers = 30;
    xinim = 300;
    yinim = -30;
    keyCode = RIGHT;
    acabou = false;
  }
}
