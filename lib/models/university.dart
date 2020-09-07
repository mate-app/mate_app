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
    id = doc.id;
    city = doc.data()['city'] ?? '';
    domain = doc.data()['domain'] ?? '';
    mail = doc.data()['mail'] ?? '';
    name = doc.data()['name'] ?? '';
    shortName = doc.data()['short_name'] ?? '';
    street = doc.data()['street'] ?? '';
    phone = doc.data()['tel'] ?? '';
    website = doc.data()['website'] ?? '';
    zip = doc.data()['zip'] ?? '';
    nextHolidays =
        doc.data()['next_holidays'].toDate() ?? DateTime.utc(1970, 01, 01);
  }
}
