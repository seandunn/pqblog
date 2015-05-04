class MakeSubscriptionsUnique < ActiveRecord::Migration
  def change
    change_column_null :subscriptions, :email, false
  end
end
