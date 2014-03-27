CarrierWave.configure do |config|
  config.fog_credentials = {
    
    # required
    
    :provider               => 'AWS',       
    :aws_access_key_id      => 'AKIAIA2PW7Y5QERFWJJA',
    :aws_secret_access_key  => '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',
    
    # optional

    # :region                 => 'eu-west-1',                  # defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # defaults to nil
    # :endpoint               => 'https://s3.example.com:8080' # defaults to nil
  }

  config.fog_directory  = 'pocketpharma-dev' if Rails.env.development?    # required
  config.fog_directory  = 'pocketpharma-dev' if Rails.env.production?   # required
  
  # config.fog_public     = false                                  # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} # optional, defaults to {}

end