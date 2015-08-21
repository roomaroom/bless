class AddFieldsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :testimony, :text
    add_column :profiles, :quote, :string
  end
end
