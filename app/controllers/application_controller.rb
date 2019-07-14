class ApplicationController < ActionController::Base
  def current_cart
    if user_signed_in?
      Cart.find_or_create_by(
        user_id: current_user.id
      )
    end
  end
  helper_method :current_cart
end
