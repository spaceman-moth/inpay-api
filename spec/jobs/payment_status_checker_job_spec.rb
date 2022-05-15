require 'rails_helper'

RSpec.describe PaymentStatusCheckerJob, type: :job do
  it "is scheduled" do
    expect {
      PaymentStatusCheckerJob.perform_async
    }.to change(PaymentStatusCheckerJob.jobs, :size).by(1)
  end

  it "scheduled job for all payments with unfinished status" do
    create_list :payment, 3

    PaymentStatusCheckerJob.perform_async
    PaymentStatusCheckerJob.drain

    expect(PaymentStatusUpdaterJob.jobs.size).to eq(3)
  end
end
