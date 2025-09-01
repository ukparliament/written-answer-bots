xml.item do
  xml.guid( written_statement.url )
  xml.title( written_statement.title )
  xml.link( written_statement.url )
  xml.pubDate( written_statement.made_on.rfc822 )
end