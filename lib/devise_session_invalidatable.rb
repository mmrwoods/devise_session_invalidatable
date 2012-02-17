require 'devise'

Devise.add_module :session_invalidatable, :model => 'devise_session_invalidatable/model'
