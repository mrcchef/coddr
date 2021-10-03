import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class IsEmailVerified {
  PlatformRepositoryImpl platformRepositoryImpl;

  IsEmailVerified({@required this.platformRepositoryImpl});

  Future<bool> call() {
    return platformRepositoryImpl.isEmailVerified();
  }
}
