xml.rss( :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' ) do
  xml.channel do
    xml.title( "Written answers to parliamentary questions" )
    xml.description( "Updates whenever an answering body provides either a written answer to a parliamentary question or a written correction to an earlier answer." )
    xml.link( answer_list_url )
    xml.copyright( 'https://www.parliament.uk/site-information/copyright-parliament/open-parliament-licence/' )
    xml.language( 'en-uk' )
    xml.managingEditor( 'somervillea@parliament.uk (Anya Somerville)' )
    xml.pubDate( @answers.first.pertinent_date.rfc822 ) unless @answers.empty?
    xml.tag!( 'atom:link', { :href => answer_list_url( :format => 'rss' ), :rel => 'self', :type => 'application/rss+xml' } )
    xml << render(:partial => 'answer/answer', :collection => @answers ) unless @answers.empty?
  end
end