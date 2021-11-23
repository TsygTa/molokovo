import 'package:get/get.dart';

import 'package:site_molokovo/models/auth_response.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:site_molokovo/models/save_user_response.dart';
import 'package:site_molokovo/models/user.dart';

class DataRepository {

  DataRepository._();
  static final DataRepository _instance = DataRepository._();

  static DataRepository get instance {
    return _instance;
  }

  static const testCode = '7777';
  String? _phone;

  final List<Product> _products = [
    Product(name: 'Молоко коровье цельное',
        description: 'Как у нас говорят молоко прямо из-под коровы. Все живые и полезные свойства сохраняются. Очень полезное и натуральное, фермерское молоко. Подоили, разлили, привезли к Вам домой. Коровки питаются у нас только натуральным. Не покупаем комбикорма. Поим чистой водой. Поэтому молоко от наших коровок сохранило полезные вещества и имеет натуральный вкус. После доставки молоко необходимо сразу поставить в холодильник.',
        shelfLife:'3 дня при температуре 0-6 градусов', composition: 'цельное не пастеризованное молоко', weight: '1л', price: 300, imagePath: 'assets/products/milk.jpg'),
    Product(name: 'Творог',
        description: '',
        shelfLife:'5 дня при температуре 0-6 градусов', composition: '', weight: '500г', price: 600, imagePath: 'assets/products/milk.jpg'),
    Product(name: 'Сметана',
        description: '',
        shelfLife:'7 дней при температуре 0-6 градусов', composition: '', weight: '200г', price: 500, imagePath: 'assets/products/milk.jpg'),
    Product(name: 'Валансе',
        description: 'Cыр из козьего молока в обсыпке из древесного угля, через который пробивается белая плесень. Отличный сыр для сырной тарелки. Перед употреблением сыр необходимо довести до комнатной температуры. Употребляется с вином Совиньон Бланк, Сансар Руж, Шинон',
        shelfLife:'90 дней с даты изготовления',
        composition: 'Пастеризованное козье молоко, закваска (мезофильные молочнокислые микроорганизмы), поваренная пищевая соль, молокосвёртывающий ферментный препарат животного происхождения, уголь растительный, чистая культура плесеней Geotrichum candidum, Penicillium candidum', weight: '200г', price: 500, imagePath: 'assets/products/valance.jpg'),
    Product(name: 'Буррата',
        description: 'Мягкий сыр с нежнейшим молочным вкусом. Из горячих шариков формируют мешочки, которые заполняют начинкой (смесь сливок и страчателлы). Едят бурату как можно более свежей. Перед подачей на стол необходимо предварительно достать сыр из холодильника и довести до комнатной температуры. Таким образом, он раскроет все свои вкусовые ноты и приобретёт необходимую консистенцию.',
        shelfLife:'24-48 часов',
        composition: 'Молоко цельное пастеризованное, сливки нормализованные питьевые, закваска термофильных молочнокислых микроорганизмов, молокосвертывающий ферментный препарат животного происхождения, соль пищевая', weight: '300г', price: 800, imagePath: 'assets/products/burrata.jpg'),
    Product(name: 'Манчего',
        description: 'Твердый сыр из коровьего и козьего молока. Вкус и аромат продукта непосредственно зависит от срока выдержки. Молодые варианты выдерживаются 4 месяца, и они имеют нежный и слегка кисловатый вкус, а выдержанные варианты обладают более насыщенным вкусом и выдерживаются минимум 1 год.',
        shelfLife:'',
        composition: '', weight: '1кг', price: 2000, imagePath: 'assets/products/manchego.jpg'),
    Product(name: 'Кротен',
        description: 'Мягкий сыр из козьего молока. Под корочкой – нежнейшая мякоть. Вкус чуть-чуть сладковатый и отдающий лесным орехом. Вкус лесного ореха, смешанный с ароматом, долго остается во рту.',
        shelfLife:'',
        composition: '', weight: '200г', price: 500, imagePath: 'assets/products/kroten.jpg'),
    Product(name: 'Качотта',
        description: 'Полутвердый сыр из коровьего молока. Вкус молочный, мягкий, сладкий, острый (у выдержанных сыров). Это превосходный бутербродный сыр. Она отлично плавится и может быть использована при приготовлении различных блюд традиционной итальянской кухни: пиццы, пасты, ризотто.',
        shelfLife:'',
        composition: '', weight: '1кг', price: 1800, imagePath: 'assets/products/kachotta.jpg'),
  ];

  Future<bool> sendCode(String phone) async {
    _phone = phone;

    return true;
  }

  Future<AuthResponse> auth(String phone, String code) async {
    if(_phone == phone && code == testCode) {
      return AuthResponse(status: true, user: User(phone: phone));
    } else {
      return AuthResponse(status: false, error: 'auth_failed'.tr);
    }
  }

  List<Product> get getProducts {
    return _products;
  }

  Future<SaveUserResponse> saveUser(User user) async{
    return SaveUserResponse(status: true);
  }

}