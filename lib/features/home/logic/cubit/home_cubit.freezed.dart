// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reelsLoading,
    required TResult Function(
            List<ReelModel> reels, List<VideoPlayerController> videoControllers)
        reelsSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reelsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reelsLoading,
    TResult? Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reelsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reelsLoading,
    TResult Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reelsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ReelsLoading value) reelsLoading,
    required TResult Function(ReelsSuccess value) reelsSuccess,
    required TResult Function(ReelsFailure value) reelsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ReelsLoading value)? reelsLoading,
    TResult? Function(ReelsSuccess value)? reelsSuccess,
    TResult? Function(ReelsFailure value)? reelsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ReelsLoading value)? reelsLoading,
    TResult Function(ReelsSuccess value)? reelsSuccess,
    TResult Function(ReelsFailure value)? reelsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reelsLoading,
    required TResult Function(
            List<ReelModel> reels, List<VideoPlayerController> videoControllers)
        reelsSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reelsFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reelsLoading,
    TResult? Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reelsFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reelsLoading,
    TResult Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reelsFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ReelsLoading value) reelsLoading,
    required TResult Function(ReelsSuccess value) reelsSuccess,
    required TResult Function(ReelsFailure value) reelsFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ReelsLoading value)? reelsLoading,
    TResult? Function(ReelsSuccess value)? reelsSuccess,
    TResult? Function(ReelsFailure value)? reelsFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ReelsLoading value)? reelsLoading,
    TResult Function(ReelsSuccess value)? reelsSuccess,
    TResult Function(ReelsFailure value)? reelsFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ReelsLoadingImplCopyWith<$Res> {
  factory _$$ReelsLoadingImplCopyWith(
          _$ReelsLoadingImpl value, $Res Function(_$ReelsLoadingImpl) then) =
      __$$ReelsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReelsLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ReelsLoadingImpl>
    implements _$$ReelsLoadingImplCopyWith<$Res> {
  __$$ReelsLoadingImplCopyWithImpl(
      _$ReelsLoadingImpl _value, $Res Function(_$ReelsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReelsLoadingImpl implements ReelsLoading {
  const _$ReelsLoadingImpl();

  @override
  String toString() {
    return 'HomeState.reelsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReelsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reelsLoading,
    required TResult Function(
            List<ReelModel> reels, List<VideoPlayerController> videoControllers)
        reelsSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reelsFailure,
  }) {
    return reelsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reelsLoading,
    TResult? Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reelsFailure,
  }) {
    return reelsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reelsLoading,
    TResult Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reelsFailure,
    required TResult orElse(),
  }) {
    if (reelsLoading != null) {
      return reelsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ReelsLoading value) reelsLoading,
    required TResult Function(ReelsSuccess value) reelsSuccess,
    required TResult Function(ReelsFailure value) reelsFailure,
  }) {
    return reelsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ReelsLoading value)? reelsLoading,
    TResult? Function(ReelsSuccess value)? reelsSuccess,
    TResult? Function(ReelsFailure value)? reelsFailure,
  }) {
    return reelsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ReelsLoading value)? reelsLoading,
    TResult Function(ReelsSuccess value)? reelsSuccess,
    TResult Function(ReelsFailure value)? reelsFailure,
    required TResult orElse(),
  }) {
    if (reelsLoading != null) {
      return reelsLoading(this);
    }
    return orElse();
  }
}

abstract class ReelsLoading implements HomeState {
  const factory ReelsLoading() = _$ReelsLoadingImpl;
}

/// @nodoc
abstract class _$$ReelsSuccessImplCopyWith<$Res> {
  factory _$$ReelsSuccessImplCopyWith(
          _$ReelsSuccessImpl value, $Res Function(_$ReelsSuccessImpl) then) =
      __$$ReelsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ReelModel> reels, List<VideoPlayerController> videoControllers});
}

/// @nodoc
class __$$ReelsSuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ReelsSuccessImpl>
    implements _$$ReelsSuccessImplCopyWith<$Res> {
  __$$ReelsSuccessImplCopyWithImpl(
      _$ReelsSuccessImpl _value, $Res Function(_$ReelsSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reels = null,
    Object? videoControllers = null,
  }) {
    return _then(_$ReelsSuccessImpl(
      null == reels
          ? _value._reels
          : reels // ignore: cast_nullable_to_non_nullable
              as List<ReelModel>,
      null == videoControllers
          ? _value._videoControllers
          : videoControllers // ignore: cast_nullable_to_non_nullable
              as List<VideoPlayerController>,
    ));
  }
}

/// @nodoc

class _$ReelsSuccessImpl implements ReelsSuccess {
  const _$ReelsSuccessImpl(final List<ReelModel> reels,
      final List<VideoPlayerController> videoControllers)
      : _reels = reels,
        _videoControllers = videoControllers;

