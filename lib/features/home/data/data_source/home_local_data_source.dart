import 'package:basketball_counter_app/constant.dart';
import 'package:hive/hive.dart';

import '../../../../core/utilis/api_service.dart';
import '../../domain/entity/book_entity.dart';


abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0});
  List<BookEntity> fetchNewestBooks({int pageNumber=0});
  List<BookEntity> fetchSimilarBooks({required String category,int pageNumber=0});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {

  HomeLocalDataSourceImpl();

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length=box.values.length;
    if(startIndex>=length || endIndex > length){
      print('length');
      return box.values.toList();// if items less than 10 fetch all items
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }// fetch data from hive using pagination every 10 items together

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length=box.values.length;
    if(startIndex>=length || endIndex > length){
      return box.values.toList();
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category,int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
    var box = Hive.box<BookEntity>(kSimilarBox);
    int length=box.values.length;
    if(startIndex>=length || endIndex > length){
      return box.values.toList();

    }
    return box.values.toList().sublist(startIndex,endIndex);
  }
}//  fetch data from API in hive