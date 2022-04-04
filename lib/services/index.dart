import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  final String url = 'http://10.254.17.139:5000/';
  final _headers = {
    'Content-Type': 'application/json',
  };

  post(String path, dynamic data) =>
      http.post(Uri.http(url, path), headers: _headers, body: jsonEncode(data));

  getAccounts() async {
    var response = await http.get(Uri.parse(url + 'api/bank/accounts/balances'),
        headers: _headers);
    return jsonDecode(response.body);
  }

  getTransactions() async {
    var response = await http.get(
        Uri.parse(url + 'api/bank/accounts/transactions'),
        headers: _headers);
    return jsonDecode(response.body);
  }

  delete(String path, String id) {
    return http.delete(Uri.http(url, '$path/$id'), headers: _headers);
  }

  update(String path, dynamic data) {
    return http.put(Uri.http(url, path),
        headers: _headers, body: jsonEncode(data));
  }
}
