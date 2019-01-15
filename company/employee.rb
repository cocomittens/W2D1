require "byebug"

class Employee
  attr_reader :name, :salary, :title, :boss

  def initialize(name, salary, title, boss = nil)
    # debugger
    @name = name
    @salary = salary
    @title = title
    @boss = boss
    boss.add_report(self) unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def inspect
    "<#{self.class.name}:#{@name}>"
  end

  
end

class Manager < Employee
  attr_accessor :reports

  def initialize(name, salary, title, boss)
    super(name, salary, title, boss)
    @reports = []
    @sub = []
  end
  
  def add_report(employee)
    @reports << employee
  end

  def bonus(multiplier)
    
    arr = []

    all_reports = @reports.flatten

    multiplier * all_reports.reduce(0) { |acc, employee| acc + employee.salary }
  end
  
  def inspect
    "<#{self.class.name}:#{@name},Reports:#{@reports}>"
  end

  def sub_employees
    sub_emps = []
    @reports.each do |employee|
      employee.is_a?(Manager) ? sub_emps += employee.sub_employees : sub_emps << employee
    end
    sub_emps << self
  end
end


ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)


p ned
p darren
p shawna
p david
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
p ned.sub_employees