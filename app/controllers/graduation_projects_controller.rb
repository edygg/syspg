class GraduationProjectsController < ApplicationController
  before_action :set_graduation_project, only: [:show, :edit, :update, :destroy]

  # GET /graduation_projects
  # GET /graduation_projects.json
  def index
    @graduation_projects = GraduationProject.where(company_id: params[:company_id])
  end

  def search
    # TODO return only active ones
    @graduation_projects = GraduationProject.includes([:majors, :company]).where(active: true).order(name: :asc)
  end

  # GET /graduation_projects/1
  # GET /graduation_projects/1.json
  def show
  end

  # GET /graduation_projects/new
  def new
    @graduation_project = GraduationProject.new
  end

  # GET /graduation_projects/1/edit
  def edit
  end

  # POST /graduation_projects
  # POST /graduation_projects.json
  def create
    @graduation_project = GraduationProject.new(graduation_project_params)
    params[:selected_majors].each do |major|
      @graduation_project.majors << Major.find_by_id(major[:id])
    end

    respond_to do |format|
      if @graduation_project.save
        format.html { redirect_to @graduation_project, notice: 'Graduation project was successfully created.' }
        format.json { render :show, status: :created, location: @graduation_project }
      else
        format.html { render :new }
        format.json { render json: @graduation_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graduation_projects/1
  # PATCH/PUT /graduation_projects/1.json
  def update
    respond_to do |format|
      if @graduation_project.update(graduation_project_params)
        format.html { redirect_to @graduation_project, notice: 'Graduation project was successfully updated.' }
        format.json { render :show, status: :ok, location: @graduation_project }
      else
        format.html { render :edit }
        format.json { render json: @graduation_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduation_projects/1
  # DELETE /graduation_projects/1.json
  def destroy
    @graduation_project.destroy
    respond_to do |format|
      format.html { redirect_to graduation_projects_url, notice: 'Graduation project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graduation_project
      @graduation_project = GraduationProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graduation_project_params
      params.require(:graduation_project).permit(:name, :description, :objective, :requirements, :company_id)
    end
end
