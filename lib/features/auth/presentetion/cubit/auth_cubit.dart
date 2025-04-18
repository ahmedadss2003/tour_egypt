import 'package:bloc/bloc.dart';
import 'package:login/features/auth/domain/entity/user_entity.dart';
import 'package:login/features/auth/domain/repos/auth_repo.dart';
import 'package:login/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  Future<void> register({required String email, required String password, required String name}) async {
    emit(AuthLoading());
    final Either<Failure, UserEntity> result = await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final Either<Failure, UserEntity> result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
