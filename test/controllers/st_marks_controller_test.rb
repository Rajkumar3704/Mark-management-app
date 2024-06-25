require "test_helper"

class StMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @st_mark = st_marks(:one)
  end

  test "should get index" do
    get st_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_st_mark_url
    assert_response :success
  end

  test "should create st_mark" do
    assert_difference("StMark.count") do
      post st_marks_url, params: { st_mark: { course_id: @st_mark.course_id, course_title: @st_mark.course_title, credit: @st_mark.credit, mark: @st_mark.mark, name: @st_mark.name, roll_no: @st_mark.roll_no, s_id: @st_mark.s_id } }
    end

    assert_redirected_to st_mark_url(StMark.last)
  end

  test "should show st_mark" do
    get st_mark_url(@st_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_st_mark_url(@st_mark)
    assert_response :success
  end

  test "should update st_mark" do
    patch st_mark_url(@st_mark), params: { st_mark: { course_id: @st_mark.course_id, course_title: @st_mark.course_title, credit: @st_mark.credit, mark: @st_mark.mark, name: @st_mark.name, roll_no: @st_mark.roll_no, s_id: @st_mark.s_id } }
    assert_redirected_to st_mark_url(@st_mark)
  end

  test "should destroy st_mark" do
    assert_difference("StMark.count", -1) do
      delete st_mark_url(@st_mark)
    end

    assert_redirected_to st_marks_url
  end
end
