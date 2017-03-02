<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:variable name="pgEvents-future" select="$base_htmlRoot//*[@data-ly-class = 'lstEvents']/*[not(meta[@property = 'eventStatus'])]" />
<xsl:variable name="pgEvents-complete" select="$base_htmlRoot//*[@data-ly-class = 'lstEvents']/*[meta[@property = 'eventStatus']]" />

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']">
	<xsl:if test="count( $pgEvents-future ) &gt; 0">
		<ul ly-list="unstyled">
			<xsl:apply-templates select="$pgEvents-future">
				<xsl:sort select="descendant::*[@property = 'startDate'][1]/@content" order="descending" />
			</xsl:apply-templates>
		</ul>
	</xsl:if>
	<xsl:if test="count( $pgEvents-complete ) &gt; 0">
		<ul class="-pastEvents" ly-list="unstyled">
			<xsl:apply-templates select="$pgEvents-complete">
				<xsl:sort select="descendant::*[@property = 'startDate'][1]/@content" order="descending" />
			</xsl:apply-templates>
		</ul>
	</xsl:if>
</xsl:template>

<xsl:template match="nav//menu/li/*" mode="nav-layScreen_current">
	<li ly-sidebar__item="" aria-level="1">
		<h1 ly-sidebar__caption="{@data-ly-class}_ current_ sidebar--slave_"><xsl:value-of select="." /></h1>
		
		<xsl:if test="count( $pgEvents-future ) &gt; 0">
			<xsl:variable name="strFuture">
				<xsl:call-template name="select_string"><xsl:with-param name="id" select="'evFuture'" /></xsl:call-template>
			</xsl:variable>
			<menu title="{$strFuture}" ly-sidebar__page_index="">
				<xsl:apply-templates select="$pgEvents-future//*[@role = 'heading'][em]" mode="pgEvents-layScreen_mi">
					<xsl:sort select="descendant::*[@property = 'startDate'][1]/@content" order="descending" />
				</xsl:apply-templates>
			</menu>
		</xsl:if>

		<xsl:if test="count( $pgEvents-complete ) &gt; 0">
			<xsl:variable name="strComplete">
				<xsl:call-template name="select_string"><xsl:with-param name="id" select="'evComplete'" /></xsl:call-template>
			</xsl:variable>
			<menu title="{$strComplete}" class="-pastEvents" ly-sidebar__page_index="">
				<xsl:apply-templates select="$pgEvents-complete//*[@role = 'heading'][em]" mode="pgEvents-layScreen_mi">
					<xsl:sort select="descendant::*[@property = 'startDate'][1]/@content" order="descending" />
				</xsl:apply-templates>
			</menu>
		</xsl:if>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@role = 'heading'][em]" mode="pgEvents-layScreen_mi">
	<xsl:variable name="date" select="substring( ..//*[@property = 'startDate'][1]/@content, 1, 10 )" />
	<xsl:variable name="second_date" select="substring( ..//*[@property = 'duration'][1]/@content, 11 )" />
	<xsl:variable name="second_date_mi" select="translate( translate($second_date, '-', '.'), '/', '-' )" />
	<li ly-sidebar__item="" aria-level="2">
		<a href="#{translate($date, '-', '')}" ly-sidebar__link="sidebar--slave_">
			<xsl:value-of select="translate( $date, '-', '.' )" />
			<xsl:value-of select="concat( substring( $second_date_mi, 1, 1 ), substring( $second_date_mi, 7, 5 ) )" />: <xsl:value-of select="em" /></a>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']/li[count( div[@aria-label = 'description']/p ) &gt; 1 ]">
	<li>
		<xsl:apply-templates select="@*" />
		<dl ly-more_less="" ly-list="unstyled">
			<xsl:apply-templates select="*[@role = 'heading']" />
			<xsl:apply-templates select="*[not(@role = 'heading')]" />
		</dl>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']/li/*[@role = 'heading']" mode="pgEvents_heading">
	<!-- startDate может быть как с разделителем 'T' так и без него -->
	<xsl:variable name="date" select="substring( ..//*[@property = 'startDate'][1]/@content, 1, 10 )" />
	<xsl:variable name="date_href" select="translate( $date, '-', '' )" />
	<!-- Используем только вторую дату (после разделителя '/'), в случае со значениями 'PT8H' получаем пустую строку -->
	<xsl:variable name="second_date" select="substring-after( ..//*[@property = 'duration'][1]/@content, '/' )" />
	
	<hr aria-hidden="true" />
	<h2 id="{$date_href}" ly-section__caption="main_">
		<xsl:apply-templates select="img" />
		<br aria-hidden="true" />
		<a class="iAnchor" href="#{$date_href}">#</a><span ly-section__date=""><xsl:value-of select="translate( $date, '-', '.' )" /></span>
		<xsl:if test="$second_date">
			<xsl:text> - </xsl:text>
			<span ly-section__date=""><xsl:value-of select="translate( $second_date, '-', '.' )" /></span>
		</xsl:if>: <xsl:apply-templates select="em" />
	</h2>
	<xsl:apply-templates select="*[not( name() = 'img' or name() = 'em' )]" />
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']/li/*[@role = 'heading']">
	<xsl:apply-templates select="." mode="pgEvents_heading" />
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']/li[count( div[@aria-label = 'description']/p ) &gt; 1 ]/*[@role = 'heading']">
	<dt>
		<xsl:apply-templates select="." mode="pgEvents_heading" />
	</dt>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']/li/div[@aria-label = 'description'][count( p ) &gt; 1]">
	<dd>
		<xsl:apply-templates />
	</dd>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']/li/*[@role = 'heading']/img/@src">
	<xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute>
	<xsl:attribute name="ly-caption__img" />
	<xsl:attribute name="height">168</xsl:attribute>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@data-ly-class = 'lstEvents']/li//*[@aria-label = 'description']//em[@role = 'heading']">
	<h3 ly-section__caption="sub_"><xsl:apply-templates /></h3>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'events']//*[@role = 'section']//ul//ul">
	<ul ly-list="inline"><xsl:apply-templates /></ul>
</xsl:template>

</xsl:stylesheet>