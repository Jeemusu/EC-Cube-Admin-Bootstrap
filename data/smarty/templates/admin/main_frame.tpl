<!DOCTYPE html>
<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta name="robots" content="noindex,nofollow" />

<!-- Stylesheets -->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/bootstrap.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/admin_custom.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/admin_file_manager.css" type="text/css" media="all" />


<!-- Javascript -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="//maps-api-ssl.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript" src="<!--{$smarty.const.ADMIN_HOME_URLPATH}-->js/navi.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ADMIN_HOME_URLPATH}-->js/win_op.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ADMIN_HOME_URLPATH}-->js/site.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ADMIN_HOME_URLPATH}-->js/css.js"></script>

<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/admin.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/file_manager.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/bootstrap.min.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/admin_custom.js"></script>

<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/flot/jquery.flot.time.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/flot/jquery.flot.selection.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/flot/jquery.flot.categories.js"></script>

<title><!--{$smarty.const.ADMIN_TITLE}--></title>
<link rel="shortcut icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />
<script type="text/javascript">
//<![CDATA[
    <!--{$tpl_javascript}-->
    $(function(){
        <!--{$tpl_onload}-->
    });
//]]>
</script>

<!--{if $arrPageLayout.HeadNavi|@count > 0}-->
    <!--{foreach key=HeadNaviKey item=HeadNaviItem from=$arrPageLayout.HeadNavi}-->
        <!--{if $HeadNaviItem.php_path != ""}-->
            <!--{include_php file=$HeadNaviItem.php_path}-->
        <!--{/if}-->
    <!--{/foreach}-->
<!--{/if}-->

</head>

<body class="<!--{if strlen($tpl_authority) >= 1}-->authority_<!--{$tpl_authority}--><!--{/if}-->">
<!--{$GLOBAL_ERR}-->

	<div class="navbar navbar-inverse navbar-fixed-top">
	
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="<!--{$smarty.const.ADMIN_HOME_URLPATH}-->">EC-CUBE</a>
		        <div class="nav-collapse">
		         	<ul class="nav pull-right">
		            	<li><a target="_blank" href="<!--{$smarty.const.HTTP_URL}--><!--{$smarty.const.DIR_INDEX_PATH}-->">サイト確認</a></li> 
		            	<li class="divider-vertical"></li>
		            	<li class="dropdown">
		              		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><!--{$smarty.session.login_name|h}--> <b class="caret"></b></a>
		              		<ul class="dropdown-menu">
								<li><a href="<!--{$smarty.const.ADMIN_LOGOUT_URLPATH}-->"><i class="icon-off"></i> ログアウト</a></li>
		             		</ul>
		            	</li>
		          	</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	
		<div id="navi-wrap">
			<div class="container">
			    <ul id="navi" class="clearfix">
			        <li id="navi-basis" class="<!--{if $tpl_mainno eq "basis"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->basis/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span class="level1">基本情報管理</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`basis/subnavi.tpl"}-->
			        </li>
			        <li id="navi-products" class="<!--{if $tpl_mainno eq "products"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->products/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>商品管理</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`products/subnavi.tpl"}-->
			        </li>
			        <li id="navi-customer" class="<!--{if $tpl_mainno eq "customer"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->customer/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>会員管理</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`customer/subnavi.tpl"}-->
			        </li>
			        <li id="navi-order" class="<!--{if $tpl_mainno eq "order"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->order/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>受注管理</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`order/subnavi.tpl"}-->
			        </li>
			        <li id="navi-total" class="<!--{if $tpl_mainno eq "total"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->total/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>売上集計</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`total/subnavi.tpl"}-->
			        </li>
			        <li id="navi-mail" class="<!--{if $tpl_mainno eq "mail"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->mail/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>メルマガ管理</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`mail/subnavi.tpl"}-->
			        </li>
			        <li id="navi-contents" class="<!--{if $tpl_mainno eq "contents"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->contents/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>コンテンツ管理</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`contents/subnavi.tpl"}-->
			        </li>
			        <li id="navi-design" class="<!--{if $tpl_mainno eq "design"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->design/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>デザイン管理</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`design/subnavi.tpl"}-->
			        </li>
			        <li id="navi-system" class="<!--{if $tpl_mainno eq "system"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->system/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>システム設定</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`system/subnavi.tpl"}-->
			        </li>
			        <li id="navi-ownersstore" class="last <!--{if $tpl_mainno eq "ownersstore"}-->on<!--{/if}-->">
			            <a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->ownersstore/<!--{$smarty.const.DIR_INDEX_PATH}-->"><span>オーナーズストア</span></a>
			            <!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`ownersstore/subnavi.tpl"}-->
			        </li>
			    </ul>
			</div>
		</div>
	</div>
	<!--{* ▲HEADER *}-->
	
	
	<div class="container" id="mainContainer">
	
		<!--{if $smarty.const.ADMIN_MODE == '1'}-->
		<div id="admin-mode-on">ADMIN_MODE ON</div>
		<!--{/if}-->


		<!--{if $tpl_subtitle}-->
		<ul class="breadcrumb">
			<li><a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->home.php">ホーム</a> <span class="divider">/</span></li>
			<!--{if strlen($tpl_maintitle) >= 1 }--><li><!--{$tpl_maintitle|h}--><span class="divider">/</span></li><!--{/if}-->
			<!--{if strlen($tpl_maintitle) >= 1 && strlen($tpl_subtitle) >= 1}--><li class="active"><!--{$tpl_subtitle|h}--><span class="divider">/</span></li><!--{/if}-->
		</ul>
		<!--{/if}-->
		
		<div id="contents" class="clearfix">
		    <!--{include file=$tpl_mainpage}-->
		</div>
	
	</div>
	
	<div id="footer"></div>
</body>
</html>