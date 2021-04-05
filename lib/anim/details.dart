import 'package:demo/anim/photohero.dart';
import 'package:demo/anim/product.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Product product;
  final VoidCallback ontap;
  Details(this.product, this.ontap);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotoHero(widget.product.url),
            Text(
              widget.product.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.product.weight}g",
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.remove),
                      Text("1"),
                      Icon(Icons.add),
                    ],
                  ),
                ),
                Text("${widget.product.cost}")
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(30),
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              tileMode: TileMode.clamp,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Color(0x4DFFFFFF),
                Color(0x1AFFFFFF),
                Color(0x00FFFFFF),
              ]),
        ),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(40)),
              child: Icon(
                Icons.favorite_border_outlined,
                size: 20,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: () {
                  widget.ontap.call();
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
