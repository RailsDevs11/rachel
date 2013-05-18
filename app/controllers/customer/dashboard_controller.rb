class Customer::DashboardController < Customer::BaseController
  before_filter :authenticate_customer!
  def index

  end
end
