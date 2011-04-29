#额外考试分组
class CreateAdditionalExamGroups < ActiveRecord::Migration
  def self.up
    create_table :additional_exam_groups do |t|
      t.string     :name, :comment => "名称"
      t.references :batch, :comment => "关联年度"
      t.string     :exam_type, :comment => "考试类型"
      t.boolean    :is_published, :default=>false, :comment => "是否发布"
      t.boolean    :result_published, :default=>false, :comment => "发布结果"
      t.string     :students_list, :comment => "学生清单"
      t.date       :exam_date, :comment => "考试日期"
    end
  end
  
  def self.down
    drop_table :additional_exam_groups
  end
end
