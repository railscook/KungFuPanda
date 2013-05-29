class AddContactColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :contact, :text
  end
end
