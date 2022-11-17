import 'package:flutter/material.dart';
import 'data/ramen_menu.dart';
import 'utils.dart';

SizedBox MenuCard(BuildContext context, RamenMenu menu) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width * 0.6,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${menu.name}\n',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          TextSpacer(2),
          TextSpan(
            text: '❤️ ${menu.numberLike} orang suka ini\n',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          TextSpacer(2),
          TextSpan(
            text: '${menu.details}\n',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                ),
          ),
          TextSpan(
            text: '${menu.price}\n',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
