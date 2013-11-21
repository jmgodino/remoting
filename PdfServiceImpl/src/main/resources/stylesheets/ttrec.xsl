<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fo="http://www.w3.org/1999/XSL/Format" >

<xsl:template match="tasa">

  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <fo:layout-master-set>
      <fo:simple-page-master master-name="interesado"
                             page-height="29.7cm" 
                             page-width="21cm"
                             margin-top="0.71cm" 
                             margin-bottom="5cm" 
                             margin-left="0.18cm" 
                             margin-right="0.18cm">
        <fo:region-body margin-top="3.4cm"/>
        <fo:region-before margin-top="0cm" 
                          margin-bottom="0cm" 
                          margin-left="0cm" 
                          margin-right="0cm"
                          extent="0cm"/>
        <fo:region-after extent="1.5cm"/>
      </fo:simple-page-master>
      <fo:simple-page-master master-name="informacion"
                             page-height="29.7cm" 
                             page-width="21cm"
                             margin-top="0.71cm" 
                             margin-bottom="0cm" 
                             margin-left="0.18cm" 
                             margin-right="0.18cm">
        <fo:region-body margin-top="1cm"
                        margin-bottom="1cm"
                        margin-left="0.8cm"
                        margin-right="0.8cm"/>
      </fo:simple-page-master>
    </fo:layout-master-set>
    
    <fo:page-sequence master-reference="interesado">
      <fo:static-content flow-name="xsl-region-before">
        <fo:table end-indent="0in" 
                  border-collapse="separate"
                  table-layout="fixed" 
                  width="100%">

          <fo:table-column column-width="5.02cm"/>
          <fo:table-column column-width="6.32cm"/>
          <fo:table-column column-width="0.08cm"/>
          <fo:table-column column-width="6.11cm"/>
          <fo:table-column column-width="0.10cm"/>
          <fo:table-column column-width="2.34cm"/>

          <fo:table-body font-family="Helvetica">
            <fo:table-row background-color="#DCDCDC" 
                          height="3.37cm">
              <fo:table-cell background-image="/images/escudotif.tif">
                <fo:block padding-top="2.5cm"
                          text-align="center"
                          font-size="8pt"
                          font-weight="bold">
                  MINISTERIO DE HACIENDA Y ADMINISTRACIONES PÚBLICAS
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border="black 0.475pt solid"
                             font-family="Helvetica">
                <fo:block padding-top="0.5cm"
                          text-align="center"
                          font-size="9pt"
                          font-weight="bold">
                  CENTRO GESTOR: 
                </fo:block>
                <fo:block text-align="left"
                          font-size="9pt"
                          font-weight="bold"
                          margin-left="0cm"
                          padding-left="0.2cm">
                  DIRECCIÓN GENERAL DEL CATASTRO
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell background-color="#FFFFFF">
                         
                <fo:block text-align="center">
                </fo:block>
              </fo:table-cell>
                       
              <fo:table-cell border="black 0.475pt solid">
                <fo:block padding-top="0.5cm"
                          text-align="center"
                          font-size="9pt"
                          font-weight="bold">
                  TASA REGULARIZACIÓN CATASTRAL
                </fo:block>
                <fo:block padding-top="1.15cm"
                          text-align="center"
                          font-size="9.5pt"
                          font-weight="bold">
                  CODIGO: 040
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell background-color="#FFFFFF">                         
                <fo:block text-align="center">
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell border="black 0.475pt solid">
                <fo:block padding-top="0.5cm"
                          text-align="center"
                          font-size="11pt"
                          font-weight="bold">
                  Modelo
                </fo:block>
                <fo:block padding-top="0.68cm"
                          text-align="center"
                          font-size="25pt"
                          font-weight="bold">
                  990
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:static-content>
      
      <fo:static-content flow-name="xsl-region-after">
      
        <fo:table font-family="Helvetica"
                  end-indent="0in"  
                  border-collapse="separate" 
                  table-layout="fixed" 
                  width="100%">
          <fo:table-column column-width="0.86cm"/>
          <fo:table-column column-width="0.10cm"/>
          <fo:table-column column-width="0.65cm"/>
          <fo:table-column column-width="8.35cm"/>
          <fo:table-column column-width="0.62cm"/>
          <fo:table-column column-width="9.38cm"/>
          <fo:table-body>
          
            <fo:table-row background-color="#FFFFFF" 
                          height="1.15cm">
                             
              <fo:table-cell number-rows-spanned="5"
                             background-color="#DCDCDC"
                             border="black 0.475pt solid">                             
                <fo:block>
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell number-rows-spanned="5"
                             background-color="#FFFFFF">
                             
                <fo:block >
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell number-rows-spanned="5"
                             background-color="#DCDCDC"
                             border="black 0.475pt solid">
                             
                <fo:block-container reference-orientation="90" 
                                    font-weight="bold"
                                    width="5.2cm"
                                    height="0.5cm"
                                    margin-left="0cm"
                                    padding-left="0.08cm">
                  <fo:block>ORGANO LIQUIDADOR</fo:block>
                </fo:block-container>
              </fo:table-cell>
              
              <fo:table-cell border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid"
                             border-top-color="black"
                             border-left-color="black"
                             border-top-width="0.475pt"
                             border-left-width="0.475pt"
                             border-top-style="solid"
                             border-left-style="solid">
                  <fo:block padding-top="0.4cm"
                            text-align="left"
                            font-size="12pt"
                            font-family="Arial"
                            margin-left="0cm"
                            padding-left="0.5cm">
                    En <xsl:value-of select="./id/domi/den_provincia"/> ,
                  </fo:block>          
              </fo:table-cell>
              
              <fo:table-cell number-rows-spanned="5"
                             background-color="#DCDCDC"
                             border="black 0.475pt solid">
                             
                <fo:block-container reference-orientation="90" 
                                    font-weight="bold"
                                    width="3.8cm"
                                    height="0.5cm"
                                    margin-left="0cm"
                                    padding-left="0.08cm">
                  <fo:block>INGRESO</fo:block>
                </fo:block-container>
              </fo:table-cell>
              
              <fo:table-cell border-top-color="black"
                             border-top-width="0.475pt" 
                             border-top-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:block padding-top="0.15cm"
                          text-align="justify"
                          font-size="8pt"
                          margin-left="0cm"
                          padding-left="0.3cm"
                          margin-right="0cm"
                          padding-right="1cm">
                  Ingreso efectuado a favor del TESORO PÚBLICO, cuenta restringida de la A.E.A.T. Para la Recaudación de TASAS
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="1.65cm">
              
              <fo:table-cell border-left-color="black"
                             border-left-width="0.475pt" 
                             border-left-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                <fo:block text-align="left"
                          font-size="12pt"
                          font-family="Arial"
                          margin-left="0cm"
                          padding-left="0.5cm">
                  a <xsl:value-of select="./org/fecha_tasa"/>
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell background-image="/images/importe.png"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:list-block>

                  <fo:list-item>
                    <fo:list-item-label>
                      <fo:block padding-top="0.38cm"
                                text-align="left"
                                font-size="10pt"
                                margin-left="0cm"
                                padding-left="0.5cm">
                        Importe Euros:
                      </fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body>
                      <fo:block padding-top="0.38cm"
                                text-align="right"
                                font-size="10pt"
                                font-weight="bold"
                                margin-right="0cm"
                                padding-right="0.5cm"> 
                        <xsl:value-of select="./org/importe_total"/>
                        <fo:character character="&#x2004;"/>€
                      </fo:block>
                    </fo:list-item-body>
                  </fo:list-item>
                </fo:list-block>
              </fo:table-cell>
              
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="2.1cm">
              
              <fo:table-cell number-rows-spanned="2"
                             border-left-color="black"
                             border-left-width="0.475pt" 
                             border-left-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:block text-align="left"
                          font-size="6.95pt"
                          margin-left="0cm"
                          padding-left="0.5cm"
                          margin-right="0cm"
                          padding-right="0.5cm">
                  Documento firmado electrónicamente con código seguro de verificación (CSV) por la Dirección General del Catastro
                </fo:block>
                <fo:block text-align="center"
                          font-size="8pt"
                          margin-left="0cm"
                          padding-left="0.5cm"
                          padding-top="0.38cm"
                          margin-right="0cm"
                          padding-right="0.5cm">
                    <xsl:text>CSV: </xsl:text><xsl:value-of select="./csv"/>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="0.1cm">
              
              <fo:table-cell background-image="/images/ccc.png"
                             number-rows-spanned="2"
                             border-bottom-color="black"
                             border-bottom-width="0.475pt"
                             border-bottom-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">                         
                  <fo:list-block>
                    <fo:list-item>
                      <fo:list-item-label>
                        <fo:block padding-top="0.3cm"
                                  text-align="left"
                                  margin-left="0pt"
                                  padding-left="0.5cm"
                                  font-size="8pt">
                          Forma de pago: En efectivo
                        </fo:block>
                      </fo:list-item-label>
                      <fo:list-item-body>
                        <fo:block padding-top="0.3cm"
                                  text-align="right"
                                  margin-right="0pt"
                                  padding-right="1cm"
                                  font-size="8pt">
                          E.C. Adeudo en cuenta
                        </fo:block>
                      </fo:list-item-body>
                    </fo:list-item>
                  </fo:list-block>
                
                <fo:block padding-top="0.3cm"
                          margin-left="0pt"
                          padding-left="3.15cm"
                          font-size="7pt">
                    <xsl:text>Código cuenta cliente (CCC)</xsl:text>
                </fo:block>
                
                <fo:block padding-top="0.3cm"
                          margin-left="0pt"
                          padding-left="1cm"
                          font-size="7pt">
                  Entidad <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                  Oficina <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                  DC      <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                  Número de cuenta
                </fo:block>
                
              </fo:table-cell>
              
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="0.7cm">
              
              <fo:table-cell border-left-color="black"
                             border-left-width="0.475pt" 
                             border-left-style="solid"
                             border-bottom-color="black"
                             border-bottom-width="0.475pt"
                             border-bottom-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:block text-align="center"
                          font-size="8pt"
                          font-weight="bold">
                  EJEMPLAR PARA EL INTERESADO
                </fo:block>
              </fo:table-cell>          
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block font-family="Helvetica"
                  text-align="center"
                  font-size="6pt"
                  margin-left="0pt"
                  padding-left="6cm">
          Este documento no será válido sin la certificación mecánica o, en su defecto, firma autorizada
        </fo:block>      
      </fo:static-content>
      
      <fo:flow flow-name="xsl-region-body">   
        <xsl:apply-templates/>  
      </fo:flow>
    </fo:page-sequence>
    
    <fo:page-sequence master-reference="informacion">
      <fo:static-content flow-name="xsl-region-before">
        <fo:block >
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body">   
        <fo:table font-family="Helvetica"
                  end-indent="0in"  
                  border-collapse="separate" 
                  table-layout="fixed" 
                  width="100%">
                  
          <fo:table-column column-width="100%"/>
        
          <fo:table-body>        
            <fo:table-row background-color="#FFFFFF" 
                          height="0.19cm">
              
              <fo:table-cell border="black 0.475pt solid"
                             text-align="justify"
                             font-size="10pt"
                             padding-top="0.2cm"
                             padding-right="0.3cm">
                <fo:block text-align="center"
                          font-weight="bold"
                          font-size="11pt">
                  INSTRUCCIONES - TASA DE REGULARIZACIÓN CATASTRAL
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block font-weight="bold"
                          margin-left="0pt"
                          padding-left="0.2cm">
                  Plazo para efectuar el ingreso
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="0.4cm">
                  Según el artículo 62 de la Ley 58/2003, de 17 de diciembre, General Tributaria, el pago en período voluntario deberá hacerse en
                  los siguientes plazos:
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="1cm">
                  a)<fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>Recibida la notificación de la liquidación entre los días 1 y 15 de cada mes, desde la fecha de recepción de la
                  notificación hasta el día 20 del mes posterior o, si éste fuera inhábil, hasta el inmediato hábil siguiente.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="1cm">
                  b)<fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>Recibida la notificación entre los días 16 y último de cada mes, desde la fecha de recepción de la notificación hasta el
                  día 5 del segundo mes posterior o, si éste fuera inhábil, hasta el inmediato hábil siguiente.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block font-weight="bold"
                          margin-left="0pt"
                          padding-left="0.2cm">
                  Lugar de pago
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="0.4cm">
                  A través de cualquier ENTIDAD COLABORADORA (Bancos, Cajas de Ahorro y Cooperativas de Crédito) en las que no es
                  preciso tener cuenta abierta, siempre que el pago se realice en efectivo, mediante la presentación de este documento de ingreso.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block font-weight="bold"
                          margin-left="0pt"
                          padding-left="0.2cm">    
                  Recursos
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="0.4cm">
                  Contra la presente liquidación puede interponer reclamación económico-administrativa ante el Tribunal Económico-
                  administrativo competente en el plazo de un mes, contado a partir del día siguiente al de su recepción.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="0.4cm">
                  Con carácter potestativo y previo a dicha reclamación puede interponer recurso de reposición ante la Gerencia o Subgerencia que
                  ha practicado la liquidación, en el mismo plazo, no siendo posible la interposición simultánea de ambos recursos.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="0.4cm">
                  La reclamación económico-administrativa o el recurso de reposición deberán dirigirse en todo caso al órgano que ha practicado la
                  liquidación.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="0.4cm">
                  El procedimiento recaudatorio solamente se suspenderá si en el momento de interponer el recurso de reposición o la reclamación
                  económico-administrativa, se garantiza el pago de la deuda en los términos establecidos en el artículo 25 y 39 y siguientes del
                  Reglamento General de desarrollo de la Ley 58/2003, de 17 de diciembre, General Tributaria, en materia de revisión en vía
                  administrativa, aprobado por Real Decreto 520/2005, de 13 de mayo.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block font-weight="bold"
                          margin-left="0pt"
                          padding-left="0.2cm">
                  Consecuencias de la falta de pago
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
                <fo:block margin-left="0pt"
                          padding-left="0.4cm"> 
                  El vencimiento del plazo de ingreso voluntario sin haber sido satisfecha la deuda, determinará el inicio del procedimiento de
                  apremio y la exigencia de los intereses de demora y los recargos del período ejecutivo, de acuerdo con lo dispuesto en los artículo
                  161 y siguientes de la Ley 58/2003, de 17 de diciembre, General Tributaria y en los artículos 69 y siguientes del Reglamento
                  General de Recaudación, aprobado por Real Decreto 939/2005, de 29 de julio.
                </fo:block>
                <fo:block><fo:character character="&#x2004;"/></fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
    </fo:page-sequence>
    
    <fo:page-sequence master-reference="interesado">
      <fo:static-content flow-name="xsl-region-before">
        <fo:table font-family="Helvetica"
                  end-indent="0in" 
                  border-collapse="separate"
                  table-layout="fixed" 
                  width="100%">
                  
          <fo:table-column column-width="5.02cm"/>
          <fo:table-column column-width="6.32cm"/>
          <fo:table-column column-width="0.08cm"/>
          <fo:table-column column-width="6.11cm"/>
          <fo:table-column column-width="0.10cm"/>
          <fo:table-column column-width="2.34cm"/>

          <fo:table-body>
            <fo:table-row background-color="#DCDCDC" 
                          height="3.37cm">
              <fo:table-cell background-image="/images/escudotif.tif">
                <fo:block padding-top="2.5cm"
                          text-align="center"
                          font-size="8pt"
                          font-weight="bold">
                  MINISTERIO DE HACIENDA Y ADMINISTRACIONES PÚBLICAS
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border="black 0.475pt solid"
                             font-family="Helvetica">
                <fo:block padding-top="0.5cm"
                          text-align="center"
                          font-size="9pt"
                          font-weight="bold">
                  CENTRO GESTOR: 
                </fo:block>
                <fo:block text-align="left"
                          font-size="9pt"
                          font-weight="bold"
                          margin-left="0cm"
                          padding-left="0.2cm">
                  DIRECCIÓN GENERAL DEL CATASTRO
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell background-color="#FFFFFF">
                         
                <fo:block text-align="center">
                </fo:block>
              </fo:table-cell>
                       
              <fo:table-cell border="black 0.475pt solid">
                <fo:block padding-top="0.5cm"
                          text-align="center"
                          font-size="9pt"
                          font-weight="bold">
                  TASA REGULARIZACIÓN CATASTRAL
                </fo:block>
                <fo:block padding-top="1.15cm"
                          text-align="center"
                          font-size="9.5pt"
                          font-weight="bold">
                  CODIGO: 040
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell background-color="#FFFFFF">                         
                <fo:block text-align="center">
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell border="black 0.475pt solid">
                <fo:block padding-top="0.5cm"
                          text-align="center"
                          font-size="11pt"
                          font-weight="bold">
                  Modelo
                </fo:block>
                <fo:block padding-top="0.68cm"
                          text-align="center"
                          font-size="25pt"
                          font-weight="bold">
                  990
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:static-content>
      
      <fo:static-content flow-name="xsl-region-after">
      
        <fo:table font-family="Helvetica"
                  end-indent="0in"  
                  border-collapse="separate" 
                  table-layout="fixed" 
                  width="100%">
          <fo:table-column column-width="0.86cm"/>
          <fo:table-column column-width="0.10cm"/>
          <fo:table-column column-width="0.65cm"/>
          <fo:table-column column-width="8.35cm"/>
          <fo:table-column column-width="0.62cm"/>
          <fo:table-column column-width="9.38cm"/>
          <fo:table-body>
          
            <fo:table-row background-color="#FFFFFF" 
                          height="1.15cm">
                             
              <fo:table-cell number-rows-spanned="5"
                             background-color="#DCDCDC"
                             border="black 0.475pt solid">
                             
                <fo:block>
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell number-rows-spanned="5"
                             background-color="#FFFFFF">
                             
                <fo:block >
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell number-rows-spanned="5"
                             background-color="#DCDCDC"
                             border="black 0.475pt solid">
                <fo:block-container reference-orientation="90" 
                                    font-weight="bold"
                                    width="5.2cm"
                                    height="0.5cm"
                                    margin-left="0cm"
                                    padding-left="0.08cm">
                  <fo:block>ORGANO LIQUIDADOR</fo:block>
                </fo:block-container>
              </fo:table-cell>
              
              <fo:table-cell border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid"
                             border-top-color="black"
                             border-left-color="black"
                             border-top-width="0.475pt"
                             border-left-width="0.475pt"
                             border-top-style="solid"
                             border-left-style="solid">
                  <fo:block padding-top="0.4cm"
                            text-align="left"
                            font-size="12pt"
                            font-family="Arial"
                            margin-left="0cm"
                            padding-left="0.5cm">
                    En <xsl:value-of select="./id/domi/den_provincia"/> ,
                  </fo:block>          
              </fo:table-cell>
              
              <fo:table-cell number-rows-spanned="5"
                             background-color="#DCDCDC"
                             border="black 0.475pt solid">
                             
                <fo:block-container reference-orientation="90" 
                                    font-weight="bold"
                                    width="3.8cm"
                                    height="0.5cm"
                                    margin-left="0cm"
                                    padding-left="0.08cm">
                  <fo:block>INGRESO</fo:block>
                </fo:block-container>
              </fo:table-cell>
              
              <fo:table-cell border-top-color="black"
                             border-top-width="0.475pt" 
                             border-top-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:block padding-top="0.15cm"
                          text-align="justify"
                          font-size="8pt"
                          margin-left="0cm"
                          padding-left="0.3cm"
                          margin-right="0cm"
                          padding-right="1cm">
                  Ingreso efectuado a favor del TESORO PÚBLICO, cuenta restringida de la A.E.A.T. Para la Recaudación de TASAS
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="1.65cm">
              
              <fo:table-cell border-left-color="black"
                             border-left-width="0.475pt" 
                             border-left-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                <fo:block text-align="left"
                          font-size="12pt"
                          font-family="Arial"
                          margin-left="0cm"
                          padding-left="0.5cm">
                  a <xsl:value-of select="./org/fecha_tasa"/>
                </fo:block>
              </fo:table-cell>
              
              <fo:table-cell background-image="/images/importe.png"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:list-block>
                  <fo:list-item>
                    <fo:list-item-label>
                      <fo:block padding-top="0.38cm"
                                text-align="left"
                                font-size="10pt"
                                margin-left="0cm"
                                padding-left="0.5cm">
                        Importe Euros:
                      </fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body>
                      <fo:block padding-top="0.38cm"
                                text-align="right"
                                font-size="10pt"
                                font-weight="bold"
                                margin-right="0cm"
                                padding-right="0.5cm"> 
                        <xsl:value-of select="./org/importe_total"/>
                        <fo:character character="&#x2004;"/>€
                      </fo:block>
                    </fo:list-item-body>
                  </fo:list-item>
                </fo:list-block>
              </fo:table-cell>
              
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="2.1cm">
              
              <fo:table-cell number-rows-spanned="2"
                             border-left-color="black"
                             border-left-width="0.475pt" 
                             border-left-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:block text-align="left"
                          font-size="6.95pt"
                          margin-left="0cm"
                          padding-left="0.5cm"
                          margin-right="0cm"
                          padding-right="0.5cm">
                  Documento firmado electrónicamente con código seguro de verificación (CSV) por la Dirección General del Catastro
                </fo:block>
                <fo:block text-align="center"
                          font-size="8pt"
                          margin-left="0cm"
                          padding-left="0.5cm"
                          padding-top="0.38cm"
                          margin-right="0cm"
                          padding-right="0.5cm">
                    <xsl:text>CSV: </xsl:text><xsl:value-of select="./csv"/>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="0.1cm">
              
              <fo:table-cell background-image="/images/ccc.png"
                             number-rows-spanned="2"
                             border-bottom-color="black"
                             border-bottom-width="0.475pt"
                             border-bottom-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                  <fo:list-block>
                    <fo:list-item>
                      <fo:list-item-label>
                        <fo:block padding-top="0.3cm"
                                  text-align="left"
                                  margin-left="0pt"
                                  padding-left="0.5cm"
                                  font-size="8pt">
                          Forma de pago: En efectivo
                        </fo:block>
                      </fo:list-item-label>
                      <fo:list-item-body>
                        <fo:block padding-top="0.3cm"
                                  text-align="right"
                                  margin-right="0pt"
                                  padding-right="1cm"
                                  font-size="8pt">
                          E.C. Adeudo en cuenta
                        </fo:block>
                      </fo:list-item-body>
                    </fo:list-item>
                  </fo:list-block>
                
                <fo:block padding-top="0.3cm"
                          margin-left="0pt"
                          padding-left="3.15cm"
                          font-size="7pt">
                    <xsl:text>Código cuenta cliente (CCC)</xsl:text>
                </fo:block>
                
                <fo:block padding-top="0.3cm"
                          margin-left="0pt"
                          padding-left="1cm"
                          font-size="7pt">
                  Entidad <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                  Oficina <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                  DC      <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                          <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                  Número de cuenta
                </fo:block>
                
              </fo:table-cell>
              
            </fo:table-row>
            
            <fo:table-row background-color="#FFFFFF" 
                          height="0.7cm">
              
              <fo:table-cell border-left-color="black"
                             border-left-width="0.475pt" 
                             border-left-style="solid"
                             border-bottom-color="black"
                             border-bottom-width="0.475pt"
                             border-bottom-style="solid"
                             border-right-color="black"
                             border-right-width="0.475pt" 
                             border-right-style="solid">
                             
                <fo:block text-align="center"
                          font-size="8pt"
                          font-weight="bold">
                  EJEMPLAR PARA LA ENTIDAD BANCARIA 
                </fo:block>
              </fo:table-cell>                        
            </fo:table-row>
          </fo:table-body>
        </fo:table>
        <fo:block font-family="Helvetica"
                  text-align="center"
                  font-size="6pt"
                  margin-left="0pt"
                  padding-left="6cm">
          Este documento no será válido sin la certificación mecánica o, en su defecto, firma autorizada
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body">   
        <xsl:apply-templates/>  
      </fo:flow>
    </fo:page-sequence>
    
    <fo:page-sequence master-reference="informacion">
      <fo:static-content flow-name="xsl-region-before">
        <fo:block >
        </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body">   
        <fo:table end-indent="0in"  
                  border-collapse="separate" 
                  table-layout="fixed" 
                  width="100%">
          <fo:table-column column-width="100%"/>        
          <fo:table-body>        
            <fo:table-row>              
              <fo:table-cell>
                <fo:block>
                </fo:block>
              </fo:table-cell>         
            </fo:table-row>
          </fo:table-body>
        </fo:table>
      </fo:flow>
    </fo:page-sequence>
    
  </fo:root>
