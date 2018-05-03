require('pg')
require_relative('../db/sql_runner')
require_relative('../db/sql_runner')



class Student
attr_reader :id, :first_name, :last_name, :house_name, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options["last_name"]
    @house_name = options["house_name"]
    @age = options["age"].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_name, age) values ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house_name, @age]
    student = SqlRunner.run(sql, values).first()
    @id = student["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    SqlRunner.run(sql)
  end
  
end