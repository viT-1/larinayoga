<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="nav//menu/li/*" mode="nav-layScreen_current">
	<li ly-sidebar__item="" aria-level="1">
		<h1 ly-sidebar__caption="{@data-ly-class}_ (current_ sidebar--master_)"><xsl:value-of select="." /></h1>
		<menu ly-sidebar__page_index="">
			<xsl:apply-templates select="$base_htmlRoot//*[@role = 'heading']" mode="pgPhoto-layScreen_mi" />
		</menu>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@role = 'heading']" mode="pgPhoto-layScreen_mi">
	<xsl:variable name="date" select="*[@property = 'dateCreated']/@content" />
	<li ly-sidebar__item="" aria-level="2">
		<a href="#{translate( $date, '-', '' )}" ly-sidebar__link="sidebar--master_">
		<xsl:if test="*[@property = 'alternateName']">
			<xsl:attribute name="href">#<xsl:value-of select="*[@property = 'alternateName']/@content" /></xsl:attribute>
		</xsl:if><xsl:value-of select="translate( $date, '-', '.' )" />: <xsl:value-of select="em" /></a>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@role = 'section']//*[@role = 'heading']/em">
	<xsl:variable name="date" select="../*[@property = 'dateCreated']/@content" />
	<xsl:variable name="date_href" select="translate( $date, '-', '' )" />
	
	<hr aria-hidden="true" />
	<h2 id="{$date_href}" ly-section__caption="main__">
		<xsl:variable name="alternate_href" select="../*[@property = 'alternateName']/@content" />
		<xsl:if test="$alternate_href">
			<xsl:attribute name="id"><xsl:value-of select="$alternate_href" /></xsl:attribute>
		</xsl:if>
		<a class="iAnchor" href="#{$date_href}">
			<xsl:if test="$alternate_href">
				<xsl:attribute name="href">#<xsl:value-of select="$alternate_href" /></xsl:attribute>
			</xsl:if>
			#
		</a>
		<span ly-section__date=""><xsl:value-of select="translate( $date, '-', '.' )" /></span>: <xsl:apply-templates />
	</h2>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']/body/ul">
	<xsl:element name="{name()}">
		<xsl:attribute name="ly-list">unstyled</xsl:attribute>
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@data-ly-class = 'lstPhotoAlbum']/@data-ly-class">
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-list" />
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@data-ly-class = 'lstPhotoAlbum']/li">
	<li>
		<xsl:apply-templates />
		<span class="iGallery" ly-hldDetails="bhvrHover"><br aria-hidden="true" /><em class="iGallery" ly-txtDetails="paspartu"><xsl:value-of select="a/img/@alt"/></em><br aria-hidden="true" /> <img src="{a/@href}" class="iGallery" ly-imgDetails="paspartu" /></span>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@data-ly-class = 'lstPhotoAlbum']/li/a/img/@src">
	<xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute>
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-imgThumb">bhvrHover paspartu</xsl:attribute>
	<xsl:attribute name="hidden" />
</xsl:template>

</xsl:stylesheet>