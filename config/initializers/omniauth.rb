OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '90036175321-3ip9i8ob7557sce7h6sat03vjeokdrlp.apps.googleusercontent.com', 'ztqE7ztgxyRlOrZr_KbakGhs', :skip_jwt => true
end