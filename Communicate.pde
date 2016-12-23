class Communicate {
  
  void importMessage() {
    Client thisClient = myServer.available();
    if(thisClient != null){
      String receiveSentence = thisClient.readString();
      
      if(phase == Phase.setGroup){
        //Phase:mainGameという文面が来たら、Phase変更
      } else if(phase == Phase.mainGame){
        //ユーザー名 defeat ユーザー名の形式の文字列を受信
      }
    }
  }
  
  void exportMessage(long _id, String _iconUrl, Group _group) {
    String sendSentence 
      = "id:"+_id+",iconUrl:"+_iconUrl+",group:"+_group;
    println(sendSentence);
    myServer.write( sendSentence );
  }
}