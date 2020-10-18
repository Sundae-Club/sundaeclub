class ControlPanel::BaseController < ApplicationController
  before_action :authenticate_user!

  def authorize(record, query = nil)
    super([:control_panel, record], query)
  end
end
