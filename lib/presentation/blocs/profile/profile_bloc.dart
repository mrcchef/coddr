import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/fetch_user_detail.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchUserDetail fetchUserDetail;
  ProfileBloc({this.fetchUserDetail}) : super(ProfileLoding());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    yield ProfileLoding();

    if (event is FetchProfileData) {
      final eitherResponse = await fetchUserDetail(NoParams());

      yield eitherResponse
          .fold((error) => ProfileError(message: "User detail fetching failed"),
              (userModel) {
        print("userModel: $userModel");
        return ProfileLoaded(userModel: userModel);
      });
    }
  }
}
