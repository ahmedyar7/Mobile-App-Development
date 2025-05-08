import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes = FirebaseFirestore.instance.collection(
    'notes',
  );

  // ✅ CREATE
  Future<void> addNote(String note) async {
    try {
      await notes.add({'note': note, 'timestamp': Timestamp.now()});
      print("✅ Note added");
    } catch (e) {
      print("❌ Error adding note: $e");
    }
  }

  // 📥 READ (as Stream)
  Stream<QuerySnapshot> getNotesStream() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  // ✏️ UPDATE
  Future<void> updateNote(String docID, String newNote) async {
    try {
      await notes.doc(docID).update({
        'note': newNote,
        'timestamp': Timestamp.now(),
      });
      print("✏️ Note updated");
    } catch (e) {
      print("❌ Error updating note: $e");
    }
  }

  // 🗑️ DELETE
  Future<void> deleteNote(String docID) async {
    try {
      await notes.doc(docID).delete();
      print("🗑️ Note deleted");
    } catch (e) {
      print("❌ Error deleting note: $e");
    }
  }
}
