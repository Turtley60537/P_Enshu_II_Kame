class ManageMap {
  int getKey;
  
  //一次のキーを作成
  int keyInit(long __id){
    return int(__id % 20);
  }
  
  //保存されていなければ、グループデータをセット
  void setData(long _id, Group _group) {
    println("group is " + _group);
    
    int getKey = keyInit(_id);
    
    if (groupMap.get(getKey)==null) {
      groupMap.put( getKey, new HashMap<Long, Group>() );
    }
    groupMap.get(getKey).put(_id, _group);
    
    println("HashMapTesting..."+groupMap.get(getKey));
    println("tweetData = " + groupMap);
  }
  
  //グループ振り分け済みかどうか判定
  boolean alreadySaved(long _id) {
    
    int getKey = keyInit(_id);
    
    if (groupMap.get(getKey) == null) {
      return false;
    } else if (groupMap.get(getKey).get(_id) == null) {
      return false;
    } else {
      return true;
    }
  }

  //与えられたidがどこのグループか判定
  Group searchData(long _id) {
    
    int getKey = keyInit(_id);
    
    if (groupMap.get(getKey).get(_id) != null) {
      return groupMap.get(getKey).get(_id);
    } else {
      return Group.white;
    }
  }
}