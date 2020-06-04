import 'package:explorer/constants/colors_const.dart';
import 'package:explorer/model/data.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailsPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: SafeArea(
          bottom: false,
          child: Stack(
            children: <Widget>[
              GalleryPart(planetInfo: planetInfo),
              Positioned(right: -64, child: Hero(tag:planetInfo.position,child: Image.asset(planetInfo.iconImage))),
              Positioned(
                  top: 60,
                  left: 32,
                  child: Text(
                    planetInfo.position.toString(),
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 247,
                        color: primaryTextColor.withOpacity(0.08),
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  )),
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryPart extends StatelessWidget {
  const GalleryPart({
    Key key,
    @required this.planetInfo,
  }) : super(key: key);

  final PlanetInfo planetInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextContentArea(planetInfo: planetInfo),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            'Gallery',
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 25,
                color: const Color(0xff47455f),
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
              itemCount: planetInfo.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        planetInfo.images[index],
                        fit: BoxFit.cover,
                      )),
                );
              }),
        ),
      ],
    );
  }
}

class TextContentArea extends StatelessWidget {
  const TextContentArea({
    Key key,
    @required this.planetInfo,
  }) : super(key: key);

  final PlanetInfo planetInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 300,
          ),
          Text(
            planetInfo.name,
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 56,
                color: primaryTextColor,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
          Text(
            'Solar System',
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 31,
                color: primaryTextColor,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.left,
          ),
          Divider(color: Colors.black38),
          SizedBox(height: 32),
          Text(
            planetInfo.description,
            maxLines: 5,
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 20,
                color: contentTextColor,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 32),
          Divider(color: Colors.black38)
        ],
      ),
    );
  }
}