  final List<ReelModel> _reels;
  @override
  List<ReelModel> get reels {
    if (_reels is EqualUnmodifiableListView) return _reels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reels);
  }

  final List<VideoPlayerController> _videoControllers;
  @override
  List<VideoPlayerController> get videoControllers {
    if (_videoControllers is EqualUnmodifiableListView)
      return _videoControllers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoControllers);
  }

  @override
  String toString() {
    return 'HomeState.reelsSuccess(reels: $reels, videoControllers: $videoControllers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReelsSuccessImpl &&
            const DeepCollectionEquality().equals(other._reels, _reels) &&
            const DeepCollectionEquality()
                .equals(other._videoControllers, _videoControllers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reels),
      const DeepCollectionEquality().hash(_videoControllers));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReelsSuccessImplCopyWith<_$ReelsSuccessImpl> get copyWith =>
      __$$ReelsSuccessImplCopyWithImpl<_$ReelsSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reelsLoading,
    required TResult Function(
            List<ReelModel> reels, List<VideoPlayerController> videoControllers)
        reelsSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reelsFailure,
  }) {
    return reelsSuccess(reels, videoControllers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reelsLoading,
    TResult? Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reelsFailure,
  }) {
    return reelsSuccess?.call(reels, videoControllers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reelsLoading,
    TResult Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reelsFailure,
    required TResult orElse(),
  }) {
    if (reelsSuccess != null) {
      return reelsSuccess(reels, videoControllers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ReelsLoading value) reelsLoading,
    required TResult Function(ReelsSuccess value) reelsSuccess,
    required TResult Function(ReelsFailure value) reelsFailure,
  }) {
    return reelsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ReelsLoading value)? reelsLoading,
    TResult? Function(ReelsSuccess value)? reelsSuccess,
    TResult? Function(ReelsFailure value)? reelsFailure,
  }) {
    return reelsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ReelsLoading value)? reelsLoading,
    TResult Function(ReelsSuccess value)? reelsSuccess,
    TResult Function(ReelsFailure value)? reelsFailure,
    required TResult orElse(),
  }) {
    if (reelsSuccess != null) {
      return reelsSuccess(this);
    }
    return orElse();
  }
}

abstract class ReelsSuccess implements HomeState {
  const factory ReelsSuccess(final List<ReelModel> reels,
      final List<VideoPlayerController> videoControllers) = _$ReelsSuccessImpl;

  List<ReelModel> get reels;
  List<VideoPlayerController> get videoControllers;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReelsSuccessImplCopyWith<_$ReelsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReelsFailureImplCopyWith<$Res> {
  factory _$$ReelsFailureImplCopyWith(
          _$ReelsFailureImpl value, $Res Function(_$ReelsFailureImpl) then) =
      __$$ReelsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$ReelsFailureImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ReelsFailureImpl>
    implements _$$ReelsFailureImplCopyWith<$Res> {
  __$$ReelsFailureImplCopyWithImpl(
      _$ReelsFailureImpl _value, $Res Function(_$ReelsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$ReelsFailureImpl(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ReelsFailureImpl implements ReelsFailure {
  const _$ReelsFailureImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'HomeState.reelsFailure(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReelsFailureImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReelsFailureImplCopyWith<_$ReelsFailureImpl> get copyWith =>
      __$$ReelsFailureImplCopyWithImpl<_$ReelsFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() reelsLoading,
    required TResult Function(
            List<ReelModel> reels, List<VideoPlayerController> videoControllers)
        reelsSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) reelsFailure,
  }) {
    return reelsFailure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? reelsLoading,
    TResult? Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? reelsFailure,
  }) {
    return reelsFailure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? reelsLoading,
    TResult Function(List<ReelModel> reels,
            List<VideoPlayerController> videoControllers)?
        reelsSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? reelsFailure,
    required TResult orElse(),
  }) {
    if (reelsFailure != null) {
      return reelsFailure(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ReelsLoading value) reelsLoading,
    required TResult Function(ReelsSuccess value) reelsSuccess,
    required TResult Function(ReelsFailure value) reelsFailure,
  }) {
    return reelsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ReelsLoading value)? reelsLoading,
    TResult? Function(ReelsSuccess value)? reelsSuccess,
    TResult? Function(ReelsFailure value)? reelsFailure,
  }) {
    return reelsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ReelsLoading value)? reelsLoading,
    TResult Function(ReelsSuccess value)? reelsSuccess,
    TResult Function(ReelsFailure value)? reelsFailure,
    required TResult orElse(),
  }) {
    if (reelsFailure != null) {
      return reelsFailure(this);
    }
    return orElse();
  }
}

abstract class ReelsFailure implements HomeState {
  const factory ReelsFailure(final ApiErrorModel apiErrorModel) =
      _$ReelsFailureImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReelsFailureImplCopyWith<_$ReelsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
