require 'test_helper'

class ParticlesControllerTest < ActionController::TestCase
  def setup
    @particle = particles(:one)
    @particle_two = particles(:two)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
end
