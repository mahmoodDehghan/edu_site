import 'dart:io';

import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:serverpod/serverpod.dart';

///With this Service you can get running server version.

class VersionEndpoint extends Endpoint {
  Future<String> getVersion(Session session) async {
    final pubspecYaml = File('pubspec.yaml').readAsStringSync().toPubspecYaml();
    return pubspecYaml.version.valueOr(() => "NotSpecified!");
  }
}
