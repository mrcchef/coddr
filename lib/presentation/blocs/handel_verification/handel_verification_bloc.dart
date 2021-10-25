import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/user_entity.dart';
import 'package:coddr/domain/usecases/get_cf_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'handel_verification_event.dart';
part 'handel_verification_state.dart';

class HandelVerificationBloc
    extends Bloc<HandelVerificationEvent, HandelVerificationState> {
  GetCFUser getCFUser;

  HandelVerificationBloc({@required this.getCFUser})
      : super(HandelVerificationInitial());

  @override
  Stream<HandelVerificationState> mapEventToState(
      HandelVerificationEvent event) async* {
    if (event is VerifyCFHandelEvent) {
      yield HandelVerificationLoading();
      List<String> handels = [];
      UserEntity userEntity;
      handels.add(event.handel);
      final eitherResponse = await getCFUser(handels);
      bool isSuccessful =
          eitherResponse.fold((error) => false, (userEntityList) {
        if (userEntityList.isEmpty) return false;
        userEntity = userEntityList[0];
        return true;
      });
      if (isSuccessful == false)
        yield HandelVerificationFailed();
      else {
        if (userEntity.email == null) yield HandelVerificationCFEmailPrivate();
        else if (userEntity.email == event.email)
          yield HandelVerificationCompleted();
        else
          yield HandelVerificationFailed();
      }
    }
  }
}
