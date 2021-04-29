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
  final String userId;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new TextFormField(
              enabled: true,
              obscureText: false,
              decoration: const InputDecoration(
                hintText:"名前を入力してください",
                labelText: "名前"
              ),
            ),
            new TextFormField(
              enabled: true,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "やった事を入力してくだい",
                labelText:"やった事"
              ),
            ),
            RaisedButton(
              onPressed: _submission,
              child: Text('送信'),
            )
          ],
        ),
      ),
    );
  }
  void _submission() {
    var request = new commentRequest(userId: this._userId, comment: this._comment);
    var url = "http://127.0.0.0/commentStudyLog";
    print(request);
    print(url);
  }

}
