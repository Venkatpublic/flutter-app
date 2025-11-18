import 'package:dartz/dartz.dart';
import 'package:flutter_basic/src/core/failure.dart';
import 'package:flutter_basic/src/core/usecase.dart';
import 'package:flutter_basic/src/domain/entities/item_entity.dart';
import 'package:flutter_basic/src/domain/repositories/item_repository.dart';

class FetchItemsUseCase implements UseCase<List<ItemEntity>, NoParams> {
  final ItemRepository repository;

  FetchItemsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ItemEntity>>> call(NoParams params) async {
    return await repository.getItems();
  }
}
