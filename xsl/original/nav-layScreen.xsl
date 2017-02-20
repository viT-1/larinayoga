<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="nav//footer//*[@data-ly-class = 'yandexName']">
	<xsl:param name="is_header" />
	
	<a ly-info_panel__link="" ly-user_name="">
		<xsl:if test="$is_header">
			<xsl:attribute name="role">heading</xsl:attribute>
			<xsl:attribute name="aria-level">1</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates select="@*" />
		<span ly-user_name__first_letter="yandex_"><xsl:value-of select="substring(text(), 1, 1)" /></span><xsl:value-of select="substring(text(), 2)" />
	</a>
</xsl:template>

<xsl:template match="nav//menu/li" mode="nav-layScreen_current">
	<li class="iSideBar" ly-item="{@data-ly-class} active"><h2 class="iSideBar" role="heading"><xsl:value-of select="*" /></h2></li>
</xsl:template>

<xsl:variable name="lay-current_class" select="//html/@data-ly-class" />

<xsl:template match="nav//menu/li">
	<xsl:choose>
		<xsl:when test="@data-ly-class = $lay-current_class"><xsl:apply-templates select="." mode="nav-layScreen_current" /></xsl:when>
		<xsl:otherwise><li class="iSideBar" ly-item="{@data-ly-class}"><xsl:apply-templates /></li></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="nav//menu/li/a/@href">
	<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
	<xsl:attribute name="class">iSideBar</xsl:attribute>
	<xsl:attribute name="role">heading</xsl:attribute>
</xsl:template>

<xsl:template match="nav//menu">
	<xsl:param name="mod__class" />
	<menu ly-hldSideBar="{$mod__class}">
		<xsl:choose>
			<xsl:when test="$mod__class = 'master'"><xsl:apply-templates select="*[position() &lt; 5]" /></xsl:when>
			<xsl:when test="$mod__class = 'slave'"><xsl:apply-templates select="*[position() &gt; 4]" /></xsl:when>
		</xsl:choose>
	</menu>
</xsl:template>

</xsl:stylesheet>