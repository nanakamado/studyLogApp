import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Log',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Study Log'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class commentRequest {
  final int userId;
  final String comment;
  commentRequest({
    this.userId,
    this.comment,
  });
  Map<String, dynamic> toJson() => {
    'name': userId,
    'comment': comment,
  };
}

class _MyHomePageState extends State<MyHomePage> {
  String _userId = '';
  String _comment = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              new TextFormField(
                enabled: true,
                obscureText: false,
                decoration: const InputDecoration(
                    hintText:"名前を入力してください",
                    labelText: "名前"
                ),
              ),
              SizedBox(height: 20.0),
              new TextFormField(
                enabled: true,
                obscureText: false,
                decoration: const InputDecoration(
                    hintText: "やった事を入力してくだい",
                    labelText:"やった事"
                ),
              ),
              SizedBox(height: 20.0),
              ButtonTheme(
                minWidth: 20.0,
                height:40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: _submission,
                      color: Colors.blue,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.send,),
                          SizedBox(width: 10.0,),
                          Text("送信")
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    FlatButton(
                      onPressed: _getText,
                      color: Colors.grey,
                      child: const Text('一覧'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  void _submission() {
    // var request = new commentRequest(userId: this._userId, comment: this._comment);
    var url = "http://localhost:8080/commentStudyLog";
    // print(request);
    print(url);
  }

  void _getText() {
    var url = "http://localhost:8080/";
    print(url);
  }

}
