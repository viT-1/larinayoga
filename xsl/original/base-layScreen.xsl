<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE xsl:stylesheet
  [
    <!ENTITY social_likes SYSTEM '../../ssi/social_likes.htm'>
	<!ENTITY copy "&#169;">
  ]
>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:template match="html">
	<html class="js-off {@class}">
		<xsl:apply-templates select="@* | *" />
	</html>
</xsl:template>

<xsl:template match="html/body">
	<body id="top" typeof="WebPage" ly-page="{$base_pgContext}">
		<xsl:apply-templates select="@*" />
		
		<div role="banner" ly-page__info_panel="top_" ly-info_panel="light_">
			<xsl:apply-templates select="$nav_navRoot/footer[@lang = $base_htmlLang]" mode="nav_header" />
		</div>
		<div ly-page__base="" ly-base="">
			<hr aria-hidden="true" />
			<xsl:apply-templates select="$nav_navRoot/menu[@lang = $base_htmlLang]">
				<xsl:with-param name="mod__class" select="'master_'" />
			</xsl:apply-templates>
			<xsl:apply-templates select="$nav_navRoot/menu[@lang = $base_htmlLang]">
				<xsl:with-param name="mod__class" select="'slave_'" />
			</xsl:apply-templates>
			
			<div role="main" ly-page__main="">
				<xsl:apply-templates select="*" />
			</div>
			
			<!--&social_likes;-->
			<hr aria-hidden="true" />
		</div>
		<div role="contentinfo" ly-page__info_panel="bottom_" ly-info_panel="dark_">
			<xsl:apply-templates select="$nav_navRoot/footer[@lang = $base_htmlLang]" />
			<span ly-info_panel__devinfo=""><xsl:call-template name="select_string"><xsl:with-param name="id" select="'markup'" /></xsl:call-template>:
			&copy;<a href="https://github.com/viT-1/larinayoga/issues" ly-info_panel__link="info_panel--dark_">viT-1</a></span>
			<a href="#top" ly-info_panel__link="info_panel--dark_" ly-info_panel__tothetop=""><xsl:call-template name="select_string"><xsl:with-param name="id" select="'tothetop'" /></xsl:call-template></a>
		</div>
		<a ly-page__banner="" href="index-{$base_htmlLang}.xml">
			<xsl:attribute name="title"><xsl:call-template name="select_string"><xsl:with-param name="id" select="'siteroot'" /></xsl:call-template></xsl:attribute>
		</a>
		
		<script type="text/javascript">
			initBodySettings();
			initToggleAbility( 'ly-more_less__toggler', 'ly-more_less__hider', '_less', '_more' );
		</script>
	</body>
</xsl:template>

<xsl:template match="*" mode="base-more_less__ctl">
	<dd ly-more_less="">
		<xsl:apply-templates select="*[1]" mode="base-toggler" />
		<div ly-more_less__hider="">
			<xsl:apply-templates select="*[position() &gt; 1]" />
		</div>
	</dd>
</xsl:template>

<xsl:template match="*" mode="base-toggler">
	<xsl:element name="{name()}">
		<xsl:attribute name="ly-more_less__toggler" />
		<xsl:apply-templates select="@* | node()" />
	</xsl:element>
</xsl:template>

<xsl:template match="*[@role = 'heading']/em">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="*[@role = 'heading']//img/@src">
	<xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute>
	<xsl:attribute name="ly-caption__img" />
</xsl:template>

<xsl:template match="*[@role = 'section']/@role">
	<xsl:attribute name="ly-section" />
</xsl:template>

</xsl:stylesheet>