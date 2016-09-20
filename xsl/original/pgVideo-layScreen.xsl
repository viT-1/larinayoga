<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="html[@data-ly-class = 'video']//*[@role = 'heading']/em">
	<xsl:variable name="date" select="../*[@property = 'dateCreated']/@content" />
	<xsl:variable name="date_href" select="translate( $date, '-', '' )" />
	
	<hr aria-hidden="true" />
	<h3 id="{translate($date, '-', '')}">
		<a class="iAnchor" href="#{$date_href}">#</a><span class="hTxt-date"><xsl:value-of select="translate($date, '-', '.')" /></span>: <xsl:apply-templates select="text()" />
	</h3>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'video']//*[@data-ly-class = 'lstVideo']/@data-ly-class">
	<xsl:attribute name="class">iList</xsl:attribute>
	<xsl:attribute name="ly-list">unstyled</xsl:attribute>
</xsl:template>

</xsl:stylesheet>