class EstatisticasJogadores {
  int defesa;
  int saque;
  int passe;
  int bloqueio;
  int levantamento;
  int ataque;
  double aproveitamentoDeAtaque;

  EstatisticasJogadores({
    required this.defesa,
    required this.saque, 
    required this.passe,
    required this.bloqueio,
    required this.levantamento, 
    required this.ataque,
    required this.aproveitamentoDeAtaque,
  });

  EstatisticasJogadores.fromMap(Map<String, dynamic> map)
  : defesa = map ["defesa"], 
    saque = map["saque"], 
    passe = map["passe"],
    bloqueio = map["bloqueio"], 
    levantamento = map ["levantamento"], 
    ataque = map["ataque"],
    aproveitamentoDeAtaque= map["aproveitamentoDeAtaque"];

  Map<String, dynamic> toMap() {
    return {
      "defesa": defesa,
      "saque": saque,
      "passe": passe,
      "bloqueio": bloqueio,
      "levantamento": levantamento,
      "ataque": ataque,
      "aproveitamentoDeAtaque": aproveitamentoDeAtaque,
    };

    void calculoAtaque(ataque, quantidaDeAtaque){
      aproveitamentoDeAtaque = (ataque/quantidaDeAtaque) * 100;
    };
  }
}