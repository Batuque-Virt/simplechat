import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final player = AudioPlayer();
   Future<void> playAudioFromUrl(String url) async {
     await player.play(UrlSource(url));
  }

  List<Message> messages = [];
  ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.linearToEaseOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    loadMessagesFromJson();
  }

  Future<void> loadMessagesFromJson() async {
    // Simulando o carregamento das mensagens a partir do JSON
    String jsonString = '''
  [
    {
      "id": 434759073,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "Boa tarde",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:04:03",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwILPrC-6wIW-b1YasM",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:04:04",
      "updated_at": "2023-07-19 14:04:04",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434759082,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "👨🏻‍💻  Olá Original Ferragens e Acabamentos, é um prazer poder te auxiliar. \\n \\nPor favor, em que posso ajudar❓ \\n \\nEscolha uma das opções abaixo? \\n *[ 1 ]* - 📊 Sobre o sistema \\n *[ 2 ]* - 💰 Quais são os planos e valores \\n *[ 3 ]* - 📳 Quero que entrem em contato comigo \\n *[ 4 ]* - ⌨ Falar com o suporte \\n *[ 5 ]* - 🗣 Falar com o setor de vendas \\n *[ 6 ]* - 💰 Quero meu boleto \\n *[ 7 ]* - 📪 Integração com o Telegram \\n\\nA qualquer momento você pode digitar *Menu* para voltar ao menu principal ou *Encerrar* para finalizar o atendimento.\\nProtocolo: *110239785230719020404*",
      "tipo": "m",
      "celular": "5511933051929",
      "hora": "2023-07-19 14:04:03",
      "enviado": null,
      "idWhatsapp": "gBGHVRiZeUhgjwIJ3FQFLUKHyj3I",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": 2,
      "created_at": "2023-07-19 14:04:05",
      "updated_at": "2023-07-19 14:04:06",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434759343,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "1",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:04:30",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwILPrBVYWgteGLD6tA",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:04:31",
      "updated_at": "2023-07-19 14:04:31",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434759349,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "O *Simple Chat*  é um sistema de automação para atendimentos automáticos via WhatsApp. \\n \\nCom ele é possível automatizar as principais funções da sua empresa. \\n \\nSegue algumas coisas que o nosso sistema pode fazer: \\n \\n - Atendimento automatizado. \\n \\n - Múltiplos atendimentos. \\n \\n - Setorização dos seus atendentes. \\n \\n - Use apenas um número e tenha vários atendentes respondendo por ele. \\n \\n - Envie Audio, Documentos ou Imagens de forma automática \\n \\n \\n \\nE muitas outras coisas. \\n \\nFale com um de nossos atendentes e veja como essa ferramenta pode ajudar o seu negócio a crescer.",
      "tipo": "m",
      "celular": "5511933051929",
      "hora": "2023-07-19 14:04:30",
      "enviado": null,
      "idWhatsapp": "gBGHVRiZeUhgjwIJJ45NWGIaojp6",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": 2,
      "created_at": "2023-07-19 14:04:31",
      "updated_at": "2023-07-19 14:04:32",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434759632,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "2",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:04:57",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwILPrDb8z0KjLDIpl4",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:04:57",
      "updated_at": "2023-07-19 14:04:57",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434759640,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "Para saber mais sobre nossos planos e valores, fale com um dos nossos atendentes para que possamos te explicar melhor \\n *[ 1 ]* - Falar com um atendente \\n *[ 2 ]* - Gostaria de contratar e testar gratuitamente \\n *[ 3 ]* - Não vou contratar agora, só estava pesquisando \\n *[ 4 ]* - Voltar ao menu anterior \\n",
      "tipo": "m",
      "celular": "5511933051929",
      "hora": "2023-07-19 14:04:57",
      "enviado": null,
      "idWhatsapp": "gBGHVRiZeUhgjwIJCZQgNJ1dAssa",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": 2,
      "created_at": "2023-07-19 14:04:58",
      "updated_at": "2023-07-19 14:04:59",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434759834,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "1",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:05:15",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwILPrBR33zC8cc_6VA",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:05:15",
      "updated_at": "2023-07-19 14:05:15",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434759840,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "Certo, eu vou te redirecionar para o atendimento. \\n \\n Por favor, informe a sua dúvida que em breve iremos te atender.",
      "tipo": "m",
      "celular": "5511933051929",
      "hora": "2023-07-19 14:05:15",
      "enviado": null,
      "idWhatsapp": "gBGHVRiZeUhgjwIJLqjCnyLjNlwc",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": 2,
      "created_at": "2023-07-19 14:05:15",
      "updated_at": "2023-07-19 14:05:16",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434760041,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": 13473,
      "mensagem": "Olá, Boa tarde, seja bem vindo ao atendimento Simple Chat, meu nome é Ygor, em que posso ajudar?",
      "tipo": "m",
      "celular": "5511933051929",
      "hora": "2023-07-19 14:05:36",
      "enviado": null,
      "idWhatsapp": "gBGHVRiZeUhgjwIJ6-aBuFgf4_E1",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": 2,
      "created_at": "2023-07-19 14:05:36",
      "updated_at": "2023-07-19 14:05:37",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434760529,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "Estou a procura de um chat para automatizar o whatsapp da empresa que trabalho, e me interessei pela sua plataforma",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:06:24",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwILPrCLefFa9-bvhms",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:06:25",
      "updated_at": "2023-07-19 14:06:25",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434761036, 
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "Ai eu gostaria de saber a quantidade de atendentes e como funciona a contratação",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:07:09",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwILPrBYDpRnmKmv4d4",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:07:10",
      "updated_at": "2023-07-19 14:07:10",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434761543,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": 13473,
      "mensagem": "<audio controls=\\"controls\\"><source src=\\"https://fileswhats.nyc3.digitaloceanspaces.com/public/admin/sistema/1/chat/30335214/lTFmv7u5bAhZhSPpF580iPP576CFswgmjUdNgicL.ogg\\" type=\\"audio/ogg; codecs=opus\\" />seu navegador não suporta HTML5</audio>",
      "tipo": "m",
      "celular": "5511933051929",
      "hora": "2023-07-19 14:08:03",
      "enviado": null,
      "idWhatsapp": "gBGHVRiZeUhgjwIJUOfeZpztUdIa",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": 2,
      "created_at": "2023-07-19 14:08:03",
      "updated_at": "2023-07-19 14:08:06",
      "lida": 0,
      "file_extension": "opus"
    },
    {
      "id": 434762466,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "4 atendentes",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:09:42",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwIQSf6dRj0q8I8xGg0iwJy8Rg",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:09:43",
      "updated_at": "2023-07-19 14:09:43",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434762573,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "Que são os 4 setores",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:09:53",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwIQb69cBGB9gBbZ4zCmOHzMrQ",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:09:53",
      "updated_at": "2023-07-19 14:09:53",
      "lida": 0,
      "file_extension": null
    },
    {
      "id": 434762725,
      "idSistema": 1,
      "idChat": 30335214,
      "idUsuario": null,
      "mensagem": "Que temos aqui",
      "tipo": "c",
      "celular": "5518997948608",
      "hora": "2023-07-19 14:10:07",
      "enviado": null,
      "idWhatsapp": "ABGHVRiZeUhgjwIQAeHv6O15DMaa9wFDaxzvVw",
      "quotedMsg": null,
      "quotedType": null,
      "quotedId": null,
      "removida": 0,
      "ack": null,
      "created_at": "2023-07-19 14:10:07",
      "updated_at": "2023-07-19 14:10:07",
      "lida": 0,
      "file_extension": null
    }
  ]
  ''';

    List<dynamic> jsonData = jsonDecode(jsonString);

    setState(() {
      messages = jsonData.map((data) => Message.fromJson(data)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            // Alinhar o Container com o appbar
            children: [
              Container(
                padding: EdgeInsets.only(top: 0.0, bottom: 7.0, left: 5.0),
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                // Manter a largura igual à largura da tela
                margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
                // Adiciona margem superior e inferior para ajustar o espaço
                height: 80.0,
                // Defina a altura desejada aqui, ajuste conforme necessário
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          'https://media-gru2-2.cdn.whatsapp.net/v/t61.24694-24/370255238_678965493879987_7856219333818825331_n.jpg?ccb=11-4&oh=01_AdQgOnenTcIXKvu6MRlD0A_LQMLIQ5e0zJEBsNpXJxVOyA&oe=655BDBC5&_nc_sid=e6ed6c&_nc_cat=100',
                        ),
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(width: 11.0, height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teste',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '+556799100000',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'teste.dev@gmail.com',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message =
                    messages[index]; // Acessar as mensagens na ordem correta
                return _buildMessage(message);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    final isMe = message.isMe;
    final messageContent = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isMe ? 16.0 : 0),
          topRight: Radius.circular(isMe ? 0 : 16.0),
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: isMe ? Colors.green[200] : Colors.grey[400],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(fontSize: 16.0),
            ),
            if (message.audioUrl != null)
              ElevatedButton(
                onPressed: () {
                  playAudioFromUrl('https://filesamples.com/samples/audio...');
                  },
                child: const Text('Play Audio'),
              ),

            SizedBox(height: 4.0),
            Text(
              DateFormat('HH:mm').format(message.dateTime),
              style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );

    return Align(
      alignment: isMe ? Alignment.topRight : Alignment.topLeft,
      child: messageContent,
    );
  }

  Widget _buildInputField() {
    String message = '';

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                message = value;
              },
              controller: TextEditingController(text: message),
              decoration: InputDecoration(labelText: 'Digite sua mensagem'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (message.isNotEmpty) {
                _sendMessage(message);
              }
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message) {
    final newMessage =
        Message(text: message, isMe: true, dateTime: DateTime.now());

    // Adiciona a nova mensagem à lista de mensagens recebidas
    setState(() {
      messages.add(newMessage);
    });
    //Role para a posição da nova mensagem
    _scrollToBottom();
  }
}

class Message {
  final String text;
  final bool isMe;
  final DateTime dateTime;
  final String? audioUrl;

  Message({
    required this.text,
    required this.isMe,
    required this.dateTime,
    this.audioUrl,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    String mensagem = json['mensagem'];
    mensagem = mensagem.replaceAll('\\n', '\n');

    String? audioUrl;
    if (mensagem.contains('https://') &&
        (mensagem.contains('.mp3') || mensagem.contains('.ogg'))) {
      audioUrl = mensagem;
    }

    return Message(
      text: mensagem,
      isMe: json['tipo'] == 'm' ? true : false,
      dateTime: DateTime.parse(json['hora']),
      audioUrl: audioUrl,
    );
  }
}

// Id é para quando eu for apagar/mensagem uma mensagem
//Id whatsapp mesma coisa

/*
{
"id":21928400,
"idSistema":6,
"idCliente":8344572,
"idUsuario":34251,
"status":"manual",
"ativo":1,
"ultimaMensagem":"cliente",
"dataUltimaMensagem":null,
"idCategoria":6,
"protocolo":"68344572230621125839",
"valorPesquisa":"op 1",
"idPesquisa":1,
"inicioAtendimento":"2023-06-21 12:58:43",
"fimAtendimento":"2023-06-21 12:58:41",
"created_at":"2023-06-21 12:58:39",
"updated_at":"2023-07-26 09:26:08",
"idConfiguracao":null,
"idVinculado":null,
"idMotivoEncerramento":null,
"dataHoraManual":null,
"idCanal":3,
"tipoChat":"W",
"cor":"#0b5394",
"observacao":null,
"userNome":"Abner Mello"
},
{
"id":21928401,
"idSistema":6,
"idCliente":8344572,
"idUsuario":34251,
"status":"manual",
"ativo":1,
"ultimaMensagem":"cliente",
"dataUltimaMensagem":null,
"idCategoria":6,
"protocolo":"68344572230621125846",
"valorPesquisa":null,
"idPesquisa":null,
"inicioAtendimento":"2023-06-21 12:58:48",
"fimAtendimento":null,
"created_at":"2023-06-21 12:58:46",
"updated_at":"2023-07-21 09:29:05",
"idConfiguracao":null,
"idVinculado":null,
"idMotivoEncerramento":null,
"dataHoraManual":"2023-06-21 12:58:49",
"idCanal":3,
"tipoChat":"W",
"cor":"#0b5394",
"observacao":null,
"userNome":"Abner Mello"
},
{
"id":21928402,
"idSistema":6,
"idCliente":8344599,
"idUsuario":34251,
"status":"manual",
"ativo":1,
"ultimaMensagem":"sistema",
"dataUltimaMensagem":null,
"idCategoria":6,
"protocolo":"68344599230621055138",
"valorPesquisa":null,
"idPesquisa":null,
"inicioAtendimento":"2023-06-21 17:51:39",
"fimAtendimento":null,
"created_at":"2023-06-21 17:51:38",
"updated_at":"2023-07-21 09:29:05",
"idConfiguracao":null,
"idVinculado":null,
"idMotivoEncerramento":null,
"dataHoraManual":null,
"idCanal":3,
"tipoChat":"W",
"cor":"#0b5394",
"observacao":null,
"userNome":"Abner Mello"
}
*/
