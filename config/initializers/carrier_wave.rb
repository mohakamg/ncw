CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJLSXFJ5WNQV3MSEA',                        # required
    aws_secret_access_key: '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',
    region: 'us-west-2'                                              # required
  }
  config.fog_directory  = 'naughtycollegeworkss'                          # required
end
