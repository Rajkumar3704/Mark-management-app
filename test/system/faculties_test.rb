require "application_system_test_case"

class FacultiesTest < ApplicationSystemTestCase
  setup do
    @faculty = faculties(:one)
  end

  test "visiting the index" do
    visit faculties_url
    assert_selector "h1", text: "Faculties"
  end

  test "should create faculty" do
    visit faculties_url
    click_on "New faculty"

    fill_in "Faculty", with: @faculty.Faculty_id
    fill_in "Address", with: @faculty.address
    fill_in "Department", with: @faculty.department
    fill_in "Dob", with: @faculty.dob
    fill_in "Email", with: @faculty.email
    fill_in "First name", with: @faculty.first_name
    fill_in "Gender", with: @faculty.gender
    fill_in "Last name", with: @faculty.last_name
    fill_in "Phone", with: @faculty.phone
    click_on "Create Faculty"

    assert_text "Faculty was successfully created"
    click_on "Back"
  end

  test "should update Faculty" do
    visit faculty_url(@faculty)
    click_on "Edit this faculty", match: :first

    fill_in "Faculty", with: @faculty.Faculty_id
    fill_in "Address", with: @faculty.address
    fill_in "Department", with: @faculty.department
    fill_in "Dob", with: @faculty.dob
    fill_in "Email", with: @faculty.email
    fill_in "First name", with: @faculty.first_name
    fill_in "Gender", with: @faculty.gender
    fill_in "Last name", with: @faculty.last_name
    fill_in "Phone", with: @faculty.phone
    click_on "Update Faculty"

    assert_text "Faculty was successfully updated"
    click_on "Back"
  end

  test "should destroy Faculty" do
    visit faculty_url(@faculty)
    click_on "Destroy this faculty", match: :first

    assert_text "Faculty was successfully destroyed"
  end
end
