import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  // static int _userId;
  // static String _comment;
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
                    ElevatedButton(
                      onPressed: _submission,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.send,),
                          SizedBox(width: 10.0,),
                          Text("送信")
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    ElevatedButton(
                      onPressed: _getText,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
  Future<void> _getText() async {
    var getUrl = "http://localhost:8080/commentStudyLogs";
    print(getUrl);
    var response = await http.get(Uri.parse(getUrl));
    if (response.statusCode == 200) {
      print(response.body);
      // var jsonResponse = json.decode(response.body);
      // final imageUrl = jsonResponse['sprites']['front_default'];
      // setState(() {
      //   imageUrls.add(imageUrl);
      // });
    } else {
      throw Exception('Failed to fetch image URL');
    }
  }

}
