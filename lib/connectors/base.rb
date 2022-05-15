class Connectors::Base
  class << self
    def authorize
    end

    def get_tokens
      # get new tokens if expired
      {
        "access_token": "access_token",
        "refresh_token": "refresh_token",
        "expires_at": "1660333872"
      }
    end

    def refresh_tokens
      # refresh tokens
      {
        "access_token": "access_token",
        "refresh_token": "refresh_token",
        "expires_at": "1660333872"
      }
    end

    def create_payment(params)
      # make a payment request to the bank here
      response = {
        status: "RCVD"
      }

      Payment.create(
        name: params["name"],
        iban: params["iban"],
        amount: params["amount"],
        currency: params["currency"],
        status: response[:status],
        customer_id: params["customer_id"],
      )
    end

    def fetch_status
      # performs a request for payment status
      { status: "ACCP" }
    end
  end
end
