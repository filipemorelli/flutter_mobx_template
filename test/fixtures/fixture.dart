import 'dart:convert';
import 'dart:io';

dynamic fixture(String filename) =>
    jsonDecode(File('./test/fixtures/$filename').readAsStringSync());
