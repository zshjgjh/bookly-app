import 'package:basketball_counter_app/constant.dart';
import 'package:basketball_counter_app/core/utilis/api_service.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:hive/hive.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber=0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category, int pageNumber=0});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{

  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0}) async {
    var data = await apiService.get(
        endpoint: 'volumes?filtering=free-ebooks&sorting=newest&q=subject:programming&startIndex=${pageNumber*10}');
    //fetch every 10 items start with index 0 then 10, then 20
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    var box=Hive.box<BookEntity>(kFeaturedBox);
    box.addAll(books);
    return books;

  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber=0}) async {
    var data = await apiService.get(
        endpoint: 'volumes?filtering=free-ebooks&q=subject:computer science&startIndex=${pageNumber*10}');
    List<BookModel> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }

    var box=Hive.box<BookEntity>(kNewestBox);
    box.addAll(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category,int pageNumber=0}) async{
    var data = await apiService.get(
        endpoint: 'volumes?filtering=free-ebooks&q=subject:$category&startIndex=${pageNumber*10}');
    List<BookModel> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }

    var box=Hive.box<BookEntity>(kSimilarBox);
    box.addAll(books);
    return books;

  }

}//fetch data from API and store them in hive box