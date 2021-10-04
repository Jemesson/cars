class Brand {
  final String nome;
  final String codigo;

  Brand({required this.nome, required this.codigo});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(nome: json['nome'], codigo: json['codigo']);
  }
}
