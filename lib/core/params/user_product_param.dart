class UserProductParam {
  String searchText;
  String category;
  final String merchantId;
  int skip;

  UserProductParam({
    this.searchText = "",
    this.category = "",
    required this.merchantId,
    this.skip = 0,
  });
  Map<String, dynamic> toQueryParameters() {
    return {
      if (searchText.isNotEmpty) "searchText": searchText,
      if (category.isNotEmpty) "category": category,
      "merchant": merchantId,
      "skip": skip,
    };
  }
}
