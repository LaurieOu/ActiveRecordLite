require_relative '03_associatable'

module Associatable

  def has_one_through(name, through_name, source_name)
    define_method(name) do

      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

      from_table = through_options.table_name
      from_fkey = through_options.foreign_key
      from_pkey = through_options.primary_key

      join_table = source_options.table_name
      join_pkey = source_options.primary_key
      join_fkey = source_options.foreign_key

      where_id = self.send(from_fkey)

      results = DBConnection.execute(<<-SQL, where_id)
        SELECT
          #{join_table}.*
        FROM
          #{from_table}
        JOIN
          #{join_table} ON #{from_table}.#{join_fkey} = #{join_table}.#{join_pkey}
        WHERE
          #{from_table}.#{from_pkey} = ?
      SQL

      source_options.model_class.parse_all(results).first
    end
  end
end
