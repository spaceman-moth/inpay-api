FactoryBot.define do
  factory :customer do
    sequence(:name) { |n| "Customer ##{n}"}
  end

  factory :application do
    association :customer
    key { "some_key" }
    secret { "some_secret" }
  end

  factory :payment do
    association :customer
    sequence(:name) { |n| "Payee ##{n}"}
    sequence(:iban) { |n| "IBAN#{n}" }
    amount { 9.99 }
    currency { "EUR" }
    status { Payment::RCVD }
  end
end
