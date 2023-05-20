<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/">
		<edix>
			<xsl:for-each select="ite">
				<xsl:element name="centro">
					<xsl:attribute name="empresa"><xsl:value-of select="empresa"/></xsl:attribute>
					<xsl:value-of select="@nombre"/>
				</xsl:element>
			
				<web>
					<xsl:value-of select="@web"/>
				</web>
				
				<telefono>
					<xsl:value-of select="telefono"/>
				</telefono>
			</xsl:for-each>
			
			<xsl:element name="profesores">
				<xsl:for-each select="ite/profesores/profesor">
					<xsl:element name="profesor">
						<xsl:attribute name="id"><xsl:value-of select="id"/></xsl:attribute>
						<xsl:value-of select="nombre"/>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			
			<xsl:copy-of select="ite/director">
			</xsl:copy-of>
			
			<xsl:copy-of select="ite/jefe_estudios">
			</xsl:copy-of>
			
			<xsl:element name="ciclos">
				<xsl:for-each select="ite/ciclos/ciclo">
					<xsl:element name="ciclo">
						<xsl:attribute name="grado"><xsl:value-of select="grado"/></xsl:attribute>
						<xsl:value-of select="nombre"/>
						<!-- introducimos un salto de linea para separar las etiquetas
							nombre y decretoTitulo -->
						<xsl:text>&#xa;</xsl:text>
						<xsl:element name="decretoTitulo">
							<xsl:value-of select="decretoTitulo/@año"/>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			
		</edix>
	</xsl:template>
</xsl:stylesheet>
