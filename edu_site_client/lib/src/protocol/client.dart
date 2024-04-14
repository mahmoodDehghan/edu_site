/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'dart:typed_data' as _i3;
import 'protocol.dart' as _i4;

///Handles Uploading public photos and downloading them
/// {@category Endpoint}
class EndpointPhotos extends _i1.EndpointRef {
  EndpointPhotos(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'photos';

  _i2.Future<String?> getPhotosUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'photos',
        'getPhotosUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyPhotoUploaded(String path) =>
      caller.callServerEndpoint<bool>(
        'photos',
        'verifyPhotoUploaded',
        {'path': path},
      );

  _i2.Future<bool> isPublicPhotoExist(String path) =>
      caller.callServerEndpoint<bool>(
        'photos',
        'isPublicPhotoExist',
        {'path': path},
      );

  _i2.Future<_i3.ByteData?> getPublicPhotoFile(String path) =>
      caller.callServerEndpoint<_i3.ByteData?>(
        'photos',
        'getPublicPhotoFile',
        {'path': path},
      );

  _i2.Future<String> getPublicPhotoUrl(String path) =>
      caller.callServerEndpoint<String>(
        'photos',
        'getPublicPhotoUrl',
        {'path': path},
      );
}

///With this Service you can get running server version.
/// {@category Endpoint}
class EndpointVersion extends _i1.EndpointRef {
  EndpointVersion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'version';

  _i2.Future<String> getVersion() => caller.callServerEndpoint<String>(
        'version',
        'getVersion',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    photos = EndpointPhotos(this);
    version = EndpointVersion(this);
  }

  late final EndpointPhotos photos;

  late final EndpointVersion version;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'photos': photos,
        'version': version,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
