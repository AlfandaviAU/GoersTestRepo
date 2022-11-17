import 'package:flutter/material.dart';

import 'data/ramen_menu.dart';

class product_app_bar extends StatelessWidget {
  const product_app_bar({
    Key? key,
    required this.ramenDetailsData,
  }) : super(key: key);

  final RamenMenu ramenDetailsData;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          ramenDetailsData.url,
          fit: BoxFit.cover,
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.chevron_left),
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.ios_share),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.search),
          ),
        )
      ],
    );
  }
}
