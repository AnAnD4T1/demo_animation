import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  PhotoHero(this.url, {this.onTap});
  final String url;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Material(
        color: Colors.white,
        child: InkWell(
          child: InkWell(onTap: onTap, child: Image.asset(url)),
        ),
      ),
    );
  }
}
