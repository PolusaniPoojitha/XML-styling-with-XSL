<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<table width ="50%"  align="center">
			<tr>
				<td>
					<table width="100%">
						<tr>
							<td  style="font-size:65%;text-align:center; " >
								<xsl:value-of select="bill/form/congress"/>
							</td>
						</tr>
						<tr>
							<td style="font-size:65%;text-align:center;" >
								<xsl:value-of select="bill/form/session"/>
							</td>
							<td style="width:80%"></td>
						</tr>
                    
					</table>
				</td>
			</tr>
			<tr>
				<td style="font-size:170%; font-type:bold; text-align:center; ">
					<xsl:value-of select="bill/form/legis-num"/>
				</td>
			</tr>
			<tr>
				<td style="font-size:70%;text-align:left;" >
					<xsl:value-of select="bill/form/official-title"/>
				</td>
			</tr>
			<tr>
				<td style="text-align:center">
					<xsl:text>______________________________________________</xsl:text>

				</td>
			</tr>
			<tr>
				<td style="font-size:75%;font-type:bold;text-align:center; ">
					<xsl:value-of select="bill/form/current-chamber"/>
				</td>
			</tr>
			<tr>
				<td style="font-size:60%;text-align:center;" >
					<xsl:value-of select="bill/form/action/action-date"/>
				</td>
			</tr>
			<tr>
				<td style="font-size:65%;text-align:left;" >
					<xsl:variable name="action" select="bill/form/action/action-desc"></xsl:variable>
					<xsl:for-each select="$action">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td style="text-align:center">
					<xsl:text>________________________________________________</xsl:text>
				</td>
			</tr>
			<tr>
				<td style="font-size:150%;font-type:bold;text-align:center; ">
					<xsl:value-of select="bill/form/legis-type"/>
				</td>
			</tr>
			<tr>
				<td style="font-size:65%;" >
					<br/>
					<xsl:value-of select="bill/form/official-title"/>
				</td>
			</tr>
			<tr>
				<td style="font-size:65%; font-style: italic;" >
					<br/>
					&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:text>Be it enacted by the Senate and House of representatives of the United States of America in Congress Assembled</xsl:text>
				   
				</td>
			</tr>
			<xsl:variable name="section" select="bill/legis-body/section"></xsl:variable>

			<xsl:for-each select="bill/legis-body/section">
				<tr>
					<td>
						<p style="font-size:70%;text-transform:uppercase; font-weight:bold; ">
							<xsl:variable name="sectionId" >
								<xsl:choose>
									<xsl:when test="@id ='S1'">
										<xsl:text>SECTION&#160;</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>SEC.&#160;</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select ="$sectionId"/>
							<xsl:value-of select="enum"/>
							<xsl:value-of select="header"/>
						</p>
						<p style="font-size:69%; padding-left:20px">
							<xsl:value-of select="text"/>
							<xsl:choose>
								<xsl:when test="@id !='S1'">
									<xsl:for-each select="paragraph">
										<p style="font-size:69%; padding-left:10px; ">
											<table>
												<tr>
													<td style="font-size:69%; padding-left:15px;">
														&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="enum"/>
														&#160;<xsl:value-of select="text"/>
													</td>
												</tr>

											</table>
										</p>
									</xsl:for-each>
								</xsl:when>
							</xsl:choose>
						</p>
					</td>
				</tr>
			</xsl:for-each>
			<tr>
				<td style="font-size:70%">
					&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="bill/legis-body/section/paragraph[2]/quoted-block"/>
				</td>
			</tr>
			<tr>
				<td style="text-align:center">
					<xsl:text>__________________________________________________________________________________________________</xsl:text>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>