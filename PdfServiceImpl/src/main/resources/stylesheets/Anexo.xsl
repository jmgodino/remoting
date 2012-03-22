<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:a="http://www.catastro.meh.es/" exclude-result-prefixes="a">
	<xsl:attribute-set name="cabecera">
		<xsl:attribute name="font-size">3.5pt</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="space-before">4pt</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="display-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="cuerpo">
		<xsl:attribute name="font-size">5pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="space-before">4pt</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="border">0.25mm solid black</xsl:attribute>
		<xsl:attribute name="display-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="blanco">
		<xsl:attribute name="padding">0.25mm</xsl:attribute>
		<xsl:attribute name="border-left">0.25mm solid black</xsl:attribute>
		<xsl:attribute name="border-top">0.25mm solid white</xsl:attribute>
		<xsl:attribute name="border-bottom">0.25mm solid white</xsl:attribute>
		<xsl:attribute name="display-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="titulo">
		<xsl:attribute name="table-layout">fixed</xsl:attribute>
		<xsl:attribute name="border">0.75pt solid black</xsl:attribute>
		<xsl:attribute name="font-size">7pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="space-before">10pt</xsl:attribute>
		<xsl:attribute name="space-after">6pt</xsl:attribute>
		<xsl:attribute name="background-color">gray</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="padding">0.5mm</xsl:attribute>
		<xsl:attribute name="display-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="titulo2">
		<xsl:attribute name="font-size">6pt</xsl:attribute>
		<xsl:attribute name="space-before">8pt</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="display-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="total">
		<xsl:attribute name="table-layout">fixed</xsl:attribute>
		<xsl:attribute name="font-size">6pt</xsl:attribute>
		<xsl:attribute name="space-before">4pt</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="padding">0.25mm</xsl:attribute>
		<xsl:attribute name="display-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template match="a:inmval">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simple" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1cm" margin-right="1cm">
					<fo:region-body margin-top="3cm"/>
					<fo:region-before extent="3cm"/>
					<fo:region-after extent="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simple">
				<!-- font-family="times"-->
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="a:identinm">
		<fo:table xsl:use-attribute-sets="titulo">
			<fo:table-column column-width="190mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block>IDENTIFICACIÓN DEL BIEN INMUEBLE</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<fo:block>
			<xsl:choose>
				<xsl:when test="a:bi/a:idcat/a:cn = 'UR' or a:bi/a:idcat/a:cn = 'RU'">
					<fo:table table-layout="fixed">
						<fo:table-column column-width="15mm"/>
						<fo:table-column column-width="45mm"/>
						<fo:table-column column-width="20mm" number-columns-repeated="3"/>
						<fo:table-column column-width="35mm" number-columns-repeated="2"/>
						<fo:table-header xsl:use-attribute-sets="cabecera">
							<fo:table-row>
								<fo:table-cell>
									<fo:block>CLASE</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>REFERENCIA CATASTRAL</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:if test="(string(.//a:cpo))">POLÍGONO</xsl:if>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:if test="(string(.//a:cpa))">PARCELA</xsl:if>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>USO</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:if test="(string(a:bi/a:debi/a:sfs))">SUPERFICIE DEL SUELO(m2)</xsl:if>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>PROCENTAJE DE PARTICIPACIÓN</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body xsl:use-attribute-sets="cuerpo">
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="a:bi/a:idcat/a:cn"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="a:bi/a:idcat/a:rc"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select=".//a:cpo"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select=".//a:cpa"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select=".//a:luso"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<!--xsl:if test="R65:22 = 00"-->
										<xsl:value-of select=".//a:sfs"/>
										<!--/xsl:if-->
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<!--xsl:if test="R65:22 = 00"-->
										<xsl:value-of select=".//a:cpt"/>
										<!--/xsl:if-->
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</xsl:when>
				<xsl:otherwise>
					<fo:table table-layout="fixed">
						<fo:table-column column-width="20mm" number-columns-repeated="2"/>
						<fo:table-column column-width="40mm" number-columns-repeated="2"/>
						<fo:table-column column-width="35mm" number-columns-repeated="2"/>
						<fo:table-header xsl:use-attribute-sets="cabecera">
							<fo:table-row>
								<fo:table-cell>
									<fo:block>CLASE</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>GRUPO</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>REFERENCIA CATASTRAL</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>UNIDAD SINGULARIZADA</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>USO</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>PROCENTAJE DE PARTICIPACIÓN</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body xsl:use-attribute-sets="cuerpo">
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<xsl:choose>
											<xsl:when test=".//a:cn = 'UR'">URBANO</xsl:when>
											<xsl:when test=".//a:cn = 'RU'">RÚSTICO</xsl:when>
											<xsl:when test=".//a:cn = 'BI'">BICE</xsl:when>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
											CLAVE
										</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="a:datosbice/a:rbice/a:rc"/> 
										0123456789 
										<xsl:value-of select="a:datosbice/a:rbice/a:desb"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="a:bi/a:idcat/a:rc"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select=".//a:luso"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<!--xsl:if test="R65:22 = 00"-->
										<xsl:value-of select=".//a:cpt"/>
										<!--/xsl:if-->
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</xsl:otherwise>
			</xsl:choose>
			<fo:table table-layout="fixed" space-before="6pt">
				<fo:table-column column-width="110mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="39mm"/>
				<fo:table-column column-width="1mm"/>
				<fo:table-column column-width="39mm"/>
				<fo:table-header xsl:use-attribute-sets="cabecera">
					<fo:table-row>
						<fo:table-cell text-align="left">
							<fo:block>LOCALIZACIÓN</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>NÚMERO/PUNTO KILOMÉTRICO</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>BLOQUE/ESCALERA/PLANTA/PUERTA</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body xsl:use-attribute-sets="cuerpo">
					<fo:table-row>
						<fo:table-cell text-align="left">
							<fo:block>
								PARAJE 
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lors/a:lorus/a:npa"/>
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:tv"/>
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:nv"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:pnp"/>
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:plp"/>-
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:snp"/>
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:slp"/>/
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:km"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:loint/a:bq"/>/
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:loint/a:es"/>/
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:loint/a:pt"/>/
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:loint/a:pu"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="left">
							<fo:block>
								<xsl:value-of select="a:bi/a:dt/a:locs/a:lous/a:lourb/a:dir/a:td"/>
								<xsl:value-of select="a:bi/a:dt/a:nm"/>
								<xsl:if test="normalize-space(a:bi/a:dt/a:nem)">
									-<xsl:value-of select="a:bi/a:dt/a:nem"/>
								</xsl:if>
								(<xsl:value-of select="a:bi/a:dt/a:np"/>)
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	<xsl:template match="a:ltit">
		<fo:table xsl:use-attribute-sets="titulo">
			<fo:table-column column-width="190mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell text-align="center">
						<!--fo:block>
							<xsl:choose>
								<xsl:when test="R68:22 = M1">TITULARIDAD MODIFICADA O INCORPORADA</xsl:when>
								<xsl:when test="R68:22 = B1">TITULARIDAD DADA DE BAJA</xsl:when>
								<xsl:otherwise>TITULARES CATASTRALES</xsl:otherwise>
							</xsl:choose>
						</fo:block-->
						<fo:block>TITULARES CATASTRALES</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="20mm"/>
			<fo:table-column column-width="100mm"/>
			<fo:table-column column-width="54mm"/>
			<fo:table-column column-width="16mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>NIF/NIE</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="left">
						<fo:block>APELLIDOS Y NOMBRE O RAZÓN SOCIAL</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>DERECHO SOBRE EL BIEN INMUEBLE</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>PORCENTAJE</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="//a:tit">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select=".//a:nif"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select=".//a:nom"/>
								<xsl:if test=".//a:iatit/a:ct">
									<xsl:text> (</xsl:text>
									<xsl:value-of select=".//a:ct"/>
									<xsl:text>)</xsl:text>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:choose>
									<xsl:when test=".//a:cdr = 'PR'">Propiedad Plena</xsl:when>
									<xsl:when test=".//a:cdr = 'US'">Usufructo</xsl:when>
									<xsl:when test=".//a:cdr = 'NP'">Nuda Propiedad</xsl:when>
									<xsl:when test=".//a:cdr = 'CA'">Concesión Administrativa</xsl:when>
									<xsl:when test=".//a:cdr = 'DF'">Disfrute</xsl:when>
									<xsl:when test=".//a:cdr = 'DS'">Derecho de Superficie</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select=".//a:cdr"/>
									</xsl:otherwise>
								</xsl:choose>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select=".//a:pct"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:dgval">
		<xsl:if test="*">
			<fo:table xsl:use-attribute-sets="titulo">
				<fo:table-column column-width="190mm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block font-weight="bold">DATOS DE VALORACIÓN</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:table table-layout="fixed">
				<fo:table-column column-width="15mm" number-columns-repeated="2"/>
				<fo:table-column column-width="20mm"/>
				<fo:table-column column-width="15mm" number-columns-repeated="8"/>
				<fo:table-column column-width="20mm"/>
				<fo:table-header xsl:use-attribute-sets="cabecera">
					<fo:table-row margin-bottom="1pt">
						<fo:table-cell number-columns-spanned="2">
							<fo:block>PUBLICACIÓN DE LA PONENCIA</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left">
							<fo:block>ORDEN MINISTERIAL</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block>VALORES DE SUELO EN POLÍGONO</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block>MÓDULOS BÁSICOS</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="5">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row font-size="4pt" space-before="1pt" space-after="1pt">
						<fo:table-cell number-columns-spanned="2">
							<fo:block>BOP/BOC/BOE</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>SUELO</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>UNITARIO</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>REPERCUSIÓN</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>SUELO</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>CONSTRUCION</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="5">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row font-size="4pt" space-before="1pt">
						<fo:table-cell>
							<fo:block>FECHA</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>NÚMERO</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MBR7(€/m2)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>VUB(€/m2)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>VRB(€/m2)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MBR(€/m2)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MBC(€/m2)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MBCI(€/unidad)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MBPE(€/MW)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MBPG(€/(m3/h))</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MBPR(€/elemento)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>MCUA(€/m)</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body xsl:use-attribute-sets="cuerpo">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:fbop"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:nbop"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbrci"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:vup"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:vrp"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbrs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbcci"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbpe"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbpg"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbpr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mcua"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="a:valsuelo">
		<fo:table xsl:use-attribute-sets="titulo">
			<fo:table-column column-width="190mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block>VALORACIÓN DEL SUELO</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="a:B03">
		<fo:block xsl:use-attribute-sets="titulo2">SUELO AGRARIO</fo:block>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="16mm"/>
			<fo:table-column column-width="26mm"/>
			<fo:table-column column-width="16mm"/>
			<fo:table-column column-width="50mm"/>
			<fo:table-column column-width="10mm" number-columns-repeated="2"/>
			<fo:table-column column-width="20mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="20mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>SUBPARCELA</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>SUPERFICIE (Ha)</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="2">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="16mm"/>
							<fo:table-column column-width="50mm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" border="0.25mm solid black">
										<fo:block>CALIFICACIÓN CATASTRAL</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>CÓDIGO</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>DESCRIPCIÓN</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>INTENSIDAD PRODUCTIVA</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="2">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="10mm"/>
							<fo:table-column column-width="20mm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" border="0.25mm solid black">
										<fo:block>TIPO EVALUATORIO</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>EJERCICIO</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>IMPORTE (€/Ha)</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="not(a:lvspr/a:vspr/a:pctrep = '100,000000')">
								% DE REPARTO
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR (€)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvspr/a:vspr">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:cspr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:ssp"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:dcc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ip"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ate"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:te"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:if test="not(a:pctrep = '100,000000')">
									<xsl:value-of select="a:pctrep"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vsp"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
		<fo:table xsl:use-attribute-sets="total">
			<fo:table-column column-width="169.5mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right">TOTAL SUELO AGRARIO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell border="0.25mm solid black" background-color="gray">
						<fo:block>
							<xsl:value-of select="a:tvsp"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:B04">
		<fo:block xsl:use-attribute-sets="titulo2">SUELO RÚSTICO OCUPADO POR CONSTRUCCIÓN</fo:block>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="15mm" number-columns-repeated="2"/>
			<fo:table-column column-width="24mm"/>
			<fo:table-column column-width="14mm" number-columns-repeated="2"/>
			<fo:table-column column-width="7mm" number-columns-repeated="5"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="10mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>UNIDAD CONSTRUCTIVA</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>SUPERFICIE (m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>USO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>COEFICIENTE</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>MBR</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="5">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="7mm" number-columns-repeated="5"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black" number-columns-spanned="5">
										<fo:block>COEF. CORRECTORES</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>J</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>K</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>L</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>M</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>N</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>RM</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>IMPORTE MBR (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR UNITARIO RESULTANTE (€/M2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR (€)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvsrc/a:vsrc">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:cuc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:so"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:duso"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:coef"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:mbr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccdf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccvli"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcccs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcce"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccad"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:imbr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:vuscr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:vs"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
		<fo:table xsl:use-attribute-sets="total">
			<fo:table-column column-width="169.5mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right">TOTAL SUELO RÚSTICO POR CONSTRUCCIÓN</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell border="0.25mm solid black" background-color="gray">
						<fo:block>
							<xsl:value-of select=".//a:tvsrc"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:B05">
		<fo:block xsl:use-attribute-sets="titulo2">VALORACIÓN POR UNITARIO</fo:block>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="15mm" number-columns-repeated="2"/>
			<fo:table-column column-width="16mm"/>
			<fo:table-column column-width="6.2mm" number-columns-repeated="17"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="17mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>SUBPARCELA</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>SUPERFICIE</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'UR' or  /a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'RU'">
								ZONA DE VALOR
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="9">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="9"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black" number-columns-spanned="9" display-align="center">
										<fo:block>COEFICIENTES CORRECTORES</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>A</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>B</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>C</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>D</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>E</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>F</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>G</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>
											<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'BI'">S</xsl:if>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black" display-align="center">
										<fo:block>
											<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'BI'">X</xsl:if>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="6">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="6"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="6" border="0.25mm solid black">
										<fo:block>COEF. CORRECTORES CONJUNTOS</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>J</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>K</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>L</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>M</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>N</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block/>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="string(a:lvsu/a:vsu/a:gb)">
								G+B
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>RM</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR UNITARIO (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR (€)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvsu/a:vsu">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:subp"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:sup"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:zv"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvs/a:vccvf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvs/a:vcclf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:ccvs/a:vccfi"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:ccvs/a:vccfe"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:ccvs/a:vccsdm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:ccvs/a:vccit"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:ccvs/a:vccpp"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:ccvs/a:vcces"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:ccvs/a:vccca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:cccsc/a:vccdf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:cccsc/a:vccvli"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:cccsc/a:vcccs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:cccsc/a:vcce"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:cccsc/a:vccad"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:gb"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:vus"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select=".//a:vsp"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:BC6">
		<fo:block xsl:use-attribute-sets="titulo2">VALORACIÓN POR REPERCUSIÓN</fo:block>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="8mm"/>
			<fo:table-column column-width="12mm"/>
			<fo:table-column column-width="10mm" number-columns-repeated="3"/>
			<fo:table-column column-width="20mm"/>
			<fo:table-column column-width="12.8mm"/>
			<fo:table-column column-width="6.2mm" number-columns-repeated="11"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="17mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>LOCAL</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>E/PL/PT</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>SUPERFICIE (m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>DESTINO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'UR' or  /a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'RU'">
								ZONA DE VALOR
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>TIPO DE VALOR DE REPERCUSIÓN</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="3">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="3"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black" number-columns-spanned="3">
										<fo:block>COEF. CORRECTORES</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>A</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>B</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>
											<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'BI'">X</xsl:if>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="6">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="6"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="6" border="0.25mm solid black">
										<fo:block>COEF. CORRECTORES CONJUNTOS</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>J</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>K</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>L</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>M</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>N</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block/>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="string(a:lvsrrc/a:vsrrc/a:gbc) or string(a:lvsrrp/a:vsrrp/a:gbc)">
								G+B
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>RM</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR REPERCUSIÓN (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR (€)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvsrrp/a:vsrrp">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:noec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:loint/a:es"/>/
								<xsl:value-of select="a:loint/a:pt"/>/
								<xsl:value-of select="a:loint/a:pu"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:stl"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:cdes"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'UR' or  /a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'RU'">
									<xsl:value-of select="a:zv"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:tvr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsr/a:vccvf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsr/a:vcclf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsr/a:vccca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccdf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccvli"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcccs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcce"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccad"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:gbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell text-align="right" border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vrs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell text-align="right" border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vsp"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="string(a:lvsrrc/a:vsrrc)">
					<fo:table-row border-top="0.25mm solid black" border-bottom="0.25mm solid black" font-size="4pt">
						<fo:table-cell text-align="left" number-columns-spanned="6" border-left="0.25mm solid white">
							<fo:block>
								Parte correspondiente de elementos comunes
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-weight="normal">
								% de reparto
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="15" border-right="0.25mm solid white">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
				<xsl:for-each select="a:lvsrrc/a:vsrrc">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:noec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:loint/a:es"/>/
								<xsl:value-of select="a:loint/a:pt"/>/
								<xsl:value-of select="a:loint/a:pu"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:stl"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:cdes"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:zv"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:tvr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:pctrep"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsr/a:vccvf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsr/a:vcclf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsr/a:vccca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccdf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccvli"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcccs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcce"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccad"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:gbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell text-align="right" border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vrs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell text-align="right" border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vsp"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:BS6">
		<fo:block xsl:use-attribute-sets="titulo2" font-size="5">Construcción Potencial</fo:block>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="20mm"/>
			<fo:table-column column-width="15mm" number-columns-repeated="2"/>
			<fo:table-column column-width="32.8mm"/>
			<fo:table-column column-width="6.2mm" number-columns-repeated="11"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="17mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>SUBPARCELA</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>SUPERFICIE (m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'UR' or  /a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'RU'">
								ZONA DE VALOR
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>TIPO DE VALOR DE REPERCUSIÓN</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="3">
						<fo:table>
							<fo:table-column column-width="6.2mm" number-columns-repeated="3"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black" number-columns-spanned="3">
										<fo:block>COEF. CORRECTORES</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>A</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>B</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block/>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="6">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="6"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="6" border="0.25mm solid black">
										<fo:block>COEF. CORRECTORES CONJUNTOS</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>J</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>K</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>L</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>M</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>N</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block/>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="not(a:lvsrp/a:vsrp/a:gb = '1.00')">
								G+B
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>RM</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR REPERCUSIÓN (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR (€)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvsrp/a:vsrp">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:subp"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:sup"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:zv"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:tvr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsc/a:vccvf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvsc/a:vcclf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccdf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccvli"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcccs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcce"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccad"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:gb"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell text-align="right" border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vrs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell text-align="right" border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vsp"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:tvcs">
		<fo:table xsl:use-attribute-sets="total">
			<fo:table-column column-width="169.5mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right">TOTAL SUELO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell border="0.25mm solid black" background-color="gray">
						<fo:block>
							<xsl:value-of select="string()"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:BA5">
		<fo:table table-layout="fixed" space-before="10pt">
			<fo:table-column column-width="40mm" number-columns-repeated="2"/>
			<fo:table-column column-width="20mm" number-columns-repeated="2"/>
			<fo:table-column column-width="35mm"/>
			<fo:table-column column-width="20mm"/>
			<fo:table-column column-width="15mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>SUPERFICIE (m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR DEL SUELO (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>COEFICIENTES APLICADOS</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>TOTAL DE COEFICIENTES APLICADOS AL SUELO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>TOTAL COEFICIENTES CONJUNTOS</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							G+B
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvspa/a:vspa">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:sup"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:evs/a:vus"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:evs/a:icca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:evs/a:vtccvs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:evs/a:vtccvsc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:evs/a:gbs"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:valconst">
		<fo:table xsl:use-attribute-sets="titulo">
			<fo:table-column column-width="190mm" background-color="gray"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block>VALORACIÓN DE LA CONSTRUCCIÓN</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="a:B07">
		<fo:block xsl:use-attribute-sets="titulo2">
			<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'BI'">CONSTRUCCIÓN CONVENCIONAL</xsl:if>
		</fo:block>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="8mm"/>
			<fo:table-column column-width="12mm" number-columns-repeated="2"/>
			<fo:table-column column-width="17.4mm"/>
			<fo:table-column column-width="11mm"/>
			<fo:table-column column-width="5mm"/>
			<fo:table-column column-width="7.4mm"/>
			<fo:table-column column-width="9mm"/>
			<fo:table-column column-width="6.2mm" number-columns-repeated="11"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="17mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>LOCAL</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>E/PL/PT</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>SUPERFICIE</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>DESTINO - ANTIGÜEDAD - CONSERVACIÓN</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="3">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="5mm"/>
							<fo:table-column column-width="7.4mm"/>
							<fo:table-column column-width="9mm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black" number-columns-spanned="3">
										<fo:block>COSTE DE CONSTRUCCIÓN</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>MBC</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>TIPOLOGÍA</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>COEF.</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="3">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="3"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black" number-columns-spanned="3">
										<fo:block>COEF. CORRECTORES</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>H</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>I</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>
											<xsl:if test="/a:inmval/a:identinm/a:bi/a:idcat/a:cn = 'BI'">X</xsl:if>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="6">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="6"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="6" border="0.25mm solid black">
										<fo:block>COEFICIENTES CORRECTORES CONJUNTOS</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>J</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>K</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>L</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>M</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>N</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block/>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:if test="not(a:lvcec/a:vcec/a:gbc = 1.00 and a:lvcep/a:vcep/a:gbc = '1.00')">
								G+B
							</xsl:if>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>RM</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>IMPORTE MBC (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR (€)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvcep/a:vcep">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:noec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:loint/a:es"/>/
								<xsl:value-of select="a:loint/a:pt"/>/
								<xsl:value-of select="a:loint/a:pu"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:stl"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:cdes"/>-
								<xsl:value-of select="a:ant"/>-
								<xsl:value-of select="a:ccec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:mbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:tip"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:cf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvc/a:vccac"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvc/a:vccec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvc/a:vccca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccdf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccvli"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcccs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcce"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccad"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:gbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:immbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vcc"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="string(a:lvcec/a:vcec)">
					<fo:table-row border-bottom="0.25mm solid black" border-top="0.25mm solid black" font-size="4pt">
						<fo:table-cell text-align="left" number-columns-spanned="4" border-left="0.25mm solid white">
							<fo:block>
									Parte correspondiente a elementos comunes
								</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-weight="normal">
									% de reparto
								</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="18" border-right="0.25mm solid white">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
				<xsl:for-each select="a:lvcec/a:vcec">
					<fo:table-row border="0.25mm solid black">
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:noec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:loint/a:es"/>/
								<xsl:value-of select="a:loint/a:pt"/>/
								<xsl:value-of select="a:loint/a:pu"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:stl"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:cdes"/>-
								<xsl:value-of select="a:ant"/>-
								<xsl:value-of select="a:ccec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:pctrep"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:mbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:tip"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:cf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvc/a:vccac"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvc/a:vccec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvc/a:vccca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccdf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccvli"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcccs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vcce"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cccsc/a:vccad"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:gbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:immbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vcc"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:B08">
		<fo:block xsl:use-attribute-sets="titulo2">CONSTRUCCIÓN SINGULAR</fo:block>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="8mm"/>
			<fo:table-column column-width="12.2mm"/>
			<fo:table-column column-width="18mm" number-columns-repeated="2"/>
			<fo:table-column column-width="30mm"/>
			<fo:table-column column-width="5mm"/>
			<fo:table-column column-width="7.4mm"/>
			<fo:table-column column-width="9mm"/>
			<fo:table-column column-width="6.2mm" number-columns-repeated="7"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="17mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>Nº ORDEN</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>E/PL/PU (m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>UNIDADES DE VALORACIÓN</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>ANTIGÜEDAD</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>DESCRIPCIÓN DE LA TIPOLOGÍA</fo:block>
					</fo:table-cell>
					<xsl:if test="string(a:lvcs/a:vcs/a:cdc/a:mbc) or string(a:lvcs/a:vcs/a:cdc/a:tip) or string(a:lvcs/a:vcs/a:cdc/a:cf)">
						<fo:table-cell number-columns-spanned="3">
							<fo:table table-layout="fixed">
								<fo:table-column column-width="5mm"/>
								<fo:table-column column-width="7.4mm"/>
								<fo:table-column column-width="9mm"/>
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell border="0.25mm solid black" number-columns-spanned="3">
											<fo:block>COSTE DE CONSTRUCCIÓN</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell border="0.25mm solid black">
											<fo:block>Módulo</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.25mm solid black">
											<fo:block>TIPOLOGÍA</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.25mm solid black">
											<fo:block>COEF.</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
					</xsl:if>
					<xsl:if test="not(string(a:lvcs/a:vcs/a:cdc/a:mbc) or string(a:lvcs/a:vcs/a:cdc/a:tip) or string(a:lvcs/a:vcs/a:cdc/a:cf))">
						<fo:table-cell number-columns-spanned="3">
							<fo:block/>
						</fo:table-cell>
					</xsl:if>
					<fo:table-cell number-columns-spanned="5">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="6.2mm" number-columns-repeated="5"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="5" border="0.25mm solid black">
										<fo:block>COEFICIENTES CORRECTORES</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>V</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>W</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>O</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>P</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.25mm solid black">
										<fo:block>X</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>RM</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>IMPORTE MÓDULO BÁSICO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR (€)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvcs/a:vcs">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:noec"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:loint/a:es"/>/
								<xsl:value-of select="a:loint/a:pt"/>/
								<xsl:value-of select="a:loint/a:pu"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:uvbi"/>
								<xsl:value-of select="a:stl"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:ant"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left">
							<fo:block>
								<xsl:value-of select="a:ddes"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:mbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:tip"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:cdc/a:cf"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvcs/a:vccev"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvcs/a:vccac"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvcs/a:vccot"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvcs/a:vccps"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:ccvcs/a:vccca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:rm"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:immbc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="blanco">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vcc"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:tvc">
		<fo:table xsl:use-attribute-sets="total">
			<fo:table-column column-width="169.5mm"/>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column column-width="19mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block text-align="right">TOTAL CONSTRUCCIÓN</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block/>
					</fo:table-cell>
					<fo:table-cell border="0.25mm solid black" background-color="gray">
						<fo:block>
							<xsl:value-of select="string()"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:BA7">
		<fo:block font-weight="bold" font-size="5" space-before="8"/>
		<fo:table table-layout="fixed">
			<fo:table-column column-width="14mm"/>
			<fo:table-column column-width="20mm"/>
			<fo:table-column column-width="30mm"/>
			<fo:table-column column-width="18mm" number-columns-repeated="7"/>
			<fo:table-header xsl:use-attribute-sets="cabecera">
				<fo:table-row>
					<fo:table-cell>
						<fo:block>E/PL/PU (m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>SUPERFICIE (m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>USO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR DE REPERCUSIÓN DEL SUELO (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>VALOR UNITARIO DE LA CONSTRUCCIÓN (€/m2)</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>COEFICIENTES APLICADOS</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>TOTAL COEFICIENTES APLICADOS AL SUELO</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>TOTAL COEF. APLICADOS A LA CONSTRUCCIÓN</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>TOTAL COEFICIENTES CONJUNTOS</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>G + B</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body xsl:use-attribute-sets="cuerpo">
				<xsl:for-each select="a:lvcpa/a:vcpa">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:loint/a:es"/>/
								<xsl:value-of select="a:loint/a:pt"/>/
								<xsl:value-of select="a:loint/a:pu"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:stl"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:evcons/a:ddes"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="a:evcons/a:vrs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:vuc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:evcons/a:icca"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:evcons/a:vtccvs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:evcons/a:vtccvc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:evcons/a:vtccvsc"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border-left="0.25mm solid black">
							<fo:block>
								<xsl:value-of select="a:evcons/a:gbc"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<fo:table-row border="0.25mm solid black" text-align="left">
					<fo:table-cell number-columns-spanned="10">
						<fo:block>
								SUPERFICIE DE ELEMENTOS COMUNES (m2): <xsl:value-of select="a:sup"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="a:valores">
		<fo:table xsl:use-attribute-sets="titulo">
			<fo:table-column column-width="190mm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block>VALORES CATASTRALES</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="a:B09">
		<fo:block>
			<fo:table table-layout="fixed">
				<fo:table-column column-width="26mm" number-columns-repeated="6"/>
				<fo:table-column column-width="7mm"/>
				<fo:table-column column-width="27mm"/>
				<fo:table-header xsl:use-attribute-sets="cabecera" font-size="5.5pt">
					<fo:table-row font-weight="bold">
						<fo:table-cell>
							<fo:block>AÑO</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:if test="string(a:totval/a:vcsa)">VALOR SUELO AGRARIO(€)</xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:if test="string(a:totval/a:vcsrc)">VALOR SUELO RÚSTICO OCUPADO POR CONSTRUCCIÓN(€)</xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<!--xsl:if test="not(R65:663 = RU)"-->
									VALOR CATASTRAL DEL SUELO(€)
								<!--/xsl:if-->
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>VALOR CATASTRAL DE LA CONSTRUCCIÓN(€)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>VALOR CATASTRAL TOTAL(€)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:if test="string(a:totval/a:pav)"> LÍMITE ADMINISTRATIVO AL VALOR (€)</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body xsl:use-attribute-sets="cuerpo" background-color="gray">
					<xsl:for-each select="a:totval">
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="a:avc"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="a:vcsa"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="a:vcsrc"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="a:vcs"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="a:vcc"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="a:vcat"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="blanco" background-color="white">
								<fo:block/>
							</fo:table-cell>
							<xsl:if test="string(a:totval/a:pav)">
								<fo:table-cell border-left="0.25mm solid black" background-color="white">
									<fo:block>
										<xsl:value-of select="a:pav"/>
									</fo:block>
								</fo:table-cell>
							</xsl:if>
							<xsl:if test="not(string(a:totval/a:pav))">
								<fo:table-cell background-color="white" border-right="0.25mm solid white" border-top="0.25mm solid white" border-bottom="0.25mm solid white">
									<fo:block>
										<xsl:value-of select="a:pav"/>
									</fo:block>
								</fo:table-cell>
							</xsl:if>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block space-before="20pt" margin-left="35pt">
			<!--<xsl:if test="*">-->
			<fo:table table-layout="fixed" font-size="6pt">
				<fo:table-column column-width="154mm" absolute-position="fixed"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding="0.5mm" text-align="center">
							<fo:block font-weight="bold">Impuesto sobre Bienes Inmuebles</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:table table-layout="fixed">
				<fo:table-column column-width="22mm" number-columns-repeated="7"/>
				<fo:table-header xsl:use-attribute-sets="cabecera">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>AÑO</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:if test="string(a:iibi/a:cicir)">COEF. MUNICIPAL</xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>BASE IMPONIBLE (€)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>VALRO BASE (€)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>REDUCCIÓN (€)</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>ÚLTIMO AÑO CON REDUCCION</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>BASE LIQUIDABLE</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body xsl:use-attribute-sets="cuerpo">
					<fo:table-row>
						<fo:table-cell padding="1mm">
							<fo:block font-weight="bold">
								<xsl:value-of select="a:iibi/a:evcr"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block font-weight="bold">
								<xsl:value-of select="a:iibi/a:cicir"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block font-weight="bold">
								<xsl:value-of select="a:iibi/a:bimp"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block font-weight="bold">
								<xsl:value-of select="a:iibi/a:vb"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block font-weight="bold">
								<xsl:value-of select="a:iibi/a:ired"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block font-weight="bold">
								<xsl:value-of select="a:iibi/a:uared"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block font-weight="bold">
								<xsl:value-of select="a:iibi/a:bl"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<!--</xsl:if>-->
			<!--<xsl:if test="r22 = t0">-->
			<fo:table table-layout="fixed" font-size="5pt" text-align="center">
				<fo:table-column column-width="154mm" absolute-position="fixed"/>
				<fo:table-body border="0.25mm solid black" text-align="center" background-color="gray">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<fo:inline font-weight="bold">A título informativo</fo:inline>, se indica que el <fo:inline font-weight="bold">Ayuntamiento del lugar en que se localiza el inmueble</fo:inline> determinará en su momento la cuota del <fo:inline font-weight="bold">Impuesto sobre Bienes Inmuebles</fo:inline>, considerando el tipo de gravamen por él establecido y, en su caso, las bonificacciones o exenciones que resulten de aplicación.
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<!--</xsl:if>-->
			<!--<xsl:if test="r22 = p0">-->
			<fo:table table-layout="fixed" font-size="5pt" text-align="center">
				<fo:table-column column-width="38.5mm" number-columns-repeated="4"/>
				<fo:table-body border="0.25mm solid black" background-color="gray">
					<fo:table-row>
						<fo:table-cell number-columns-spanned="4">
							<fo:block>
								<fo:inline font-weight="bold">A título informativo</fo:inline>, se le indican los datos facilitados por el Ayuntamiento de <fo:inline font-weight="bold">
									<xsl:value-of select="preceding::a:bi/a:dt/a:nm"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								Extención/Bonificación:<fo:inline font-weight="bold">
									<xsl:value-of select="preceding::a:bi/a:dt/a:nm"/> €</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block>
								Límite del art. 74.2 TRLRHL: <fo:inline font-weight="bold">
									<xsl:value-of select="preceding::a:bi/a:dt/a:nm"/> €</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block>
								Tipo de gravamen: <fo:inline font-weight="bold">
									<xsl:value-of select="preceding::a:bi/a:dt/a:nm"/> %</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1mm">
							<fo:block>
								Cuota Líquida: <fo:inline font-weight="bold">
									<xsl:value-of select="preceding::a:bi/a:dt/a:nm"/> €</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<!--</xsl:if>-->
	</xsl:template>
</xsl:stylesheet>
