class ParticlesController < ApplicationController
  
  # I am only allowing one action which corresponds to the initial empty page view as an index and the populated page view with constraints set
  def index
    particle = Particle.new
    particle.populate(params[:artist_id])
    namearray = Particle.pluck(:provider_name).uniq
    @particles = nil
    namearray.each do |item|
      if @particles.nil?
        @particles = Particle.where(provider_name: item).limit(params[:slice])
      else
        @particles += Particle.where(provider_name: item).limit(params[:slice])
      end
    end
  end
end