</xsl:template>

<xsl:template match="id">
      
    <fo:table font-family="Helvetica"
              end-indent="0in"  
              border-collapse="separate"
              table-layout="fixed"
              width="100%">
      <fo:table-column column-width="0.86cm"/>
      <fo:table-column column-width="0.10cm"/>
      <fo:table-column column-width="0.63cm"/>
      <fo:table-column column-width="8.00cm"/>
      <fo:table-column column-width="1.07cm"/>
      <fo:table-column column-width="0.65cm"/>
      <fo:table-column column-width="0.72cm"/>
      <fo:table-column column-width="0.95cm"/>
      <fo:table-column column-width="1.10cm"/>
      <fo:table-column column-width="3.00cm"/>
      <fo:table-column column-width="2.88cm"/>
      
      <fo:table-body>      
        <fo:table-row background-color="#FFFFFF" 
                      height="0.15cm">          
          <fo:table-cell number-columns-spanned="11"
                         border="0pt">
            <fo:block >
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
      
      <fo:table-body height="5.35">      
        <fo:table-row background-color="#FFFFFF" 
                      height="1.61cm">
                         
          <fo:table-cell number-rows-spanned="4"
                         background-color="#DCDCDC"
                         border="black 0.475pt solid">
            <fo:block>
            </fo:block>
          </fo:table-cell>
          
          <fo:table-cell number-rows-spanned="4">                         
            <fo:block>
            </fo:block>
          </fo:table-cell>
          
          <fo:table-cell number-rows-spanned="4"
                         background-color="#DCDCDC"
                         border="black 0.475pt solid">
            <fo:block-container reference-orientation="90" 
                                font-weight="bold"
                                width="4.8cm"
                                height="0.5cm"
                                margin-left="0cm"
                                padding-left="0.08cm">
              <fo:block>IDENTIFICACIÓN</fo:block>
            </fo:block-container>
          </fo:table-cell>
          
          <fo:table-cell number-columns-spanned="5"
                         border-top-color="black"
                         border-right-color="black"
                         border-left-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-left-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         border-left-style="solid"
                         text-align="left"
                         margin-left="0cm"
                         padding-left="0.13cm">
              <fo:block padding-top="0.135cm"
                        font-size="8pt"
                        font-weight="bold">
                N.I.F., D.N.I., N.I.E.:
              </fo:block>
              <fo:block padding-top="0.3cm"
                        font-family="Courier"
                        font-size="13pt">
                <xsl:value-of select="./cif"/>
              </fo:block>                            
                          
          </fo:table-cell>
          
          <fo:table-cell background-color="#DCDCDC"
                         border-top-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         margin-left="0cm"
                         padding-left="0.05cm">                         
            <fo:block padding-top="0.2cm"
                      text-align="left"
                      font-size="9.2pt"
                      font-weight="bold"
                      font-family="Courier">
              De<fo:character character="&#x2004;"/>- ven<fo:character character="&#x2004;"/>- go
            </fo:block>
            
          </fo:table-cell>
          
          <fo:table-cell number-columns-spanned="2"
                         border-top-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         margin-left="0cm"
                         padding-left="0.13cm">                         
            <fo:block padding-top="0.6cm"
                      text-align="center"
                      font-size="9pt"
                      font-weight="bold">
              Ejercicio...............   <xsl:value-of select="./ejercicio_dev"/>
            </fo:block>
          </fo:table-cell>
          
        </fo:table-row>
        
        <fo:table-row background-color="#FFFFFF" 
                      height="1.67cm">
          
          <fo:table-cell number-columns-spanned="5"
                         border-top-color="black"
                         border-left-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-left-width="0.475pt"
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-left-style="solid"
                         border-right-style="solid"
                         margin-left="0cm"
                         padding-left="0.13cm">
            <fo:block padding-top="0.135cm"
                      font-size="8pt"
                      font-weight="bold">
              Apellidos y nombre o Razón Social del obligado al pago:
            </fo:block>
            
              <fo:block padding-top="0.3cm"
                        font-family="Courier"
                        font-size="13pt">
                   <xsl:value-of select="./apenom"/>
            </fo:block>
            
          </fo:table-cell>
          
          <fo:table-cell number-rows-spanned="2"
                         number-columns-spanned="3"
                         border-top-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid">
                         
            <fo:block padding-top="0.80cm"
                      text-align="center"
                      font-family="Courier"
                      font-size="13pt"
                      font-weight="bold">
              <xsl:value-of select="./numero_just"/>
            </fo:block>
            
            <fo:block padding-top="0.50cm"
                      text-align="center"
                      font-family="Code39"
                      font-size="20pt">
              <xsl:value-of select="./just_barcode"/>
            </fo:block>
            
          </fo:table-cell>
          
        </fo:table-row>
        
        <fo:table-row background-color="#FFFFFF" 
                      height="1.5cm">
          
          <fo:table-cell border-top-color="black"
                         border-left-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt"
                         border-left-width="0.475pt"  
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-left-style="solid"
                         border-right-style="solid"
                         margin-left="0cm"
                         padding-left="0.13cm">
                         
            <fo:block padding-top="0.135cm"
                      font-size="8pt"
                      font-weight="bold">
              Nombre de la via pública:              
            </fo:block>
            <fo:block padding-top="0.3cm"
                      font-family="Courier"
                      font-size="13pt">
                <xsl:value-of select="./domi/sigla"/><fo:character character="&#x2004;"/><xsl:value-of select="./domi/den_via"/>
            </fo:block>            
          </fo:table-cell>
          
          <fo:table-cell border-top-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         text-align="center">
            <fo:block font-size="8pt"
                      font-weight="bold"
                      padding-top="0.135cm">
              Núm.
            </fo:block>
            <fo:block padding-top="0.3cm"
                      font-family="Courier">
                <xsl:value-of select="./domi/numero"/>
            </fo:block>                       
          </fo:table-cell>
          
          <fo:table-cell border-top-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         text-align="center">                         
            <fo:block font-size="8pt"
                      font-weight="bold"
                      padding-top="0.135cm">
              Esc.
            </fo:block>
            <fo:block padding-top="0.3cm"
                      font-family="Courier">
                <xsl:value-of select="./domi/escalera"/>
            </fo:block>            
          </fo:table-cell>
          
          <fo:table-cell border-top-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         text-align="center">                         
            <fo:block font-size="8pt"
                      font-weight="bold"
                      padding-top="0.135cm">
              Piso
            </fo:block>
            <fo:block padding-top="0.3cm"
                      font-family="Courier">
                <xsl:value-of select="./domi/planta"/>
            </fo:block>            
          </fo:table-cell>
          
          <fo:table-cell border-top-color="black"
                         border-right-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         text-align="center"
                         >                         
            <fo:block font-size="8pt"
                      font-weight="bold"
                      padding-top="0.135cm">
              Puerta                        
            </fo:block>
            <fo:block padding-top="0.3cm"
                      font-family="Courier">
                <xsl:value-of select="./domi/puerta"/>
            </fo:block>            
          </fo:table-cell>
          
        </fo:table-row>
        
        <fo:table-row background-color="#FFFFFF" 
                      height="1.36cm">
          
          <fo:table-cell number-columns-spanned="5"
                         border="black 0.475pt solid"
                         margin-left="0cm"
                         padding-left="0.13cm">
                         
            <fo:block padding-top="0.135cm"
                      font-size="8pt"
                      font-weight="bold">
              Municipio
            </fo:block>
            <fo:block padding-top="0.3cm"
                      font-family="Courier"
                      font-size="13pt">
                <xsl:value-of select="./domi/den_municipio"/>
            </fo:block>
          </fo:table-cell>
          
          <fo:table-cell number-columns-spanned="2"
                         border-top-color="black"
                         border-right-color="black"
                         border-bottom-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-bottom-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         border-bottom-style="solid">
                         
            <fo:block padding-top="0.135cm"
                      font-size="8pt"
                      font-weight="bold"
                      margin-left="0cm"
                      padding-left="0.3cm">
              Provincia                        
            </fo:block>
            <fo:block text-align="center"
                      padding-top="0.3cm"
                      font-family="Courier"
                      font-size="13pt">
                <xsl:value-of select="./domi/den_provincia"/>
            </fo:block>
            
            <fo:block font-family="Times Roman"
                      font-size="9pt"
                      start-indent="3pt"
                      line-height="12pt"
                      space-after.optimum="3pt"
                      text-align="left">
            </fo:block>
            
          </fo:table-cell>            
          <fo:table-cell border-top-color="black"
                         border-right-color="black"
                         border-bottom-color="black"
                         border-top-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-bottom-width="0.475pt"
                         border-top-style="solid"
                         border-right-style="solid"
                         border-bottom-style="solid">                         
                         
            <fo:block padding-top="0.135cm"
                      font-size="8pt"
                      font-weight="bold"
                      margin-left="0cm"
                      padding-left="0.3cm">
              Código Postal                        
            </fo:block>
            <fo:block text-align="center"
                      padding-top="0.3cm"
                      font-family="Courier"
                      font-size="13pt">
                <xsl:value-of select="./domi/dp"/>
            </fo:block>   
            
            <fo:block font-family="Times Roman"
                      font-size="9pt"
                      start-indent="3pt"
                      line-height="12pt"
                      space-after.optimum="3pt"
                      text-align="left">
            </fo:block>         
          
          </fo:table-cell>
        </fo:table-row>        
      </fo:table-body>
    </fo:table>    
  </xsl:template>
    
  <xsl:template match="liq">    
    <fo:table font-family="Helvetica"
              end-indent="0in"  
              border-collapse="separate" 
              table-layout="fixed"
              width="100%">
            
      <fo:table-column column-width="0.86cm"/>
      <fo:table-column column-width="0.10cm"/>
      <fo:table-column column-width="0.63cm"/>
      <fo:table-column column-width="18.37cm"/>
      <fo:table-column column-width="0.63cm"/>
      
      <fo:table-body>      
        <fo:table-row background-color="#FFFFFF" 
                      height="0.55cm">
          
          <fo:table-cell number-columns-spanned="4">                         
            <fo:block >
            </fo:block>
          </fo:table-cell>          
        </fo:table-row>
      
        <fo:table-row border-collapse="separate" 
                      border-separation="0.5cm"
                      background-color="#FFFFFF" 
                      height="4cm">

          <fo:table-cell number-rows-spanned="2"
                         background-color="#DCDCDC"
                         border="black 0.475pt solid">
                         
            <fo:block text-align="center">
            </fo:block>
          </fo:table-cell>
          
          <fo:table-cell number-rows-spanned="2"
                         background-color="#FFFFFF">
                         
            <fo:block text-align="center">
            </fo:block>
          </fo:table-cell>
          
          <fo:table-cell number-rows-spanned="2"
                         background-color="#DCDCDC"
                         border-left-color="black"
                         border-top-color="black"
                         border-bottom-color="black"
                         border-left-width="0.475pt" 
                         border-top-width="0.475pt"
                         border-bottom-width="0.475pt"
                         border-left-style="solid"
                         border-top-style="solid"
                         border-bottom-style="solid">
            <fo:block-container reference-orientation="90" 
                                font-weight="bold"
                                width="7.5cm"
                                height="0.5cm"
                                margin-left="0cm"
                                padding-left="0.08cm">
              <fo:block>LIQUIDACIÓN</fo:block>
            </fo:block-container>            
          </fo:table-cell>
          <fo:table-cell background-color="#FFFFFF"
                         border-left-color="black"
                         border-right-color="black"
                         border-top-color="black"
                         border-left-width="0.475pt" 
                         border-right-width="0.475pt" 
                         border-top-width="0.475pt"
                         border-left-style="solid"
                         border-right-style="solid"
                         border-top-style="solid">
            <fo:block padding-top="0.55cm"
                      text-align="justify"
                      font-size="11pt"
                      margin-left="0cm"
                      padding-left="0.3cm"
                      margin-right="0cm"
                      padding-right="0.3cm">
              De conformidad con lo dispuesto en el apartado 8 de la disposición adicional tercera del texto refundido 
              de la Ley del Catastro Inmobiliario (R.D. Legislativo 1/2004, de 5 de marzo) 
              y con motivo de la tramitación del procedimiento de <xsl:value-of select="./nom_proc"/>, 
              nº de expediente <xsl:value-of select="./numero"/>.<xsl:value-of select="./control"/>/<xsl:value-of select="./ejercicio"/>, se emite la siguiente liquidación de la tasa de regularización catastral 
              correspondiente a los inmuebles que se indican:
            </fo:block>
            
            <fo:block>
            <fo:character character="&#x2004;"/>
            </fo:block>
            
            <fo:block text-align="left"
                      font-size="11.7pt"
                      margin-left="0cm"
                      padding-left="0.3cm">
            - Nº inmuebles regularizados ..<xsl:value-of select="./num_inm"/>
            </fo:block>
            
            <fo:block text-align="left"
                      font-size="11.7pt"
                      margin-left="0cm"
                      padding-left="0.3cm">
            - Tasa por inmueble regularizado ....................... <xsl:value-of select="./tasa_inm"/>€
            </fo:block>
            
            
            <fo:block text-align="left"
                      font-size="11.7pt"
                      margin-left="0cm"
                      padding-left="0.3cm">
            - Total a ingresar <xsl:value-of select="num_inm"/>x<xsl:value-of select="tasa_inm"/>€  
            <xsl:value-of select="total_importe"/>€
            </fo:block>
            
            <fo:block>
            <fo:character character="&#x2004;"/>
            </fo:block>
            
            <fo:block text-align="left"
                      font-size="11.7pt"
                      margin-left="0cm"
                      padding-left="0.3cm">
            - Relación de inmuebles regularizados:
            </fo:block>
            
            <fo:block>
            <fo:character character="&#x2004;"/>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell number-rows-spanned="2">
            <fo:block-container reference-orientation="90"
                                width="12cm"
                                height="0.5cm"
                                margin-left="0cm"
                                padding-left="0.08cm">
              <fo:block text-align="left"
                        font-style="italic"
                        font-size="8pt">
                <xsl:text>CSV: </xsl:text><fo:inline font-weight="bold"><xsl:value-of select="./../csv"/></fo:inline> (verificable en https://www.sedecatastro.gob.es)
              </fo:block>
            </fo:block-container>            
          </fo:table-cell>
         </fo:table-row>
        <fo:table-row border-collapse="separate" 
                      border-separation="0.5cm"
                      background-color="#FFFFFF"
                      height="6cm">
          <fo:table-cell background-color="#FFFFFF"
                         border-left-color="black"
                         border-right-color="black"
                         border-bottom-color="black"
                         border-left-width="0.475pt" 
                         border-right-width="0.475pt"
                         border-bottom-width="0.475pt"
                         border-left-style="solid"
                         border-right-style="solid"
                         border-bottom-style="solid">
              <fo:block font-family="Courier"
                        margin-left="0cm"
                        padding-left="0.297cm">
                <xsl:for-each select="./inms/inms_item">
                  <xsl:choose>
                    <xsl:when test="position() mod 3 = 0">
                      <xsl:value-of select="./pcatastral1"/>
                      <xsl:value-of select="./pcatastral2"/>
                      <xsl:value-of select="./cargo"/>
                      <xsl:value-of select="./dc1"/>
                      <xsl:value-of select="./dc2"/>
                      <fo:block></fo:block>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="./pcatastral1"/>
                      <xsl:value-of select="./pcatastral2"/>
                      <xsl:value-of select="./cargo"/>
                      <xsl:value-of select="./dc1"/>
                      <xsl:value-of select="./dc2"/>
                      <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                      <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                      <fo:character character="&#x2004;"/><fo:character character="&#x2004;"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </fo:block>
          </fo:table-cell>          
        </fo:table-row>        
      </fo:table-body>
    </fo:table>
  </xsl:template>       
</xsl:stylesheet>
