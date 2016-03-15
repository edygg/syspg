require 'test_helper'

class ProfessionalPracticesControllerTest < ActionController::TestCase
  setup do
    @professional_practice = professional_practices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professional_practices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professional_practice" do
    assert_difference('ProfessionalPractice.count') do
      post :create, professional_practice: { area: @professional_practice.area, charge: @professional_practice.charge, daily_tasks: @professional_practice.daily_tasks, flexitime: @professional_practice.flexitime, hire_probability: @professional_practice.hire_probability, objective: @professional_practice.objective, observation: @professional_practice.observation }
    end

    assert_redirected_to professional_practice_path(assigns(:professional_practice))
  end

  test "should show professional_practice" do
    get :show, id: @professional_practice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professional_practice
    assert_response :success
  end

  test "should update professional_practice" do
    patch :update, id: @professional_practice, professional_practice: { area: @professional_practice.area, charge: @professional_practice.charge, daily_tasks: @professional_practice.daily_tasks, flexitime: @professional_practice.flexitime, hire_probability: @professional_practice.hire_probability, objective: @professional_practice.objective, observation: @professional_practice.observation }
    assert_redirected_to professional_practice_path(assigns(:professional_practice))
  end

  test "should destroy professional_practice" do
    assert_difference('ProfessionalPractice.count', -1) do
      delete :destroy, id: @professional_practice
    end

    assert_redirected_to professional_practices_path
  end
end
