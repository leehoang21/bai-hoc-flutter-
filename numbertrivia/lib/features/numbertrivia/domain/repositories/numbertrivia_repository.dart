import '/core/dartz/dartz.dart';
import '/core/failure/failure.dart';
import '/features/numbertrivia/domain/entities/numbertrivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
