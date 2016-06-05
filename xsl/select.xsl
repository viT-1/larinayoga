<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="html"
	encoding="utf-8"
	omit-xml-declaration="yes"
	indent="no"
	doctype-system="about:legacy-compat"
/>

<xsl:variable name="select_stringRoot" select="document('select.xml')/select" />
<xsl:key name="select_stringByIdAndLang" match="select//option" use="concat( '{', @id, '}{', @lang, '}' )"/>

<xsl:template name="select_string">
	<xsl:param name="id" />
	
	<xsl:apply-templates select="$select_stringRoot" mode="select_string">
		<xsl:with-param name="id" select="$id" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="select[@id = 'strings']" mode="select_string">
	<xsl:param name="id" />
	
	<xsl:variable name="nodes" select="key( 'select_stringByIdAndLang', concat( '{', $id, '}{', $base_htmlLang, '}' ) )" />
	<xsl:variable name="nodes_in_optgroup" select="$nodes[ancestor::optgroup/@label = $base_pgContext]" />
	<xsl:if test="$conf_debugIsOn">strNodesCount{<xsl:value-of select="count($nodes)" />-<xsl:value-of select="count($nodes_in_optgroup)" />}</xsl:if>
	<xsl:choose>
		<!-- Стандартное поведение: по одному id находим для нужного языка одну строку -->
		<xsl:when test="count( $nodes ) = 1">
			<xsl:apply-templates select="$nodes" />
		</xsl:when>
		<!-- Попытка найти хоть какую-то строку, пусть даже не того языка, что ищем (чтобы сразу дополнить словарь, а не искать ошибку при пустом выводе) -->
		<xsl:when test="count( $nodes ) = 0
						or count( $nodes_in_optgroup ) = 0">
			<xsl:variable name="allLang_nodes_in_optgroup" select="optgroup[@label = $base_pgContext]/option[@id = $id]" />
			<xsl:variable name="allLang_base_nodes" select="option[@id = $id]" />
			<xsl:if test="$conf_debugIsOn">[simpleSearch]</xsl:if>
			<xsl:choose>
				<xsl:when test="count( $allLang_nodes_in_optgroup ) &gt; 0">
					<xsl:apply-templates select="$allLang_nodes_in_optgroup" />
				</xsl:when>
				<xsl:when test="count( $allLang_base_nodes ) &gt; 0">
					<xsl:apply-templates select="$allLang_base_nodes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="." mode="select_string">
						<xsl:with-param name="id" select="'notfound'" />
					</xsl:apply-templates>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<!-- Нашли несколько строк (id неуникален), ограничимся контекстом страницы (optgroup) -->
		<xsl:otherwise>
			<xsl:apply-templates select="$nodes_in_optgroup" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="select[@id = 'strings']//option[@value]">
	<xsl:value-of select="@value" />
</xsl:template>

<xsl:template match="select[@id = 'strings']//option[not( @value )]">
	<xsl:apply-templates />
</xsl:template>

</xsl:stylesheet>