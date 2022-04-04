import 'package:http/http.dart' as http;

class Services {
  var url = Uri.parse('https://example.com/whatsit/create');

  Future<dynamic> get() async {
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }
}
