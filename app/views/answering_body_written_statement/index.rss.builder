xml.rss( :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' ) do
  xml.channel do
    xml.title( "Written statements from the #{@answering_body.name}" )
    xml.description( "Updates whenever the #{@answering_body.name} provide either a written statement to Parliament." )
    xml.link( answering_body_written_statement_list_url( :answering_body => @answering_body.mnis_id ) )
    xml.copyright( 'https://www.parliament.uk/site-information/copyright-parliament/open-parliament-licence/' )
    xml.language( 'en-uk' )
    xml.managingEditor( 'somervillea@parliament.uk (Anya Somerville)' )
    xml.pubDate( @answering_body.written_statements.first.made_on.rfc822 ) unless @answering_body.written_statements.empty?
    xml.tag!( 'atom:link', { :href => answering_body_written_statement_list_url( :answering_body => @answering_body.mnis_id, :format => 'rss' ), :rel => 'self', :type => 'application/rss+xml' } )
    xml << render(:partial => 'written_statement/written_statement', :collection => @answering_body.written_statements ) unless @answering_body.written_statements.empty?
  end
end