class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :register_event_listeners

  def register_event_listeners(&around_listener_block)
    Wisper.with_listeners(ArticleListener.new) do
      around_listener_block.call
    end
  end        
end
