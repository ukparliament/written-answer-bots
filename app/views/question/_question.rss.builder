xml.item do
  xml.guid( "https://questions-statements.parliament.uk/written-questions/detail/#{question.date_tabled}/#{question.uin}" )
  xml.title( question.title )
  xml.link( "https://questions-statements.parliament.uk/written-questions/detail/#{question.date_tabled}/#{question.uin}" )
  xml.pubDate( question.pertinent_date.rfc822 )
  xml.tag!("description") { xml.cdata!("<h2>Question</h2><p>#{question.question_text}</p><h2>Question</h2><p>#{question.answer_text}</p>]]>" ) }
end