part of 'publisher_cubit.dart';

abstract class PublisherState extends Equatable {
  const PublisherState();
}

class PublisherInitial extends PublisherState {
  @override
  List<Object> get props => [];
}
