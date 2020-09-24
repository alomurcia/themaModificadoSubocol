 <nav class="navbar-default navbar-static-side" role="navigation" id="top-navigation">
 	<div class="" id="slimScroll">
    	<div class="sidebar-collapse"> 
    		
    		<div class="navbar-closed">
		    	<#if  getterUtil.getBoolean(theme_settings['use-navbar-closed']!"", false) == true>
			    	<a class="close-canvas-menu"><i class="fa fa-times"></i></a>
			    </#if>
    		</div>
    		  
	        <ul class="nav" id="side-menu">
				<div>
				<img alt="image" class="img-fluid rounded mx-auto d-block margin-top-img" src="${site_logo}" />
				</div>
	        	<#if (is_signed_in)>
		            <li class="nav-header">
		            	<div class="dropdown profile-element"> 
			            	<span><img alt="image" class="img-circle rounded mx-auto d-block" src="${user.getPortraitURL(themeDisplay)}" /></span>
						    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
							    <span class="clear"> 
							    	<span class="block m-t-xs"> <strong class="font-bold">${user.getFullName()}</strong>
							    		<#if (user.getJobTitle() =="")> <b class="caret"></b> </#if>
							    	</span> 
								    <span class="text-muted text-xs block">
								    	${user.getJobTitle()}
								    	<#if (user.getJobTitle() !="")> <b class="caret"></b> </#if>
							    	</span>
						    	</span>
						    </a>
						   
						    <ul class="dropdown-menu animated fadeInRight m-t-xs">
						        <#if getterUtil.getBoolean(theme_settings['custom-profile-left-header-menu']!"", false)  == false>
							    	<#assign user_profile = theme_display.getPortalURL()+"/web/"+user.getScreenName() />
							    	<li><a href="${user_profile}"> <@liferay.language key="Mi perfil" /></a></li>
							    	
							    	<#assign user_dash = theme_display.getPortalURL()+"/user/"+user.getScreenName() />
							    	<li><a href="${user_dash}"> <@liferay.language key="Mi tablero de control" /></a></li>
							    	
							    	<#if my_account_url??>
							    		<li><a href="${my_account_url}">${my_account_text}</a></li>
						    		</#if>
						    	<#else>
						         	<#if journalContentUtil??>
										${nav_header_profile_menu}
									<#else>
										<#assign preferences = freeMarkerPortletPreferences.getPreferences("articleId", "${nav_header_profile_menu}") />
										<@liferay_portlet["runtime"]
											defaultPreferences="${preferences}"
											portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" 
											instanceId="header_prof"
										/>
									</#if>
									
					         	</#if>
					         	
						        <li><a data-redirect="false" href="${sign_out_url}" rel="nofollow">${sign_out_text} </a> </li>
						    </ul>
						</div>               
		            </li>
	            </#if>
	            <#assign velocityCount=0 />
	            
	            <#if nav_items??>
		            <#list nav_items as nav_item>
						<#assign nav_item_attr_has_popup="" />
						<#assign nav_item_attr_selected="" />
						<#assign nav_item_css_class = "" />
						<#assign velocityCount = velocityCount +1 />
		            
		            	
						<#if  (nav_item.isSelected())>
							<#assign nav_item_attr_selected="aria-selected='true'" />
							<#assign nav_item_css_class = "active" />
						</#if>
						
						<li class="${nav_item_css_class} item${velocityCount}" id="layout_${nav_item.getLayoutId()}" ${nav_item_attr_selected} role="presentation">
							<a aria-labelledby="layout_${nav_item.getLayoutId()}" href="${nav_item.getURL()}" ${nav_item_attr_has_popup} ${nav_item.getTarget()} role="menuitem">
								<#if getterUtil.getString(theme_settings['pages-icon']!"", "") == "Upload Icon">
									<#if nav_item.icon??>
										${nav_item.icon()}
									</#if>
								<#elseif (getterUtil.getString(theme_settings['pages-icon']!"", "") == "Default")>
									<i class='icon-item${velocityCount}'></i>
								<#elseif (getterUtil.getString(theme_settings['pages-icon']!"", "") == "Custom Field")>
									<#if  (nav_item.getLayout().getExpandoBridge().hasAttribute("icon") == true)>
										${nav_item.getLayout().getExpandoBridge().getAttribute("icon")}
									</#if>
								</#if>
								
								<span class="nav-label menu-name">${nav_item.getName()}</span>
								
								<#if  (! nav_item.hasChildren())>
									</a>
								<#else>
									<span class="fa arrow"></span>
								</a>
								
								<ul class="nav nav-second-level">
		            				<#list nav_item.getChildren() as nav_child>
										<#assign  nav_child_css_class = "" />
										<#if  (nav_child.isSelected())>
											<#assign nav_child_css_class = "active" />
										</#if>
										<li class="${nav_child_css_class}">
											<#if  (!nav_child.hasChildren())>
												<a href="${nav_child.getURL()}" >
													${nav_child.getName()}
												</a>
											<#else>
												<a href="${nav_child.getURL()}" >
													${nav_child.getName()}
													<span class="fa arrow"></span>
												</a>
												<ul class="nav nav-third-level">
													<#list nav_child.getChildren() as nav_child3 >
														<li><a href="${nav_child3.getURL()}">${nav_child3.getName()}</a></li>
													</#list>
												</ul>
											</#if>
										</li>
									</#list>
								</ul>
						 	</#if>
						</li>
					</#list>
				</#if>
	        </ul>
    	</div>
    	<div id="slimScrollBar"></div>
    	<div id="slimScrollRail"></div>
	</div>
</nav>

<#if (getterUtil.getString(theme_settings['pages-icon']!"", "") =="Default")>
	<script type="text/javascript">		
		$( document ).ready(function() {
			$('.icon-item1').addClass('fa fa-th-large');
			$('.icon-item2').addClass('fa fa-globe');
			$('.icon-item3').addClass('fa fa-bar-chart-o');
			$('.icon-item4').addClass('fa fa-envelope');
			$('.icon-item5').addClass('fa fa-pie-chart');
			$('.icon-item6').addClass('fa fa-flask');
			$('.icon-item7').addClass('fa fa-edit');
			$('.icon-item8').addClass('fa fa-desktop');
			$('.icon-item9').addClass('fa fa-files-o');
			$('.icon-item10').addClass('fa fa-globe');		
			$('.icon-item11').addClass('fa fa-flask');		
			$('.icon-item12').addClass('fa fa-laptop');		
			$('.icon-item13').addClass('fa fa-table');		
			$('.icon-item14').addClass('fa fa-shopping-cart');		
			$('.icon-item15').addClass('fa fa-picture-o');		
			$('.icon-item16').addClass('fa fa-sitemap');			
			$('.icon-item17').addClass('fa fa-magic');
			$('.icon-item18').addClass('fa fa-database');
			
			$('.icon-item19').addClass('fa fa-star');	
			$('.item19').addClass('landing_link');		
		});
	</script>	
</#if>