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
	<dl ly-list="unstyled" ly-section="">
		<xsl:apply-templates select="*[@role = 'heading']" />
		<xsl:apply-templates select="blockquote" mode="base-more_less__ctl" />
	</dl>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'reviews']//*[@role = 'article']//*[@role = 'heading']">
	<dt>
		<xsl:variable name="date" select="substring(*[@property = 'datePublished']/@content, 1, 10 )" />
		<xsl:variable name="date_href" select="translate( $date, '-', '' )" />
		<hr aria-hidden="true" />
		<h2 id="{$date_href}" ly-section__caption="main_">
		<a class="iAnchor" href="#{$date_href}">#</a><span ly-section__date=""><xsl:value-of select="translate( $date, '-', '.' )" /></span>: <xsl:apply-templates select="*[@property = 'author']" /></h2>
		<h3 ly-section__caption="sub_"><xsl:call-template name="select_string"><xsl:with-param name="id" select="'cite'" /></xsl:call-template> &#171;<xsl:apply-templates select="cite" />&#187;</h3>
	</dt>
</xsl:template>

</xsl:stylesheet>