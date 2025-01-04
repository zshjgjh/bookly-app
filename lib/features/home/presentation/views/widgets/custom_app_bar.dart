import 'package:basketball_counter_app/core/utilis/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilis/asset_data.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetData.logo,
            height: 100,
            width: 100,),
          IconButton(onPressed: () {
            GoRouter.of(context).push(AppRouters.kSearchView);
          },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass,
                size: 20,))
        ],
      ),
    );
  }
}