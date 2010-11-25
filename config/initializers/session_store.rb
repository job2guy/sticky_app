# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sticker_note_app_session',
  :secret      => '226efb1943f60422e95e193c7af409c95e868bbbaff187fd86d1be24d3677f1825eff8dc6d5dd0ac216f912a0233e09b0a1c6be803fce272b70da3dee8639be7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
