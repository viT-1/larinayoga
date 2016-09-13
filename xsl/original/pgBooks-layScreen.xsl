<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="html[@data-ly-class = 'books']//*[@data-ly-class = 'lstBooks']/@data-ly-class">
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-list" />
</xsl:template>

<xsl:template match="html[@data-ly-class = 'books']//*[@data-ly-class = 'lstBooks']//img/@src">
	<xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute>
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-imgThumb">paspartu</xsl:attribute>
	<xsl:attribute name="title">
		<xsl:value-of select="ancestor::*[@typeof = 'Book']/meta[@property = 'author']/@content"/>. <xsl:value-of select="ancestor::*[@typeof = 'Book']/meta[@property = 'name']/@content"/>
	</xsl:attribute>
</xsl:template>

</xsl:stylesheet>