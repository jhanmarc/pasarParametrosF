import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TexScreen(),
    );
  }
}

class TexScreen extends StatefulWidget {
  TexScreen({Key key}) : super(key: key);

  @override
  _TexScreenState createState() => _TexScreenState();
}

class _TexScreenState extends State<TexScreen> {
  String _text = "Texto Editable";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pasar Parametros'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Cambiar"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditScreen(_text)
                  )
                ).then((result){
                  if(result != null){
                    setState(() {
                      _text = result;
                    });
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  final String texto;
  EditScreen(this.texto);
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _controller;


  @override
  void initState() {
    _controller = TextEditingController(text: widget.texto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Texto"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(controller: _controller),
              RaisedButton(
                child: Text("Guardar"),
                onPressed: () {
                  Navigator.of(context).pop(_controller.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
