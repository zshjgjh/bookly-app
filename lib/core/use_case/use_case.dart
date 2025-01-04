import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class UseCase<Type,Param>{         //data type
  Future<Either<Failure,Type>> call([Param param]);
}
class Param{}



