part of 'edit_menu_bloc.dart';

enum EditMenuStatus { initial, loading, success, failure }

sealed class EditMenuState extends Equatable {
  const EditMenuState({
    this.status = EditMenuStatus.initial,
  });

  final EditMenuStatus status;

  @override
  List<Object> get props => [];
}

final class EditMenuInitial extends EditMenuState {}
