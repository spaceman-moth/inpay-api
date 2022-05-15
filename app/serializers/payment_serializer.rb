class PaymentSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :amount,
    :currency,
    :iban,
    :status,
  )
end
