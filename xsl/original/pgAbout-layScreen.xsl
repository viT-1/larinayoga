<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="html[@data-ly-class = 'about']//*[@role = 'section']//*[@role = 'heading']">
	<hr aria-hidden="true" />
	<h3 id="{@id}" ly-section__caption="main_"><a class="iAnchor" href="#{@id}">#</a><xsl:apply-templates /></h3>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'img-primary']/@data-ly-class">
	<xsl:attribute name="class">hImg-responsive</xsl:attribute>
	<xsl:attribute name="width">185</xsl:attribute>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'awards']/@data-ly-class">
	<xsl:attribute name="ly-list">paragraph</xsl:attribute>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']/@data-ly-class">
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-list" />
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']/li">
	<li>
		<xsl:apply-templates />
		<span class="iGallery" ly-hldDetails="bhvrHover"><br aria-hidden="true" /><em class="iGallery" ly-txtDetails="paspartu"><xsl:value-of select="a/img/@alt"/></em><br aria-hidden="true" /> <img src="{a/@href}" class="iGallery" ly-imgDetails="paspartu" /></span>
	</li>
</xsl:template>

<xsl:template match="html[@data-ly-class = 'about']//*[@data-ly-class = 'certificates']/li/a/img/@alt">
	<xsl:attribute name="class">iGallery</xsl:attribute>
	<xsl:attribute name="ly-imgThumb">h120px bhvrHover paspartu</xsl:attribute>
	<xsl:attribute name="hidden"></xsl:attribute>
	<xsl:attribute name="alt"><xsl:value-of select="."/></xsl:attribute>
	<xsl:attribute name="title"><xsl:call-template name="select_string"><xsl:with-param name="id" select="'getbigimg'" /></xsl:call-template></xsl:attribute>
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