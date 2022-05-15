class Api::PaymentsController < Api::BaseController
  before_action :authorized_customer

  def index
    render json: authorized_customer.payments, each_serializer: PaymentSerializer
  end

  def create
    PaymentCreatorJob.perform_async(
      payment_params.merge(customer_id: authorized_customer.id).as_json
    )

    render status: 200
  end

  def show
    payment = Payment.find(params[:id])

    if payment.present?
      render json: payment, serializer: PaymentSerializer
    else
      render status: 404
    end
  end

  def status
    payment = Payment.find(params[:payment_id])

    render json: {
      status: payment.status
    }
  end

  private

  def payment_params
    params.require(:attributes).permit(
      :name,
      :iban,
      :amount,
      :currency,
    )
  end
end
