
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/newest_books_bloc_consumer.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utilis/styles.dart';
import 'newest_books_item.dart';


class PagenationHomeViewBody extends StatefulWidget {
  const PagenationHomeViewBody({Key? key,}) : super(key: key);


  @override
  State<PagenationHomeViewBody> createState() => _PagenationHomeViewBodyState();
}

class _PagenationHomeViewBodyState extends State<PagenationHomeViewBody> {
  late ScrollController scrollController;
  int nextPage = 1;// because page=0 is already shown in first page
   bool isLoading=false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    var currentPosition = scrollController.position.pixels;
    var maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (isLoading==false) {
        isLoading=true;
        BlocProvider.of<NewestBooksCubit>(context).getNewestBooks(
            pageNumber: nextPage);
        nextPage++;
        isLoading=false;//to stop fetch data before the previous request is completed
      }

      print('loading..');
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .27,
                      child: const FeaturedBooksListView()),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 10),
                    child: Text('Newest Books', style: Styles.textStyle18,),
                  ),
                ],)),

          NewestBooksBlocConsumer()
        ]);
  }
}


