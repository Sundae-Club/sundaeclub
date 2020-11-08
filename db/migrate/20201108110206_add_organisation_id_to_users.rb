class AddOrganisationIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :organisation, null: false, foreign_key: true
  end
end
