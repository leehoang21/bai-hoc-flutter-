import 'package:equatable/equatable.dart';
import 'package:numbertrivia/core/dartz/dartz.dart';
import 'package:numbertrivia/core/failure/failure.dart';
import 'package:numbertrivia/core/usecase/usecase.dart';
import 'package:numbertrivia/features/numbertrivia/domain/entities/numbertrivia.dart';
import 'package:numbertrivia/features/numbertrivia/domain/repositories/numbertrivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object> get props => [number];
}
