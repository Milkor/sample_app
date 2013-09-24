# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.



# old code:
# SampleApp::Application.config.secret_key_base = 'a8aa2be2f40e782f234f28b86866bba2e9b1cf3c61217020a9dd96dc1961522a9c9b50ca31c6d8c5a05e632288cea28d7459e5c240cfa2eedc13e2feec5fa2e7'

# new code: this generates a key dynamically. In "old code", the key is hard-coded.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
