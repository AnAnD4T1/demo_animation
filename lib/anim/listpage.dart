import 'package:demo/anim/product.dart';
import 'package:demo/anim/productcard.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  List<Product> items = [
    Product(name: "Noodles", cost: 150, url: "assets/noodles.png", weight: 500),
    Product(name: "Bread", cost: 100, url: "assets/bread.png", weight: 500),
  ];

  List<String> cartItems = ["assets/noodles.png"];
  String current;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.addListener(() {
      if (_animationController.value > .80) {
        setState(() {
          cartItems.add(current);

          current = null;
        });
        _animationController.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              var height = (size.height / 2) +
                  (_animationController.value * (size.height / 2));
              var opacity = _animationController.value > .85 ? 0.0 : 1.0;
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Color(0xffECE9DE),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                          child: GridView.count(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 2,
                            children: items
                                .map((e) => ProductCard(e, onTap: () {
                                      _animationController.forward();
                                      setState(() {
                                        current = e.url;
                                      });
                                    }))
                                .toList(),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Cart",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 24)),
                                Expanded(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: cartItems
                                        .map(
                                          (e) => Container(
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Image.asset(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text("${cartItems.length}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  current == null
                      ? SizedBox(
                          width: 0,
                          height: 0,
                        )
                      : AnimatedOpacity(
                          opacity: opacity,
                          duration: Duration(milliseconds: 200),
                          child: Transform.translate(
                            offset: Offset(size.width / 2, height),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Image.asset(current),
                            ),
                          ),
                        )
                ],
              );
            }),
      ),
    );
  }
}
