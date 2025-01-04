import 'package:basketball_counter_app/core/errors/errors.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/home_local_data_source.dart';
import '../data_source/home_remote_data_source.dart';


class HomeRepoImpl implements HomeRepo{
 final HomeRemoteDataSource homeRemoteDataSource;
 final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource,
    required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0}) async {

    List<BookEntity> books;
    try {
      books=  homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if(books.isNotEmpty){
        print('not empty');
        return right(books);

      }else{
        books=await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
        print(' empty');
        return right(books);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      print(e.toString());
      return left(ServerFailure(e.toString()));

    }
  }

 @override
 Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber=0}) async {
   List<BookEntity> books;
   try {
     books=  homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
     if(books.isNotEmpty){
       print('not emoty');
       return right(books);

     }else{
       books=await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
       print(' emoty');
       return right(books);
     }

   } catch (e) {
     if (e is DioException) {
       return left(ServerFailure.fromDioError(e));
     }
     return left(ServerFailure(e.toString()));
   }

 }

 @override
 Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category,int pageNumber=0}) async{

   List<BookEntity> books;
   try {
     books=  homeLocalDataSource.fetchSimilarBooks(category: category,pageNumber: pageNumber);
     if(books.isNotEmpty){
       return right(books);
     }else{
       books=await homeRemoteDataSource.fetchSimilarBooks(category: category,pageNumber: pageNumber);
       return right(books);
     }
   } catch (e) {
     if (e is DioException) {
       return left(ServerFailure.fromDioError(e));
     }
     return left(ServerFailure(e.toString()));
   }

 }



}