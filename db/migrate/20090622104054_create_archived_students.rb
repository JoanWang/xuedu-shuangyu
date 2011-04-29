#学生存档
class CreateArchivedStudents < ActiveRecord::Migration
  def self.up
    create_table :archived_students do |t|
      t.string     :admission_no, :comment => "学号" 
      t.string     :class_roll_no, :comment => "班级" 
      t.date       :admission_date, :comment => "入学日期" 

      t.string     :first_name, :comment => "姓" 
      t.string     :middle_name, :comment => "中间名" 
      t.string     :last_name, :comment => "名" 

      t.references :batch, :comment => "关联年度" 
      t.date       :date_of_birth, :comment => "出生日期" 
      t.string     :gender, :comment => "性别" 
      t.string     :blood_group, :comment => "血型" 
      t.string     :birth_place, :comment => "出生地" 
      t.integer    :nationality_id, :comment => "国籍" 
      t.string     :language, :comment => "语言" 
      t.string     :religion, :comment => "信仰" 
      t.references :student_category, :comment => "关联学生类型" 

      t.string     :address_line1, :comment => "住址1" 
      t.string     :address_line2, :comment => "住址2" 
      t.string     :city, :comment => "所在城市" 
      t.string     :state, :comment => "所在州" 
      t.string     :pin_code, :comment => "PIN码" 
      t.integer    :country_id, :comment => "国家" 

      t.string     :phone1, :comment => "电话1" 
      t.string     :phone2, :comment => "电话2" 
      t.string     :email, :comment => "email" 

      t.string     :photo_filename, :comment => "照片名称" 
      t.string     :photo_content_type, :comment => "照片类型" 
      t.binary     :photo_data, :limit => 5.megabytes, :comment => "照片大小" 

      t.string     :status_description, :comment => "状态描述" 
      t.boolean    :is_active, :default => true, :comment => "是否激活" 
      t.boolean    :is_deleted, :default => false, :comment => "是否删除" 

      t.references :immediate_contact, :comment => "关联通讯录" 
      t.boolean    :is_sms_enabled, :default=>true, :comment => "是否启用短信" 
      t.string     :former_id, :comment => "是否毕业" 

      t.timestamps
    end
  end

  def self.down
    drop_table :archived_students
  end

end
