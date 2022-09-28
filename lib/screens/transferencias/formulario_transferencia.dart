import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';
var yellow = Color.fromARGB(255, 255, 242, 18);
var orange = Color.fromARGB(255, 236, 112, 0);
var blue = Color.fromARGB(255, 0, 51, 153);

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoValor = TextEditingController();
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Color.fromARGB(255, 236, 112, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(_controllerCampoNumeroConta, _rotuloCampoNumeroConta,
                _dicaCampoNumeroConta, null),
            Editor(_controllerCampoValor, _rotuloCampoValor, _dicaCampoValor,
                Icons.monetization_on),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar,
                  style: TextStyle(fontSize: 20, color: yellow)),
              onPressed: () {
                _criaTransferencia(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return ListaTransferencia();
                //     },
                //   ),
                // );
              },
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    print('clicou no confirmar');
    // debugPrint(_controllerCampoNumeroConta.text);
    // debugPrint(_controllerCampoValor.text);
    final int? numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(_controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      // debugPrint('Criando Transferência');
      // debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
