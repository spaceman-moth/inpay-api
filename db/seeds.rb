Bank.create!(
  name: "Italian Bank",
  api_url: "https://italian.bank.it/api",
  credentials: {
    access_token: "access_token",
    refresh_token: "refresh_token",
  }
)

customer = Customer.create!(
  name: "Customer 1"
)

Application.create!(
  key: "app_id",
  secret: "app_secret",
  customer: customer
)
