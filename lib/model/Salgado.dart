class Salgado {
  String nome;
  String valor;
  String caminho;

  Salgado(this.nome,this.valor,this.caminho);
}


Salgado currentSalgado(int num){
  if(num == 1){
    return Salgado("Coxinha","0.99","imgs/coxinha.jpg");
  }
  if(num == 2){
    return Salgado("Kibe","0.99","imgs/kibe.jpg");
  }
  if(num == 3){
    return Salgado("Bolinho de Queijo","0.99","imgs/bolinho.jpg");
  }
  if(num == 4){
    return Salgado("Bolinho de Salsicha","1.99","imgs/bolinho_salsicha.jpg");
  }
  if(num == 5){
    return Salgado("Esfirra","1.99","imgs/esfira.jpg");
  }
  if(num == 6){
    return Salgado("Fogassa","1.49","imgs/fogassahd.png");
  }
}



