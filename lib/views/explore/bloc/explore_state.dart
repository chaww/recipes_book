part of 'explore_bloc.dart';

enum ExploreStatus { initial, loading, success, failure }

class ExploreState extends Equatable {
  const ExploreState({
    this.menuList = const [],
  });

  final List<Menu> menuList;

  ExploreState copyWith({
    List<Menu> Function()? menuList,
  }) {
    return ExploreState(
      menuList: menuList != null ? menuList() : this.menuList,
    );
  }

  @override
  List<Object> get props => [menuList];
}
