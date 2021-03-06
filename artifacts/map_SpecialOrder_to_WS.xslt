<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/X12/2006" xmlns:ns0="http://portal.karsten.com/" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:X12_00401_850" />
  </xsl:template>
  <xsl:template match="/s0:X12_00401_850">
    <ns0:ArrayOfPO_850x_Document>
      <ns0:PO_850x_Document>
        <xsl:for-each select="ST">
          <ns0:head1TransactionSetHeader>
            <ns0:ST_TransSetIDCode>
              <xsl:value-of select="ST01/text()" />
            </ns0:ST_TransSetIDCode>
            <ns0:ST_ControlNum>
              <xsl:value-of select="ST02/text()" />
            </ns0:ST_ControlNum>
          </ns0:head1TransactionSetHeader>
        </xsl:for-each>
        <ns0:head1BeginSegmentForPurchaseOrder>
          <ns0:beg_PurposeCode>
            <xsl:value-of select="s0:BEG/BEG01/text()" />
          </ns0:beg_PurposeCode>
          <ns0:beg_OrderTypeCode>
            <xsl:value-of select="s0:BEG/BEG02/text()" />
          </ns0:beg_OrderTypeCode>
          <ns0:beg_PurchaseOrdNum>
            <xsl:value-of select="s0:BEG/BEG03/text()" />
          </ns0:beg_PurchaseOrdNum>
          <xsl:if test="s0:BEG/BEG04">
            <ns0:beg_ReleaseNum>
              <xsl:value-of select="s0:BEG/BEG04/text()" />
            </ns0:beg_ReleaseNum>
          </xsl:if>
          <ns0:beg_Date>
            <xsl:value-of select="s0:BEG/BEG05/text()" />
          </ns0:beg_Date>
        </ns0:head1BeginSegmentForPurchaseOrder>
        <xsl:for-each select="s0:CUR">
          <ns0:head1Currency>
            <ns0:cur_EntityCode>
              <xsl:value-of select="CUR01/text()" />
            </ns0:cur_EntityCode>
            <ns0:cur_CurrCode>
              <xsl:value-of select="CUR02/text()" />
            </ns0:cur_CurrCode>
          </ns0:head1Currency>
        </xsl:for-each>
        <xsl:for-each select="s0:REF">
          <ns0:head1RefIdentification>
            <ns0:refHead_IDQual>
              <xsl:value-of select="REF01/text()" />
            </ns0:refHead_IDQual>
            <xsl:if test="REF02">
              <ns0:refHead_ID>
                <xsl:value-of select="REF02/text()" />
              </ns0:refHead_ID>
            </xsl:if>
            <xsl:if test="REF03">
              <ns0:refHead_Description>
                <xsl:value-of select="REF03/text()" />
              </ns0:refHead_Description>
            </xsl:if>
          </ns0:head1RefIdentification>
        </xsl:for-each>
        <xsl:for-each select="s0:PER">
          <ns0:head1AdminCommContact>
            <ns0:perHead1_ContFunctCode>
              <xsl:value-of select="PER01/text()" />
            </ns0:perHead1_ContFunctCode>
            <xsl:if test="PER02">
              <ns0:perHead1_Name>
                <xsl:value-of select="PER02/text()" />
              </ns0:perHead1_Name>
            </xsl:if>
            <xsl:if test="PER03">
              <ns0:perHead1_CommNumQualifier1>
                <xsl:value-of select="PER03/text()" />
              </ns0:perHead1_CommNumQualifier1>
            </xsl:if>
            <xsl:if test="PER04">
              <ns0:perHead1_CommNum1>
                <xsl:value-of select="PER04/text()" />
              </ns0:perHead1_CommNum1>
            </xsl:if>
            <xsl:if test="PER05">
              <ns0:perHead1_CommNumQualifier2>
                <xsl:value-of select="PER05/text()" />
              </ns0:perHead1_CommNumQualifier2>
            </xsl:if>
            <xsl:if test="PER06">
              <ns0:perHead1_CommNum2>
                <xsl:value-of select="PER06/text()" />
              </ns0:perHead1_CommNum2>
            </xsl:if>
            <xsl:if test="PER07">
              <ns0:perHead1_CommNumQualifier3>
                <xsl:value-of select="PER07/text()" />
              </ns0:perHead1_CommNumQualifier3>
            </xsl:if>
            <xsl:if test="PER08">
              <ns0:perHead1_CommNum3>
                <xsl:value-of select="PER08/text()" />
              </ns0:perHead1_CommNum3>
            </xsl:if>
          </ns0:head1AdminCommContact>
        </xsl:for-each>
        <xsl:for-each select="s0:FOB">
          <ns0:head1FobRelatedInstructions>
            <ns0:fob_ShipMethPay>
              <xsl:value-of select="FOB01/text()" />
            </ns0:fob_ShipMethPay>
            <xsl:if test="FOB02">
              <ns0:fob_LocationQualifier>
                <xsl:value-of select="FOB02/text()" />
              </ns0:fob_LocationQualifier>
            </xsl:if>
            <xsl:if test="FOB03">
              <ns0:fob_Description>
                <xsl:value-of select="FOB03/text()" />
              </ns0:fob_Description>
            </xsl:if>
          </ns0:head1FobRelatedInstructions>
        </xsl:for-each>
        <xsl:for-each select="s0:SACLoop1">
          <xsl:variable name="var:v1" select="userCSharp:StringSize(string(s0:SAC/SAC01/text()))" />
          <xsl:variable name="var:v2" select="userCSharp:LogicalGt(string($var:v1) , &quot;0&quot;)" />
          <xsl:if test="$var:v2">
            <ns0:head1LoopSAC>
              <ns0:Edix_850_Sac_Heading1>
                <ns0:sacHead1_ChargeIndicator>
                  <xsl:value-of select="s0:SAC/SAC01/text()" />
                </ns0:sacHead1_ChargeIndicator>
                <xsl:if test="s0:SAC/SAC02">
                  <ns0:sacHead1_ChargeCode>
                    <xsl:value-of select="s0:SAC/SAC02/text()" />
                  </ns0:sacHead1_ChargeCode>
                </xsl:if>
                <xsl:if test="s0:SAC/SAC03">
                  <ns0:sacHead1_ChargePercQualifier>
                    <xsl:value-of select="s0:SAC/SAC03/text()" />
                  </ns0:sacHead1_ChargePercQualifier>
                </xsl:if>
                <xsl:if test="s0:SAC/SAC04">
                  <ns0:sacHead1_Percent>
                    <xsl:value-of select="s0:SAC/SAC04/text()" />
                  </ns0:sacHead1_Percent>
                </xsl:if>
                <xsl:if test="s0:SAC/SAC05">
                  <ns0:sacHead1_Rate>
                    <xsl:value-of select="s0:SAC/SAC05/text()" />
                  </ns0:sacHead1_Rate>
                </xsl:if>
                <xsl:if test="s0:SAC/SAC06">
                  <ns0:sacHead1_UnitCode>
                    <xsl:value-of select="s0:SAC/SAC06/text()" />
                  </ns0:sacHead1_UnitCode>
                </xsl:if>
                <xsl:if test="s0:SAC/SAC07">
                  <ns0:sacHead1_Quantity>
                    <xsl:value-of select="s0:SAC/SAC07/text()" />
                  </ns0:sacHead1_Quantity>
                </xsl:if>
                <xsl:if test="s0:SAC/SAC08">
                  <ns0:sacHead1_HandlingCode>
                    <xsl:value-of select="s0:SAC/SAC08/text()" />
                  </ns0:sacHead1_HandlingCode>
                </xsl:if>
                <xsl:if test="s0:SAC/SAC09">
                  <ns0:sacHead1_Description>
                    <xsl:value-of select="s0:SAC/SAC09/text()" />
                  </ns0:sacHead1_Description>
                </xsl:if>
              </ns0:Edix_850_Sac_Heading1>
            </ns0:head1LoopSAC>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="s0:ITD">
          <ns0:head1TermsSale_DefTermsSale>
            <xsl:if test="ITD01">
              <ns0:itd_TermTypeCode>
                <xsl:value-of select="ITD01/text()" />
              </ns0:itd_TermTypeCode>
            </xsl:if>
            <xsl:if test="ITD02">
              <ns0:itd_TermBasisDateCode>
                <xsl:value-of select="ITD02/text()" />
              </ns0:itd_TermBasisDateCode>
            </xsl:if>
            <xsl:if test="ITD03">
              <ns0:itd_TermsDiscPercent>
                <xsl:value-of select="ITD03/text()" />
              </ns0:itd_TermsDiscPercent>
            </xsl:if>
            <xsl:if test="ITD04">
              <ns0:itd_TermsDiscDueDate>
                <xsl:value-of select="ITD04/text()" />
              </ns0:itd_TermsDiscDueDate>
            </xsl:if>
            <xsl:if test="ITD05">
              <ns0:itd_TermsDiscDaysDue>
                <xsl:value-of select="ITD05/text()" />
              </ns0:itd_TermsDiscDaysDue>
            </xsl:if>
            <xsl:if test="ITD06">
              <ns0:itd_TermsNetDueDate>
                <xsl:value-of select="ITD06/text()" />
              </ns0:itd_TermsNetDueDate>
            </xsl:if>
            <xsl:if test="ITD07">
              <ns0:itd_TermsNetDays>
                <xsl:value-of select="ITD07/text()" />
              </ns0:itd_TermsNetDays>
            </xsl:if>
            <xsl:if test="ITD08">
              <ns0:itd_TermsDiscountAmt>
                <xsl:value-of select="ITD08/text()" />
              </ns0:itd_TermsDiscountAmt>
            </xsl:if>
            <xsl:if test="ITD09">
              <ns0:itd_TermsDeferDueDate>
                <xsl:value-of select="ITD09/text()" />
              </ns0:itd_TermsDeferDueDate>
            </xsl:if>
            <xsl:if test="ITD10">
              <ns0:itd_DeferAmtDue>
                <xsl:value-of select="ITD10/text()" />
              </ns0:itd_DeferAmtDue>
            </xsl:if>
            <xsl:if test="ITD11">
              <ns0:itd_PercInvoicePayable>
                <xsl:value-of select="ITD11/text()" />
              </ns0:itd_PercInvoicePayable>
            </xsl:if>
            <xsl:if test="ITD12">
              <ns0:itd_TermsDescription>
                <xsl:value-of select="ITD12/text()" />
              </ns0:itd_TermsDescription>
            </xsl:if>
            <xsl:if test="ITD13">
              <ns0:itd_TermsDayOfMonth>
                <xsl:value-of select="ITD13/text()" />
              </ns0:itd_TermsDayOfMonth>
            </xsl:if>
          </ns0:head1TermsSale_DefTermsSale>
        </xsl:for-each>
        <xsl:for-each select="s0:DTM">
          <xsl:variable name="var:v3" select="userCSharp:LogicalIsString(string(DTM01/text()))" />
          <xsl:if test="$var:v3">
            <ns0:head1DateTimeReference>
              <ns0:Edix_850_Dtm_Heading1>
                <ns0:dtmHead1_DateTimeQualifier>
                  <xsl:value-of select="DTM01/text()" />
                </ns0:dtmHead1_DateTimeQualifier>
                <xsl:if test="DTM02">
                  <ns0:dtmHead1_ReferenceDate>
                    <xsl:value-of select="DTM02/text()" />
                  </ns0:dtmHead1_ReferenceDate>
                </xsl:if>
              </ns0:Edix_850_Dtm_Heading1>
            </ns0:head1DateTimeReference>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="s0:TD5">
          <xsl:variable name="var:v4" select="userCSharp:StringSize(string(TD501/text()))" />
          <xsl:variable name="var:v5" select="userCSharp:LogicalGt(string($var:v4) , &quot;0&quot;)" />
          <xsl:if test="$var:v5">
            <ns0:head1CarrierDetails>
              <xsl:if test="TD501">
                <ns0:td5_Routing>
                  <xsl:value-of select="TD501/text()" />
                </ns0:td5_Routing>
              </xsl:if>
            </ns0:head1CarrierDetails>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="s0:N9Loop1">
          <xsl:variable name="var:v6" select="userCSharp:StringSize(string(s0:N9/N901/text()))" />
          <xsl:variable name="var:v7" select="userCSharp:LogicalGt(string($var:v6) , &quot;0&quot;)" />
          <xsl:if test="$var:v7">
            <ns0:head1LoopN9>
              <ns0:Edix_Heading1_N9Loop>
                <ns0:head1_N9>
                  <ns0:n9_RefIDQualifier>
                    <xsl:value-of select="s0:N9/N901/text()" />
                  </ns0:n9_RefIDQualifier>
                  <xsl:if test="s0:N9/N902">
                    <ns0:n9_RefID>
                      <xsl:value-of select="s0:N9/N902/text()" />
                    </ns0:n9_RefID>
                  </xsl:if>
                  <xsl:if test="s0:N9/N903">
                    <ns0:n9_RefDescription>
                      <xsl:value-of select="s0:N9/N903/text()" />
                    </ns0:n9_RefDescription>
                  </xsl:if>
                </ns0:head1_N9>
                <ns0:head1_Msg>
                  <ns0:Edix_850_Msg>
                    <ns0:msg_FreeFormMessage>
                      <xsl:value-of select="s0:MSG/MSG01/text()" />
                    </ns0:msg_FreeFormMessage>
                  </ns0:Edix_850_Msg>
                </ns0:head1_Msg>
                <ns0:mtxSegments>
                  <ns0:Edix_850_MTX>
                    <xsl:if test="../s0:ADVLoop1/s0:MTX/MTX01">
                      <ns0:mtx_NoteReferenceCode>
                        <xsl:value-of select="../s0:ADVLoop1/s0:MTX/MTX01/text()" />
                      </ns0:mtx_NoteReferenceCode>
                    </xsl:if>
                    <xsl:if test="../s0:ADVLoop1/s0:MTX/MTX02">
                      <ns0:mtx_ReferenceText1>
                        <xsl:value-of select="../s0:ADVLoop1/s0:MTX/MTX02/text()" />
                      </ns0:mtx_ReferenceText1>
                    </xsl:if>
                    <xsl:if test="../s0:ADVLoop1/s0:MTX/MTX03">
                      <ns0:mtx_ReferenceText2>
                        <xsl:value-of select="../s0:ADVLoop1/s0:MTX/MTX03/text()" />
                      </ns0:mtx_ReferenceText2>
                    </xsl:if>
                  </ns0:Edix_850_MTX>
                </ns0:mtxSegments>
              </ns0:Edix_Heading1_N9Loop>
            </ns0:head1LoopN9>
          </xsl:if>
        </xsl:for-each>
        <ns0:head1LoopN1>
          <xsl:for-each select="s0:N1Loop1">
            <xsl:variable name="var:v8" select="userCSharp:StringSize(string(s0:N2/N201/text()))" />
            <xsl:variable name="var:v9" select="userCSharp:LogicalGt(string($var:v8) , &quot;0&quot;)" />
            <ns0:Edix_Heading1x_N1Loop>
              <ns0:header1_N1>
                <ns0:n1_NameID>
                  <xsl:value-of select="s0:N1/N101/text()" />
                </ns0:n1_NameID>
                <xsl:if test="s0:N1/N102">
                  <ns0:n1_FreeformName>
                    <xsl:value-of select="s0:N1/N102/text()" />
                  </ns0:n1_FreeformName>
                </xsl:if>
                <xsl:if test="s0:N1/N103">
                  <ns0:n1_IDCodeQualifier>
                    <xsl:value-of select="s0:N1/N103/text()" />
                  </ns0:n1_IDCodeQualifier>
                </xsl:if>
                <xsl:if test="s0:N1/N104">
                  <ns0:n1_IDCode>
                    <xsl:value-of select="s0:N1/N104/text()" />
                  </ns0:n1_IDCode>
                </xsl:if>
              </ns0:header1_N1>
              <xsl:if test="$var:v9">
                <ns0:header1_N2>
                  <ns0:n2_AdditionalName>
                    <xsl:value-of select="s0:N2/N201/text()" />
                  </ns0:n2_AdditionalName>
                </ns0:header1_N2>
              </xsl:if>
              <ns0:header1_N3>
                <ns0:n3_AddressInfo1>
                  <xsl:value-of select="s0:N3/N301/text()" />
                </ns0:n3_AddressInfo1>
                <xsl:if test="s0:N3/N302">
                  <ns0:n3_AddressInfo2>
                    <xsl:value-of select="s0:N3/N302/text()" />
                  </ns0:n3_AddressInfo2>
                </xsl:if>
              </ns0:header1_N3>
              <ns0:header1_N4>
                <xsl:if test="s0:N4/N401">
                  <ns0:n4_CityName>
                    <xsl:value-of select="s0:N4/N401/text()" />
                  </ns0:n4_CityName>
                </xsl:if>
                <xsl:if test="s0:N4/N402">
                  <ns0:n4_StateProv_Code>
                    <xsl:value-of select="s0:N4/N402/text()" />
                  </ns0:n4_StateProv_Code>
                </xsl:if>
                <xsl:if test="s0:N4/N403">
                  <ns0:n4_PostalCode>
                    <xsl:value-of select="s0:N4/N403/text()" />
                  </ns0:n4_PostalCode>
                </xsl:if>
                <xsl:if test="s0:N4/N404">
                  <ns0:n4_CountryCode>
                    <xsl:value-of select="s0:N4/N404/text()" />
                  </ns0:n4_CountryCode>
                </xsl:if>
              </ns0:header1_N4>
              <xsl:for-each select="s0:REF_3">
                <xsl:variable name="var:v10" select="userCSharp:StringSize(string(REF01/text()))" />
                <xsl:variable name="var:v11" select="userCSharp:LogicalGt(string($var:v10) , &quot;0&quot;)" />
                <xsl:if test="$var:v11">
                  <ns0:header1_RefLoopN1>
                    <ns0:Edix_850_Ref_LoopN1>
                      <ns0:refLoopN1_IDQual>
                        <xsl:value-of select="REF01/text()" />
                      </ns0:refLoopN1_IDQual>
                      <xsl:if test="REF02">
                        <ns0:refLoopN1_ID>
                          <xsl:value-of select="REF02/text()" />
                        </ns0:refLoopN1_ID>
                      </xsl:if>
                    </ns0:Edix_850_Ref_LoopN1>
                  </ns0:header1_RefLoopN1>
                </xsl:if>
              </xsl:for-each>
              <xsl:for-each select="s0:PER_2">
                <xsl:variable name="var:v12" select="userCSharp:StringSize(string(PER01/text()))" />
                <xsl:variable name="var:v13" select="userCSharp:LogicalGt(string($var:v12) , &quot;0&quot;)" />
                <xsl:if test="$var:v13">
                  <ns0:header1_Per_LoopN1>
                    <ns0:perLoopN1_ContFunctCode>
                      <xsl:value-of select="PER01/text()" />
                    </ns0:perLoopN1_ContFunctCode>
                    <xsl:if test="PER02">
                      <ns0:perLoopN1_Name>
                        <xsl:value-of select="PER02/text()" />
                      </ns0:perLoopN1_Name>
                    </xsl:if>
                    <xsl:if test="PER03">
                      <ns0:perLoopN1_CommNumQualifier>
                        <xsl:value-of select="PER03/text()" />
                      </ns0:perLoopN1_CommNumQualifier>
                    </xsl:if>
                    <xsl:if test="PER04">
                      <ns0:perLoopN1_CommNum>
                        <xsl:value-of select="PER04/text()" />
                      </ns0:perLoopN1_CommNum>
                    </xsl:if>
                  </ns0:header1_Per_LoopN1>
                </xsl:if>
              </xsl:for-each>
            </ns0:Edix_Heading1x_N1Loop>
          </xsl:for-each>
        </ns0:head1LoopN1>
        <ns0:detail1LoopPO1>
          <xsl:for-each select="s0:PO1Loop1">
            <xsl:variable name="var:v15" select="userCSharp:LogicalIsString(string(s0:REF_7/REF01/text()))" />
            <xsl:variable name="var:v19" select="userCSharp:LogicalIsString(string(s0:DTM_7/text()))" />
            <xsl:variable name="var:v24" select="userCSharp:LogicalIsString(string(s0:N9Loop2/s0:MSG_7/text()))" />
            <ns0:Edix_Detail1_LoopPo1>
              <ns0:detail1PO1>
                <xsl:if test="s0:PO1/PO101">
                  <ns0:po1_PoID>
                    <xsl:value-of select="s0:PO1/PO101/text()" />
                  </ns0:po1_PoID>
                </xsl:if>
                <xsl:if test="s0:PO1/PO102">
                  <ns0:po1_QuantityOrdered>
                    <xsl:value-of select="s0:PO1/PO102/text()" />
                  </ns0:po1_QuantityOrdered>
                </xsl:if>
                <xsl:if test="s0:PO1/PO103">
                  <ns0:po1_UnitOfMeasureCode>
                    <xsl:value-of select="s0:PO1/PO103/text()" />
                  </ns0:po1_UnitOfMeasureCode>
                </xsl:if>
                <xsl:if test="s0:PO1/PO104">
                  <ns0:po1_UnitPrice>
                    <xsl:value-of select="s0:PO1/PO104/text()" />
                  </ns0:po1_UnitPrice>
                </xsl:if>
                <xsl:if test="s0:PO1/PO105">
                  <ns0:po1_BasisOfUnitPriceCode>
                    <xsl:value-of select="s0:PO1/PO105/text()" />
                  </ns0:po1_BasisOfUnitPriceCode>
                </xsl:if>
                <xsl:if test="s0:PO1/PO106">
                  <ns0:po1_ProductIDQualifier1>
                    <xsl:value-of select="s0:PO1/PO106/text()" />
                  </ns0:po1_ProductIDQualifier1>
                </xsl:if>
                <xsl:if test="s0:PO1/PO107">
                  <ns0:po1_ProductID1>
                    <xsl:value-of select="s0:PO1/PO107/text()" />
                  </ns0:po1_ProductID1>
                </xsl:if>
                <xsl:if test="s0:PO1/PO108">
                  <ns0:po1_ProductIDQualifier2>
                    <xsl:value-of select="s0:PO1/PO108/text()" />
                  </ns0:po1_ProductIDQualifier2>
                </xsl:if>
                <xsl:if test="s0:PO1/PO109">
                  <ns0:po1_ProductID2>
                    <xsl:value-of select="s0:PO1/PO109/text()" />
                  </ns0:po1_ProductID2>
                </xsl:if>
                <xsl:if test="s0:PO1/PO110">
                  <ns0:po1_ProductIDQualifier3>
                    <xsl:value-of select="s0:PO1/PO110/text()" />
                  </ns0:po1_ProductIDQualifier3>
                </xsl:if>
                <xsl:if test="s0:PO1/PO111">
                  <ns0:po1_ProductID3>
                    <xsl:value-of select="s0:PO1/PO111/text()" />
                  </ns0:po1_ProductID3>
                </xsl:if>
                <xsl:if test="s0:PO1/PO112">
                  <ns0:po1_ProductIDQualifier4>
                    <xsl:value-of select="s0:PO1/PO112/text()" />
                  </ns0:po1_ProductIDQualifier4>
                </xsl:if>
                <xsl:if test="s0:PO1/PO113">
                  <ns0:po1_ProductID4>
                    <xsl:value-of select="s0:PO1/PO113/text()" />
                  </ns0:po1_ProductID4>
                </xsl:if>
                <xsl:if test="s0:PO1/PO114">
                  <ns0:po1_ProductIDQualifier5>
                    <xsl:value-of select="s0:PO1/PO114/text()" />
                  </ns0:po1_ProductIDQualifier5>
                </xsl:if>
                <xsl:if test="s0:PO1/PO115">
                  <ns0:po1_ProductID5>
                    <xsl:value-of select="s0:PO1/PO115/text()" />
                  </ns0:po1_ProductID5>
                </xsl:if>
                <xsl:if test="s0:PO1/PO116">
                  <ns0:po1_ProductIDQualifier6>
                    <xsl:value-of select="s0:PO1/PO116/text()" />
                  </ns0:po1_ProductIDQualifier6>
                </xsl:if>
                <xsl:if test="s0:PO1/PO117">
                  <ns0:po1_ProductID6>
                    <xsl:value-of select="s0:PO1/PO117/text()" />
                  </ns0:po1_ProductID6>
                </xsl:if>
                <xsl:if test="s0:PO1/PO118">
                  <ns0:isPackage>
                    <xsl:value-of select="s0:PO1/PO118/text()" />
                  </ns0:isPackage>
                </xsl:if>
                <xsl:if test="s0:PO1/PO119">
                  <ns0:packageNumber>
                    <xsl:value-of select="s0:PO1/PO119/text()" />
                  </ns0:packageNumber>
                </xsl:if>
                <xsl:if test="s0:PO1/PO120">
                  <ns0:packageUPCCode>
                    <xsl:value-of select="s0:PO1/PO120/text()" />
                  </ns0:packageUPCCode>
                </xsl:if>
                <xsl:if test="s0:PO1/PO121">
                  <ns0:packagePrice>
                    <xsl:value-of select="s0:PO1/PO121/text()" />
                  </ns0:packagePrice>
                </xsl:if>
                <xsl:if test="s0:PO1/PO122">
                  <ns0:packageLineNumber>
                    <xsl:value-of select="s0:PO1/PO122/text()" />
                  </ns0:packageLineNumber>
                </xsl:if>
                <xsl:if test="s0:PO1/PO123">
                  <ns0:originalPackageQty>
                    <xsl:value-of select="s0:PO1/PO123/text()" />
                  </ns0:originalPackageQty>
                </xsl:if>
                <xsl:if test="s0:PO1/PO124">
                  <ns0:mfgRetailPrice>
                    <xsl:value-of select="s0:PO1/PO124/text()" />
                  </ns0:mfgRetailPrice>
                </xsl:if>
                <xsl:if test="s0:PO1/PO125">
                  <ns0:vendorPkgPartNum>
                    <xsl:value-of select="s0:PO1/PO125/text()" />
                  </ns0:vendorPkgPartNum>
                </xsl:if>
              </ns0:detail1PO1>
              <xsl:for-each select="s0:CTPLoop1">
                <xsl:variable name="var:v14" select="userCSharp:LogicalIsString(string(s0:CTP_2/CTP01/text()))" />
                <xsl:if test="$var:v14">
                  <ns0:detail1LoopCTP>
                    <ns0:Edix_850_Ctp_Detail1>
                      <xsl:if test="s0:CTP_2/CTP01">
                        <ns0:ctpDetail1_ClassTradeCode>
                          <xsl:value-of select="s0:CTP_2/CTP01/text()" />
                        </ns0:ctpDetail1_ClassTradeCode>
                      </xsl:if>
                      <xsl:if test="s0:CTP_2/CTP02">
                        <ns0:ctpDetail1_PriceIDCode>
                          <xsl:value-of select="s0:CTP_2/CTP02/text()" />
                        </ns0:ctpDetail1_PriceIDCode>
                      </xsl:if>
                      <xsl:if test="s0:CTP_2/CTP03">
                        <ns0:ctpDetail1_UnitPrice>
                          <xsl:value-of select="s0:CTP_2/CTP03/text()" />
                        </ns0:ctpDetail1_UnitPrice>
                      </xsl:if>
                    </ns0:Edix_850_Ctp_Detail1>
                  </ns0:detail1LoopCTP>
                </xsl:if>
              </xsl:for-each>
              <ns0:detail1LoopPID>
                <ns0:Edix_850_Pid>
                  <ns0:pid_ItemDescriptionType>
                    <xsl:value-of select="s0:PIDLoop1/s0:PID_2/PID01/text()" />
                  </ns0:pid_ItemDescriptionType>
                  <xsl:if test="s0:PIDLoop1/s0:PID_2/PID02">
                    <ns0:pid_ProductCharacteristicCode>
                      <xsl:value-of select="s0:PIDLoop1/s0:PID_2/PID02/text()" />
                    </ns0:pid_ProductCharacteristicCode>
                  </xsl:if>
                  <xsl:if test="s0:PIDLoop1/s0:PID_2/PID05">
                    <ns0:pid_ProductDescription>
                      <xsl:value-of select="s0:PIDLoop1/s0:PID_2/PID05/text()" />
                    </ns0:pid_ProductDescription>
                  </xsl:if>
                  <xsl:if test="$var:v15">
                    <ns0:pid_REFSegments>
                      <xsl:for-each select="s0:REF_7">
                        <ns0:Edix_850_REF>
                          <ns0:RefIdQualifier>
                            <xsl:value-of select="REF01/text()" />
                          </ns0:RefIdQualifier>
                          <xsl:if test="REF02">
                            <ns0:RefIdIdentification>
                              <xsl:value-of select="REF02/text()" />
                            </ns0:RefIdIdentification>
                          </xsl:if>
                          <xsl:if test="REF03">
                            <ns0:RefDescription>
                              <xsl:value-of select="REF03/text()" />
                            </ns0:RefDescription>
                          </xsl:if>
                        </ns0:Edix_850_REF>
                      </xsl:for-each>
                    </ns0:pid_REFSegments>
                  </xsl:if>
                </ns0:Edix_850_Pid>
              </ns0:detail1LoopPID>
              <xsl:for-each select="s0:PO4">
                <xsl:variable name="var:v16" select="userCSharp:LogicalIsString(string(PO401/text()))" />
                <xsl:if test="$var:v16">
                  <ns0:detail1LoopP04>
                    <xsl:if test="PO401">
                      <ns0:po4_Pack>
                        <xsl:value-of select="PO401/text()" />
                      </ns0:po4_Pack>
                    </xsl:if>
                    <xsl:if test="PO402">
                      <ns0:po4_InnerPack>
                        <xsl:value-of select="PO402/text()" />
                      </ns0:po4_InnerPack>
                    </xsl:if>
                  </ns0:detail1LoopP04>
                </xsl:if>
              </xsl:for-each>
              <xsl:for-each select="s0:SACLoop2">
                <xsl:variable name="var:v17" select="userCSharp:LogicalIsString(string(s0:SAC_2/SAC01/text()))" />
                <xsl:if test="$var:v17">
                  <ns0:head2LoopSAC>
                    <ns0:Edix_850_Sac_Heading2>
                      <ns0:sacHead2_ChargeIndicator>
                        <xsl:value-of select="s0:SAC_2/SAC01/text()" />
                      </ns0:sacHead2_ChargeIndicator>
                      <xsl:if test="s0:SAC_2/SAC02">
                        <ns0:sacHead2_ChargeCode>
                          <xsl:value-of select="s0:SAC_2/SAC02/text()" />
                        </ns0:sacHead2_ChargeCode>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC03">
                        <ns0:sacHead2_Amount>
                          <xsl:value-of select="s0:SAC_2/SAC03/text()" />
                        </ns0:sacHead2_Amount>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC04">
                        <ns0:sacHead2_ChargePercQualifier>
                          <xsl:value-of select="s0:SAC_2/SAC04/text()" />
                        </ns0:sacHead2_ChargePercQualifier>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC05">
                        <ns0:sacHead2_Percent>
                          <xsl:value-of select="s0:SAC_2/SAC05/text()" />
                        </ns0:sacHead2_Percent>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC06">
                        <ns0:sacHead2_Rate>
                          <xsl:value-of select="s0:SAC_2/SAC06/text()" />
                        </ns0:sacHead2_Rate>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC07">
                        <ns0:sacHead2_UnitCode>
                          <xsl:value-of select="s0:SAC_2/SAC07/text()" />
                        </ns0:sacHead2_UnitCode>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC08">
                        <ns0:sacHead2_Quantity>
                          <xsl:value-of select="s0:SAC_2/SAC08/text()" />
                        </ns0:sacHead2_Quantity>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC09">
                        <ns0:sacHead2_HandlingCode>
                          <xsl:value-of select="s0:SAC_2/SAC09/text()" />
                        </ns0:sacHead2_HandlingCode>
                      </xsl:if>
                      <xsl:if test="s0:SAC_2/SAC10">
                        <ns0:sacHead2_Description>
                          <xsl:value-of select="s0:SAC_2/SAC10/text()" />
                        </ns0:sacHead2_Description>
                      </xsl:if>
                    </ns0:Edix_850_Sac_Heading2>
                  </ns0:head2LoopSAC>
                </xsl:if>
              </xsl:for-each>
              <xsl:for-each select="s0:SDQ">
                <xsl:variable name="var:v18" select="userCSharp:LogicalIsString(string(./text()))" />
                <xsl:if test="$var:v18">
                  <ns0:detail2DestinationQuantity>
                    <ns0:Edix_850_Sdq>
                      <ns0:sdq_UnitCode>
                        <xsl:value-of select="SDQ01/text()" />
                      </ns0:sdq_UnitCode>
                      <xsl:if test="SDQ02">
                        <ns0:sdq_IDCodeQualifier>
                          <xsl:value-of select="SDQ02/text()" />
                        </ns0:sdq_IDCodeQualifier>
                      </xsl:if>
                      <ns0:sdq_IDCode1>
                        <xsl:value-of select="SDQ03/text()" />
                      </ns0:sdq_IDCode1>
                      <ns0:sdq_Quantity1>
                        <xsl:value-of select="SDQ04/text()" />
                      </ns0:sdq_Quantity1>
                      <xsl:if test="SDQ05">
                        <ns0:sdq_IDCode2>
                          <xsl:value-of select="SDQ05/text()" />
                        </ns0:sdq_IDCode2>
                      </xsl:if>
                      <xsl:if test="SDQ06">
                        <ns0:sdq_Quantity2>
                          <xsl:value-of select="SDQ06/text()" />
                        </ns0:sdq_Quantity2>
                      </xsl:if>
                      <xsl:if test="SDQ07">
                        <ns0:sdq_IDCode3>
                          <xsl:value-of select="SDQ07/text()" />
                        </ns0:sdq_IDCode3>
                      </xsl:if>
                      <xsl:if test="SDQ08">
                        <ns0:sdq_Quantity3>
                          <xsl:value-of select="SDQ08/text()" />
                        </ns0:sdq_Quantity3>
                      </xsl:if>
                      <xsl:if test="SDQ09">
                        <ns0:sdq_IDCode4>
                          <xsl:value-of select="SDQ09/text()" />
                        </ns0:sdq_IDCode4>
                      </xsl:if>
                      <xsl:if test="SDQ10">
                        <ns0:sdq_Quantity4>
                          <xsl:value-of select="SDQ10/text()" />
                        </ns0:sdq_Quantity4>
                      </xsl:if>
                      <xsl:if test="SDQ11">
                        <ns0:sdq_IDCode5>
                          <xsl:value-of select="SDQ11/text()" />
                        </ns0:sdq_IDCode5>
                      </xsl:if>
                      <xsl:if test="SDQ12">
                        <ns0:sdq_Quantity5>
                          <xsl:value-of select="SDQ12/text()" />
                        </ns0:sdq_Quantity5>
                      </xsl:if>
                      <xsl:if test="SDQ13">
                        <ns0:sdq_IDCode6>
                          <xsl:value-of select="SDQ13/text()" />
                        </ns0:sdq_IDCode6>
                      </xsl:if>
                      <xsl:if test="SDQ14">
                        <ns0:sdq_Quantity6>
                          <xsl:value-of select="SDQ14/text()" />
                        </ns0:sdq_Quantity6>
                      </xsl:if>
                      <xsl:if test="SDQ15">
                        <ns0:sdq_IDCode7>
                          <xsl:value-of select="SDQ15/text()" />
                        </ns0:sdq_IDCode7>
                      </xsl:if>
                      <xsl:if test="SDQ16">
                        <ns0:sdq_Quantity7>
                          <xsl:value-of select="SDQ16/text()" />
                        </ns0:sdq_Quantity7>
                      </xsl:if>
                      <xsl:if test="SDQ17">
                        <ns0:sdq_IDCode8>
                          <xsl:value-of select="SDQ17/text()" />
                        </ns0:sdq_IDCode8>
                      </xsl:if>
                      <xsl:if test="SDQ18">
                        <ns0:sdq_Quantity8>
                          <xsl:value-of select="SDQ18/text()" />
                        </ns0:sdq_Quantity8>
                      </xsl:if>
                      <xsl:if test="SDQ19">
                        <ns0:sdq_IDCode9>
                          <xsl:value-of select="SDQ19/text()" />
                        </ns0:sdq_IDCode9>
                      </xsl:if>
                      <xsl:if test="SDQ20">
                        <ns0:sdq_Quantity9>
                          <xsl:value-of select="SDQ20/text()" />
                        </ns0:sdq_Quantity9>
                      </xsl:if>
                      <xsl:if test="SDQ21">
                        <ns0:sdq_IDCode10>
                          <xsl:value-of select="SDQ21/text()" />
                        </ns0:sdq_IDCode10>
                      </xsl:if>
                      <xsl:if test="SDQ22">
                        <ns0:sdq_Quantity10>
                          <xsl:value-of select="SDQ22/text()" />
                        </ns0:sdq_Quantity10>
                      </xsl:if>
                    </ns0:Edix_850_Sdq>
                  </ns0:detail2DestinationQuantity>
                </xsl:if>
              </xsl:for-each>
              <xsl:if test="$var:v19">
                <ns0:detail2DateTimeReference>
                  <xsl:for-each select="s0:DTM_7">
                    <ns0:Edix_850_Dtm_Detail2>
                      <ns0:dtmDetail2_DateTimeQualifier>
                        <xsl:value-of select="DTM01/text()" />
                      </ns0:dtmDetail2_DateTimeQualifier>
                      <xsl:if test="DTM02">
                        <ns0:dtmDetail2_ReferenceDate>
                          <xsl:value-of select="DTM02/text()" />
                        </ns0:dtmDetail2_ReferenceDate>
                      </xsl:if>
                    </ns0:Edix_850_Dtm_Detail2>
                  </xsl:for-each>
                </ns0:detail2DateTimeReference>
              </xsl:if>
              <xsl:for-each select="s0:SLNLoop1">
                <xsl:variable name="var:v20" select="userCSharp:LogicalIsString(string(s0:SLN/SLN01/text()))" />
                <xsl:if test="$var:v20">
                  <ns0:detail2LoopSLN>
                    <ns0:Edix_Detail2_LoopSln>
                      <ns0:detail2_LoopSln>
                        <ns0:sln_AssignedID>
                          <xsl:value-of select="s0:SLN/SLN01/text()" />
                        </ns0:sln_AssignedID>
                        <xsl:if test="s0:SLN/SLN02">
                          <ns0:sln_RelationshipCode>
                            <xsl:value-of select="s0:SLN/SLN02/text()" />
                          </ns0:sln_RelationshipCode>
                        </xsl:if>
                        <ns0:sln_Quantity>
                          <xsl:value-of select="s0:SLN/SLN03/text()" />
                        </ns0:sln_Quantity>
                        <xsl:if test="s0:SLN/SLN04">
                          <ns0:sln_CompUnitOfMeasure>
                            <xsl:value-of select="s0:SLN/SLN04/text()" />
                          </ns0:sln_CompUnitOfMeasure>
                        </xsl:if>
                        <xsl:if test="s0:SLN/s0:C001_17">
                          <ns0:sln_BasisForMeasurementCode>
                            <xsl:value-of select="s0:SLN/s0:C001_17/text()" />
                          </ns0:sln_BasisForMeasurementCode>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN06">
                          <ns0:sln_UnitPrice>
                            <xsl:value-of select="s0:SLN/SLN06/text()" />
                          </ns0:sln_UnitPrice>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN07">
                          <ns0:sln_ProductIDQualifier1>
                            <xsl:value-of select="s0:SLN/SLN07/text()" />
                          </ns0:sln_ProductIDQualifier1>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN08">
                          <ns0:sln_ProductID1>
                            <xsl:value-of select="s0:SLN/SLN08/text()" />
                          </ns0:sln_ProductID1>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN09">
                          <ns0:sln_ProductIDQualifier2>
                            <xsl:value-of select="s0:SLN/SLN09/text()" />
                          </ns0:sln_ProductIDQualifier2>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN10">
                          <ns0:sln_ProductID2>
                            <xsl:value-of select="s0:SLN/SLN10/text()" />
                          </ns0:sln_ProductID2>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN11">
                          <ns0:sln_ProductIDQualifier3>
                            <xsl:value-of select="s0:SLN/SLN11/text()" />
                          </ns0:sln_ProductIDQualifier3>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN12">
                          <ns0:sln_ProductID3>
                            <xsl:value-of select="s0:SLN/SLN12/text()" />
                          </ns0:sln_ProductID3>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN13">
                          <ns0:sln_ProductIDQualifier4>
                            <xsl:value-of select="s0:SLN/SLN13/text()" />
                          </ns0:sln_ProductIDQualifier4>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN14">
                          <ns0:sln_ProductID4>
                            <xsl:value-of select="s0:SLN/SLN14/text()" />
                          </ns0:sln_ProductID4>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN15">
                          <ns0:sln_ProductIDQualifier5>
                            <xsl:value-of select="s0:SLN/SLN15/text()" />
                          </ns0:sln_ProductIDQualifier5>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN16">
                          <ns0:sln_ProductID5>
                            <xsl:value-of select="s0:SLN/SLN16/text()" />
                          </ns0:sln_ProductID5>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN17">
                          <ns0:sln_ProductIDQualifier6>
                            <xsl:value-of select="s0:SLN/SLN17/text()" />
                          </ns0:sln_ProductIDQualifier6>
                        </xsl:if>
                        <xsl:if test="s0:SLN/SLN18">
                          <ns0:sln_ProductID6>
                            <xsl:value-of select="s0:SLN/SLN18/text()" />
                          </ns0:sln_ProductID6>
                        </xsl:if>
                      </ns0:detail2_LoopSln>
                      <xsl:for-each select="s0:CTP_4">
                        <xsl:variable name="var:v21" select="userCSharp:LogicalIsString(string(CTP01/text()))" />
                        <xsl:if test="$var:v21">
                          <ns0:detail2_LoopCtp>
                            <ns0:Edix_850_Ctp_Detail2>
                              <xsl:if test="CTP01">
                                <ns0:ctpLoopSln_ClassTradeCode>
                                  <xsl:value-of select="CTP01/text()" />
                                </ns0:ctpLoopSln_ClassTradeCode>
                              </xsl:if>
                              <xsl:if test="CTP02">
                                <ns0:ctpLoopSln_PriceIDCode>
                                  <xsl:value-of select="CTP02/text()" />
                                </ns0:ctpLoopSln_PriceIDCode>
                              </xsl:if>
                              <xsl:if test="CTP03">
                                <ns0:ctpLoopSln_UnitPrice>
                                  <xsl:value-of select="CTP03/text()" />
                                </ns0:ctpLoopSln_UnitPrice>
                              </xsl:if>
                            </ns0:Edix_850_Ctp_Detail2>
                          </ns0:detail2_LoopCtp>
                        </xsl:if>
                      </xsl:for-each>
                    </ns0:Edix_Detail2_LoopSln>
                  </ns0:detail2LoopSLN>
                </xsl:if>
              </xsl:for-each>
              <xsl:for-each select="s0:AMTLoop2">
                <xsl:variable name="var:v22" select="userCSharp:LogicalIsString(string(s0:AMT_2/AMT01/text()))" />
                <ns0:detail2LoopAMT>
                  <ns0:Edix_850_Amt_Detail2>
                    <xsl:if test="$var:v22">
                      <ns0:amtDetail2_AmtQualifierCode>
                        <xsl:value-of select="s0:AMT_2/AMT01/text()" />
                      </ns0:amtDetail2_AmtQualifierCode>
                    </xsl:if>
                    <ns0:amtDetail2_MonetaryAmt>
                      <xsl:value-of select="s0:AMT_2/AMT02/text()" />
                    </ns0:amtDetail2_MonetaryAmt>
                  </ns0:Edix_850_Amt_Detail2>
                </ns0:detail2LoopAMT>
              </xsl:for-each>
              <xsl:for-each select="s0:N9Loop2">
                <xsl:variable name="var:v23" select="userCSharp:LogicalIsString(string(s0:N9_2/N901/text()))" />
                <xsl:if test="$var:v23">
                  <ns0:n9Segment>
                    <ns0:n9_RefIDQualifier>
                      <xsl:value-of select="s0:N9_2/N901/text()" />
                    </ns0:n9_RefIDQualifier>
                    <xsl:if test="s0:N9_2/N902">
                      <ns0:n9_RefID>
                        <xsl:value-of select="s0:N9_2/N902/text()" />
                      </ns0:n9_RefID>
                    </xsl:if>
                    <xsl:if test="s0:N9_2/N903">
                      <ns0:n9_RefDescription>
                        <xsl:value-of select="s0:N9_2/N903/text()" />
                      </ns0:n9_RefDescription>
                    </xsl:if>
                  </ns0:n9Segment>
                </xsl:if>
              </xsl:for-each>
              <xsl:if test="$var:v24">
                <ns0:mtxSegments>
                  <xsl:for-each select="s0:N9Loop2">
                    <xsl:for-each select="s0:MSG_7">
                      <ns0:Edix_850_MTX>
                        <ns0:mtx_NoteReferenceCode>
                          <xsl:value-of select="MSG01/text()" />
                        </ns0:mtx_NoteReferenceCode>
                        <xsl:if test="MSG02">
                          <ns0:mtx_ReferenceText1>
                            <xsl:value-of select="MSG02/text()" />
                          </ns0:mtx_ReferenceText1>
                        </xsl:if>
                        <xsl:if test="MSG03">
                          <ns0:mtx_ReferenceText2>
                            <xsl:value-of select="MSG03/text()" />
                          </ns0:mtx_ReferenceText2>
                        </xsl:if>
                      </ns0:Edix_850_MTX>
                    </xsl:for-each>
                  </xsl:for-each>
                </ns0:mtxSegments>
              </xsl:if>
            </ns0:Edix_Detail1_LoopPo1>
          </xsl:for-each>
        </ns0:detail1LoopPO1>
        <ns0:summaryLoopCTT>
          <ns0:Edix_Summary_LoopCTT>
            <xsl:for-each select="s0:CTTLoop1">
              <ns0:summary_Ctt>
                <ns0:ctt_NumOfLineItems>
                  <xsl:value-of select="s0:CTT/CTT01/text()" />
                </ns0:ctt_NumOfLineItems>
                <xsl:if test="s0:CTT/CTT02">
                  <ns0:ctt_HashTotal>
                    <xsl:value-of select="s0:CTT/CTT02/text()" />
                  </ns0:ctt_HashTotal>
                </xsl:if>
              </ns0:summary_Ctt>
            </xsl:for-each>
            <xsl:for-each select="s0:CTTLoop1">
              <xsl:for-each select="s0:AMT_3">
                <xsl:variable name="var:v25" select="userCSharp:LogicalIsString(string(AMT01/text()))" />
                <ns0:summary_Amt>
                  <xsl:if test="$var:v25">
                    <ns0:amtSummary_AmtQualifierCode>
                      <xsl:value-of select="AMT01/text()" />
                    </ns0:amtSummary_AmtQualifierCode>
                  </xsl:if>
                  <ns0:amtSummary_MonetaryAmt>
                    <xsl:value-of select="AMT02/text()" />
                  </ns0:amtSummary_MonetaryAmt>
                </ns0:summary_Amt>
              </xsl:for-each>
            </xsl:for-each>
          </ns0:Edix_Summary_LoopCTT>
        </ns0:summaryLoopCTT>
      </ns0:PO_850x_Document>
    </ns0:ArrayOfPO_850x_Document>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public bool LogicalGt(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 > d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) > 0;
	}
	return ret;
}


public bool LogicalIsString(string val)
{
	return (val != null && val !="");
}


public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}


]]></msxsl:script>
</xsl:stylesheet>