import 'package:flutter/material.dart';

import 'data/ramen_menu.dart';

import 'dart:ui' as ui;

import '../components/icons/my_flutter_app_icons.dart';

WidgetSpan TextSpacer(double quantity) {
  return WidgetSpan(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: quantity),
    ),
  );
}

ClipRRect MenuImage(RamenMenu menu) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20), // Image border
    child: SizedBox.fromSize(
      size: const Size.fromRadius(48), // Image radius
      child: Image.network(menu.url, fit: BoxFit.cover),
    ),
  );
}

class Headings extends StatelessWidget {
  const Headings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Ramen Restaurant\n",
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
          TextSpan(
            text: "\$\$ Japanese, Asian food\n",
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Colors.grey, fontSize: 16),
          ),
          TextSpan(
            text: "4.3 ",
            style: Theme.of(context).textTheme.button?.copyWith(
                  fontSize: 16,
                ),
          ),
          const WidgetSpan(
              alignment: ui.PlaceholderAlignment.middle,
              child: Icon(
                Icons.star,
                color: Colors.red,
                size: 16,
              )),
          TextSpan(
            text: "200+ Ratings",
            style: Theme.of(context).textTheme.button?.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class SubHeadings extends StatelessWidget {
  const SubHeadings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        children: [
          // Container(
          //   child: Icon(MyFlutterApp.dollar_sign, ),
          // ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(MyFlutterApp.dollar_sign),
              onPressed: () {},
              iconSize: 16,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Free\n",
                          style: Theme.of(context).textTheme.titleMedium),
                      TextSpan(
                          text: "Delivery",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.grey)),
                    ],
                  ),
                ),
                // const Text("Free"),
                // const Text("Delivery")
              ],
            ),
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.timelapse),
              onPressed: () {},
              iconSize: 16,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "25\n",
                          style: Theme.of(context).textTheme.titleMedium),
                      TextSpan(
                        text: "Minutes",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
                // const Text("Free"),
                // const Text("Delivery")
              ],
            ),
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            child: const Text(
              "Take Away",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
