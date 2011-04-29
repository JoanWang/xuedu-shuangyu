#新增考试
class CreateAdditionalExams < ActiveRecord::Migration
  def self.up
    create_table :additional_exams do |t|
      t.references :additional_exam_group, :comment => "关联增加考试分组"
      t.references :subject, :comment => "关联课程"
      t.datetime   :start_time, :comment => "开始时间"
      t.datetime   :end_time, :comment => "结束时间"
      t.integer    :maximum_marks, :comment => "最高分"
      t.integer    :minimum_marks, :comment => "最低分"
      t.references :grading_level, :comment => "等级水平"
      t.integer    :weightage, :default => 0, :comment => "分量"

      t.references :event, :comment => "关联事件"
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_exams
  end
end
