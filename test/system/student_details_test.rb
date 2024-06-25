require "application_system_test_case"

class StudentDetailsTest < ApplicationSystemTestCase
  setup do
    @student_detail = student_details(:one)
  end

  test "visiting the index" do
    visit student_details_url
    assert_selector "h1", text: "Student details"
  end

  test "should create student detail" do
    visit student_details_url
    click_on "New student detail"

    fill_in "Address", with: @student_detail.address
    fill_in "Blood group", with: @student_detail.blood_group
    fill_in "Dept", with: @student_detail.dept
    fill_in "Dob", with: @student_detail.dob
    fill_in "Email", with: @student_detail.email
    fill_in "First name", with: @student_detail.first_name
    fill_in "Gender", with: @student_detail.gender
    fill_in "Last name", with: @student_detail.last_name
    fill_in "Parent name", with: @student_detail.parent_name
    fill_in "Parent phone no", with: @student_detail.parent_phone_no
    fill_in "Phone", with: @student_detail.phone
    fill_in "Roll no", with: @student_detail.roll_no
    click_on "Create Student detail"

    assert_text "Student detail was successfully created"
    click_on "Back"
  end

  test "should update Student detail" do
    visit student_detail_url(@student_detail)
    click_on "Edit this student detail", match: :first

    fill_in "Address", with: @student_detail.address
    fill_in "Blood group", with: @student_detail.blood_group
    fill_in "Dept", with: @student_detail.dept
    fill_in "Dob", with: @student_detail.dob
    fill_in "Email", with: @student_detail.email
    fill_in "First name", with: @student_detail.first_name
    fill_in "Gender", with: @student_detail.gender
    fill_in "Last name", with: @student_detail.last_name
    fill_in "Parent name", with: @student_detail.parent_name
    fill_in "Parent phone no", with: @student_detail.parent_phone_no
    fill_in "Phone", with: @student_detail.phone
    fill_in "Roll no", with: @student_detail.roll_no
    click_on "Update Student detail"

    assert_text "Student detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Student detail" do
    visit student_detail_url(@student_detail)
    click_on "Destroy this student detail", match: :first

    assert_text "Student detail was successfully destroyed"
  end
end
