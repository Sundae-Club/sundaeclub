class ControlPanel::ChannelPolicy < ApplicationPolicy
  def show?
    user.present?
  end
end
