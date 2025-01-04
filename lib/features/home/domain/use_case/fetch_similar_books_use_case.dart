import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>,String>{
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? category,int pageNumber=0]) async{

      return await homeRepo.fetchSimilarBooks(category:category!,pageNumber:pageNumber );
    }
  }


