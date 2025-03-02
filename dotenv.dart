import 'dart:io';

void main() async {
  final env = Dotenv('.env');
  await env.load();

  final database = env.getValue('DATABASE_URL');
  print(database == "http://DATABASE");

  final isadm = env.getValue('IS_ADMIN');
  print(isadm == 'true');

  final refresh = env.getValue('REFRESH_TIME');
  print(refresh == '123454');
}

class Dotenv {
  final String _path;
  final Map<String, dynamic> _env = {};

  Dotenv(this._path) {}

  Future<void> load() async {
    final file = File(_path);

    if (await file.exists()) {
      String contents = await file.readAsString();

      List<String> lines = contents.split('\n');

      for (var line in lines) {
        line = line.trim();
        if (line.isEmpty || line.startsWith('#')) continue;

        int commentIndex = line.indexOf('#');
        if (commentIndex != -1) {
          line = line.substring(0, commentIndex).trim();
        }

        List<String> parts = line.split('=');
        if (parts.length >= 2) {
          String key = parts[0].trim();
          String value = parts[1].trim();

          if (value.startsWith('"') && value.endsWith('"')) {
            value = value.substring(1, value.length - 1);
          }

          _env[key] = value;
        }
      }

      print("arquivo Env encontrado");
    } else {
      print("arquivo Env não encontrado");
    }
  }

  dynamic getValue(String Key) {
    return _env[Key];
  }
}
