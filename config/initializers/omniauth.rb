Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '359251874207725', '9644a275657f22bedcbd24c2ed61cf89'
end