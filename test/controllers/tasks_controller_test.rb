require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { name: 'task1', description: 'this is a sample description', category_id: 1 } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { name: 'sample task', description: 'this is a sample description', category_id: 1 } }
    assert_redirected_to task_url(@task)
  end

  test "should not update task when name is empty" do
    patch task_url(@task), params: { task: { name: '', description: "sample task description", category_id: 1 } }
    assert_response :unprocessable_entity
  end

  test "should not update task when name is longer than 20 characters" do
    patch task_url(@task), params: { task: { name: 'This name is looooonger than 20 characters', description: "sample task description", category_id: 1 } }
    assert_response :unprocessable_entity
  end

  test "should not update task when description is empty" do
    patch task_url(@task), params: { task: { name: 'task1', description: '', category_id: 1 } }
    assert_response :unprocessable_entity
  end

  test "should not update task when description is shorter than 10 characters" do
    patch task_url(@task), params: { task: { name: 'task1', description: 'desc', category_id: 1 } }
    assert_response :unprocessable_entity
  end

  test "should not update task when description is longer than 100 characters" do
    patch task_url(@task), params: { task: { name: 'task1', description: 'Lorem ipsum keme keme keme 48 years kemerloo jowa matod pamenthol wiz at ang ugmas buya sa krung-krung na shonga tanders majonders keme.', category_id: 1 } }
    assert_response :unprocessable_entity
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
