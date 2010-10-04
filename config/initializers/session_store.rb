# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_r4rmusic1_session',
  :secret      => 'ea859655749cbcd102855fbf04804e05b313b80f1f8d1f7a1b68e329e6f1e64eed213893d530e1ac375c25761929d4f00f24a9e024a3661f6d7690679c9f804c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
