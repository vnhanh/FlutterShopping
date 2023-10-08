import 'dart:async';

enum AuthenticationStatus { unkown, unauthenticated, authenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String phoneNumber,
    required String passWord
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
        () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void dispose() => _controller.close();
}
