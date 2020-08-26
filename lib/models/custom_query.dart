import 'package:flutter/foundation.dart';

class CustomQuery {
  String field;
  String operation;
  dynamic value;

  CustomQuery(
      {@required this.field, @required this.operation, @required this.value})
      : assert(field != null),
        assert([
          '==',
          '>',
          '<',
          '<=',
          '>=',
          'isNull',
          'arrayContains',
          'arrayContainsAny',
          'whereIn'
        ].contains(operation)),
        assert(value != null);
}
