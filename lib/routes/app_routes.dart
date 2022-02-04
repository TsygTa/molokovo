part of 'app_pages.dart';

abstract class Routes {
  static const home = _Paths.home;
  static const products = _Paths.home + _Paths.products;
  static const delivery =  _Paths.home + _Paths.delivery;
  static const aboutUs =  _Paths.home + _Paths.aboutUs;
  static const contacts =  _Paths.home + _Paths.contacts;
  //static const login = _Paths.home + _Paths.login;
  static const profile = _Paths.home + _Paths.profile;
  static const order = _Paths.home + _Paths.order;
  static const unknown = _Paths.home + _Paths.unknown;

  Routes._();

  // static String loginThen(String afterSuccessfulLogin) =>
  //     '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';

  static String productDetails(String productId) => '$products/$productId';
}

abstract class _Paths {
  static const home = '/home';
  static const products = '/products';
  static const productDetails = '/:productId';
  static const delivery = '/delivery';
  static const aboutUs = '/aboutUs';
  static const contacts = '/contacts';
  //static const login = '/login';
  static const profile = '/profile';
  static const order = '/order';
  static const unknown = '/404';
}