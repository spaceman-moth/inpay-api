class Api::BaseController < ApplicationController
  private

  def authorized_customer
    # we should also check if current customer has
    # signature
    # app_id and app_secret

    application = Application.find_by(
      key:    request.headers["app-id"],
      secret: request.headers["app-secret"],
    )

    return render json: { status: "not authorized" }, status: 401 unless application.present?

    application.customer
  end
end
