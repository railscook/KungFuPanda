require 'socket'
webserver = TCPServer.new('127.0.0.1', 7125)
while(session = webserver.accept)
	session.print "HTTP/1.1 200/OK\rContent-type:text/xml\r\n\r\n"
	session.print <<-XML
		<sessions>
			<session>
				<name>Jeffrey Wilcke</name>
				<password>secter</password>
				<email>someemail@gmail.com</email>
			</session>
		</sessions>
	XML

	session.close
end
