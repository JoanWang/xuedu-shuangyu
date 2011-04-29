#考试
class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.references :exam_group, :comment => "关联考试组"
      t.references :subject, :comment => "关联课程"
      t.datetime   :start_time, :comment => "开始时间"
      t.datetime   :end_time, :comment => "结束时间"
      t.integer    :maximum_marks, :comment => "最高分"
      t.integer    :minimum_marks, :comment => "最低分"
      t.references :grading_level, :comment => "关联等级水平"
      t.integer    :weightage, :default => 0, :comment => "权衡值"

      t.references :event, :comment => "关联活动"
      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end

end
