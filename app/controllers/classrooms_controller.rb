class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.where(major_id: params[:major_id], campu_id: params[:campus_id]).order(created_at: :desc)
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  def get_student_list
    @students = Classroom.find_by_id(params[:classroom_id]).students
  end

  def add_student_to_classroom
    if Classroom.find_by_id(params[:classroom_id]).students.find_by_id(params[:student_id]).nil?
      Classroom.find_by_id(params[:classroom_id]).students << Student.find_by_id(params[:student_id])
    end
    respond_to do |format|
      format.html
      format.json { render json: :ok }
    end
  end

  def delete_student_from_classroom
    Classroom.find_by_id(params[:classroom_id]).students.delete(Student.find_by_id(params[:student_id]))
    respond_to do |format|
      format.html
      format.json { render json: :ok }
    end
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'Classroom was successfully created.' }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: 'Classroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:section, :academy_id, :subject_id, :quarter_id, :major_id, :campu_id)
    end
end
