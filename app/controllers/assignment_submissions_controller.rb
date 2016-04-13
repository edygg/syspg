class AssignmentSubmissionsController < ApplicationController
  before_action :set_assignment_submission, only: [:show, :edit, :update, :destroy]

  # GET /assignment_submissions
  # GET /assignment_submissions.json
  def index
    @assignment_submissions = Assignment.find_by_id(params[:assignment_id]).assignment_submissions
  end

  # GET /assignment_submissions/1
  # GET /assignment_submissions/1.json
  def show
  end

  # GET /assignment_submissions/new
  def new
    @assignment_submission = AssignmentSubmission.new
  end

  # GET /assignment_submissions/1/edit
  def edit
  end

  # POST /assignment_submissions
  # POST /assignment_submissions.json
  def create
    @assignment_submission = AssignmentSubmission.new(assignment_submission_params)

    respond_to do |format|
      if @assignment_submission.save
        format.html { redirect_to @assignment_submission, notice: 'Assignment submission was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_submission }
      else
        format.html { render :new }
        format.json { render json: @assignment_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_submissions/1
  # PATCH/PUT /assignment_submissions/1.json
  def update
    respond_to do |format|
      if @assignment_submission.update(assignment_submission_params)
        format.html { redirect_to @assignment_submission, notice: 'Assignment submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_submission }
      else
        format.html { render :edit }
        format.json { render json: @assignment_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_submissions/1
  # DELETE /assignment_submissions/1.json
  def destroy
    @assignment_submission.destroy
    respond_to do |format|
      format.html { redirect_to assignment_submissions_url, notice: 'Assignment submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_submission
      @assignment_submission = AssignmentSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_submission_params
      params.require(:assignment_submission).permit(:assignment_id, :student_id, :assignment_file, :counseling_file)
    end
end
