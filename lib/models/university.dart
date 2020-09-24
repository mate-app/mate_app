class University {
  String id;
  String city;
  String domain;
  String mail;
  String name;
  String shortName;
  String street;
  String phone;
  String website;
  String zip;
  DateTime nextHolidays;

  University({
    this.id,
    this.city,
    this.domain,
    this.mail,
    this.name,
    this.shortName,
    this.street,
    this.phone,
    this.website,
    this.zip,
    this.nextHolidays,
  });
  University.fromMap(doc) {
    id = doc.id is String ? doc.id as String : '';
    city = doc.data()['city'] is String ? doc.data()['city'] as String : '';
    domain =
        doc.data()['domain'] is String ? doc.data()['domain'] as String : '';
    mail = doc.data()['mail'] is String ? doc.data()['mail'] as String : '';
    name = doc.data()['name'] is String ? doc.data()['name'] as String : '';
    shortName = doc.data()['short_name'] is String
        ? doc.data()['short_name'] as String
        : '';
    street =
        doc.data()['street'] is String ? doc.data()['street'] as String : '';
    phone = doc.data()['tel'] is String ? doc.data()['tel'] as String : '';
    website =
        doc.data()['website'] is String ? doc.data()['website'] as String : '';
    zip = doc.data()['zip'] is String ? doc.data()['zip'] as String : '';
    nextHolidays = doc.data()['next_holidays'] != null
        ? doc.data()['next_holidays'].toDate() is DateTime
            ? doc.data()['next_holidays'].toDate() as DateTime
            : DateTime.utc(1970)
        : DateTime.utc(1970);
  }
}
