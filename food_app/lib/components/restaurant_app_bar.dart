import 'package:flutter/material.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          "https://static1.therecipeimages.com/wordpress/wp-content/uploads/2022/03/Branden-Skeli-on-Unsplash-bright-ramen-restaurant-lights.jpg",
          fit: BoxFit.cover,
        ),
      ),
      // leading: GestureDetector(
      //   onTap: () {
      //     print("onBack Action");
      //   },
      //   child: const Padding(
      //     padding: EdgeInsets.only(left: 16.0),
      //     child: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: Icon(Icons.chevron_left),
      //     ),
      //   ),
      // ),
      // actions: const [
      //   Padding(
      //     padding: EdgeInsets.only(right: 16.0),
      //     child: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: Icon(Icons.ios_share),
      //     ),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(right: 16.0),
      //     child: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: Icon(Icons.search),
      //     ),
      //   )
      // ],
    );
  }
}
