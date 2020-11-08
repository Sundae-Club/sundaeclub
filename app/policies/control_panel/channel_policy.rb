class ControlPanel::ChannelPolicy < ApplicationPolicy
  def show?
    user.organisation == record.site.organisation
  end
end
