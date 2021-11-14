import 'package:contact_app/Models/Contact.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteHelper {
  Database? dab;
  final String numb = "Contact";

  Future open(String path) async {
    dab = await openDatabase(path, version: 1,
        onCreate: (Database dab, int version) async {
      await dab.execute('''
create table Contact ( 
  id integer primary key autoincrement, 
          name text not null,
          email text not null,
          phone text not null,
          desc text,
          sex integer not null,
          isFavorite integer not null)
''');
    });
  }

  Future<Contact> insert(Contact contact) async {
    contact.id = await dab?.insert(numb, contact.toMap());
    return contact;
  }

  Future<Contact?> getContact(int id) async {
    List<Map<String, dynamic>?>? maps = await dab?.query(
      numb,
      where: 'id = ?',
      whereArgs: [id],
    );

    int l = maps?.length ?? 0;

    if (l > 0) {
      return Contact.fromMap(maps?.first);
    }
    return null;
  }

  Future<List<Contact>?> getAllContact() async {
    List<Map<String, dynamic>?>? maps = await dab?.query(numb);
    return maps?.map((contactMap) => Contact.fromMap(contactMap)).toList();
  }

  Future<List<Contact>?> getFavorites() async {
    List<Map<String, dynamic>?>? maps = await dab?.query(
      numb,
      where: "isFavorite = ?",
      whereArgs: [1],
    );
    return maps?.map((contactMap) => Contact.fromMap(contactMap)).toList();
  }
}
