class PaymentCreatorJob
  include Sidekiq::Job

  sidekiq_options queue: :default

  def perform(params)
    Connectors::Base.get_tokens unless Connectors::Base.refresh_tokens
    Connectors::Base.create_payment(params)
  end
end
