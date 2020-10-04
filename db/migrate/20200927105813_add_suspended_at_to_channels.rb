class AddSuspendedAtToChannels < ActiveRecord::Migration[6.0]
  def change
    add_column :channels, :suspended_at, :datetime
  end
end
