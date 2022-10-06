import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'publisher_state.dart';

class PublisherCubit extends Cubit<PublisherState> {
  PublisherCubit() : super(PublisherInitial());
}
