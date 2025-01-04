import 'package:basketball_counter_app/core/utilis/service_locator.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/domain/use_case/fetch_similar_books_use_case.dart';
import 'package:basketball_counter_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:basketball_counter_app/features/home/presentation/views/book_details_view.dart';
import 'package:basketball_counter_app/features/home/presentation/views/home_view.dart';
import 'package:basketball_counter_app/features/search/data/repos/search_repo_implement.dart';
import 'package:basketball_counter_app/features/search/presentation/manager/serch_books_cubit/search_books_cubit.dart';
import 'package:basketball_counter_app/features/splash/presentation/views/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/data_source/home_local_data_source.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repos_impl/home_repo_implement.dart';
import '../../features/search/presentation/views/search_view.dart';
import 'api_service.dart';

abstract class AppRouters {
  static const kHomeView = '/homeview';
  static const kBookDetails = '/bookdetailsview';
  static const kSearchView = '/searchview';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context,
            GoRouterState state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetails,
        builder: (BuildContext context, GoRouterState state) =>
            BlocProvider<SimilarBooksCubit>(
              create: (context) {
                return SimilarBooksCubit(FetchSimilarBooksUseCase(
                    homeRepo: HomeRepoImpl(
                    homeLocalDataSource:HomeLocalDataSourceImpl(),
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                apiService: ApiService(Dio())))));
              },
              child: BookDetailsView(bookEntity: state.extra as BookEntity,),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) =>
            BlocProvider<SearchBooksCubit>(create: (BuildContext context) =>
                SearchBooksCubit(SearchRepoImpl(ApiService(Dio()))),
                child: const SearchView()),
      ),
    ],
  );
}