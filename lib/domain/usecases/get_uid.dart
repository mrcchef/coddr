import 'package:coddr/domain/repositories/platform_repository.dart';
import 'package:flutter/cupertino.dart';

class GetUid  {
  PlatformRepository platformRepository;

  GetUid({@required this.platformRepository});

  String call() {
    return platformRepository.getUid();
  }
}
