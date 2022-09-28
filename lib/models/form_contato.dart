class Contatos {
  final String nome;
  final String endereco;
  final String telefone;
  final String email;
  final String cpf;

  Contatos(
    this.nome,
    this.endereco,
    this.telefone,
    this.email,
    this.cpf,
  );

  @override
  String toString() {
    return 'Nome{valor: $nome, endereco: $endereco, Telefone: $telefone, E-mail: $email, CPF: $cpf}';
  }
}
