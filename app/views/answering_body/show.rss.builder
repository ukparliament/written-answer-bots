xml.rss( :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' ) do
  xml.channel do
    xml.title( "Written answers to parliamentary questions from the #{@answering_body.name}" )
    xml.description( "Updates whenever the #{@answering_body.name} provide either a written answer to a parliamentary question or a written correction to an earlier answer." )
    xml.link( answering_body_show_url( :answering_body => @answering_body.mnis_id ) )
    xml.copyright( 'https://www.parliament.uk/site-information/copyright-parliament/open-parliament-licence/' )
    xml.language( 'en-uk' )
    xml.managingEditor( 'somervillea@parliament.uk (Anya Somerville)' )
    xml.pubDate( @answering_body.questions.first.pertinent_date.rfc822 ) unless @answering_body.questions.empty?
    xml.tag!( 'atom:link', { :href => answering_body_show_url( :answering_body => @answering_body.mnis_id, :format => 'rss' ), :rel => 'self', :type => 'application/rss+xml' } )
    xml << render(:partial => 'answer/answer', :collection => @answering_body.questions ) unless @answering_body.questions.empty?
  end
end