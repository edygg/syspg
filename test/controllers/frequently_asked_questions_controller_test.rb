require 'test_helper'

class FrequentlyAskedQuestionsControllerTest < ActionController::TestCase
  setup do
    @frequently_asked_question = frequently_asked_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequently_asked_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequently_asked_question" do
    assert_difference('FrequentlyAskedQuestion.count') do
      post :create, frequently_asked_question: { answer: @frequently_asked_question.answer, question: @frequently_asked_question.question }
    end

    assert_redirected_to frequently_asked_question_path(assigns(:frequently_asked_question))
  end

  test "should show frequently_asked_question" do
    get :show, id: @frequently_asked_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frequently_asked_question
    assert_response :success
  end

  test "should update frequently_asked_question" do
    patch :update, id: @frequently_asked_question, frequently_asked_question: { answer: @frequently_asked_question.answer, question: @frequently_asked_question.question }
    assert_redirected_to frequently_asked_question_path(assigns(:frequently_asked_question))
  end

  test "should destroy frequently_asked_question" do
    assert_difference('FrequentlyAskedQuestion.count', -1) do
      delete :destroy, id: @frequently_asked_question
    end

    assert_redirected_to frequently_asked_questions_path
  end
end
