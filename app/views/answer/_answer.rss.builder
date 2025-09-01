xml.item do
  xml.guid( answer.url )
  xml.title( answer.title )
  xml.link( answer.url )
  xml.pubDate( answer.pertinent_date.rfc822 )
  xml.tag!("description") { xml.cdata!("<p>[Question] #{answer.question_text}</p> <p>[Answer] #{answer.answer_text}</p>" ) }
end