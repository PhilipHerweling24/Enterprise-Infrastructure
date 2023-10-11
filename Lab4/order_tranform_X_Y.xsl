<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		
<xsl:template match="/">

	<xsl:element name="order_document">		
		<xsl:attribute name="order_id_number"><xsl:value-of select="order/@orderid"/></xsl:attribute>		
		    
		<person_responsible><xsl:value-of select="order/person" /></person_responsible>
		
		<parties>
			<ship_to_party>
				<name><xsl:value-of select="order/shipto/name" /></name>
				<address_info>
				  <address_line><xsl:value-of select="order/shipto/address" /></address_line>
				  <city><xsl:value-of select="order/shipto/city"/></city>
				  <destination_country> <xsl:value-of select="order/shipto/country"/></destination_country>				  
				</address_info>
			</ship_to_party>				
		</parties>
	  
	  	<items>
			<xsl:copy-of select="order/item" />
		</items>
	
		<quantity_total><xsl:value-of select="sum(order/item/quantity)"/></quantity_total>
			
		<order_total>  
			<xsl:call-template name="calculate_total">
				<xsl:with-param name="items" select="order/item"/>
				<xsl:with-param name="total" select="0"/>
			</xsl:call-template>
		</order_total>		
	
	</xsl:element>
	  
</xsl:template>

<xsl:template name="calculate_total">
	<xsl:param name="items"/>
	<xsl:param name="total" select="0" />

	<xsl:choose>
		<xsl:when test="$items">
			<xsl:variable name="first" select="$items[1]"/>
				<xsl:call-template name="calculate_total">
					<xsl:with-param name="items" select="$items[position()>1]"/>
					<xsl:with-param name="total" select="($first/quantity * $first/price) + $total"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="format-number($total, '###,##0.00')"/>
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>
	
</xsl:stylesheet>	
