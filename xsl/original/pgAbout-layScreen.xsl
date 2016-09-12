<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="html[@data-ly-class = 'about']//*[@role = 'heading']">
	<hr class="-hidden" />
	<h3 id="{@id}"><a class="iAnchor" href="#{@id}">#</a><xsl:apply-templates /></h3>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'img-primary']/@data-ly-class">
	<xsl:attribute name="class">img-responsive</xsl:attribute>
	<xsl:attribute name="width">185</xsl:attribute>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'awards']/@data-ly-class">
	<xsl:attribute name="class">iList</xsl:attribute>
	<xsl:attribute name="ly-list">paragraph</xsl:attribute>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']/@data-ly-class">
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-list">paspartu</xsl:attribute>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']/li">
	<li>
		<xsl:apply-templates />
		<span class="iGallery" ly-hldDetails="bhvrHover"><br class="-hidden" /><em class="iGallery" ly-txtDetails="paspartu"><xsl:value-of select="a/img/@alt"/></em><br class="-hidden" /> <img src="{a/@href}" class="iGallery" ly-imgDetails="" /></span>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']/li/a/img/@alt">
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-imgThumb">h120px bhvrHover paspartu</xsl:attribute>
	<xsl:attribute name="hidden"></xsl:attribute>
	<xsl:attribute name="alt"><xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<!--
<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']">
	<div class="fotorama" data-nav="thumbs" data-navposition="top" data-autoplay="true" data-loop="true">
		<xsl:apply-templates select="..//a" />
	</div>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']//img/@title" />

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']//img">
	<xsl:attribute name="data-caption"><xsl:value-of select="@title"/></xsl:attribute>
</xsl:template>
-->

</xsl:stylesheet>