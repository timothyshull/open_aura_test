class Particle < ActiveRecord::Base
  require 'open-uri'
  require 'json'
  include QueryApi
  
  # For CRUD actions I just use the actions inherited from ActivRecord::Base. The methods here take care of making the API call and populating and re-indexing the database on each query
  def populate(artist_id)
    if Particle.exists?
      Particle.delete_all
      Particle.reset_pk_sequence
    end
    response = Particle.new.query_api( artist_id )
    unless response.nil?
      response[:particles].each do |item|
        @particle = Particle.new
        @particle.provider_name = item[:source][:provider][:name]
        @particle.particle_date = item[:date]
        @particle.particle_id = item[:oa_particle_id]
        @particle.save
      end
    end
  end
  
  # https://github.com/splendeo/activerecord-reset-pk-sequence
  def self.reset_pk_sequence
    case ActiveRecord::Base.connection.adapter_name
    when 'SQLite'
      new_max = maximum(primary_key) || 0
      update_seq_sql = "UPDATE sqlite_sequence SET seq = #{new_max} WHERE name = '#{table_name}';"
      ActiveRecord::Base.connection.execute(update_seq_sql)
    when 'Mysql'
      new_max = maximum(primary_key) + 1 || 1
      update_seq_sql = "ALTER TABLE '#{table_name}' AUTO_INCREMENT = #{new_max};"
      ActiveRecord::Base.connection.execute(update_seq_sql)
    when 'PostgreSQL'
      ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
    else 
      raise "Task not implemented for this DB adapter"
    end 
  end
end
