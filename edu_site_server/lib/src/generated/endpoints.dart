/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/version_endpoint.dart' as _i2;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'version': _i2.VersionEndpoint()
        ..initialize(
          server,
          'version',
          null,
        )
    };
    connectors['version'] = _i1.EndpointConnector(
      name: 'version',
      endpoint: endpoints['version']!,
      methodConnectors: {
        'getVersion': _i1.MethodConnector(
          name: 'getVersion',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['version'] as _i2.VersionEndpoint).getVersion(session),
        )
      },
    );
  }
}
