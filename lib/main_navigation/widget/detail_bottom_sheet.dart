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
    //TODO: 저장하시겠습니까? 묻기
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
              IconButton(onPressed: _onPressEdit, icon: Icon(Icons.edit)),
              IconButton(onPressed: _onPressDelete, icon: Icon(Icons.close)),
            ],
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '제목',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                Text(
                  '여기에 클릭한 일기의 내용이 나오도록 해야함.',
                  style: TextStyle(fontSize: 14),
                  maxLines: 10,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16),
                Center(
                  child: Container(width: 200, height: 200, color: Colors.grey),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
