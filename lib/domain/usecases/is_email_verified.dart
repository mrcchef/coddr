import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:flutter/cupertino.dart';

class IsEmailVerified {
  PlatformRepository platformRepository;

  IsEmailVerified({@required this.platformRepository});

  Future<bool> call() {
    return platformRepository.isEmailVerified();
  }
}
