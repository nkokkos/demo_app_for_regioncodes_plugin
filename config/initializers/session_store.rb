# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dynamic_select_boxes_session',
  :secret      => 'f6c80e6fc863facfdcaada72ef99fd428d72547c746744762aa865d21eddd3a2828fc247078dd6be70b5787894e3b8f233e70409136c186ea0f354e14cca0220'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
