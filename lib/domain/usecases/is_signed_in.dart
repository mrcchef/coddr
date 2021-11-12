import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:flutter/cupertino.dart';

class IsSignedIn {
  PlatformRepository platformRepository;

  IsSignedIn({@required this.platformRepository});

  bool call() {
    return platformRepository.isSignedIn();
  }
}
