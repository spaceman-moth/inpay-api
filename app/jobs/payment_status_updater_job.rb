class PaymentStatusUpdaterJob
  include Sidekiq::Job

  sidekiq_options queue: :default

  def perform(payment_id)
    response = Connectors::Base.fetch_status
    Payment.find(payment_id).update!(status: response[:status])
  end
end
