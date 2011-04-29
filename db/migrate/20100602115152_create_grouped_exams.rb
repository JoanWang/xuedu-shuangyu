#考试组
class CreateGroupedExams < ActiveRecord::Migration
  def self.up
    create_table :grouped_exams do |t|
      t.references :exam_group, :comment => "关联考试组"
      t.references :batch, :comment => "关联学期"
    end
  end

  def self.down
    drop_table :grouped_exams
  end
end
