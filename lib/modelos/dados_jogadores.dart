class DadosJogadores{
  int id;
  String nome;
  String posicao;

  DadosJogadores({
    required this.id,
    required this.nome, 
    required this.posicao,
    });

  DadosJogadores.fromMap(Map<String, dynamic> map)
  : id = map ["id"], 
    nome = map["nome"], 
    posicao = map["posicao"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "posicao": posicao,
    };
  }
}