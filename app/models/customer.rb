class Customer < ApplicationRecord
  has_many :applications
  has_many :payments
end
