require 'test_helper'

class TryParticlesTest < ActionDispatch::IntegrationTest
  test "particles interface" do 
    get root_path
    assert_select "div.jumbotron.center-text"
  end
  
  test "particles location" do
    get particles_path
    assert_select "div.jumbotron.center-text"
  end
end
