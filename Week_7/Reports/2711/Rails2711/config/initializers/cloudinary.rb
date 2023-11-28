Cloudinary.config do |config|
  config.cloud_name = ENV['cloud_name']
  config.api_key = ENV['api_key']
  config.api_secret = ENV['api_secret']
  config.secure = true # Ensures HTTPS
  config.cdn_subdomain = true # Optional, use CDN subdomain for assets
end
  