#考试成绩
class CreateArchivedExamScores < ActiveRecord::Migration
  def self.up
    create_table :archived_exam_scores do |t|
      t.references :student, :comment => "关联学生"
      t.references :exam, :comment => "关联考试"
      t.decimal    :marks, :precision => 7, :scale => 2, :comment => "成绩"
      t.references :grading_level, :comment => "关联等级水平"
      t.string     :remarks, :comment => "备注"
      t.boolean    :is_failed, :comment => "是否通过"
      t.timestamps
    end
  end

  def self.down
    drop_table :archived_exam_scores
  end
end
