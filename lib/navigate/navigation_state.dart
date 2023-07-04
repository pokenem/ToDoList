class NavigationState
{
  final bool? _unknown;

  int? selectedItemIndex;
  bool? isNew;

  bool get isAddPage => selectedItemIndex != null;

  bool get isRoot => !isUnknown && !isAddPage;

  bool get isUnknown => _unknown == true;

  NavigationState.root()
      : _unknown = false,
        selectedItemIndex = null;

  NavigationState.item(this.selectedItemIndex, this.isNew)
      : _unknown = false;

  NavigationState.unknown()
      : _unknown = true,
        selectedItemIndex = null;
}