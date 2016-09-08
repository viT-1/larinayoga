<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="
meta
| @cite

| @vocab
| body/*/@typeof
| @property

| @itemscope
| @itemprop
| @itemtype

| @data-ly-ie
| @data-ly-class
| @data-ly-mod
| @data-ly-proc
"></xsl:template>

<xsl:template match="script[@data-ly-ie]">
	<xsl:text disable-output-escaping="yes">&lt;!--[if </xsl:text><xsl:value-of select="@data-ly-ie" /><xsl:text disable-output-escaping="yes">]&gt;</xsl:text>
	<xsl:copy>
		<xsl:apply-templates select="@* | node()" />
	</xsl:copy>
	<xsl:text disable-output-escaping="yes">&lt;![endif]--&gt;</xsl:text>
</xsl:template>

<xsl:template match="link[contains(@href, '.css') and not(@rel | @type)]">
	<xsl:if test="@data-ly-ie">
		<xsl:text disable-output-escaping="yes">&lt;!--[if </xsl:text><xsl:value-of select="@data-ly-ie" /><xsl:text disable-output-escaping="yes">]&gt;</xsl:text>
	</xsl:if>
	<xsl:copy>
		<xsl:apply-templates select="@*" />
		<xsl:attribute name="rel">stylesheet</xsl:attribute>
		<!--<xsl:attribute name="type">text/css</xsl:attribute>-->
		<xsl:if test="$conf_debugIsOn">
			<xsl:attribute name="data-test">xslt-test</xsl:attribute>
		</xsl:if>
	</xsl:copy>
	<xsl:if test="@data-ly-ie">
		<xsl:text disable-output-escaping="yes">&lt;![endif]--&gt;</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="@* | node()">
	<xsl:copy>
		<xsl:apply-templates select="@* | node()" />
	</xsl:copy>
</xsl:template>
<!--
<xsl:template match="text()[normalize-space()]">
	<xsl:value-of select="normalize-space()" />
</xsl:template>
-->
</xsl:stylesheet>