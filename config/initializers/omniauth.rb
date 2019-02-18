Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem'
  provider :github, '926f65031c0890ed0b77', '0d6369347d8f0756ebcad7ca6431da79b8ed7687'
  provider :openid, store: OpenID::Store::Filesystem.new('/tmp')
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
# end
