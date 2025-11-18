import 'package:dartz/dartz.dart';
import 'package:flutter_basic/src/core/failure.dart';
import 'package:flutter_basic/src/domain/entities/item_entity.dart';

abstract class ItemRepository {
  Future<Either<Failure, List<ItemEntity>>> getItems();
}
