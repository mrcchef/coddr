part of 'contest_listing_bloc.dart';

abstract class ContestListingEvent extends Equatable {
  const ContestListingEvent();

  @override
  List<Object> get props => [];
}

class PlatformSelectedEvent extends ContestListingEvent {}
