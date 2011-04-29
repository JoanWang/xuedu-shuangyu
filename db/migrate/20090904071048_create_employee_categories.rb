#职员类别
class CreateEmployeeCategories < ActiveRecord::Migration
  def self.up
    create_table :employee_categories do |t|
      t.string :name, :comment => "名称"
      t.string :prefix, :comment => "前缀"
      t.boolean :status, :comment => "状态"
    end
    create_default
  end

  def self.down
    drop_table :employee_categories
  end

   def self.create_default
     EmployeeCategory.create :name => 'Fedena Admin',:prefix => 'Admin',:status => true
  end
end
