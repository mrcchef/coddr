part of 'contest_listing_bloc.dart';

abstract class ContestListingState extends Equatable {
  const ContestListingState();

  @override
  List<Object> get props => [];
}

class ContestListingInitial extends ContestListingState {}

class ContestListFetchingState extends ContestListingState {}

class ContestListFetchedState extends ContestListingState {
  final List<ContestEntity> contestList;

  ContestListFetchedState({@required this.contestList});

  List<Object> get props => [contestList];
}

class ContestListErrorState extends ContestListingState {
  final AppErrorType appErrorType;

  ContestListErrorState({@required this.appErrorType});

  List<Object> get props => [appErrorType];
}
