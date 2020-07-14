import 'package:mobx/mobx.dart';
part 'Produto.g.dart';

class ProdutoStore=_ProdutoStore with _$ProdutoStore;

abstract class _ProdutoStore with Store{
  @observable
  bool statebutton=false;
  @action
  changeButton(){
    statebutton= !statebutton;
  }

}