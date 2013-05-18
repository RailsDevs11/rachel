class CustomerRegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_customer!, :only => [:update, :edit]
  layout 'dashboard', :only => [:edit, :update]

  def update
    # required for settings form to submit when password is left blank
    @customer = current_customer
    if @customer.update_without_password(params[:customer])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @customer, :bypass => true
      redirect_to customer_dashboard_index_path
    else
      render "edit_personal"
    end
  end

end
