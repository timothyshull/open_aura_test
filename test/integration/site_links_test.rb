require 'test_helper'

class SiteLinksTest < ActionDispatch::IntegrationTest
  
  test "page links" do
    get root_path
    assert_template 'particles/index'
    assert_select "a[href=?]", "http://openaura.com", count: 3
    assert_select "a[href=?]", "http://developer.openaura.com"
    assert_select "a[href=?]", "http://developer.openaura.com/docs/"
    assert_select "a[href=?]", "http://www.timothyshulljr.com/"
    assert_select "a[href=?]", "#"
  end
end
