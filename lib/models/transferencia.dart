class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia paraa a conta $numeroConta no valor de $valor realizada com sucesso';
  }
}
