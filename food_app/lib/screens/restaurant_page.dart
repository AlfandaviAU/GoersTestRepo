import 'package:flutter/material.dart';
import 'package:food_app/components/data/ramen_menu.dart';
import 'package:food_app/screens/ramen_details.dart';
import '../components/menu_card.dart';
import '../components/restaurant_app_bar.dart';
import '../components/utils.dart';
import '../const.dart';
import 'dart:ui' as ui;
import '../components/icons/my_flutter_app_icons.dart';
import 'create_ramen.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<RamenMenu> product_list = [Menu1, Menu2, Menu3, Menu4];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.processData();
    });
  }

  void processData() async {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final data = await (arguments["inputData"])!;
    if (data != null) {
      setState(() {
        product_list = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(_createRouteAddMenu(product_list));
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.restaurant),
      ),
      body: CustomScrollView(
        slivers: [
          const RestaurantAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Headings(),
                  const SubHeadings(),
                  Container(
                    // decoration: BoxDecoration(color: Colors.red),
                    margin: const EdgeInsets.all(12),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: product_list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context)
                              .push(_createRoute(product_list, index)),
                          child: Column(children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MenuCard(context, product_list[index]),
                                const Spacer(),
                                MenuImage(product_list[index]),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                          ]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute(inputData, index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const RamenDetails(),
    settings: RouteSettings(
      arguments: {
        "inputData": inputData,
        "index": index,
      },
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteAddMenu(inputData) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CreateRamen(),
    settings: RouteSettings(
      arguments: {
        "inputData": inputData,
      },
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
