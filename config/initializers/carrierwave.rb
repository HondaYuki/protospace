CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id:       Settings.aws_key,
      aws_secret_access_key:   Settings.secret_access_key,
      region:                  Settings.region,
    }

    case Rails.env
    when 'development'
      config.fog_directory = Settings.backet
      config.asset_host = Settings.asset_host
    when 'production'
      config.fog_directory = Settings.backet
      config.asset_host = Settings.asset_host
    end

end
