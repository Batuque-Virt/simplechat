import 'package:flutter/material.dart';
import 'dart:convert';
import 'ChatModel.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<ChatModel> _chats = [];

  @override
  void initState() {
    super.initState();
    // Simulando o carregamento dos dados a partir do arquivo JSON (consumo da API).
    String jsonString = '''[ 
      {
        "id": 21928400,
        "idSistema": 6,
        "idCliente": 8344572,
        "idUsuario": 34251,
        "status": "manual",
        "ativo": 1,
        "ultimaMensagem": "cliente",
        "dataUltimaMensagem": null,
        "idCategoria": 6,
        "protocolo": "68344572230621125839",
        "valorPesquisa": "op 1",
        "idPesquisa": 1,
        "inicioAtendimento": "2023-06-21 12:58:43",
        "fimAtendimento": "2023-06-21 12:58:41",
        "created_at": "2023-06-21 12:58:39",
        "updated_at": "2023-07-26 09:26:08",
        "idConfiguracao": null,
        "idVinculado": null,
        "idMotivoEncerramento": null,
        "dataHoraManual": null,
        "idCanal": 3,
        "tipoChat": "W",
        "cor": "#0b5394",
        "observacao": null,
        "userNome": "Abner Mello"
      },
      {
        "id": 21928401,
        "idSistema": 6,
        "idCliente": 8344572,
        "idUsuario": 34251,
        "status": "manual",
        "ativo": 1,
        "ultimaMensagem": "cliente",
        "dataUltimaMensagem": null,
        "idCategoria": 6,
        "protocolo": "68344572230621125846",
        "valorPesquisa": null,
        "idPesquisa": null,
        "inicioAtendimento": "2023-06-21 12:58:48",
        "fimAtendimento": null,
        "created_at": "2023-06-21 12:58:46",
        "updated_at": "2023-07-21 09:29:05",
        "idConfiguracao": null,
        "idVinculado": null,
        "idMotivoEncerramento": null,
        "dataHoraManual": "2023-06-21 12:58:49",
        "idCanal": 3,
        "tipoChat": "W",
        "cor": "#0b5394",
        "observacao": null,
        "userNome": "Abner Mello"
      },
      {
        "id": 21928402,
        "idSistema": 6,
        "idCliente": 8344599,
        "idUsuario": 34251,
        "status": "manual",
        "ativo": 1,
        "ultimaMensagem": "sistema",
        "dataUltimaMensagem": null,
        "idCategoria": 6,
        "protocolo": "68344599230621055138",
        "valorPesquisa": null,
        "idPesquisa": null,
        "inicioAtendimento": "2023-06-21 17:51:39",
        "fimAtendimento": null,
        "created_at": "2023-06-21 17:51:38",
        "updated_at": "2023-07-21 09:29:05",
        "idConfiguracao": null,
        "idVinculado": null,
        "idMotivoEncerramento": null,
        "dataHoraManual": null,
        "idCanal": 3,
        "tipoChat": "W",
        "cor": "#0b5394",
        "observacao": null,
        "userNome": "Abner Mello"
      }
    ]''';

    List<dynamic> jsonData = json.decode(jsonString);
    _chats = jsonData.map((data) => ChatModel.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Chats'),
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          ChatModel chat = _chats[index];
          return ListTile(
            title: Text(chat.userNome),
            subtitle: Text(chat.ultimaMensagem),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navegar para a tela de detalhes do chat quando o item for clicado.
              // Você pode implementar essa navegação de acordo com suas necessidades.
            },
          );
        },
      ),
    );
  }
}
