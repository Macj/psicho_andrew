require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { coast_dl: @course.coast_dl, coast_hr: @course.coast_hr, coast_rb: @course.coast_rb, description: @course.description, programm: @course.programm, shipping_type: @course.shipping_type, term: @course.term, title: @course.title, video: @course.video }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @course, course: { coast_dl: @course.coast_dl, coast_hr: @course.coast_hr, coast_rb: @course.coast_rb, description: @course.description, programm: @course.programm, shipping_type: @course.shipping_type, term: @course.term, title: @course.title, video: @course.video }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
