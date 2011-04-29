#课程信息
class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string     :name, :comment => "课程名称"
      t.string     :code, :comment => "课程代码"
      t.references :batch, :comment => "关联学期"
      t.references :classroom, :comment => "关联教室"
      t.boolean    :no_exams, :default=>false, :comment => "关联考试"
      t.boolean    :no_classroom, :default=>false, :comment => "关联教室"
      t.integer    :max_weekly_classes, :comment => "一周最多多少节课程"
      t.references :elective_group, :comment => "关联选修组"
      t.boolean    :is_deleted, :default => false, :comment => "是否删除"
      t.timestamps
    end
  end

  def self.down
    drop_table :subjects
  end

end
