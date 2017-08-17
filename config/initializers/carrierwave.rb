CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIYAC4TMGOOJLFOVQ',                        # required
    aws_secret_access_key: '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',                        # required
  }
  config.fog_directory  = 'bookshelfy'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
end