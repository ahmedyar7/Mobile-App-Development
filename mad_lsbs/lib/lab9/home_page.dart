import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_lsbs/lab9/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();

  void openNotesBox({String? existingNote, String? docId}) {
    textController.text = existingNote ?? "";

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              docId == null ? "Add Note" : "Edit Note",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: TextField(
              controller: textController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Write your note here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  textController.clear();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  final text = textController.text.trim();
                  if (text.isEmpty) return;

                  if (docId == null) {
                    firestoreService.addNote(text);
                  } else {
                    firestoreService.updateNote(docId, text);
                  }

                  textController.clear();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text(docId == null ? "Add" : "Update"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Notes", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 82, 133),
        onPressed: () => openNotesBox(),
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("❌ Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("📭 No notes found", style: TextStyle(fontSize: 16)),
            );
          }

          final notes = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final doc = notes[index];
              final data = doc.data() as Map<String, dynamic>;
              final noteText = data['note'] ?? 'No note';
              final timestamp = data['timestamp'] as Timestamp?;
              final date = timestamp?.toDate();

              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  title: Text(
                    noteText,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle:
                      date != null
                          ? Text(
                            "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                          : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed:
                            () => openNotesBox(
                              existingNote: noteText,
                              docId: doc.id,
                            ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          firestoreService.deleteNote(doc.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
