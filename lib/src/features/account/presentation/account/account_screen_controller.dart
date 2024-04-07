import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vokki/src/features/account/data/auth_repository.dart';
import 'package:vokki/src/features/account/domain/app_user.dart';

part 'account_screen_controller.g.dart';

@riverpod
class AccountScreenController extends _$AccountScreenController {
  @override
  FutureOr<void> build() async {
    //nothing to do here
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue<void>.loading();
    state = await AsyncValue.guard(() async {
      await authRepository.signOut();
    });
  }

  Future<bool> sendEmailVerification(AppUser user) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => user.sendEmailVerification());
    return state.hasError == false;
  }
}
