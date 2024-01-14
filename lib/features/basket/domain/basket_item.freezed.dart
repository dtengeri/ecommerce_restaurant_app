// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasketItem _$BasketItemFromJson(Map<String, dynamic> json) {
  return _BasketItem.fromJson(json);
}

/// @nodoc
mixin _$BasketItem {
  String get id => throw _privateConstructorUsedError;
  String get foodItemId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasketItemCopyWith<BasketItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketItemCopyWith<$Res> {
  factory $BasketItemCopyWith(
          BasketItem value, $Res Function(BasketItem) then) =
      _$BasketItemCopyWithImpl<$Res, BasketItem>;
  @useResult
  $Res call({String id, String foodItemId, int amount});
}

/// @nodoc
class _$BasketItemCopyWithImpl<$Res, $Val extends BasketItem>
    implements $BasketItemCopyWith<$Res> {
  _$BasketItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? foodItemId = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      foodItemId: null == foodItemId
          ? _value.foodItemId
          : foodItemId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketItemImplCopyWith<$Res>
    implements $BasketItemCopyWith<$Res> {
  factory _$$BasketItemImplCopyWith(
          _$BasketItemImpl value, $Res Function(_$BasketItemImpl) then) =
      __$$BasketItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String foodItemId, int amount});
}

/// @nodoc
class __$$BasketItemImplCopyWithImpl<$Res>
    extends _$BasketItemCopyWithImpl<$Res, _$BasketItemImpl>
    implements _$$BasketItemImplCopyWith<$Res> {
  __$$BasketItemImplCopyWithImpl(
      _$BasketItemImpl _value, $Res Function(_$BasketItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? foodItemId = null,
    Object? amount = null,
  }) {
    return _then(_$BasketItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      foodItemId: null == foodItemId
          ? _value.foodItemId
          : foodItemId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasketItemImpl implements _BasketItem {
  const _$BasketItemImpl(
      {required this.id, required this.foodItemId, required this.amount});

  factory _$BasketItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasketItemImplFromJson(json);

  @override
  final String id;
  @override
  final String foodItemId;
  @override
  final int amount;

  @override
  String toString() {
    return 'BasketItem(id: $id, foodItemId: $foodItemId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.foodItemId, foodItemId) ||
                other.foodItemId == foodItemId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, foodItemId, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketItemImplCopyWith<_$BasketItemImpl> get copyWith =>
      __$$BasketItemImplCopyWithImpl<_$BasketItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasketItemImplToJson(
      this,
    );
  }
}

abstract class _BasketItem implements BasketItem {
  const factory _BasketItem(
      {required final String id,
      required final String foodItemId,
      required final int amount}) = _$BasketItemImpl;

  factory _BasketItem.fromJson(Map<String, dynamic> json) =
      _$BasketItemImpl.fromJson;

  @override
  String get id;
  @override
  String get foodItemId;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$BasketItemImplCopyWith<_$BasketItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
