# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :customer

  STATUSES = %w[
    ACCP
    RCVD
    CANC
    RJCT
  ]

  STATUSES.each do |status|
    self.const_set(status, status)
  end
end
