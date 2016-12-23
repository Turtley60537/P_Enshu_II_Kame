class APISettings {
  
  void rest(String _consumerKey, String _consumerSecret, String _accessToken, String _accessTokenSecret) {
    //RestのConfigurationを生成するためのビルダーオブジェクトを生成
    ConfigurationBuilder cb_rest = new ConfigurationBuilder();

    //キー設定
    cb_rest.setOAuthConsumerKey      ( _consumerKey       );
    cb_rest.setOAuthConsumerSecret   ( _consumerSecret    );
    cb_rest.setOAuthAccessToken      ( _accessToken       );
    cb_rest.setOAuthAccessTokenSecret( _accessTokenSecret );

    //TwitterRestのインスタンスを生成
    rest = new TwitterFactory( cb_rest.build() ).getInstance();
  }

  void stream(String _consumerKey, String _consumerSecret, String _accessToken, String _accessTokenSecret) {
    //StreamのConfigurationを生成するためのビルダーオブジェクトを生成
    ConfigurationBuilder cb_stream = new ConfigurationBuilder();

    //キー設定
    cb_stream.setOAuthConsumerKey      ( _consumerKey       );
    cb_stream.setOAuthConsumerSecret   ( _consumerSecret    );
    cb_stream.setOAuthAccessToken      ( _accessToken       );
    cb_stream.setOAuthAccessTokenSecret( _accessTokenSecret );

    //TwitterStreamのインスタンスを生成
    TwitterStreamFactory streamFactory 
      = new TwitterStreamFactory( cb_stream.build() );

    stream = streamFactory.getInstance();
  }
}