import 'package:explorer/constants/colors_const.dart';
import 'package:explorer/model/data.dart';
import 'package:explorer/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7])),
          padding: const EdgeInsets.only(left: 32),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopTextPart(),
              SwiperCard(width: width),
            ],
          )),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: navigationColor,
          // borderRadius: BorderRadius.vertical(
          //   top: Radius.circular(36)
          // )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                icon: Image.asset('assets/images/menu_icon.png'),
                onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/images/search_icon.png'),
                onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/images/profile_icon.png'),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class SwiperCard extends StatelessWidget {
  const SwiperCard({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Swiper(
        itemCount: planets.length,
        itemWidth: width - 2 * 44,
        layout: SwiperLayout.STACK,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeSize: 20, space: 8, color: Colors.redAccent)),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) => DetailsPage(
                            planetInfo: planets[index],
                          )));
            },
            child: Stack(
              children: <Widget>[
                SizedBox(height: 100),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 200),
                        Text(
                          planets[index].name,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 44,
                              color: const Color(0xff47455f),
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 23,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: <Widget>[
                            Text(
                              'Know more',
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 18,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: secondaryTextColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Hero(
                  tag: planets[index].position,
                  child: Image.asset(planets[index].iconImage)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TopTextPart extends StatelessWidget {
  const TopTextPart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Text(
            'Explore',
            style: TextStyle(
                fontFamily: 'Avenir', fontSize: 44, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          DropdownButton(
              items: [
                DropdownMenuItem(
                    child: Text(
                  'Solar System',
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 24,
                      color: const Color(0x7cdbf1ff),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ))
              ],
              onChanged: (value) {},
              icon: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset('assets/images/drop_down_icon.png'),
              ),
              underline: SizedBox())
        ],
      ),
    );
  }
}
