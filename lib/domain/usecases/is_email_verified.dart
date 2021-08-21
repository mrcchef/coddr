import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class IsSignedIn {
  PlatformRepositoryImpl platformRepositoryImpl;

  IsSignedIn({@required this.platformRepositoryImpl});

  bool call() {
    return platformRepositoryImpl.isEmailVerified();
  }
}
