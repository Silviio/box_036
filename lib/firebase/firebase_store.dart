import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:box036/entitie/point.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class FirebaseStore {
  final Firestore _db = Firestore.instance;

  addPointsToFireStore(Point point) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    initializeDateFormatting();

    var dateString = DateFormat('dd/MM/yyyy').format(date);

    try {
      var snapshot = await _db
          .collection('scores')
          .where('date', isEqualTo: dateString)
          .where('id', isEqualTo: point.id)
          .getDocuments();

      if (snapshot != null && snapshot.documents.length > 0) {
        var scoreDocumentRef = snapshot.documents[0].reference;

        var oldCountNumber = snapshot.documents[0]['count'];

        var newCountNumber = oldCountNumber + 1;

        var newUpdatedDescription =
            'PSE ${point.title} - Selecionado(s) $newCountNumber no dia $dateString';

        scoreDocumentRef.updateData(
            ({'count': newCountNumber, 'description': newUpdatedDescription}));
      } else {
        var documentId = 'PSE ' +
            point.title +
            ' - ' +
            DateFormat.yMMMd('pt_BR').format(date);

        _db.collection('scores').document(documentId).setData(({
              'count': 1,
              'date': dateString,
              'description':
                  'PSE ${point.title} - Selecionado 1 no dia $dateString',
              'id': point.id
            }));
      }
    } catch (e) {
      throw 'Error Message $e';
    }
  }
}
