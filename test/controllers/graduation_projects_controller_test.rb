require 'test_helper'

class GraduationProjectsControllerTest < ActionController::TestCase
  setup do
    @graduation_project = graduation_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graduation_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graduation_project" do
    assert_difference('GraduationProject.count') do
      post :create, graduation_project: { description: @graduation_project.description, name: @graduation_project.name, objective: @graduation_project.objective, requirements: @graduation_project.requirements }
    end

    assert_redirected_to graduation_project_path(assigns(:graduation_project))
  end

  test "should show graduation_project" do
    get :show, id: @graduation_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @graduation_project
    assert_response :success
  end

  test "should update graduation_project" do
    patch :update, id: @graduation_project, graduation_project: { description: @graduation_project.description, name: @graduation_project.name, objective: @graduation_project.objective, requirements: @graduation_project.requirements }
    assert_redirected_to graduation_project_path(assigns(:graduation_project))
  end

  test "should destroy graduation_project" do
    assert_difference('GraduationProject.count', -1) do
      delete :destroy, id: @graduation_project
    end

    assert_redirected_to graduation_projects_path
  end
end
