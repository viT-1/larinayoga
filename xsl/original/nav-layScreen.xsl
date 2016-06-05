<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="nav//footer//*[@data-ly-class = 'yandexName']/@data-ly-class">
	<xsl:attribute name="class">-clrYandex</xsl:attribute>
</xsl:template>

<xsl:template match="nav//menu/li" mode="nav-layScreen_current">
	<li class="bSideBar_mi mi-{@data-ly-class} -active"><h2><xsl:value-of select="*" /></h2></li>
</xsl:template>

<xsl:variable name="lay-current_class" select="//html/@data-ly-class" />

<xsl:template match="nav//menu/li">
	<xsl:choose>
		<xsl:when test="@data-ly-class = $lay-current_class"><xsl:apply-templates select="." mode="nav-layScreen_current" /></xsl:when>
		<xsl:otherwise><li class="bSideBar_mi mi-{@data-ly-class}"><xsl:apply-templates /></li></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="nav//menu">
	<xsl:param name="mod__class" />
	<menu class="bSideBar {$mod__class}">
		<xsl:choose>
			<xsl:when test="$mod__class = '-master'"><xsl:apply-templates select="*[position() &lt; 5]" /></xsl:when>
			<xsl:when test="$mod__class = '-slave'"><xsl:apply-templates select="*[position() &gt; 4]" /></xsl:when>
		</xsl:choose>
	</menu>
</xsl:template>

</xsl:stylesheet>