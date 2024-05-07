import 'package:auto_mates/splashscreen/controllers/functions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(context) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      checkIfUserLogedin(context);
    });
  }
}
