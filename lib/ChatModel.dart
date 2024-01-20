class ChatModel {
  final int id;
  final int idSistema;
  final int idCliente;
  final int idUsuario;
  final String status;
  final int ativo;
  final String ultimaMensagem;
  final String dataUltimaMensagem;
  final int idCategoria;
  final String protocolo;
  final String valorPesquisa;
  final int idPesquisa;
  final String inicioAtendimento;
  final String fimAtendimento;
  final String createdAt;
  final String updatedAt;
  final int idConfiguracao;
  final int idVinculado;
  final int idMotivoEncerramento;
  final String dataHoraManual;
  final int idCanal;
  final String tipoChat;
  final String cor;
  final String observacao;
  final String userNome;

  ChatModel({
    required this.id,
    required this.idSistema,
    required this.idCliente,
    required this.idUsuario,
    required this.status,
    required this.ativo,
    required this.ultimaMensagem,
    required this.dataUltimaMensagem,
    required this.idCategoria,
    required this.protocolo,
    required this.valorPesquisa,
    required this.idPesquisa,
    required this.inicioAtendimento,
    required this.fimAtendimento,
    required this.createdAt,
    required this.updatedAt,
    required this.idConfiguracao,
    required this.idVinculado,
    required this.idMotivoEncerramento,
    required this.dataHoraManual,
    required this.idCanal,
    required this.tipoChat,
    required this.cor,
    required this.observacao,
    required this.userNome,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      idSistema: json['idSistema'],
      idCliente: json['idCliente'],
      idUsuario: json['idUsuario'],
      status: json['status'],
      ativo: json['ativo'],
      ultimaMensagem: json['ultimaMensagem'],
      dataUltimaMensagem: json['dataUltimaMensagem'],
      idCategoria: json['idCategoria'],
      protocolo: json['protocolo'],
      valorPesquisa: json['valorPesquisa'],
      idPesquisa: json['idPesquisa'],
      inicioAtendimento: json['inicioAtendimento'],
      fimAtendimento: json['fimAtendimento'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      idConfiguracao: json['idConfiguracao'],
      idVinculado: json['idVinculado'],
      idMotivoEncerramento: json['idMotivoEncerramento'],
      dataHoraManual: json['dataHoraManual'],
      idCanal: json['idCanal'],
      tipoChat: json['tipoChat'],
      cor: json['cor'],
      observacao: json['observacao'],
      userNome: json['userNome'],
    );
  }
}
