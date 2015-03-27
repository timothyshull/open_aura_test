class AddForeignKeyToProviderName < ActiveRecord::Migration
  def change
    add_index :particles, :provider_name, name: 'provider_nm_ix'
  end
end
