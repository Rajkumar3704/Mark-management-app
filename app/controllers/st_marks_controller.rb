class StMarksController < ApplicationController
  before_action :set_st_mark, only: %i[ show edit update destroy ]

  # GET /st_marks or /st_marks.json
  def index

    if current_user.role == "faculty" 
      faculty_ids =  Faculty.where(user_id: current_user.id).pluck(:faculty_id)
      c_ids = Course.where(faculty_id: faculty_ids).pluck(:course_code)
      @st_marks = StMark.where(course_id: c_ids) 

    elsif current_user.role == "student"
      c_id = Course.all.pluck(:course_code)
      @st_marks = StMark.where(s_id: current_user.id,course_id: c_id)

    else
      @st_marks = StMark.all
      
    end

  end

  # GET /st_marks/1 or /st_marks/1.json
  def show
  end

  # GET /st_marks/new
  def new
    #@st_mark = StMark.new
    @st_mark = StMark.new(name: params[:name],course_id: params[:course_id], s_id: params[:s_id], credit: params[:credit],course_title: params[:course_title])
  end

  # GET /st_marks/1/edit
  def edit
  end

  # POST /st_marks or /st_marks.json
  def create
    @st_mark = StMark.new(st_mark_params)

    respond_to do |format|
      if @st_mark.save
        format.html { redirect_to st_marks_path, notice: "St mark was successfully created." }
        format.json { render :show, status: :created, location: @st_mark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @st_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /st_marks/1 or /st_marks/1.json
  def update
    respond_to do |format|
      if @st_mark.update(st_mark_params)
        format.html { redirect_to st_marks_path, notice: "St mark was successfully updated." }
        format.json { render :show, status: :ok, location: @st_mark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @st_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /st_marks/1 or /st_marks/1.json
  def destroy
    @st_mark.destroy!

    respond_to do |format|
      format.html { redirect_to st_marks_url, notice: "St mark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_st_mark
      @st_mark = StMark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def st_mark_params
      params.require(:st_mark).permit(:name, :roll_no, :course_title, :course_id, :credit, :mark, :s_id)
    end
end
