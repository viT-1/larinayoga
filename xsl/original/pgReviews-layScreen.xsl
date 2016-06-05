<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="html[@data-ly-class = 'reviews']//*[@role = 'article']">
	<hr class="-hidden" />
	<dl class="iMoreLess">
		<xsl:apply-templates select="*[@role = 'heading']" />
		<xsl:apply-templates select="blockquote" />
	</dl>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'reviews']//*[@role = 'heading']">
	<dt>
		<xsl:variable name="date" select="substring(*[@property = 'datePublished']/@content, 1, 10 )" />
		<xsl:variable name="date_href" select="translate( $date, '-', '' )" />
		<h3 id="{$date_href}">
		<a class="anchor" href="#{$date_href}">#</a><span class="tpDate"><xsl:value-of select="translate( $date, '-', '.' )" /></span>: <xsl:apply-templates select="*[@property = 'author']" /></h3>
		<h4><xsl:call-template name="select_string"><xsl:with-param name="id" select="'cite'" /></xsl:call-template> &#171;<xsl:apply-templates select="cite" />&#187;</h4>
	</dt>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'reviews']//blockquote">
	<dd>
		<xsl:apply-templates />
	</dd>
</xsl:template>

</xsl:stylesheet>