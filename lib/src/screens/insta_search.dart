import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_icons/custom_icons.dart';

class InstaSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Icon(CustomIcons.search_fill),
              backgroundColor: Colors.grey[50],
              snap: true,
              floating: true,
              titleSpacing: 0.0,
              elevation: 0.0,
              title: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 24.0,
                  ),
                ),
                style: TextStyle(),
              ),
              actions: <Widget>[
                Icon(FontAwesomeIcons.qrcode),
                SizedBox(width: 16.0),
              ],
            ),
            SliverPersistentHeader(
              delegate: CustomSliverDelegate(),
              pinned: true,
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1.0,
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: 30.0,
                    width: 20.0,
                    color: Colors.red,
                  );
                },
                childCount: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text('IGTV'),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                  color: Colors.black12,
                  width: 0.5,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
        },
        padding: EdgeInsets.only(left: 8.0),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return null;
  }
}
