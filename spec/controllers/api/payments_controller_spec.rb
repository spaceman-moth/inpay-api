require 'rails_helper'

describe Api::PaymentsController do
  describe "without app_id and app_secret" do
    it "returns unauthorized" do
      get :index

      expect(json_response).to eq(
        status: "not authorized"
      )
    end
  end

  describe "with app_id and app_secret" do
    let!(:application) { create :application, key: "app_id", secret: "secret_id" }
    let!(:payments)    { create_list :payment, 3, customer: application.customer }

    before do
      request.headers["app-id"] = "app_id"
      request.headers["app-secret"] = "secret_id"
    end

    describe "GET index" do
      it "returns all payments" do
        get :index

        expect(json_response.size).to eq(3)
        expect(json_response.first).to eq(
          id: payments.first.id,
          amount: "9.99",
          currency: "EUR",
          iban: payments.first.iban,
          name: payments.first.name,
          status: "RCVD",
        )
      end
    end

    describe "POST create" do
      it "creates a payment" do
        attributes = {
          name: "Postal office",
          iban: "PSTO11111111111",
          amount: 9999.99,
          currency: "EUR",
        }

        post :create, params: {
          attributes: attributes
        }


        PaymentCreatorJob.drain
        expect(Payment.count).to eq(4)
        expect(
          Payment.last.slice(:name, :iban, :amount, :currency)
        ).to eq(attributes.as_json)
      end
    end

    describe "GET show" do
      it "shows a payment" do
        get :show, params: { id: payments.first.id }

        expect(json_response[:id]).to eq(payments.first.id)
      end
    end

    describe "GET status" do
      it "shows a payment's status" do
        get :status, params: { payment_id: payments.first.id }

        expect(json_response).to eq(status: "RCVD")
      end
    end
  end
end
