import 'package:flutter/material.dart';

import '../utils/ui_image.dart';
import './circle_image.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
        itemCount: UiImage.storiesList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 4.0),
        itemBuilder: (BuildContext context, int index) {
          return story(index);
        },
      ),
    );
  }

  Widget story(int index) {
    return Column(
      children: <Widget>[
        index == 0
            ? createStory()
            : CircleImage(
                UiImage.storiesList[index],
              ),
        Expanded(
          child: Text(
            index == 0 ? 'Your Story' : UiImage.storiesName[index],
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  Widget createStory() {
    return Stack(
      children: <Widget>[
        Container(
          height: 90.0,
          width: 90.0,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                UiImage.storiesList[0],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 4.0,
          right: 2.0,
          height: 28.0,
          width: 28.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
