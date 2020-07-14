// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Produto.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoStore on _ProdutoStore, Store {
  final _$statebuttonAtom = Atom(name: '_ProdutoStore.statebutton');

  @override
  bool get statebutton {
    _$statebuttonAtom.reportRead();
    return super.statebutton;
  }

  @override
  set statebutton(bool value) {
    _$statebuttonAtom.reportWrite(value, super.statebutton, () {
      super.statebutton = value;
    });
  }

  final _$_ProdutoStoreActionController =
      ActionController(name: '_ProdutoStore');

  @override
  dynamic changeButton() {
    final _$actionInfo = _$_ProdutoStoreActionController.startAction(
        name: '_ProdutoStore.changeButton');
    try {
      return super.changeButton();
    } finally {
      _$_ProdutoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statebutton: ${statebutton}
    ''';
  }
}
