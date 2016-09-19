<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="html[@data-ly-class = 'index']/body//*[@data-ly-class = 'img-primary']/@data-ly-class">
	<xsl:attribute name="class">img-responsive</xsl:attribute>
	<xsl:attribute name="style">float:right; margin:0 0 15px 15px;</xsl:attribute>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'index']/body//*[@data-ly-class = 'best_wishes']/@data-ly-class">
	<xsl:attribute name="class">hTxt-r</xsl:attribute>
</xsl:template>

</xsl:stylesheet>