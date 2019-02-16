Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '926f65031c0890ed0b77', '0d6369347d8f0756ebcad7ca6431da79b8ed7687'
end
