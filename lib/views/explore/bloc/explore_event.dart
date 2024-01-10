part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

final class MenuListSubscriptionRequested extends ExploreEvent {
  const MenuListSubscriptionRequested();
}

final class MenuListChanged extends ExploreEvent {
  const MenuListChanged({
    required this.menuList,
  });

  final List<Menu> menuList;

  @override
  List<Object> get props => [
        ...menuList.map((e) => e.name),
        ...menuList.map((e) => e.image),
        ...menuList.map((e) => e.category),
      ];
}
