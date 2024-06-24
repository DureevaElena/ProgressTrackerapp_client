import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/api/note/stagenode_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/home/note/viewcat2_note.dart';

class CatEtapNoteScreen extends StatefulWidget {
  final int noteId;
  final Note note;

  const CatEtapNoteScreen({super.key, required this.noteId, required this.note});

  @override
  State<CatEtapNoteScreen> createState() => _CatEtapNoteScreenState();
}

class _CatEtapNoteScreenState extends State<CatEtapNoteScreen> {
  late User user;
  List<StageNote> notestages = []; 

  int totalNotes = 0;
  int totalDone1 = 0;
  int totalDone2 = 0;

  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().state;
    loadDataAndCalculateTotals();
  }

  Future<void> loadDataAndCalculateTotals() async {
    notestages = await getStageNotes(user, widget.noteId);
    calculateTotals();
    setState(() {}); 
  }

 
  void calculateTotals() {
    totalNotes = notestages.length;
    totalDone1 = notestages.where((stagenote) => stagenote.donetodo == 1).length;
    totalDone2 = notestages.where((stagenote) => stagenote.donetodo == 2).length;

    if (totalNotes == totalDone1) {
      widget.note.statustodo = 3;
      updateNoteStatus(); 
    } else if (totalNotes >= 0) {
      DateTime currentDate = DateTime.now();
      DateTime endDate = widget.note.dataendtodo is DateTime
        ? widget.note.dataendtodo as DateTime
        : currentDate;

      if (endDate.isAfter(currentDate)) {
        widget.note.statustodo = 1; 
      } else {
        widget.note.statustodo = 2; 
      }
      updateNoteStatus(); 
    }
  }
  Future<void> updateNoteStatus() async {
    var success = await updateNote(
      user,
      widget.note
    );
    if (success) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.noteId;
    Note noteforcreatstage = widget.note;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CatViewNoteScreen(note: widget.note, user: user),
                        ),
                      );
                    },
                    child: const Text(
                      'Описание',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Этапы',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black,
                height: 2.0,
              ),
            ],
          ),
        ),
      ),
      body: notestages.isEmpty
          ? Center(
            child: Text(
              'Нет созданных этапов',
              style: TextStyle(fontSize: 20),
            ),
          )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Expanded(
                  child: ListView.builder(
                    itemCount: notestages.length,
                    itemBuilder: (context, index) {
                      final notestage = notestages[index];
                      return ListTile(
                        leading: IconButton(
                          icon: Icon(
                            notestage.donetodo == 1
                                ? Icons.check_circle_outline
                                : Icons.radio_button_unchecked,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (notestage.donetodo == 1) {
                              notestage.donetodo = 2;
                            } else {
                              notestage.donetodo = 1;
                            }
                            var success =
                                await updateStageNote(user, notestage);
                            if (success) {
                              setState(() {});
                            }
                          },
                        ),
                        title: Text(notestage.titlestagetodo, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                        
                      );
                    },
                  ),
                ),
              ],
            )
    );
  }
}

