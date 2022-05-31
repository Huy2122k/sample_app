require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get root page" do
    get root_path
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end
  test "should get about" do
    get about_path
    assert_response :success
  end
  test "should get help" do
    get helf_path
    assert_response :success
  end
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end
end
