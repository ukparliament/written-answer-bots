xml.rss( :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' ) do
  xml.channel do
    xml.title( "Written statements" )
    xml.description( "Updates whenever a government minister makes a written statement to Parliament." )
    xml.link( written_statement_list_url )
    xml.copyright( 'https://www.parliament.uk/site-information/copyright-parliament/open-parliament-licence/' )
    xml.language( 'en-uk' )
    xml.managingEditor( 'somervillea@parliament.uk (Anya Somerville)' )
    xml.pubDate( @written_statements.first.made_on.rfc822 ) unless @written_statements.empty?
    xml.tag!( 'atom:link', { :href => written_statement_list_url( :format => 'rss' ), :rel => 'self', :type => 'application/rss+xml' } )
    xml << render(:partial => 'written_statement/written_statement', :collection => @written_statements ) unless @written_statements.empty?
  end
end