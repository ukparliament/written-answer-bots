xml.item do
  xml.guid( "https://questions-statements.parliament.uk/written-questions/detail/#{question.date_tabled}/#{question.uin}" )
  xml.title( question.title )
  xml.link( "https://questions-statements.parliament.uk/written-questions/detail/#{question.date_tabled}/#{question.uin}" )
  xml.pubDate( question.pertinent_date.rfc822 )
  xml.tag!("description") { xml.cdata!("&lt;h2&gt;Question&lt;/h2&gt;&lt;p&gt#{question.question_text}&lt;/p&gt&lt;h2&gtQuestion&lt;/h2&gt&lt;p&gt#{question.answer_text}&lt;/p&gt>" ) }
end