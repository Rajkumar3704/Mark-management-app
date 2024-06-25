class StudentDetailsController < ApplicationController
  before_action :set_student_detail, only: %i[ show edit update destroy ]
  before_action :set_faculty_courses, only: [:show]
  # GET /student_details or /student_details.json
  def index

    @student_details = StudentDetail.where(user_id: current_user.id)
    if current_user.role == "admin"
      @student_details = StudentDetail.all
    elsif current_user.role == "faculty"
      # faculty_ids = Faculty.where(user_id: current_user.id).pluck(:faculty_id)
      # c_ids = Course.where(faculty_id: faculty_ids).pluck(:id)
      # c_codes = Course.where(faculty_id: faculty_ids).pluck(:course_code).map(&:to_i)
      # marked_sid = StMark.where(course_id: c_codes).pluck(:s_id)
      # sid = CourseStudent.where(c_id: c_ids).pluck(:s_id)
      # st = StudentDetail.where(user_id: sid)
      
      # @student_details = st.where.not(user_id: marked_sid)


      if params[:course_id].present?
        @students = @students.joins(:courses).where(courses: { id: params[:course_id] })
      else
        faculty_ids = Faculty.where(user_id: current_user.id).pluck(:faculty_id)
        c_ids = Course.where(faculty_id: faculty_ids).pluck(:id)
        c_codes = Course.where(faculty_id: faculty_ids).pluck(:course_code).map(&:to_i)
        sid = CourseStudent.where(c_id: c_ids).pluck(:s_id)
        @student_details= StudentDetail.where(user_id: sid)
      end
      

    end

  end


  # GET /student_details/1 or /student_details/1.json
  def show
  end

  # GET /student_details/new
  def new
    @student_detail = StudentDetail.new
  end

  # GET /student_details/1/edit
  def edit
  end

  # POST /student_details or /student_details.json   student_detail_url(@student_detail)
  def create
    @student_detail = StudentDetail.new(student_detail_params)

    respond_to do |format|
      if @student_detail.save
        format.html { redirect_to student_details_path, notice: "Student detail was successfully created." }
        format.json { render :show, status: :created, location: @student_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_details/1 or /student_details/1.json
  def update
    respond_to do |format|
      if @student_detail.update(student_detail_params)
        format.html { redirect_to student_details_path, notice: "Student detail was successfully updated." }
        format.json { render :show, status: :ok, location: @student_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_details/1 or /student_details/1.json
  def destroy
    @student_detail.destroy!

    respond_to do |format|
      format.html { redirect_to student_details_url, notice: "Student detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_detail
      @student_detail = StudentDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_detail_params
      params.require(:student_detail).permit(:first_name, :last_name, :roll_no, :gender, :dob, :address, :email, :phone, :blood_group, :dept, :parent_name, :parent_phone_no, :user_id)
    end

    def set_faculty_courses
      faculty_ids = Faculty.where(user_id: current_user.id).pluck(:faculty_id)
      @courses = Course.where(faculty_id: faculty_ids)
    end

end
