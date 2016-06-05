<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="conf.xsl" />
<xsl:include href="nav.xsl" />
<xsl:include href="common.xsl" />
<xsl:include href="select.xsl" />
<xsl:include href="original/base-layScreen.xsl" />

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:variable name="base_htmlRoot" select="//html" />
<xsl:variable name="base_htmlLang" select="//html/@lang" />
<xsl:variable name="base_pgContext" select="//html/@data-ly-class" />

</xsl:stylesheet>