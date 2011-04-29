module SchoolsHelper

  def setup_compus(school)
    returning(school) do |c|
      c.classrooms.build if c.classrooms.empty?
    end
  end

end
