import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/pagenation_home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: PagenationHomeViewBody(),
    );
  }
}