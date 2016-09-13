<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="nav//menu/li" mode="nav-layScreen_current">
	<li class="bSideBar_mi mi-{@data-ly-class} -active">
		<h2><xsl:value-of select="*" /></h2>
		<menu>
			<xsl:apply-templates select="$base_htmlRoot//*[@role = 'heading']" mode="pgPhoto-layScreen_mi" />
		</menu>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@role = 'heading']" mode="pgPhoto-layScreen_mi">
	<xsl:variable name="date" select="*[@property = 'dateCreated']/@content" />
	<li>
		<a href="#{translate( $date, '-', '' )}">
		<xsl:if test="*[@property = 'alternateName']">
			<xsl:attribute name="href">#<xsl:value-of select="*[@property = 'alternateName']/@content" /></xsl:attribute>
		</xsl:if><xsl:value-of select="translate( $date, '-', '.' )" />: <xsl:value-of select="em" /></a>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@role = 'heading']/em">
	<xsl:variable name="date" select="../*[@property = 'dateCreated']/@content" />
	<xsl:variable name="date_href" select="translate( $date, '-', '' )" />
	
	<hr class="-hidden" />
	<h3 id="{$date_href}">
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
		<span class="tpDate"><xsl:value-of select="translate( $date, '-', '.' )" /></span>: <xsl:apply-templates />
	</h3>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']/body/ul">
	<xsl:element name="{name()}">
		<xsl:attribute name="class">iList</xsl:attribute>
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
		<span class="iGallery" ly-hldDetails="bhvrHover"><br class="-hidden" /><em class="iGallery" ly-txtDetails="paspartu"><xsl:value-of select="a/img/@alt"/></em><br class="-hidden" /> <img src="{a/@href}" class="iGallery" ly-imgDetails="paspartu" /></span>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'photo']//*[@data-ly-class = 'lstPhotoAlbum']/li/a/img/@src">
	<xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute>
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-imgThumb">bhvrHover paspartu</xsl:attribute>
	<xsl:attribute name="hidden"></xsl:attribute>
</xsl:template>

</xsl:stylesheet>