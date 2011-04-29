#年级与学期
class CreateCoursesAndBatches < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string     :course_name, :comment => "年级名称"
      t.string     :code, :comment => "年级代码"
      t.string     :section_name, :comment => "分段名称"
      t.boolean    :is_deleted, :default => false, :comment => "是否删除"
      t.timestamps
    end

    create_table :batches do |t|
      t.string     :name, :comment => "学期名称"
      t.references :course, :comment => "关联年级"
      t.datetime   :start_date, :comment => "开始时间"
      t.datetime   :end_date, :comment => "结束时间"
      t.boolean    :is_active, :default => true, :comment => "是否激活"
      t.boolean    :is_deleted, :default => false, :comment => "是否删除"
    end
  end

  def self.down
    drop_table :batches
    drop_table :courses
  end

end
