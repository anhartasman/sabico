import 'package:bloc/bloc.dart';
import './bloc.dart';

class SplashCheckBloc extends Bloc<SplashCheckBlocEvent, SplashCheckBlocState> {
  SplashCheckBloc() : super(SplashCheckOnIdle()) {
    on<SplashCheckBlocEvent>((event, emit) async {
      if (event is SplashCheckBlocSuccessPermission) {
        emit(SplashCheckOnAuth());
      } else if (event is SplashCheckBlocSuccessAuth) {
        emit(SplashCheckOnSuccess());
      }
    });
  }
}
