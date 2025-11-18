import 'package:dartz/dartz.dart';
import 'package:flutter_basic/src/core/failure.dart';
import 'package:flutter_basic/src/domain/entities/item_entity.dart';
import 'package:flutter_basic/src/domain/repositories/item_repository.dart';
import 'package:flutter_basic/src/data/datasources/item_remote_datasource.dart';
import 'package:flutter_basic/src/data/models/item_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource remoteDataSource;

  ItemRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ItemEntity>>> getItems() async {
    try {
      final List<ItemModel> itemModels = await remoteDataSource.getItems();
      return Right(itemModels);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
