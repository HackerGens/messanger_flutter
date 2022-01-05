import 'package:flutter/material.dart';

class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
];

class conversactions extends StatelessWidget {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
     height = MediaQuery.of(context).size.height;
     width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white70,

        title: Text("Mark Bin", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black,
            fontFamily: "Roboto"),),

        leading: Container(
          padding: EdgeInsets.only(left: 16, top: 3, bottom: 3),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset("assets/profile-pics/1.jpg", fit: BoxFit.fill,),
            ),
          ),
        ),

        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.vpn_key, size: 18, color: Colors.black,), onPressed: () {  },
            ),
          ),
          SizedBox(width: 16,),

        ],
      ),

      body: SingleChildScrollView(
        child:Column(
          children: [

            Container(
              width: width,
              height: height*0.74,
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                      ),
                    ),
                  );
                },
              ),
            ),


            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[

                        Container(
                          width: width*0.81,
                          height: width*1.5,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.3)
                                ,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none,

                              ),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: (){},
                          child: Icon(Icons.send,color: Colors.white,size: 18,),
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),




      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
        padding: EdgeInsets.only(left: 80, right: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: Image.asset("assets/profile-pics/mmessage.png", fit: BoxFit.fitHeight,), onPressed: () {  },
                  ),
                ),
                Positioned(
                  child: Container(
                    height:21 ,
                    width: 21,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.5)),
                        color: Colors.redAccent,
                        border: Border.all(color: Colors.black, width: 3)
                    ),
                    child: Center(
                      child: Text("2", style: TextStyle(fontFamily: "Roboto", fontSize: 12, color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  top: 2,
                  right: 0,
                )

              ],
            ),
            Container(
              height: 40,
              width: 40,
              child: IconButton(
                icon: Image.asset("assets/profile-pics/people.png", fit: BoxFit.fitHeight,), onPressed: () {  },
              ),
            ),
            Container(
              height: 40,
              width: 40,
              child: IconButton(
                icon: Image.asset("assets/profile-pics/navigation.png", fit: BoxFit.fitHeight,), onPressed: () {  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


