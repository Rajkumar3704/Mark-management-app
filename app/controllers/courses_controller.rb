class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    enrolled_course_ids = CourseStudent.where(s_id: current_user.id).pluck(:c_id)
    @courses = Course.where.not(id: enrolled_course_ids)
    @Enroll_courses = Course.where(id: enrolled_course_ids)

    if current_user.role == "faculty" 
        faculty_ids =  Faculty.where(user_id: current_user.id).pluck(:faculty_id)
        c_ids = Course.where(faculty_id: faculty_ids).pluck(:id)
        sid = CourseStudent.where(c_id: c_ids).pluck(:s_id)
        @Students = StudentDetail.where(user_id: sid)
        @courses = Course.where(faculty_id: faculty_ids)

    end
    # @courses =Course.all;
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end


    def enroll
      @course = CourseStudent.new(c_id: params[:id], s_id: current_user.id)
  
      if @course.save
        flash[:notice] = 'Course enrolled successfully!'
        redirect_to courses_path
      else
        flash[:alert] = 'Failed to enroll in course.'
        render :index
      end
    end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_title, :description, :course_code, :credits, :faculty_id)
    end



end
