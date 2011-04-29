#职员信息
class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.references :employee_category, :comment => "关联职员类别"
      t.string     :employee_number, :comment => "员工号"
      t.date       :joining_date, :comment => "入职时间"
      t.string     :first_name, :comment => "名字"
      t.string     :middle_name, :comment => "中间名"
      t.string     :last_name, :comment => "姓氏"
      t.boolean    :gender, :comment => "性别"
      t.string     :job_title, :comment => "职位"
      t.references :employee_position, :comment => "关联职员职务"
      t.references :employee_department, :comment => "关联部门"
      t.integer    :reporting_manager_id, :comment => "上级领导"
      t.references :employee_grade, :comment => "关联职员等级"
      t.string     :qualification, :comment => "资格"
      t.text       :experience_detail, :comment => "工作经历"
      t.integer    :experience_year, :comment => "工龄"
      t.integer    :experience_month, :comment => "工作月数"
      t.boolean    :status, :comment => "状态"
      t.string     :status_description, :comment => "状态描述"

      t.date       :date_of_birth, :comment => "出生日期"
      t.string     :marital_status, :comment => "婚姻状况"
      t.integer    :children_count, :comment => "儿女数"
      t.string     :father_name, :comment => "父亲姓名"
      t.string     :mother_name, :comment => "母亲姓名"
      t.string     :husband_name, :comment => "配偶姓名"
      t.string     :blood_group, :comment => "血型"
      t.references :nationality, :comment => "国籍"

      
      t.string     :home_address_line1, :comment => "家庭地址1"
      t.string     :home_address_line2, :comment => "家庭地址2"
      t.string     :home_city, :comment => "家庭所在城市"
      t.string     :home_state, :comment => "家庭所在州"
      t.integer    :home_country_id, :comment => "家庭所在国家"
      t.string     :home_pin_code, :comment => "pin码"

      t.string     :office_address_line1, :comment => "办公地址1"
      t.string     :office_address_line2, :comment => "办公地址2"
      t.string     :office_city, :comment => "公司所在城市"
      t.string     :office_state, :comment => "公司所在州"
      t.integer    :office_country_id, :comment => "公司所在国家"
      t.string    :office_pin_code, :comment => "公司pin码"

      t.string     :office_phone1, :comment => "办公电话1"
      t.string     :office_phone2, :comment => "办公电话2"
      t.string     :mobile_phone, :comment => "手机号码"
      t.string     :home_phone, :comment => "家庭电话"
      t.string     :email, :comment => "email"
      t.string     :fax, :comment => "传真"

      t.column   :photo_filename,       :string, :comment => "照片名称"
      t.column   :photo_content_type,   :string, :comment => "照片类型"
      t.column   :photo_data,           :binary,
        :limit => 5.megabytes, :comment => "照片大小"

      t.timestamps
    end
    create_default
  end


  def self.down
    drop_table :employees
  end


    def self.create_default
     Employee.create :employee_number => 'admin',:joining_date => Date.today,:first_name => 'Admin',:last_name => 'Employee',
       :employee_department_id => 1,:employee_grade_id => 1,:employee_position_id => 1,:employee_category_id => 1,:status => true,:nationality_id =>'76', :date_of_birth => Date.today-365
  end

end
