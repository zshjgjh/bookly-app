import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/use_case/use_case.dart';
import '../repo/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber=0]) async {
    return await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
  }

}

