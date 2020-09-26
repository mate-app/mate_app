import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mateapp/models/models.dart';

class University {
  String _id;
  String _city;
  String _domain;
  String _mail;
  String _name;
  String _shortName;
  String _street;
  String _tel;
  String _website;
  String _zip;
  Date nextHolidays;

  University({
    String id,
    String city,
    String domain,
    String mail,
    String name,
    String shortName,
    String street,
    String tel,
    String website,
    String zip,
  })  : _id = id,
        _city = city,
        _domain = domain,
        _mail = mail,
        _name = name,
        _shortName = shortName,
        _street = street,
        _tel = tel,
        _website = website,
        _zip = zip;

  University.fromMap(String docid, data) : assert(data != null) {
    id = docid;
    city = data['city'] is String ? data['city'] as String : null;
    domain = data['domain'] is String ? data['domain'] as String : null;
    mail = data['mail'] is String ? data['mail'] as String : null;
    name = data['name'] is String ? data['name'] as String : null;
    shortName =
        data['short_name'] is String ? data['short_name'] as String : null;
    street = data['street'] is String ? data['street'] as String : null;
    tel = data['tel'] is String ? data['tel'] as String : null;
    website = data['website'] is String ? data['website'] as String : null;
    zip = data['zip'] is String ? data['zip'] as String : null;
    nextHolidays =
        data['next_holidays'] != null && data['next_holidays'] is Timestamp
            ? Date(dateTime: data['next_holidays'].toDate() as DateTime)
            : const Date();
  }

  set id(String id) => _id = id;
  set city(String city) => _city = city;
  set domain(String domain) => _domain = domain;
  set mail(String mail) => _mail = mail;
  set name(String name) => _name = name;
  set shortName(String shortName) => _shortName = shortName;
  set street(String street) => _street = street;
  set tel(String tel) => _tel = tel;
  set website(String website) => _website = website;
  set zip(String zip) => _zip = zip;

  String get id => _id ?? '';
  String get city => _city ?? '';
  String get domain => _domain ?? '';
  String get mail => _mail ?? '';
  String get name => _name ?? '';
  String get shortName => _shortName ?? '';
  String get street => _street ?? '';
  String get tel => _tel ?? '';
  String get website => _website ?? '';
  String get zip => _zip ?? '';
}
