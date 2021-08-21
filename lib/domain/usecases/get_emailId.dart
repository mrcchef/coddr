import 'package:coddr/data/repositories/platform_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class GetEmailId {
  PlatformRepositoryImpl platformRepositoryImpl;

  GetEmailId({@required this.platformRepositoryImpl});

  String call() {
    return platformRepositoryImpl.getEmailId();
  }
}
