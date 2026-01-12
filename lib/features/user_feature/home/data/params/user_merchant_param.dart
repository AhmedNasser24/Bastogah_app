class UserMerchantParam {
  String searchText;
  final String categoryId;
  int skip;

  UserMerchantParam({
    this.searchText = "",
    required this.categoryId,
    this.skip = 0,
  });
  Map<String, dynamic> toQueryParameters() {
    return {
      if (searchText.isNotEmpty) "searchText": searchText,
      "category": categoryId,
      "skip": skip,
    };
  }
}
