//Classe para envio de informações dos produtos no carrinho
class CartproductsTotal{
   double total;
   List<Cartproduct> produtos;
   CartproductsTotal(this.total,this.produtos);

   
}
class Cartproduct{
   String nome;
   int quantidade;
   double valor;
   String totalProduto (){
    return (quantidade*valor).toStringAsFixed(2).toString();
  }
  
   Cartproduct(this.nome,this.quantidade,this.valor);

}