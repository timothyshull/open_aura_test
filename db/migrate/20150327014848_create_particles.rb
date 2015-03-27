class CreateParticles < ActiveRecord::Migration
  def change
    create_table :particles do |t|
      t.string :provider_name
      t.string :particle_id
      t.string :particle_date

      t.timestamps null: false
    end
  end
end
