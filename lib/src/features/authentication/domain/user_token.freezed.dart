// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserToken {
  String get token => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTokenCopyWith<UserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTokenCopyWith<$Res> {
  factory $UserTokenCopyWith(UserToken value, $Res Function(UserToken) then) =
      _$UserTokenCopyWithImpl<$Res, UserToken>;
  @useResult
  $Res call({String token, String tokenType});
}

/// @nodoc
class _$UserTokenCopyWithImpl<$Res, $Val extends UserToken>
    implements $UserTokenCopyWith<$Res> {
  _$UserTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTokenImplCopyWith<$Res>
    implements $UserTokenCopyWith<$Res> {
  factory _$$UserTokenImplCopyWith(
          _$UserTokenImpl value, $Res Function(_$UserTokenImpl) then) =
      __$$UserTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String tokenType});
}

/// @nodoc
class __$$UserTokenImplCopyWithImpl<$Res>
    extends _$UserTokenCopyWithImpl<$Res, _$UserTokenImpl>
    implements _$$UserTokenImplCopyWith<$Res> {
  __$$UserTokenImplCopyWithImpl(
      _$UserTokenImpl _value, $Res Function(_$UserTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? tokenType = null,
  }) {
    return _then(_$UserTokenImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserTokenImpl implements _UserToken {
  const _$UserTokenImpl({required this.token, required this.tokenType});

  @override
  final String token;
  @override
  final String tokenType;

  @override
  String toString() {
    return 'UserToken(token: $token, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType);

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTokenImplCopyWith<_$UserTokenImpl> get copyWith =>
      __$$UserTokenImplCopyWithImpl<_$UserTokenImpl>(this, _$identity);
}

abstract class _UserToken implements UserToken {
  const factory _UserToken(
      {required final String token,
      required final String tokenType}) = _$UserTokenImpl;

  @override
  String get token;
  @override
  String get tokenType;

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTokenImplCopyWith<_$UserTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
