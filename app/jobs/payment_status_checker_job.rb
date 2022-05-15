class PaymentStatusCheckerJob
  include Sidekiq::Job

  sidekiq_options queue: :default

  def perform
    payments = Payment.where.not(status: ::Payment::ACCP)

    payments.each do |payment|
      PaymentStatusUpdaterJob.perform_async(payment.id)
    end
  end
end
