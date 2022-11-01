//import 'package:postgres/postgres.dart';
//
//class ProductsDao {
//  ProductsDao(this.connection) {
//    table = 'emoji_status';
//  }
//
//  late PostgreSQLConnection connection;
//  late String table;
//
//  Future<List<EmojiStatusEntity>> getAll() async {
//    final List<List<dynamic>> results = await connection.query('SELECT * FROM $table');
//
//    final emojiStatusList = <EmojiStatusEntity>[];
//
//    for (final item in results) {
//      emojiStatusList.add(
//        EmojiStatusEntity(
//          productId: item[0] as num,
//          title: item[1] as String,
//          price: item[2] as num,
//          description: item[3] as String,
//          category: item[4] as String?,
//          image: item[5] as String?,
//          rate: item[6] as num?,
//          rateCount: item[7] as num?,
//        ),
//      );
//    }
//
//    return emojiStatusList;
//  }
//}
