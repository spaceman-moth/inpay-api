require 'rails_helper'

RSpec.describe PaymentStatusUpdaterJob, type: :job do
  before do
    PaymentStatusUpdaterJob.clear
  end

  it "is scheduled" do
    expect {
      PaymentStatusUpdaterJob.perform_async(1)
    }.to change(PaymentStatusUpdaterJob.jobs, :size).by(1)
  end

  it "scheduled job for all payments with unfinished status" do
    payment = create :payment

    PaymentStatusUpdaterJob.perform_async(payment.id)
    PaymentStatusUpdaterJob.drain

    expect(payment.reload.status).to eq("ACCP")
  end
end
