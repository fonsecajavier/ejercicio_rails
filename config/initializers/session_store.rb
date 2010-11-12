# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ejercicio_rails_session',
  :secret      => '054c366780eb6e9ca1740f1e64a3af9031524c41f37281ef783b4471a4365ec52ad8ef60a3ba94885bfe2a633396b20391dfc83eedcae775cb037b57ce92c32c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
