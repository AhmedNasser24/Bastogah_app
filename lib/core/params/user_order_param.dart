class UserOrderParam {
  // int status;
  String client;
  int skip;

  UserOrderParam({this.client = '', this.skip = 0});
  Map<String, dynamic> toQueryParameters() {
    return {"client": client, "skip": skip};
  }
}
