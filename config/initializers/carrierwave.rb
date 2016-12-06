CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: 'us-east-1'
    }
    config.fog_directory  = 'upload-mytools'
    config.asset_host = 'https://s3.amazonaws.com/upload-mytools'
  end
end
