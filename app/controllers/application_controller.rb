class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :device_variant, :set_view_path


  private

  def is_mobile?
    request.user_agent =~ /iPhone|iPad|Android/
  end


  def device_variant
    request.variant = :mobile if is_mobile?
  end


  def set_view_path
    path =  is_mobile? ? 'mobile' : 'pc'
    prepend_view_path Rails.root + 'app/views/' + path
  end
end
