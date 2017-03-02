<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:variable name="conf_confRoot" select="document('conf.xml')/conf" />
<xsl:variable name="conf_debugIsOn" select="document('conf.xml')/conf//*[@name = 'debug_is_on' and not(@disabled)]" />

<xsl:template match="html/head">
	<head>
		<xsl:apply-templates select="$conf_confRoot//meta" />

		<xsl:variable name="srcPgCssLinks" select="link[contains(@href, '.css')]" />
		<xsl:variable name="srcPgScripts" select="script" />
		<xsl:variable name="src_except" select="$srcPgCssLinks | $srcPgScripts" />
		
		<!-- Рендерим все элементы из xml страницы кроме css и script обычным образом -->
		<xsl:apply-templates select="*[count(. | $src_except) != count($src_except)]" />
		
		<!-- Порядок css: сначала общенастроечные -->
		<xsl:apply-templates select="$conf_confRoot//link[contains(@href, '.css')][not(@rel)] | $conf_confRoot//link[@rel = 'stylesheet']" mode="conf_writeThemesToHead" />
		<!-- Порядок css: затем индивидуальные для конкретной страницы -->
		<xsl:apply-templates select="$srcPgCssLinks" />
		<!-- В низ head скрипты -->
		<xsl:apply-templates select="$conf_confRoot//script[not(@disabled)] | $srcPgScripts" />
	</head>
</xsl:template>

<xsl:template match="conf//link[not(@disabled)]" mode="conf_writeThemesToHead">
	<xsl:variable name="active_themes" select="$conf_confRoot//*[@name = 'active_theme' and not(@disabled)]" />
	<xsl:variable name="current_href" select="@href" />
	<xsl:if test="count($active_themes[contains($current_href, @content)])">
		<xsl:apply-templates select="." />
	</xsl:if>
</xsl:template>

<xsl:template match="html/head/title/text()" mode="conf_headTitle">
	<xsl:if	test="$conf_confRoot//*[@name = 'cr_to_title' and not(@disabled)]"><xsl:value-of select="$conf_confRoot//*[@name = 'copyright']/@content" />: </xsl:if>
</xsl:template>

<xsl:template match="html/head/title/text()" priority="1">
	<xsl:apply-templates select="." mode="conf_headTitle" /><xsl:value-of select="normalize-space()" />
</xsl:template>

</xsl:stylesheet>