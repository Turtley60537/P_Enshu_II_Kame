//enum(列挙型) : フラグ分けを数字ではなく単語で行うために利用

//ユーザーのグループ分けの変数として使用
enum Group {
  red, 
  blue, 
  black, 
  white,
}

//プログラムの進行のためのフラグに使用
enum Phase {
  setGroup, 
  mainGame,
}