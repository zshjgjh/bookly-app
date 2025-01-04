import 'package:basketball_counter_app/features/search/domain/search_repos/search-repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/utilis/api_service.dart';
import '../../../home/data/models/book_model/book_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({required String category}) async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?filtering=free-ebooks&sorting=newest&q=subject:$category');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
