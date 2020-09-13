class AddOrganisationIdToChannels < ActiveRecord::Migration[6.0]
  def change
    add_column :channels, :organisation_id, :bigint
  end
end
