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
				<xsl:with-param name="mod__class" select="'master'" />
			</xsl:apply-templates>
			<xsl:apply-templates select="$nav_navRoot/menu[@lang = $base_htmlLang]">
				<xsl:with-param name="mod__class" select="'slave'" />
			</xsl:apply-templates>
			
			<div role="main" ly-hldMain="">
				<xsl:apply-templates select="*" />
			</div>
			
			<!--&social_likes;-->
			<hr aria-hidden="true" />
		</div>
		<div role="contentinfo" ly-page__info_panel="bottom_" ly-info_panel="dark_">
			<xsl:apply-templates select="$nav_navRoot/footer[@lang = $base_htmlLang]" />
			<span ly-hldDevInfo=""><xsl:call-template name="select_string"><xsl:with-param name="id" select="'markup'" /></xsl:call-template>:
			&copy;<a href="https://github.com/viT-1/larinayoga/issues" ly-info_panel__link="">viT-1</a></span>
			<a href="#top" ly-info_panel__link="" ly-hldToTop=""><xsl:call-template name="select_string"><xsl:with-param name="id" select="'tothetop'" /></xsl:call-template></a>
		</div>
		<a ly-hldBanner="" ly-page__banner="" href="index-{$base_htmlLang}.xml">
			<xsl:attribute name="title"><xsl:call-template name="select_string"><xsl:with-param name="id" select="'siteroot'" /></xsl:call-template></xsl:attribute>
		</a>
		
		<script type="text/javascript">
			initBodySettings();
			
			//IE9 and other browsers
			if (document.addEventListener) {
				initToggleAbility( '*[ly-hldMain] dl.iMoreLess', 'dd > p:first-child', 'aria-expanded', 'false', 'true' );
			}
		</script>
	</body>
</xsl:template>

<xsl:template match="*[@role = 'heading']/em">
	<xsl:apply-templates />
</xsl:template>

</xsl:stylesheet>