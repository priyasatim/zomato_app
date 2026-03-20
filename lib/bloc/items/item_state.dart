abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<Map<String, String>> items;
  ItemLoaded(this.items);
}

class ItemError extends ItemState {
  final String message;
  ItemError(this.message);
}