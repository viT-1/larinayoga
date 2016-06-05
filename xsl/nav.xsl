<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="original/nav-layScreen.xsl" />

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:variable name="nav_navRoot" select="document('nav.xml')/nav" />

<xsl:template match="nav//footer" mode="nav_header">
	<xsl:apply-templates><xsl:with-param name="is_header" select="true()" /></xsl:apply-templates>
</xsl:template>

<xsl:template match="nav//footer">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="nav//footer//*[@data-ly-class = 'yandexName']">
	<xsl:param name="is_header" />
	<a>
		<xsl:apply-templates select="@*" />
		<xsl:choose>
			<xsl:when test="$is_header"><h1><xsl:apply-templates /></h1></xsl:when>
			<xsl:otherwise><xsl:apply-templates /></xsl:otherwise>
		</xsl:choose>
	</a>
</xsl:template>

</xsl:stylesheet>