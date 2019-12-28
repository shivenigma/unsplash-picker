import 'package:flutter/material.dart';
import 'unsplash_result.dart';
//import 'package:http/http.dart' as http;
import 'network.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Pick a Image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder<String>(
        future:  DefaultAssetBundle.of(context)
            .loadString('assets/response.json'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            List<UnsplashResults> data = parseData(snapshot.data.toString());
            return GridView.count(
                primary: true,
                crossAxisCount: 2,
                childAspectRatio: 0.80,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: List.generate(data.length, (index) {
                  var imageData = data[index];
                  return Image.network(imageData.urls.thumb,
                    fit: BoxFit.cover,
                  );
                }));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}
