class CreateParticles < ActiveRecord::Migration
  def change
    create_table :particles do |t|

      t.timestamps null: false
    end
  end
end
