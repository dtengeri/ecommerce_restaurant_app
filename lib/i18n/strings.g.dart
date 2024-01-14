/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 28
///
/// Built on 2024-01-14 at 07:47 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get failedToLoad => 'Failed to load';
	String get ok => 'Ok';
	String get cancel => 'Cancel';
	String get remove => 'Remove';
	String get required => 'Required';
	late final _StringsFoodsEn foods = _StringsFoodsEn._(_root);
	late final _StringsFoodDetailsEn foodDetails = _StringsFoodDetailsEn._(_root);
	late final _StringsBasketEn basket = _StringsBasketEn._(_root);
	late final _StringsCheckoutEn checkout = _StringsCheckoutEn._(_root);
}

// Path: foods
class _StringsFoodsEn {
	_StringsFoodsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get menu => 'Menu';
	String get favourites => 'Favourites';
	String get buy => 'Buy';
}

// Path: foodDetails
class _StringsFoodDetailsEn {
	_StringsFoodDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get notFound => 'Food not found';
	String get addFavourite => 'Add to favourites';
	String get removeFavourite => 'Remove from favourites';
}

// Path: basket
class _StringsBasketEn {
	_StringsBasketEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Basket';
	String get checkout => 'Checkout';
	String get confirmRemove => 'Are you sure you want to remove this item from your basket?';
	String get total => 'Total';
}

// Path: checkout
class _StringsCheckoutEn {
	_StringsCheckoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Checkout';
	String get success => 'Order placed successfully';
	String get error => 'Error placing order';
	late final _StringsCheckoutDeliveryAddressEn deliveryAddress = _StringsCheckoutDeliveryAddressEn._(_root);
}

// Path: checkout.deliveryAddress
class _StringsCheckoutDeliveryAddressEn {
	_StringsCheckoutDeliveryAddressEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Name';
	String get nameIsRequired => 'Name is required';
	String get street => 'Street';
	String get streetIsRequired => 'Street is required';
	String get city => 'City';
	String get cityIsRequired => 'City is required';
	String get phoneNumber => 'Phone number';
	String get phoneNumberIsRequired => 'Phone number is required';
	String get postalCode => 'Postal code';
	String get postalCodeIsRequired => 'Postal code is required';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'failedToLoad': return 'Failed to load';
			case 'ok': return 'Ok';
			case 'cancel': return 'Cancel';
			case 'remove': return 'Remove';
			case 'required': return 'Required';
			case 'foods.menu': return 'Menu';
			case 'foods.favourites': return 'Favourites';
			case 'foods.buy': return 'Buy';
			case 'foodDetails.notFound': return 'Food not found';
			case 'foodDetails.addFavourite': return 'Add to favourites';
			case 'foodDetails.removeFavourite': return 'Remove from favourites';
			case 'basket.title': return 'Basket';
			case 'basket.checkout': return 'Checkout';
			case 'basket.confirmRemove': return 'Are you sure you want to remove this item from your basket?';
			case 'basket.total': return 'Total';
			case 'checkout.title': return 'Checkout';
			case 'checkout.success': return 'Order placed successfully';
			case 'checkout.error': return 'Error placing order';
			case 'checkout.deliveryAddress.name': return 'Name';
			case 'checkout.deliveryAddress.nameIsRequired': return 'Name is required';
			case 'checkout.deliveryAddress.street': return 'Street';
			case 'checkout.deliveryAddress.streetIsRequired': return 'Street is required';
			case 'checkout.deliveryAddress.city': return 'City';
			case 'checkout.deliveryAddress.cityIsRequired': return 'City is required';
			case 'checkout.deliveryAddress.phoneNumber': return 'Phone number';
			case 'checkout.deliveryAddress.phoneNumberIsRequired': return 'Phone number is required';
			case 'checkout.deliveryAddress.postalCode': return 'Postal code';
			case 'checkout.deliveryAddress.postalCodeIsRequired': return 'Postal code is required';
			default: return null;
		}
	}
}
