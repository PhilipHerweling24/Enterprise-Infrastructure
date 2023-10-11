<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/">

<!-- A root element of "messages" was added to the XML source -->
  <xsl:for-each select="messages/message">

	<b>To: </b> <xsl:value-of select="to"/>
	<br/>
	<b>From: </b> <xsl:value-of select="from"/>
	<br/>
	<b>Subject: </b> <xsl:value-of select="subject"/>
	<br/>
	<b>Body: </b> <xsl:value-of select="body"/>
	<br/>
	<br/>
	
  </xsl:for-each>
	
</xsl:template>
 
</xsl:stylesheet>