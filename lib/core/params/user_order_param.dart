class UserOrderParam {
  int status;
  String client;
  int skip;

  UserOrderParam({this.status = 0, this.client = '', this.skip = 0});
  Map<String, dynamic> toQueryParameters() {
    return {"status": status, "client": client, "skip": skip};
  }
}
