part of 'edit_menu_bloc.dart';

sealed class EditMenuState extends Equatable {
  const EditMenuState();
  
  @override
  List<Object> get props => [];
}

final class EditMenuInitial extends EditMenuState {}
