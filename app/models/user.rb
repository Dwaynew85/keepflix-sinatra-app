class User < ActiveRecord::Base
  has_secure_password
  has_mamy :movies
end
