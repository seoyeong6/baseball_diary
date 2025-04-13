import 'package:flutter/material.dart';

class DetailBottomSheet extends StatefulWidget {
  const DetailBottomSheet({super.key});

  @override
  State<DetailBottomSheet> createState() => _DetailBottomSheetState();
}

class _DetailBottomSheetState extends State<DetailBottomSheet> {
  void _onPressDelete() {
    Navigator.of(context).pop();
  }

  void _onPressEdit() {
    //TODO: 수정 로직 추가
  }

  void _onPressSave() {
    //TODO: 저장 로직 추가
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('야구 일기'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: _onPressDelete, icon: Icon(Icons.close)),
            ],
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'title'),
                  maxLines: 1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  cursorColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '여기에 클릭한 일기의 내용이 나오도록 해야함.',
                  ),
                  maxLines: 10,
                  style: TextStyle(fontSize: 14),
                  cursorColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
                Container(width: 100, height: 100, color: Colors.grey),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: TextButton(
                    onPressed: _onPressSave,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('완료'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
