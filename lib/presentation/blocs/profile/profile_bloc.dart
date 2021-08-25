import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/data/data_sources/remote_data_source.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RemoteDataSourceImpl remoteDataSourceImpl;
  ProfileBloc({this.remoteDataSourceImpl}) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    yield ProfileLoding();

    if (event is FetchProfileData) {
      UserModel userModel =
          await remoteDataSourceImpl.fetchUserDetails(event.uid);
      yield ProfileLoaded(userModel: userModel);
    }
  }
}
