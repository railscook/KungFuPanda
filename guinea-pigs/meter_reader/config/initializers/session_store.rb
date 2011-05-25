# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_meter_reader_session',
  :secret      => '933245ef6ecb7ae73e9a67495323728f4001cb4662372a4328526c48e14350da496eb3f71c1b8d5d804fb4d49d78bb21dc7819f0f09c0208966a1aafbea691e3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
