import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>> searchBooks({required String category});

}