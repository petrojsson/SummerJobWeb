<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1"/>
	
	<xsl:include href="classpath://se/unlogic/hierarchy/core/xsl/CommonCoreTemplates.xsl" />
	<xsl:include href="classpath://se/unlogic/hierarchy/core/xsl/Errors.en.xsl" />
	
	<xsl:template match="document">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
	
		<xsl:text disable-output-escaping="yes"><![CDATA[<!--[if lt IE 8]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<!--[if gt IE 8]><!--> ]]></xsl:text>    
             <xsl:text disable-output-escaping="yes"><![CDATA[<!--[if gt IE 8]><!--><html class="no-js" lang="sv"><!--<![endif]-->]]></xsl:text>   

			<head>

				<meta name="viewport" content="width=device-width, initial-scale=1.0, minimal-ui"/>
				<title>					
					<xsl:if test="title">						
						<xsl:value-of select="title"/>
						<xsl:text> - </xsl:text>
					</xsl:if>
					<xsl:text>Sommarjobb</xsl:text>
				</title>
				
				<link rel="shortcut icon" href="{/document/requestinfo/contextpath}/favicon.ico"/>
				<link rel="stylesheet" href="{/document/requestinfo/contextpath}/css/bootstrap.min.css"/>
				<link rel="stylesheet" href="{/document/requestinfo/contextpath}/css/bootstrap-theme.min.css"/>
		    	<link rel="stylesheet" href="{/document/requestinfo/contextpath}/css/verksam.css"/>
		    	
				<xsl:apply-templates select="scripts/script[src != '/static/global/jquery/jquery.js' and  src != '/static/global/jquery/jquery-ui.js']"/>		 
			    <xsl:apply-templates select="links/link"/>
				
				<xsl:for-each select="backgroundsModuleResponses/response[slots/slot='head']">
					<xsl:value-of select="HTML" disable-output-escaping="yes"/>
				</xsl:for-each>
							    
			</head>
			
			<body>
				<div class="container">			
					<nav id="navBar" class="navbar navbar-fixed-top">
				      <div class="container">
				        <div class="navbar-header">
				          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				            <span class="sr-only">Toggle navigation</span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				          </button>
				          <a class="navbar-brand" href="/">Sommarjobb</a>
				        </div>
				        <div id="navbar" class="navbar-collapse collapse">
				          <ul class="nav navbar-nav"> 				        
				            <li class=""><a href="{/document/requestinfo/contextpath}/add-municipality-job-application">ansök om kommunalt sommarjobb</a></li>				           
				            <xsl:if test="user">
				            	<li class=""><a href="{/document/requestinfo/contextpath}/add-municipality-job">Lägg till kommunalt sommarjobb</a></li>
				            </xsl:if>
				            <xsl:if test="user/admin = 'true'">
				            	<li class=""><a href="{/document/requestinfo/contextpath}/summerjobs-overview">Överblick</a></li>
				            	
					            <li class="dropdown">
					              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin menu <span class="caret"></span></a>
					              <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
			    					<li role="presentation">
			    						<a role="menuitem" tabindex="-1" href="{/document/requestinfo/contextpath}/"><xsl:value-of select="section/name"/></a>
			    					</li>
									<xsl:apply-templates select="menus/menu/menuitem"/>
			    				</ul>
					            </li>
				            </xsl:if>
				            <li>
				            	<xsl:if test="not(user)">
									<a href="{/document/requestinfo/contextpath}/login">login</a>
								</xsl:if>	
								<xsl:if test="user">
									<a href="{/document/requestinfo/contextpath}/logout">logout</a>
								</xsl:if>
				            </li> 
				          </ul>
				          
				        </div>
				      </div><!-- /.container -->
				    </nav>
				</div>
			

			<div class="container" style="padding: 60px 15px 0;">

			<!-- banner-slot: top -->				
				<xsl:for-each select="backgroundsModuleResponses/response[slots/slot='banner-slot']">
					<xsl:value-of select="HTML" disable-output-escaping="yes"/>
				</xsl:for-each>
				
<!-- 			 <xsl:if test="user/admin = 'true'">
			  	<div class="dropdown">
    				<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Admin menu
    				<span class="caret"></span></button>
    				<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
    					<li role="presentation">
    						<a role="menuitem" tabindex="-1" href="{/document/requestinfo/contextpath}/"><xsl:value-of select="section/name"/></a>
    					</li>
							<xsl:apply-templates select="menus/menu/menuitem"/>
    				</ul>
    			</div>	

			</xsl:if> -->
<!-- 				
				<xsl:if test="not(user)">
					<div class="ekorren-header-section ekorren-profile ekorren-login-btn">					

						<a class="of-btn of-btn-inline of-btn-vattjom of-btn-spaced login-modal" href="/login">
						<span>Logga in</span>
						</a>
					</div>

				</xsl:if>
				<xsl:if test="user">
					<div class="ekorren-header-section ekorren-profile ekorren-login-btn">					
						<a class="of-btn of-btn-inline of-btn-vattjom of-btn-spaced" href="{/document/requestinfo/contextpath}/logout">					
						<span>Logga ut</span>
						</a>
					</div>
				</xsl:if>
				-->

			
			<xsl:for-each select="backgroundsModuleResponses/response[slots/slot='main-slot']">
				<xsl:value-of select="HTML" disable-output-escaping="yes"/>
			</xsl:for-each>
			<xsl:apply-templates select="errors" />
			<xsl:apply-templates select="moduleXMLResponse" />
			<xsl:value-of select="moduleHTMLResponse" disable-output-escaping="yes"/>
			<xsl:value-of select="moduleTransformedResponse" disable-output-escaping="yes"/>
	
			<xsl:for-each select="backgroundsModuleResponses/response[slots/slot='footer-slot']">
				<xsl:value-of select="HTML" disable-output-escaping="yes"/>
			</xsl:for-each>

		</div>


			<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
			<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
			<script type="text/javascript" src="{/document/requestinfo/contextpath}/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="{/document/requestinfo/contextpath}/js/add-municipality-job.js"></script>
		</body>			
	<xsl:text disable-output-escaping="yes"><![CDATA[</html>]]></xsl:text>
	</xsl:template>

	<xsl:template match="menuitem">	
		
		<xsl:choose>
			<xsl:when test="not(menu)">
				<li>
					<a>
					<xsl:choose>
						<xsl:when test="urlType='RELATIVE_FROM_CONTEXTPATH'">
							<xsl:attribute name="href"><xsl:value-of select="/document/requestinfo/contextpath"/><xsl:value-of select="url"/></xsl:attribute>				
						</xsl:when>			
						<xsl:when test="urlType='FULL'">
							<xsl:attribute name="href"><xsl:value-of select="url"/></xsl:attribute>				
						</xsl:when>
					</xsl:choose>
					<xsl:if test="selected">
					 		<xsl:attribute name="selected">"selected"</xsl:attribute>
			 		</xsl:if>
					<xsl:value-of select="name"/>
					</a>
				</li>				
			</xsl:when>
			<xsl:otherwise>
				
<!-- 				<optgroup label="{name}"> -->
 				<li role="presentation" class="divider"></li>
					<xsl:apply-templates select="menu/menuitem[itemType!='BLANK' and itemType!='TITLE']" />
								
<!-- 				</optgroup> -->
			</xsl:otherwise>
		</xsl:choose>				
	</xsl:template>
	
	<xsl:template match="moduleXMLResponse">
		<xsl:apply-templates mode="module" />
	</xsl:template>	
</xsl:stylesheet>