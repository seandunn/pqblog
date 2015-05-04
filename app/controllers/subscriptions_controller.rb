class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.js {}
      else
        format.js { render 'fail' }
      end
    end

  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
  end

  def subscription_params
    params.require(:subscription).permit(:screen_name, :email)
  end
  private :subscription_params
end
