class ControlPanel::BaseController < ApplicationController
  before_action :authenticate_user!
end
