class ParticlesController < ApplicationController

  def create
    @particle = Particle.find(params[:id])
  end

end
