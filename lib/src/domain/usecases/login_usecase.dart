import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_basic/src/core/failure.dart';
import 'package:flutter_basic/src/core/usecase.dart';
import 'package:flutter_basic/src/domain/entities/user_entity.dart';
import 'package:flutter_basic/src/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
