require 'test_helper'

class ThingToDosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thing_to_do = thing_to_dos(:one)
  end

  test "should get index" do
    get thing_to_dos_url
    assert_response :success
  end

  test "should get new" do
    get new_thing_to_do_url
    assert_response :success
  end

  test "should create thing_to_do" do
    assert_difference('ThingToDo.count') do
      post thing_to_dos_url, params: { thing_to_do: { attending: @thing_to_do.attending, description: @thing_to_do.description, name: @thing_to_do.name } }
    end

    assert_redirected_to thing_to_do_url(ThingToDo.last)
  end

  test "should show thing_to_do" do
    get thing_to_do_url(@thing_to_do)
    assert_response :success
  end

  test "should get edit" do
    get edit_thing_to_do_url(@thing_to_do)
    assert_response :success
  end

  test "should update thing_to_do" do
    patch thing_to_do_url(@thing_to_do), params: { thing_to_do: { attending: @thing_to_do.attending, description: @thing_to_do.description, name: @thing_to_do.name } }
    assert_redirected_to thing_to_do_url(@thing_to_do)
  end

  test "should destroy thing_to_do" do
    assert_difference('ThingToDo.count', -1) do
      delete thing_to_do_url(@thing_to_do)
    end

    assert_redirected_to thing_to_dos_url
  end
end
