import 'package:bloc/bloc.dart';
import 'package:coddr/domain/entities/no_params.dart';
import 'package:coddr/domain/entities/user_model.dart';
import 'package:coddr/domain/usecases/fetch_user_detail.dart';
import 'package:coddr/domain/usecases/store_user_model.dart';
import 'package:coddr/domain/usecases/update_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchUserDetail fetchUserDetail;
  final UpdateUserModel updateUserModel;
  final StoreUserModel storeUserModel;
  ProfileBloc({
    @required this.fetchUserDetail,
    @required this.updateUserModel,
    @required this.storeUserModel,
  }) : super(ProfileLoding()) {
    on<FetchProfileData>((event, emit) async {
      emit(ProfileLoding());

      final eitherResponse = await fetchUserDetail(NoParams());

      emit(eitherResponse
          .fold((error) => ProfileError(message: "User detail fetching failed"),
              (userModel) {
        return ProfileLoaded(userModel: userModel);
      }));
    });

    on<UpdateProfileData>(
      (event, emit) async {
        emit(ProfileLoding());

        final eitherResponse = await updateUserModel(event.userModel);
        // emit(ProfileUpdated());
        emit(
          eitherResponse.fold(
            (error) => ProfileError(message: "Profile update failed"),
            (r) => ProfileUpdated(),
          ),
        );
      },
    );

    on<StoreProfileData>(
      (event, emit) async {
        emit(ProfileLoding());

        final eitherResponse = await storeUserModel(event.userModel);

        emit(
          eitherResponse.fold(
            (error) => ProfileError(message: "Profile update failed"),
            (r) => ProfileUpdated(),
          ),
        );
      },
    );
  }
}
