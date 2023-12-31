require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
config.fog_provider = 'fog/aws'
config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'us-east-1'  # Cambia esto según tu región de AWS
}
config.fog_directory = 'karip-ic'  # Nombre de tu bucket en S3
end