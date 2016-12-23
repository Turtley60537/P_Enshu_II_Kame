//イベント駆動型のクラス
//取得できるツイートがあると自動で実行される
class MyStatusListener extends StatusAdapter {
  public void onStatus(Status s) {
    //tweets.add(new Tweet(s));
    Tweet tweet = new Tweet(s);
  }
}

/*
* ツイートから情報を引き出すためのクラス
 * ツイート自体はリストなどに格納したりせず、
 * ツイートのユーザーidとグループ分けをManageMapクラスでHashMapに格納する
 * また、ゲーム中に取得したツイートから、
 * ユーザーのid, アイコンのurl, idをキーとして引き出したグループを
 * Communicateクラスで送信する
 */
class Tweet {
  Group group;
  long   id;
  String text;
  String name;
  String screenName;
  String iconUrl;

  public Tweet(Status status) {
    text         = status.getText();      //本文
    User user    = status.getUser();
    id           = user.getId();          //固有id
    name         = user.getName();        //ユーザー名
    screenName   = user.getScreenName();  //@name
    //profileImage = loadImage( user.getProfileImageURL() );    //アイコン
    iconUrl      = user.getProfileImageURL();

    println(name, screenName, id);
    println("  " + text);
    println();

    if (phase == Phase.setGroup) {
      if (!containAka() && !containAo()) {
        println("関係ないツイート\n");
        return;
      } else if ( manageMap.alreadySaved(id) ) {
        println("グループ分け完了済み\n");
        return;
      } else {
        /*
         * グループ分けをする
         * 赤に関するツイートを含んでいたら赤グループに
         * 青に関するツイートを含んでいたら青グループに
         * 両方含んでいたら黒グループに配属され、
         * 黒グループはグループ分け最後に赤か青へランダムに割り振られる
         */
        if      ( containAka() && !containAo()) group = Group.red;
        else if (!containAka() &&  containAo()) group = Group.blue;
        else if ( containAka() &&  containAo()) group = Group.black;

        manageMap.setData(id, group);

        return;
      }
    } else if (phase == Phase.mainGame) {
      //HashMapからデータを返して、クライアントに送信
      group = manageMap.searchData(id);
      println("this tweet's group ="+ group);
    }
  }

  boolean containAka() {
    return text.matches(".*(赤|あか|アカ|aka|AKA|red).*");
  }

  boolean containAo() {
    return text.matches(".*(青|あお|アオ|ao|AO|blue).*");
  }
}