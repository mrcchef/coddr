import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:flutter/cupertino.dart';

class GetEmailId {
  PlatformRepository platformRepository;

  GetEmailId({@required this.platformRepository});

  String call() {
    return platformRepository.getEmailId();
  }
}
