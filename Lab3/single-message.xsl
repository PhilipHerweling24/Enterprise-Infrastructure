<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/">

	<b>To: </b> <xsl:value-of select="message/to"/><br/>
	<b>From: </b> <xsl:value-of select="message/from"/><br/>
	<b>Subject: </b> <xsl:value-of select="message/subject"/><br/>
	<b>Body: </b> <xsl:value-of select="message/body"/><br/>
	<br/>
		
</xsl:template>
 
</xsl:stylesheet>