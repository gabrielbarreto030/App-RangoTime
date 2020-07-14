
class Userbasico{
  String nome;
  String endereco;
  String uf;
  String cidade;
  Userbasico(this.nome,this.endereco,this.uf,this.cidade);
}



//Consulta com BD local


// db.Pesquisa().then((listas) {
                        //   listas.forEach((usuario) {
                        //     print("executado");
                        //     print(
                        //         "'${usuario.email.trim()}' email encontrado com tamanho de ${usuario.email.length}");
                        //     print(
                        //         "${emailtext} email digitado com tamanho de ${emailtext.length}");
                        //     if (((usuario.email).trim().toString()) ==
                        //         emailtext.trim().toString()) {
                        //       print("Os email são iguais");
                        //       if ((usuario.senha).trim().toString() ==
                        //           senhaltext.trim().toString()) {
                        //         Navigator.of(context).push(MaterialPageRoute(
                        //             builder: (context) => Home(usuario)));
                        //       }
                        //     }
                        //   });
                        // });