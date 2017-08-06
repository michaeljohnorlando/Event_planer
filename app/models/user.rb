class User < ApplicationRecord
  has_secure_password
  serialize :going_to
  has_many  :thing_to_do
end
