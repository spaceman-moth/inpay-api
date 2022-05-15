class Application < ApplicationRecord
  belongs_to :customer
  has_many :payments
end
