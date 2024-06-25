require "test_helper"

class StudentDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_detail = student_details(:one)
  end

  test "should get index" do
    get student_details_url
    assert_response :success
  end

  test "should get new" do
    get new_student_detail_url
    assert_response :success
  end

  test "should create student_detail" do
    assert_difference("StudentDetail.count") do
      post student_details_url, params: { student_detail: { address: @student_detail.address, blood_group: @student_detail.blood_group, dept: @student_detail.dept, dob: @student_detail.dob, email: @student_detail.email, first_name: @student_detail.first_name, gender: @student_detail.gender, last_name: @student_detail.last_name, parent_name: @student_detail.parent_name, parent_phone_no: @student_detail.parent_phone_no, phone: @student_detail.phone, roll_no: @student_detail.roll_no } }
    end

    assert_redirected_to student_detail_url(StudentDetail.last)
  end

  test "should show student_detail" do
    get student_detail_url(@student_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_detail_url(@student_detail)
    assert_response :success
  end

  test "should update student_detail" do
    patch student_detail_url(@student_detail), params: { student_detail: { address: @student_detail.address, blood_group: @student_detail.blood_group, dept: @student_detail.dept, dob: @student_detail.dob, email: @student_detail.email, first_name: @student_detail.first_name, gender: @student_detail.gender, last_name: @student_detail.last_name, parent_name: @student_detail.parent_name, parent_phone_no: @student_detail.parent_phone_no, phone: @student_detail.phone, roll_no: @student_detail.roll_no } }
    assert_redirected_to student_detail_url(@student_detail)
  end

  test "should destroy student_detail" do
    assert_difference("StudentDetail.count", -1) do
      delete student_detail_url(@student_detail)
    end

    assert_redirected_to student_details_url
  end
end
