class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery # :secret => '434571160a81b5595319c859d32060c1'
  filter_parameter_logging :password
  
  before_filter { |c| Authorization.current_user = c.current_user }
  before_filter :message_user
  before_filter :set_user_language

  def initialize
    @title = 'Xuedu'
  end

  def message_user
    @current_user = current_user
  end

  def current_user
    User.find(session[:user_id]) unless session[:user_id].nil?
  end

  
  def find_finance_managers
    Privilege.find_by_name('FinanceControl').users
  end

  def permission_denied
    flash[:notice] = t('msg.no_right')
    redirect_to :controller => 'user', :action => 'dashboard'
  end
  
  protected
  def login_required
    redirect_to '/' unless session[:user_id]
  end

  def configuration_settings_for_hr
    hr = Configuration.find_by_config_value("HR")
    if hr.nil?
      redirect_to :controller => 'user', :action => 'dashboard'
      flash[:notice] = t('msg.no_right')
    end
  end

  

  def configuration_settings_for_finance
    finance = Configuration.find_by_config_value("Finance")
    if finance.nil?
      redirect_to :controller => 'user', :action => 'dashboard'
      flash[:notice] = t('msg.no_right')
    end
  end

  def only_admin_allowed
    redirect_to :controller => 'user', :action => 'dashboard' unless current_user.admin?
  end

  def protect_other_student_data
    if current_user.student?
      student = Student.find_by_admission_no(current_user.username)
      unless params[:id].to_i == student.id or params[:student].to_i == student.id
        flash[:notice] = t('msg.no_view')
        redirect_to :controller=>"user", :action=>"dashboard"
      end
    end
  end

  def protect_other_employee_data
    if current_user.employee?
      employee = Employee.find_by_employee_number(current_user.username)
      #    pri = Privilege.find(:all,:select => "privilege_id",:conditions=> 'privileges_users.user_id = ' + current_user.id.to_s, :joins =>'INNER JOIN `privileges_users` ON `privileges`.id = `privileges_users`.privilege_id' )
      #    privilege =[]
      #    pri.each do |p|
      #      privilege.push p.privilege_id
      #    end
      #    unless privilege.include?('9') or privilege.include?('14') or privilege.include?('17') or privilege.include?('18') or privilege.include?('19')
      unless params[:id].to_i == employee.id
        flash[:notice] = t('msg.no_view')
        redirect_to :controller=>"user", :action=>"dashboard"
      end
    end
  end
  #  end

  #reminder filters
  def protect_view_reminders
    reminder = Reminder.find(params[:id2])
    unless reminder.recipient == current_user.id
      flash[:notice] = t('msg.no_view')
      redirect_to :controller=>"reminder", :action=>"index"
    end
  end

  def protect_sent_reminders
    reminder = Reminder.find(params[:id2])
    unless reminder.sender == current_user.id
      flash[:notice] = t('msg.no_view')
      redirect_to :controller=>"reminder", :action=>"index"
    end
  end

  #employee_leaves_filters
  def protect_leave_dashboard
    employee = Employee.find(params[:id])
    employee_user = employee.user
    unless employee_user.id == current_user.id
      flash[:notice] = t('msg.denied')
      redirect_to :controller=>"user", :action=>"dashboard"
    end
  end

  def protect_applied_leave
    applied_leave = ApplyLeave.find(params[:id])
    applied_employee = applied_leave.employee
    applied_employee_user = applied_employee.user
    unless applied_employee_user.id == current_user.id
      flash[:notice] = t('msg.denied')
      redirect_to :controller=>"user", :action=>"dashboard"
    end
  end

  def protect_manager_leave_application_view
    applied_leave = ApplyLeave.find(params[:id])
    applied_employee = applied_leave.employee
    applied_employees_manager = Employee.find(applied_employee.reporting_manager_id)
    applied_employees_manager_user = applied_employees_manager.user
    unless applied_employees_manager_user.id == current_user.id
      flash[:notice] = t('msg.denied')
      redirect_to :controller=>"user", :action=>"dashboard"
    end
  end

  #获取操作结果提示信息
  #@path 'user.create.success' 'user.create.failure'
  # user 为定义在activerecord.models下的model name
  #m('user.create.success') => 新增用户成功
  def m(path)
    a = path.split('.')
    m = t("activerecord.models.#{a[0]}")
    s = t("msg.#{a[1]}.#{a[2]}", :model => m)
  end

  private
  def set_user_language
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
    locale_path = "#{LOCALES_DIRECTORY}#{I18n.locale}.yml"
    unless I18n.load_path.include? locale_path
      I18n.load_path << locale_path
      I18n.backend.send(:init_translations)
    end
    rescue Exception => err
    logger.error err
    flash.now[:notice] = "#{I18n.locale} translation not available"
    I18n.load_path -= [locale_path]
    I18n.locale = session[:locale] = I18n.default_locale
    #I18n.locale = 'zh-CN'
  end
end
