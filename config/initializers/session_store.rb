# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_keywifi_session',
  :secret      => '5b0b0f65543d768e583e9ffae095af1f778730a1381e27ecec0c80378cb95f21eeb4ee579f39b6dc37733d5cd8ad1c9342f99551b1f6617eee8eec27ab3def19'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
