class Customer::ProfilesController < Customer::BaseController
  before_filter :authenticate_customer!

  def show
    @customer = Customer.find(current_customer)
  end

  def change_password
    @resource = current_customer
    is_update = @resource.update_with_password(
      :password => params[:customer][:password],
      :password_confirmation => params[:customer][:password_confirmation], 
      :current_password => params[:customer][:current_password]
    )
    if is_update
      flash[:notice] = "Password updated successfully"
      sign_in @resource, :bypass => true
      redirect_to customer_dashboard_index_path
    end
  end

  def change_username
    @resource = current_customer
    is_update = @resource.update_without_password(:username => params[:customer][:username])
    if @resource.update_without_password(:username => params[:customer][:username])
      flash[:notice] = "Username updated successfully"
      sign_in @resource, :bypass => true
      redirect_to customer_dashboard_index_path
    end
  end
end
