require_relative 'db_connection'
require 'active_support/inflector'


class SQLObject
  def self.columns
    if @columns
      return @columns
    else
      db_info = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          cats
       SQL

       @columns =  db_info[0].map {|column| column.to_sym}
       return @columns
    end
  end

  def self.finalize!
    self.columns.each do |column|
      define_method("#{column}") do
        attributes[column]
      end

      define_method("#{column}=") do |argument|
        attributes[column] = argument
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    return "humans" if self.to_s == "Human"

    str_of_class = self.to_s
    str_of_class.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if !self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      else
        self.send "#{attr_name}=".to_sym, value
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
