import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/update_is_Handle_Verified_argument.dart';
import 'package:coddr/domain/entities/user_entity.dart';
import 'package:coddr/domain/usecases/get_cf_user.dart';
import 'package:coddr/domain/usecases/update_is_Handle_verified.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'handel_verification_event.dart';
part 'handel_verification_state.dart';

class HandelVerificationBloc
    extends Bloc<HandelVerificationEvent, HandelVerificationState> {
  GetCFUser getCFUser;
  UpdateIsHandleVerified updateIsHandleVerified;

  HandelVerificationBloc(
      {@required this.getCFUser, @required this.updateIsHandleVerified})
      : super(HandelVerificationInitial()) {
    on<VerifyCFHandelEvent>((event, emit) async {
      emit(HandelVerificationLoading());
      if (event.handel.isEmpty) emit(HandelVerificationCFHandelEmpty());
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
        emit(HandelVerificationFailed());
      else {
        print(userEntity.email);
        print(event.email);
        if (userEntity.email == null)
          emit(HandelVerificationCFEmailPrivate());
        else if (userEntity.email == event.email) {
          // can check the response and add one more checking of updating verification in firebase
          await updateIsHandleVerified(UpdateIsHandleCFVerifiedArgument(
              uid: event.uid, platformId: event.platformId));
          emit(HandelVerificationCompleted());
        } else
          emit(HandelVerificationFailed());
      }
    });
  }
}
