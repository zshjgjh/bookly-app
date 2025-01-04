import 'package:basketball_counter_app/features/home/data/models/book_model/book_model.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class HomeRepo{
Future<Either<Failure,List<BookEntity>>> fetchNewestBooks({int pageNumber=0});
Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0});
Future<Either<Failure,List<BookEntity>>> fetchSimilarBooks({required String category,int pageNumber=0});

}