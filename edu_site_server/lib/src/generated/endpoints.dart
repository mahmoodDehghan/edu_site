/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/photos_endpoint.dart' as _i2;
import '../endpoints/version_endpoint.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'photos': _i2.PhotosEndpoint()
        ..initialize(
          server,
          'photos',
          null,
        ),
      'version': _i3.VersionEndpoint()
        ..initialize(
          server,
          'version',
          null,
        ),
    };
    connectors['photos'] = _i1.EndpointConnector(
      name: 'photos',
      endpoint: endpoints['photos']!,
      methodConnectors: {
        'getPhotosUploadDescription': _i1.MethodConnector(
          name: 'getPhotosUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['photos'] as _i2.PhotosEndpoint)
                  .getPhotosUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyPhotoUploaded': _i1.MethodConnector(
          name: 'verifyPhotoUploaded',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['photos'] as _i2.PhotosEndpoint).verifyPhotoUploaded(
            session,
            params['path'],
          ),
        ),
        'isPublicPhotoExist': _i1.MethodConnector(
          name: 'isPublicPhotoExist',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['photos'] as _i2.PhotosEndpoint).isPublicPhotoExist(
            session,
            params['path'],
          ),
        ),
        'getPublicPhotoFile': _i1.MethodConnector(
          name: 'getPublicPhotoFile',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['photos'] as _i2.PhotosEndpoint).getPublicPhotoFile(
            session,
            params['path'],
          ),
        ),
        'getPublicPhotoUrl': _i1.MethodConnector(
          name: 'getPublicPhotoUrl',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['photos'] as _i2.PhotosEndpoint).getPublicPhotoUrl(
            session,
            params['path'],
          ),
        ),
      },
    );
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
              (endpoints['version'] as _i3.VersionEndpoint).getVersion(session),
        )
      },
    );
  }
}
