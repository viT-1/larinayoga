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
	<xsl:apply-templates select="@* | node()"><xsl:with-param name="is_header" select="true()" /></xsl:apply-templates>
</xsl:template>

<xsl:template match="nav//footer">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="nav//footer/a/@href">
	<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
	<xsl:attribute name="ly-info_panel__link"><xsl:value-of select="../@data-ly-class"/></xsl:attribute>
</xsl:template>

</xsl:stylesheet>