class UserMerchantParam {
  String searchText;
  final String category;
  String subCategory;
  final int skip;

  UserMerchantParam({
    this.searchText = "",
    required this.category,
    this.subCategory = "",
    required this.skip,
  });
  Map<String, dynamic> toQueryParameters() {
    return {
      "searchText": searchText,
      "category": category,
      "subCategory": subCategory,
      "skip": skip,
    };
  }
}
