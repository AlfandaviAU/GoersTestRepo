import 'package:flutter/material.dart';
import 'package:food_app/components/data/ramen_menu.dart';
import 'package:food_app/components/product_app_bar.dart';
import 'package:food_app/screens/restaurant_page.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

import 'package:food_app/components/utils.dart';

class RamenDetails extends StatefulWidget {
  const RamenDetails({super.key});

  @override
  State<RamenDetails> createState() => _RamenDetailsState();
}

class _RamenDetailsState extends State<RamenDetails> {
  RamenMenu ramenDetailsData = RamenMenu("", "", "", "", "");
  late List<RamenMenu> allData;
  late int indexData;
  bool waitingState = true;

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
    final index = await arguments["index"]!;
    setState(() {
      allData = data;
      indexData = index;
      ramenDetailsData = data[index];
      waitingState = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                ramenDetailsData.url,
                fit: BoxFit.cover,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  allData[indexData] = ramenDetailsData;
                });
                Navigator.of(context).push(_createRouteBack(allData));
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${ramenDetailsData.name}\n",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 24),
                          ),
                          TextSpan(
                            text: "\$\$ Japanese, Asian food\n",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.grey, fontSize: 16),
                          ),
                          TextSpan(
                            text: "❤️ ${ramenDetailsData.numberLike} likes",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        ramenDetailsData.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                RichText(
                  text: TextSpan(
                    text: "Change Menu Details",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  padding: const EdgeInsets.all(16),
                  // decoration: BoxDecoration(color: Colors.red),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Name",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                ramenDetailsData.name = value;
                              });
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "${ramenDetailsData.name}",

                              // hintStyle: TextStyle(
                              //   color: colors.withOpacity(0.5),
                              // ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Url",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ramenDetailsData.url = value;
                                }
                              });
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "Insert New Url Here",

                              // hintStyle: TextStyle(
                              //   color: colors.withOpacity(0.5),
                              // ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Price",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ramenDetailsData.price = processDigit(
                                      int.tryParse(value).toString());
                                }
                              });
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText:
                                  "${ramenDetailsData.price != "" ? ramenDetailsData.price : "Input Price Here"}",

                              // hintStyle: TextStyle(
                              //   color: colors.withOpacity(0.5),
                              // ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Like",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ramenDetailsData.numberLike = processDigit(
                                      int.tryParse(value).toString());
                                }
                              });
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText:
                                  "${ramenDetailsData.numberLike != "" ? ramenDetailsData.numberLike : "Input Price Here"}",

                              // hintStyle: TextStyle(
                              //   color: colors.withOpacity(0.5),
                              // ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          "Details",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ramenDetailsData.details = value;
                                }
                              });
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "${ramenDetailsData.details}",

                              // hintStyle: TextStyle(
                              //   color: colors.withOpacity(0.5),
                              // ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.1),
                      child: ElevatedButton(
                          onPressed: () {
                            allData.removeAt(indexData);
                            Navigator.of(context)
                                .push(_createRouteBack(allData));
                          },
                          child: Text(
                            "Remove Menu",
                            style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ]),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

String processDigit(String number) {
  final numberDigits = List.from(number.split(''));
  if (numberDigits.length > 6 || number == "null") {
    return "Invalid number";
  }
  int index = numberDigits.length - 3;
  while (index > 0) {
    numberDigits.insert(index, '.');
    index -= 3;
  }
  return numberDigits.join();
}

Route _createRouteBack(inputData) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const RestaurantPage(),
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
