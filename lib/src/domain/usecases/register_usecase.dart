import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_basic/src/core/failure.dart';
import 'package:flutter_basic/src/core/usecase.dart';
import 'package:flutter_basic/src/domain/entities/user_entity.dart';
import 'package:flutter_basic/src/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<UserEntity, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    return await repository.register(params.email, params.password);
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;

  const RegisterParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
