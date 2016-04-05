class FrequentlyAskedQuestionsController < ApplicationController
  before_action :set_frequently_asked_question, only: [:show, :edit, :update, :destroy]

  # GET /frequently_asked_questions
  # GET /frequently_asked_questions.json
  def index
    @frequently_asked_questions = FrequentlyAskedQuestion.all
  end

  # GET /frequently_asked_questions/1
  # GET /frequently_asked_questions/1.json
  def show
  end

  # GET /frequently_asked_questions/new
  def new
    @frequently_asked_question = FrequentlyAskedQuestion.new
  end

  # GET /frequently_asked_questions/1/edit
  def edit
  end

  # POST /frequently_asked_questions
  # POST /frequently_asked_questions.json
  def create
    @frequently_asked_question = FrequentlyAskedQuestion.new(frequently_asked_question_params)

    respond_to do |format|
      if @frequently_asked_question.save
        format.html { redirect_to @frequently_asked_question, notice: 'Frequently asked question was successfully created.' }
        format.json { render :show, status: :created, location: @frequently_asked_question }
      else
        format.html { render :new }
        format.json { render json: @frequently_asked_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frequently_asked_questions/1
  # PATCH/PUT /frequently_asked_questions/1.json
  def update
    respond_to do |format|
      if @frequently_asked_question.update(frequently_asked_question_params)
        format.html { redirect_to @frequently_asked_question, notice: 'Frequently asked question was successfully updated.' }
        format.json { render :show, status: :ok, location: @frequently_asked_question }
      else
        format.html { render :edit }
        format.json { render json: @frequently_asked_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frequently_asked_questions/1
  # DELETE /frequently_asked_questions/1.json
  def destroy
    @frequently_asked_question.destroy
    respond_to do |format|
      format.html { redirect_to frequently_asked_questions_url, notice: 'Frequently asked question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frequently_asked_question
      @frequently_asked_question = FrequentlyAskedQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frequently_asked_question_params
      params.require(:frequently_asked_question).permit(:question, :answer)
    end
end
