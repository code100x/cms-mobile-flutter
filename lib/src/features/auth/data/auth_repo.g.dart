// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioRepoHash() => r'a848a8d3f5d447fbe0a7598a658de88f68bfed37';

/// See also [dioRepo].
@ProviderFor(dioRepo)
final dioRepoProvider = Provider<Dio>.internal(
  dioRepo,
  name: r'dioRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRepoRef = ProviderRef<Dio>;
String _$ssRepoHash() => r'2da8e66b7461b4a8127ca47182f551e0e8e3b2bf';

/// See also [ssRepo].
@ProviderFor(ssRepo)
final ssRepoProvider = Provider<FlutterSecureStorage>.internal(
  ssRepo,
  name: r'ssRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ssRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SsRepoRef = ProviderRef<FlutterSecureStorage>;
String _$authRepoHash() => r'f5cbd20bbd155c02627d93fe5c9542779ea3266b';

/// See also [authRepo].
@ProviderFor(authRepo)
final authRepoProvider = Provider<AuthRepo>.internal(
  authRepo,
  name: r'authRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepoRef = ProviderRef<AuthRepo>;
String _$authStateChangesHash() => r'7ea2118d3d5c2687ee53cdade7d9350a58ab164e';

/// See also [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = StreamProvider<AppUser?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangesRef = StreamProviderRef<AppUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
