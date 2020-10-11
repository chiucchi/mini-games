import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController username_controller = new TextEditingController();
  TextEditingController userpsw_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 40.0),
                child: Container(
                  height: 180.0,
                  width: 600.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "MINI\nGAMES",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 55.0,
                          fontWeight: FontWeight.w200,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: username_controller,
                          decoration: InputDecoration(
                            labelText: "USUÁRIO",
                            labelStyle: TextStyle(fontSize: 20.0),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('Favor inserir o usuário');
                            } else if (value.length < 3) {
                              return ("Favor inserir um nome de usuário maior");
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: userpsw_controller,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "SENHA",
                            labelStyle: TextStyle(fontSize: 20.0),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('Favor inserir a senha');
                            } else if (value.length < 5) {
                              return ("Favor inserir uma senha maior");
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.only(top: 45.0, left: 45.0, right: 45.0),
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => telaJogos()),
                      );
                    },
                    child: Text('LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 20.0,
                        )),
                    color: Colors.grey[350],
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class telaJogos extends StatefulWidget {
  @override
  _telaJogosState createState() => _telaJogosState();
}

class _telaJogosState extends State<telaJogos> {
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Mini Games", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.grey[350],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Container(
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Text("Acesse o jogo clicando na imagem",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          int randomNumber = random.nextInt(51);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    jogoAdivinha(randomNumber: randomNumber)),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          color: Colors.grey[350],
                          child:
                              new Image.asset('assets/icons/questionMark.png'),
                          // child: const Icon(Icons.)
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Forca()),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          color: Colors.grey[350],
                          child: new Image.asset('assets/icons/controller.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(),
                ));
          },
          child: const Icon(Icons.info_outline, color: Colors.black),
          backgroundColor: Colors.white,
          // splashColor: Colors.grey,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

class jogoAdivinha extends StatefulWidget {
  int randomNumber;

  jogoAdivinha({this.randomNumber});

  @override
  _jogoAdivinhaState createState() => _jogoAdivinhaState(randomNumber);
}

class _jogoAdivinhaState extends State<jogoAdivinha> {
  final valor = TextEditingController();
  Random random = new Random();
  int randomNumber;
  int tentativas = 0;

  _jogoAdivinhaState(this.randomNumber);

  showAlertDialog(BuildContext context, int tentativas) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Não"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => telaJogos()), // volta pra pagina de jogos
        );
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Sim"),
      onPressed: () {
        tentativas = 0;
        int randomNumber = random.nextInt(51);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => jogoAdivinha(
                  randomNumber: randomNumber)), // volta pra pagina de jogos
        );
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Você ganhou!"),
      content:
          Text("Após $tentativas tentativas. Gostaria de jogar novamente?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Adivinha", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[350],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Container(
                width: 250,
                height: 340,
                child: new Image.asset('assets/adivinhagame/genio.png'),
                alignment: Alignment.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    width: 100.0,
                    child: Text(
                        "Você consegue adivinhar o número em que estou pensando?",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w300))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150.0, left: 150.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(counterText: ''),
                  controller: valor,
                  onChanged: (valor) {
                    print(randomNumber);
                    if (valor.length == 2) {
                      if (int.parse(valor) < randomNumber) {
                        tentativas++;
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content:
                                      Text("Muito baixo! Tente novamente"));
                            });
                      } else if (int.parse(valor) > randomNumber) {
                        tentativas++;
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content: Text("Muito alto! Tente novamente"));
                            });
                      } else if (int.parse(valor) == randomNumber) {
                        return showAlertDialog(context,
                            tentativas); // gerar novo numero aleatorio e resetar tentativas
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Informações", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[350],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 5.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 220.0,
                      height: 180.0,
                      child: Text(
                          "No adivinha você deve ser mais esperto do que o gênio, tente adivinhar o número em que ele está pensando no menor número de tentativas.\nUma dica: sempre vai ser menor do que 50.",
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ),
                    Container(
                      width: 130.0,
                      height: 190.0,
                      child: new Image.asset('assets/adivinhagame/genio.png'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 5.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 220.0,
                      height: 180.0,
                      child: Text(
                          "O jogo da forca é simples, basta você acertar a palavra sorteada. Mas cuidado, se você errar muito o stickman vai acabar morrendo! Somente 4 erros serão tolerados.",
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ),
                    Container(
                      width: 130.0,
                      height: 190.0,
                      child: new Image.asset('assets/forca/hangman_legs.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Forca extends StatefulWidget {
  @override
  _ForcaState createState() => _ForcaState();
}

class _ForcaState extends State<Forca> {
  int status = 0;
  String palavra = palavras[Random().nextInt(palavras.length)];
  List<String> letrasadivinhadas = [];
  List<String> imagens = [
    "assets/forca/hangman_vazio.png", // 0
    "assets/forca/hangman_head.png", // 1
    "assets/forca/hangman_tummy.png", // 2
    "assets/forca/hangman_arms.png", // 3
    "assets/forca/hangman_legs.png", // 4
  ];

  showAlertDialog(BuildContext context, String perdeu) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Não"),
      onPressed: () {
        status = 0;
        letrasadivinhadas.clear();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => telaJogos()), // volta pra pagina de jogos
        );
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Sim"),
      onPressed: () {
        status = 0;
        letrasadivinhadas.clear();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Forca()), // volta pra pagina de jogos
        );
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Você $perdeu!"),
      content: Text("Gostaria de jogar novamente?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  handletext() {
    String mostrarpalavra = '';
    for (int i = 0; i < palavra.length; i++) {
      var char = palavra[i];
      if (letrasadivinhadas.contains(char)) {
        mostrarpalavra += char + " ";
      } else {
        mostrarpalavra += "_ ";
      }
    }
    return mostrarpalavra;
  }

  checarletra(String alfabeto) {
    if (palavra.contains(alfabeto)) {
      setState(() {
        letrasadivinhadas.add(alfabeto);
      });
    } else {
      if (status != 4) {
        setState(() {
          status++;
        });
      } else {
        showAlertDialog(context, "perdeu");
      }
    }

    bool ganhou = true;
    for (int i = 0; i < palavra.length; i++) {
      var char = palavra[i];
      if (!letrasadivinhadas.contains(char)) {
        setState(() {
          ganhou = false;
        });
        break;
      }
    }

    if (ganhou == true) {
      showAlertDialog(context, 'ganhou');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forca", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[350],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 200.0,
              height: 200.0,
              margin: EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(imagens[status]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 25.0),
            child: Text(handletext(),
                style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 8,
                children: letras.map((eachalphabet) {
                  return GestureDetector(
                    onTap: () => checarletra(eachalphabet),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[350],
                      ),
                      child: Center(
                        child: Text(eachalphabet,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w300)),
                      ),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}

List<String> palavras = [
  'FLUTTER',
  'COMPUTADOR',
  'GOOGLE',
  'ANDROID',
  'APPLE',
  'IOS',
  'TECLADO',
  'MONITOR',
  'CACHORRO',
  'CANTAR',
  'CASA',
  'COZINHA',
  'PREDIO',
  'PUC',
  'FACULDADE',
  'PROFESSOR',
  'CHUVA',
  'RUA'
];

List<String> letras = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
  'Á',
  'Ã',
  'Ç',
  'É'
];
