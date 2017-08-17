CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['aws_access_key_id'],
    :aws_secret_access_key => ENV['aws_secret_access_key']
  }
  config.fog_directory  = 'bookshelfy'
  config.fog_host       = 'http://www.example.com' 
  config.fog_public     = true                                    # optional, defaults to true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}  # optional, defaults to {}

else
 #for development and testing locally
  config.storage = :file
  config.enable_processing = false
 end
end