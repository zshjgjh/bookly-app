
import 'package:basketball_counter_app/constant.dart';
import 'package:basketball_counter_app/core/utilis/api_service.dart';
import 'package:basketball_counter_app/core/utilis/app_routers.dart';
import 'package:basketball_counter_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:basketball_counter_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:basketball_counter_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:basketball_counter_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utilis/service_locator.dart';
import 'features/home/data/repos_impl/home_repo_implement.dart';
import 'features/home/domain/use_case/fetch_featured_books_use_case.dart';




void main() async{
 await Hive.initFlutter();
 Hive.registerAdapter(BookEntityAdapter());
 await Hive.openBox<BookEntity>(kFeaturedBox);
 await Hive.openBox<BookEntity>(kNewestBox);
 await Hive.openBox<BookEntity>(kSimilarBox);
  setupServiceLocator();
  runApp(BooklyApp());
}


class BooklyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<NewestBooksCubit>(
          create: (BuildContext context) {
            return NewestBooksCubit(FetchNewestBooksUseCase
              (
              homeRepo: HomeRepoImpl(
                homeLocalDataSource:HomeLocalDataSourceImpl(),
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                    apiService: ApiService(Dio())
                ), ),),)..getNewestBooks();
          }
        ),
        BlocProvider<FeaturedBooksCubit>(
          create: (BuildContext context){
            return FeaturedBooksCubit(
                FetchFeaturedBooksUseCase(
                homeRepo: HomeRepoImpl(
                homeLocalDataSource:HomeLocalDataSourceImpl(),
            homeRemoteDataSource: HomeRemoteDataSourceImpl(
            apiService: ApiService(Dio())))))..getFeaturedBooks();
          }
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
            ),

        ),
    );
  }
}
