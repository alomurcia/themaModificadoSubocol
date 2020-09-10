<div class="row border-bottom">		
 	<#if getterUtil.getBoolean(theme_settings['white-top-header']!"", false) == true>
 		<nav class="navbar navbar-static-top  white-bg" role="navigation" style="margin-bottom: 0;  z-index: 111;">
 	<#else>
 		<nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0;  z-index: 111;">
 	</#if>
    
        <div class="navbar-header navbar-search">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " id="btnClose" href="#"><i class="fa fa-bars"></i> </a>
            
            <div class="navbar-form-custom" role="search"> <@liferay.search /></div>
        </div>
        <div class="header-right right">
        
        <ul class="nav navbar-top-links navbar-right">
        	<li>
                <span class="m-r-sm text-muted welcome-message">Welcome to ${company_name}.</span>
            </li>
            <#if !is_signed_in>
            	<#if getterUtil.getString(theme_settings['login-page']!"", "") == "">
					<li><a data-redirect="false" href="${sign_in_url}" rel="nofollow" id="sign-in">${sign_in_text}</a></li>
				<#else>
					<li><a data-redirect="true" href="${getterUtil.getString(theme_settings['login-page']!"", "")}" rel="nofollow" id="sign-in">${sign_in_text}</a></li>
				</#if>
            </#if>
            
            <#if getterUtil.getBoolean(theme_settings['display-right-sidebar-toggle']!"", false) == true>
            	<li>
					<a class="right-sidebar-toggle">
				         <i class="fa fa-tasks"></i>
				     </a>
				</li>
			</#if>

        </ul>
		<#if getterUtil.getBoolean(theme_settings['show-language-choice']!"", false) ==true>
			<div class="clearfix"> </div>
            <div id="Language-choices">
            	<#if taglibLiferay??>
					${taglibLiferay.language("fm",null,"_82_languageId",0)}
				</#if>
			</div>
		</#if>
		 </div>
        </nav>
    </div>

<#if getterUtil.getBoolean(theme_settings['show-breadcrumbs']!"", false) == true>
	<div class="row wrapper border-bottom white-bg page-heading row-breadcrumbs" style="display: block !important;">
	    <div class="col-lg-10">
	        <@liferay.breadcrumbs />
	    </div>
	</div>
</#if>
