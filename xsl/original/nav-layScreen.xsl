<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="nav//footer//a">
	<xsl:param name="is_header" />
	<a>
		<xsl:attribute name="ly-info_panel__link">
			<xsl:choose>
				<xsl:when test="$is_header">info_panel--light_</xsl:when>
				<xsl:otherwise>info_panel--dark_</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:apply-templates select="@* | node()" />
	</a>
</xsl:template>

<xsl:template match="nav//footer//a[@data-ly-class = 'yandexName']">
	<xsl:param name="is_header" />
	
	<a ly-info_panel__link="info_panel--dark_" ly-user_name="">
		<xsl:if test="$is_header">
			<xsl:attribute name="ly-info_panel__link">info_panel--light_</xsl:attribute>
			<xsl:attribute name="role">heading</xsl:attribute>
			<xsl:attribute name="aria-level">1</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates select="@*" />
		<span ly-user_name__first_letter="yandex_"><xsl:value-of select="substring(text(), 1, 1)" /></span><xsl:value-of select="substring(text(), 2)" />
	</a>
</xsl:template>

<xsl:template match="nav//menu/li/*" mode="nav-layScreen_current">
	<h1 ly-sidebar__caption="{@data-ly-class}_ (current_ sidebar--slave_)"><xsl:value-of select="." /></h1>
</xsl:template>

<xsl:template match="nav//menu/li[position() &lt; 5]/*" mode="nav-layScreen_current">
	<h1 ly-sidebar__caption="{@data-ly-class}_ (current_ sidebar--master_)"><xsl:value-of select="." /></h1>
</xsl:template>

<xsl:variable name="lay-current_class" select="//html/@data-ly-class" />

<xsl:template match="nav//menu/li">
	<xsl:variable name="data-ly-class" select="*/@data-ly-class" />
	
	<li ly-sidebar__item="" aria-level="1">
	<xsl:choose>
		<xsl:when test="$data-ly-class = $lay-current_class"><xsl:apply-templates mode="nav-layScreen_current" /></xsl:when>
		<xsl:otherwise><xsl:apply-templates /></xsl:otherwise>
	</xsl:choose>
	</li>
</xsl:template>

<xsl:template match="nav//menu/li/a/@href">
	<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
	<xsl:attribute name="ly-sidebar__caption"><xsl:value-of select="../@data-ly-class" />_ (other_ sidebar--slave_)</xsl:attribute>
	<xsl:attribute name="aria-level">1</xsl:attribute>
</xsl:template>

<xsl:template match="nav//menu/li[position() &lt; 5]/a/@href">
	<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
	<xsl:attribute name="ly-sidebar__caption"><xsl:value-of select="../@data-ly-class" />_ (other_ sidebar--master_)</xsl:attribute>
	<xsl:attribute name="aria-level">1</xsl:attribute>
</xsl:template>

<xsl:template match="nav//menu">
	<xsl:param name="mod__class" />
	<menu ly-base__sidebar="{$mod__class}" ly-sidebar="">
		<xsl:choose>
			<xsl:when test="$mod__class = 'master_'"><xsl:apply-templates select="*[position() &lt; 5]" /></xsl:when>
			<xsl:when test="$mod__class = 'slave_'"><xsl:apply-templates select="*[position() &gt; 4]" /></xsl:when>
		</xsl:choose>
	</menu>
</xsl:template>

</xsl:stylesheet>