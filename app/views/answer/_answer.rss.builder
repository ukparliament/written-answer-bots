xml.item do
  xml.guid( "https://questions-statements.parliament.uk/written-questions/detail/#{answer.date_tabled}/#{answer.uin}" )
  xml.title( answer.title )
  xml.link( "https://questions-statements.parliament.uk/written-questions/detail/#{answer.date_tabled}/#{answer.uin}" )
  xml.pubDate( answer.pertinent_date.rfc822 )
  xml.tag!("description") { xml.cdata!("<p>[Question] #{answer.question_text}</p> <p>[Answer] #{answer.answer_text}</p>" ) }
end