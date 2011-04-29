#增加考试分数
class CreateAdditionalExamScores < ActiveRecord::Migration
  def self.up
    create_table :additional_exam_scores do |t|
      t.references :student, :comment => "关联学生"
      t.references :additional_exam, :comment => "关联新增考试"
      t.decimal    :marks, :precision => 7, :scale => 2, :comment => "分数"
      t.references :grading_level, :comment => "关联等级水平"
      t.string     :remarks, :comment => "备注"
      t.boolean    :is_failed, :comment => "是否及格"
      t.timestamps
    end
  end

  def self.down
    drop_table :additional_exam_scores
  end
end
