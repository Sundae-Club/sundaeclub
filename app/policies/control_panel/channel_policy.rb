class ControlPanel::ChannelPolicy < ApplicationPolicy
  def show?
    user.organisation == record.organisation
  end
end
