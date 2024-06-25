require "application_system_test_case"

class StMarksTest < ApplicationSystemTestCase
  setup do
    @st_mark = st_marks(:one)
  end

  test "visiting the index" do
    visit st_marks_url
    assert_selector "h1", text: "St marks"
  end

  test "should create st mark" do
    visit st_marks_url
    click_on "New st mark"

    fill_in "Course", with: @st_mark.course_id
    fill_in "Course title", with: @st_mark.course_title
    fill_in "Credit", with: @st_mark.credit
    fill_in "Mark", with: @st_mark.mark
    fill_in "Name", with: @st_mark.name
    fill_in "Roll no", with: @st_mark.roll_no
    fill_in "S", with: @st_mark.s_id
    click_on "Create St mark"

    assert_text "St mark was successfully created"
    click_on "Back"
  end

  test "should update St mark" do
    visit st_mark_url(@st_mark)
    click_on "Edit this st mark", match: :first

    fill_in "Course", with: @st_mark.course_id
    fill_in "Course title", with: @st_mark.course_title
    fill_in "Credit", with: @st_mark.credit
    fill_in "Mark", with: @st_mark.mark
    fill_in "Name", with: @st_mark.name
    fill_in "Roll no", with: @st_mark.roll_no
    fill_in "S", with: @st_mark.s_id
    click_on "Update St mark"

    assert_text "St mark was successfully updated"
    click_on "Back"
  end

  test "should destroy St mark" do
    visit st_mark_url(@st_mark)
    click_on "Destroy this st mark", match: :first

    assert_text "St mark was successfully destroyed"
  end
end
