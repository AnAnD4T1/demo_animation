import 'package:demo/anim/cart.dart';
import 'package:demo/anim/listpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final int val = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Home(),
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     body: TestApp(
    //       val.toString(),
    //       NewScreen1(),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       child: Icon(Icons.add),
    //       onPressed: () {
    //         val += 1;
    //       },
    //     ),
    //   ),
    // );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        children: [ListPage(), Cart()],
      ),
    );
  }
}

// class TestApp extends InheritedWidget {
//   final String name;
//   final Widget child;

//   TestApp(this.name, this.child);

//   static TestApp of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType(aspect: TestApp);
//   }

//   @override
//   bool updateShouldNotify(covariant TestApp old) {
//     return old.name != name;
//   }
// }

// class NewScreen1 extends StatefulWidget {
//   @override
//   _NewScreen1State createState() => _NewScreen1State();
// }

// class _NewScreen1State extends State<NewScreen1> {
//   sendReq(String route) {
//     http.get(Uri.parse("http://192.168.0.106" + route)).then((value) {
//       print("done");
//     });
//   }

//   bool light = false;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(TestApp.of(context).name),
//     );
//   }
// }

// Widget textButton(BuildContext ctx, Widget screen) => TextButton(
//     child: Text("push"),
//     onPressed: () => Navigator.of(ctx).push(
//           MaterialPageRoute(builder: (context) => screen),
//         ));
