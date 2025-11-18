import 'package:dartz/dartz.dart';
import 'package:flutter_basic/src/core/failure.dart';
import 'package:flutter_basic/src/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> register(String email, String password);
  Future<Either<Failure, void>> logout();
}
