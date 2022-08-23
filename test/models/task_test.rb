require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without a Category" do
    task = Task.new
    task.name = 'Chorva'
    task.description = 'cheneseeeeee'
    task.deadline = DateTime.current
    assert_not task.save, "Saved the task without Category"
  end

  test "should not save without Deadline" do
    task = Task.new
    task.name = 'Chorva'
    task.description = 'cheneseeeee'
    task.category_id = 1
    assert_not task.save, "Saved the task without Deadline"
  end

  test "should not save Task with empty name" do
    task = Task.new
    task.description = 'task bla bal abl ablabla'
    task.category_id = 1
    task.deadline = DateTime.current
    assert_not task.save, "Saved the Task with empty name"
  end

  test "should not save Task with name longer than 20 characters" do
    task = Task.new
    task.name = 'This is a task name with more than 20 charactersssss'
    task.description = 'Description here'
    task.category_id = 1
    task.deadline = DateTime.current
    assert_not task.save, "Saved the task with name more than 20 characters"
  end
  
  test "should not save Task with empty description" do
    task = Task.new
    task.name = 'task'
    task.category_id = 1
    task.deadline = DateTime.current
    assert_not task.save, "Saved the Task with empty description"
  end
  
  test "should not save Task with description shorter than 10 characters" do
    task = Task.new
    task.name = 'task'
    task.description = 'Desc'
    task.category_id = 1
    task.deadline = DateTime.current
    assert_not task.save, "Saved the Task with description shorter than 10 characters"
  end

  test "should not save Task with description longer than 100 characters" do
    task = Task.new
    task.name = 'task'
    task.description = 'Lorem ipsum keme keme keme 48 years pamenthol jowabella ng shontis nang jongoloids oblation na ang pranella'
    task.category_id = 1
    task.deadline = DateTime.current
    assert_not task.save, "Saved the Task with description longer than 100 characters"
  end
end
