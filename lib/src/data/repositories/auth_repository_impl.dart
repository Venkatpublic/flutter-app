import 'package:dartz/dartz.dart';
import 'package:flutter_basic/src/core/failure.dart';
import 'package:flutter_basic/src/domain/entities/user_entity.dart';
import 'package:flutter_basic/src/domain/repositories/auth_repository.dart';
import 'package:flutter_basic/src/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_basic/src/data/models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final UserModel userModel = await remoteDataSource.login(email, password);
      return Right(userModel);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(
    String email,
    String password,
  ) async {
    try {
      final UserModel userModel = await remoteDataSource.register(
        email,
        password,
      );
      return Right(userModel);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }
}
