class ProfessionalPracticesController < ApplicationController
  before_action :set_professional_practice, only: [:show, :edit, :update, :destroy]

  # GET /professional_practices
  # GET /professional_practices.json
  def index
    # TODO return only active ones
    @professional_practices = ProfessionalPractice.where(company_id: params[:company_id])
  end

  def search
    # TODO return only active ones
    @professional_practices = ProfessionalPractice.includes([:majors, :company]).where(active: true).order(charge: :asc)
    # if (params.has_key?(:majors))
    #   @professional_practices = @professional_practices.where(majors: { id: params[:majors] })
    # end
    #
    # if (params.has_key?(:search_text))
    #   @professional_practices.where("professional_practices.charge like '%:text%'", { text: params[:search_text] })
    # end
  end

  # GET /professional_practices/1
  # GET /professional_practices/1.json
  def show
  end

  # GET /professional_practices/new
  def new
    @professional_practice = ProfessionalPractice.new
  end

  # GET /professional_practices/1/edit
  def edit
  end

  # POST /professional_practices
  # POST /professional_practices.json
  def create
    @professional_practice = ProfessionalPractice.new(professional_practice_params)
    params[:selected_majors].each do |major|
      @professional_practice.majors << Major.find_by_id(major[:id])
    end

    respond_to do |format|
      if @professional_practice.save
        format.html { redirect_to @professional_practice, notice: 'Professional practice was successfully created.' }
        format.json { render :show, status: :created, location: @professional_practice }
      else
        format.html { render :new }
        format.json { render json: @professional_practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_practices/1
  # PATCH/PUT /professional_practices/1.json
  def update
    respond_to do |format|
      if @professional_practice.update(professional_practice_params)
        format.html { redirect_to @professional_practice, notice: 'Professional practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional_practice }
      else
        format.html { render :edit }
        format.json { render json: @professional_practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_practices/1
  # DELETE /professional_practices/1.json
  def destroy
    @professional_practice.destroy
    respond_to do |format|
      format.html { redirect_to professional_practices_url, notice: 'Professional practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_practice
      @professional_practice = ProfessionalPractice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_practice_params
      params.require(:professional_practice).permit(:area, :charge, :objective, :daily_tasks, :observation, :hire_probability, :flexitime, :company_id, :boss_name, :boss_email, :check_in, :check_out)
    end
end
