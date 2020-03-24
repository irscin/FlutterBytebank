class contact{
  final String name;
  final int numeroConta;

  contact(this.name, this.numeroConta);

  String toString(){
    return 'Contato{nome: $name, numeroConta: $numeroConta}';
  }
  String getName(){
    return '$name';
  }

  String getConta(){
    return '$numeroConta';
  }
}