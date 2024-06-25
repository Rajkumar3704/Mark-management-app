require "application_system_test_case"

class CourseStudentsTest < ApplicationSystemTestCase
  setup do
    @course_student = course_students(:one)
  end

  test "visiting the index" do
    visit course_students_url
    assert_selector "h1", text: "Course students"
  end

  test "should create course student" do
    visit course_students_url
    click_on "New course student"

    fill_in "C", with: @course_student.c_id
    fill_in "S", with: @course_student.s_id
    click_on "Create Course student"

    assert_text "Course student was successfully created"
    click_on "Back"
  end

  test "should update Course student" do
    visit course_student_url(@course_student)
    click_on "Edit this course student", match: :first

    fill_in "C", with: @course_student.c_id
    fill_in "S", with: @course_student.s_id
    click_on "Update Course student"

    assert_text "Course student was successfully updated"
    click_on "Back"
  end

  test "should destroy Course student" do
    visit course_student_url(@course_student)
    click_on "Destroy this course student", match: :first

    assert_text "Course student was successfully destroyed"
  end
end
