class UserProductParam {
  String searchText;
  final String category;
  final String merchantId;
  final int skip;

  UserProductParam({
    this.searchText = "",
    required this.category,
    required this.merchantId,
    required this.skip,
  });
  Map<String, dynamic> toQueryParameters() {
    return {
      "searchText": searchText,
      "category": category,
      "merchant": merchantId,
      "skip": skip,
    };
  }
}
