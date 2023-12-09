class WrittenStatementController < ApplicationController
  
  def index
    @written_statements = WrittenStatement.find_by_sql(
      "
        SELECT ws.*, m.display_name AS member_name, ab.name AS answering_body_name
        FROM written_statements ws, members m, answering_bodies ab
        WHERE ws.member_id = m.id
        AND ws.answering_body_id = ab.id
        ORDER BY ws.made_on DESC
      "
    )
  end
end
