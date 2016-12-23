import twitter4j.*;
import twitter4j.api.*;
import twitter4j.auth.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.management.*;
import twitter4j.util.*;
import twitter4j.util.function.*;

import processing.net.*;

//サーバーを立てる
Server myServer = new Server(this, 12345);

/*
 * グループデータを格納するための二次元のHashMap
 * id%20を一次キー、idを二次キーとして、groupの値を返す
 */
HashMap<Integer, HashMap<Long, Group>> groupMap
  = new HashMap<Integer, HashMap<Long, Group>>();

//APIを利用するためのもの
Twitter          rest;
TwitterStream    stream;
APISettings apiSettings;

//Enum.javaを参照
Phase phase;

//HashMapの操作を行うためのクラス
ManageMap manageMap = new ManageMap();

void setup() {
  //自分のキーを入力　配布時参照不可　
  String lines[] = loadStrings("../twitterOathKey.txt");
  final String consumerKey       = lines[0];
  final String consumerSecret    = lines[1];
  final String accessToken       = lines[2];
  final String accessTokenSecret = lines[3];
  
  //APIを使うための設定
  apiSettings = new APISettings();
  apiSettings.rest(consumerKey, consumerSecret, accessToken, accessTokenSecret);
  apiSettings.stream(consumerKey, consumerSecret, accessToken, accessTokenSecret);

  //イベントを受け取るリスナーオブジェクトを設定
  stream.addListener( new MyStatusListener() );

  //取得ツイートを自分のフォローする人のツイートに設定
  stream.user();
  //取得ツイートをキーワードが含まれるツイートに設定
  //stream.filster("#P演発表会");

  phase = Phase.setGroup;

  //surface.setVisible(false);
}

void draw() {
}