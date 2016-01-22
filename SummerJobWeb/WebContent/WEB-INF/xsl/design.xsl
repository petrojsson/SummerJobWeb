<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8" />

	<xsl:include
		href="classpath://se/unlogic/hierarchy/core/xsl/CommonCoreTemplates.xsl" />
	<xsl:include href="classpath://se/unlogic/hierarchy/core/xsl/Errors.en.xsl" />

	<xsl:template match="document">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>

		<xsl:text disable-output-escaping="yes"><![CDATA[<!--[if lt IE 8]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->]]></xsl:text>
		<xsl:text disable-output-escaping="yes"><![CDATA[<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->]]></xsl:text>
		<xsl:text disable-output-escaping="yes"><![CDATA[<!--[if gt IE 8]><!--> ]]></xsl:text>
		<xsl:text disable-output-escaping="yes"><![CDATA[<!--[if gt IE 8]><!--><html class="no-js" lang="sv"><!--<![endif]-->]]></xsl:text>

		<head>

			<meta name="viewport" content="width=device-width, initial-scale=1.0, minimal-ui" />
			<title>
				<xsl:if test="title">
					<xsl:value-of select="title" />
					<xsl:text> - </xsl:text>
				</xsl:if>
				<xsl:text>Sommarjobb</xsl:text>
			</title>

			<link rel="shortcut icon" href="{/document/requestinfo/contextpath}/favicon.ico" />
			<link rel="stylesheet"
				href="{/document/requestinfo/contextpath}/css/bootstrap.min.css" />
			<link rel="stylesheet"
				href="{/document/requestinfo/contextpath}/css/bootstrap-theme.min.css" />
			<link rel="stylesheet" href="{/document/requestinfo/contextpath}/css/sommarjobb.css" />
			<link rel="stylesheet"
				href="{/document/requestinfo/contextpath}/css/jquery-ui-1.8.7.custom.css" />
			<link rel="stylesheet"
				href="{/document/requestinfo/contextpath}/css/jquery-ui-timepicker-addon.css" />


			<xsl:apply-templates
				select="scripts/script[src != '/static/global/jquery/jquery.js' and  src != '/static/global/jquery/jquery-ui.js']" />
			<xsl:apply-templates select="links/link" />

			<xsl:for-each
				select="backgroundsModuleResponses/response[slots/slot='head']">
				<xsl:value-of select="HTML" disable-output-escaping="yes" />
			</xsl:for-each>

		</head>

		<body>
			<div class="container">
				
				<div id="HeaderArea">
	                <a id="HomeLink" href="/"></a>
	            </div>
	            
				<nav id="navBar" class="navbar navbar-fixed-top no-fixed-top">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#navbar" aria-expanded="false"
								aria-controls="navbar">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<xsl:choose>
								<xsl:when test="/document/requestinfo/contextpath!=''">
									<a class="navbar-brand" href="{/document/requestinfo/contextpath}">Sommarjobb</a>
								</xsl:when>
								<xsl:otherwise>
									<a class="navbar-brand" href="/">Sommarjobb</a>
								</xsl:otherwise>
							</xsl:choose>
							
						</div>
						<div id="navbar" class="navbar-collapse collapse">
							<ul class="nav navbar-nav">

								<xsl:if test="user/admin = 'false'">				
									<li>
										<a href="{/document/requestinfo/contextpath}/summerjobs-overview">Överblick</a>
									</li>
												
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">
											Lägg till sommarjobb
											<span class="caret"></span>
										</a>
										
										<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
											<li role="presentation">
												<a role="menuitem" tabindex="1"
													href="{/document/requestinfo/contextpath}/add-municipality-job">Inom kommunal verksamhet</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="2"
													href="{/document/requestinfo/contextpath}/add-business-sector-job">Inom näringslivet</a>
											</li>
										</ul>
									</li>
									
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">
											Inlagda jobb
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
											<li role="presentation">
												<a role="menuitem" tabindex="2"
													href="{/document/requestinfo/contextpath}/list-summerjobs?municipality=true">Kommunala sommarjobb</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="3"
													href="{/document/requestinfo/contextpath}/list-summerjobs?business=true">Sommarjobb i näringslivet</a>
											</li>
										</ul>
									</li>									


								</xsl:if>
								
								<xsl:if test="user/admin = 'true'">
									<li>
										<a href="{/document/requestinfo/contextpath}/summerjobs-overview">Överblick</a>
									</li>
									
									<li>
										<a href="{/document/requestinfo/contextpath}/list-applications">Ansökningar</a>
									</li>
									
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">
											Menu
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
											
											<li role="presentation">
												<a role="menuitem" tabindex="1"
													href="{/document/requestinfo/contextpath}/list-summerjobs?municipality=true">Alla kommunala sommarjobb</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="2"
													href="{/document/requestinfo/contextpath}/list-summerjobs?business=true">Alla Sommarjobb i näringslivet</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="3"
													href="{/document/requestinfo/contextpath}/admin-manage">Administrera</a>
											</li>
											
											<li class="divider"/>
											<li role="presentation">
												<a role="menuitem" tabindex="4"
													href="{/document/requestinfo/contextpath}/add-municipality-job">Lägg till kommunalt jobb</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="5"
													href="{/document/requestinfo/contextpath}/add-business-sector-job">Lägg till näringslivsjobb</a>
											</li>
											
											<li class="divider"/>
											
											<li role="presentation">
												<a role="menuitem" tabindex="6"
													href="{/document/requestinfo/contextpath}/add-municipality-job-application">Lägg till kommunal sommarjobbsansökan</a>
											</li>
											
											<li role="presentation">
												<a role="menuitem" tabindex="7"
													href="{/document/requestinfo/contextpath}/business-sector-job">Lägg till sommarjobbsansökan i näringsliv</a>
											</li>
										</ul>
									</li>

									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">
											Admin menu
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
											<li role="presentation">
												<a role="menuitem" tabindex="-1"
													href="{/document/requestinfo/contextpath}/">
													<xsl:value-of select="section/name" />
												</a>
											</li>
											<xsl:apply-templates select="menus/menu/menuitem" />
										</ul>
									</li>
								</xsl:if>
								<li>
									<xsl:if test="not(user)">
										<a href="{/document/requestinfo/contextpath}/login">Logga in</a>
									</xsl:if>
									<xsl:if test="user">
										<a href="{/document/requestinfo/contextpath}/logout">Logga ut</a>
									</xsl:if>
								</li>
							</ul>

						</div>
					</div><!-- /.container -->
				</nav>
			</div>


			<div class="container main-content-container">

				<!-- banner-slot: top -->
				<xsl:for-each
					select="backgroundsModuleResponses/response[slots/slot='banner-slot']">
					<xsl:value-of select="HTML" disable-output-escaping="yes" />
				</xsl:for-each>


				<xsl:for-each
					select="backgroundsModuleResponses/response[slots/slot='main-slot']">
					<xsl:value-of select="HTML" disable-output-escaping="yes" />
				</xsl:for-each>
				<xsl:apply-templates select="errors" />
				<xsl:apply-templates select="moduleXMLResponse" />
				<xsl:value-of select="moduleHTMLResponse"
					disable-output-escaping="yes" />
				<xsl:value-of select="moduleTransformedResponse"
					disable-output-escaping="yes" />

				<xsl:for-each
					select="backgroundsModuleResponses/response[slots/slot='footer-slot']">
					<xsl:value-of select="HTML" disable-output-escaping="yes" />
				</xsl:for-each>

			</div>


			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/jquery-2.1.4.min.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/jquery-ui.min.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/bootstrap.min.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/add-summerjob.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/jquery.ui.datepicker.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/jquery.ui.datepicker-sv.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/validator.min.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/match-summerjob.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/periodsadmin.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/applications.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/jquery-ui-timepicker-addon.js"></script>
			<script type="text/javascript"
				src="{/document/requestinfo/contextpath}/js/jquery.scrollTo.min.js"></script>

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
								<xsl:attribute name="href"><xsl:value-of
									select="/document/requestinfo/contextpath" /><xsl:value-of
									select="url" /></xsl:attribute>
							</xsl:when>
							<xsl:when test="urlType='FULL'">
								<xsl:attribute name="href"><xsl:value-of
									select="url" /></xsl:attribute>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="selected">
							<xsl:attribute name="selected">"selected"</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="name" />
					</a>
				</li>
			</xsl:when>
			<xsl:otherwise>

				<!-- <optgroup label="{name}"> -->
				<li role="presentation" class="divider"></li>
				<xsl:apply-templates
					select="menu/menuitem[itemType!='BLANK' and itemType!='TITLE']" />

				<!-- </optgroup> -->
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="moduleXMLResponse">
		<xsl:apply-templates mode="module" />
	</xsl:template>
</xsl:stylesheet>