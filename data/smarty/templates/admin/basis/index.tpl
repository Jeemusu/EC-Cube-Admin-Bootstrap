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
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />

<form name="form1" id="form1" method="post" action="?">
	<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
	<input type="hidden" name="mode" value="<!--{$tpl_mode}-->" />

	<div>
	
	    <h2>基本情報</h2>
	    <table class="table">
	        <tr>
	            <th>会社名</th>
	            <td>
	                <span class="attention"><!--{$arrErr.company_name}--></span>
	                <input type="text" name="company_name" value="<!--{$arrForm.company_name|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="span5" style="<!--{if $arrErr.company_name != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	                <span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>会社名(フリガナ)</th>
	            <td>
	                <span class="attention"><!--{$arrErr.company_kana}--></span>
	                <input type="text" name="company_kana" value="<!--{$arrForm.company_kana|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="span5" style="<!--{if $arrErr.company_kana != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	                <span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>店名<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.shop_name}--></span>
	                <input type="text" name="shop_name" value="<!--{$arrForm.shop_name|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="span5" style="<!--{if $arrErr.shop_name != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	                <span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>店名(フリガナ)</th>
	            <td>
	                <span class="attention"><!--{$arrErr.shop_kana}--></span>
	                <input type="text" name="shop_kana" value="<!--{$arrForm.shop_kana|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="span5" style="<!--{if $arrErr.shop_kana != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	                <span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>店名(英語表記)</th>
	            <td>
	                <span class="attention"><!--{$arrErr.shop_name_eng}--></span>
	                <input type="text" name="shop_name_eng" value="<!--{$arrForm.shop_name_eng|h}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" class="span5" style="<!--{if $arrErr.shop_name_eng != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	                <span class="warning"> (上限<!--{$smarty.const.MTEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>郵便番号<span class="attention"> *</span></th>
	            <td>
	                <!--{if $arrErr.zip01}--><span class="attention"><!--{$arrErr.zip01}--></span><!--{/if}-->
	                <!--{if $arrErr.zip02}--><span class="attention"><!--{$arrErr.zip02}--></span><!--{/if}-->
	                
	                <span class="vac">〒</span>&nbsp;&nbsp;<input type="text" name="zip01" value="<!--{$arrForm.zip01|h}-->" maxlength="3" class="zip01" style="<!--{if $arrErr.zip01 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" /><span class="vac"> - </span><input type="text" name="zip02" value="<!--{$arrForm.zip02|h}-->" maxlength="4" size="4" class="box6 zip02" style="<!--{if $arrErr.zip02 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	                <a class="btn" href="javascript:;" name="address_input" onclick="fnCallAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', 'zip01', 'zip02', 'pref', 'addr01'); return false;"><i class="icon-search"></i> 所在地入力</a>
	            </td>
	        </tr>
	        <tr>
	            <th>SHOP所在地<span class="attention"> *</span></th>
	            <td>
	                <p>
	                    <span class="attention"><!--{$arrErr.pref}--></span>
	                    <select class="top pref" name="pref" style="<!--{if $arrErr.pref != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" >
	                        <option value="" selected="selected">都道府県を選択</option>
	                        <!--{html_options options=$arrPref selected=$arrForm.pref}-->
	                    </select>
	                </p>
	                <p>
	                    <span class="attention"><!--{$arrErr.addr01}--></span>
	                    <input type="text" name="addr01" value="<!--{$arrForm.addr01|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="span5" style="<!--{if $arrErr.addr01 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" id="addr01" /><span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span><br /><span class="sample"><!--{$smarty.const.SAMPLE_ADDRESS1}--></span>
	                </p>
	                <p>
	                    <span class="attention"><!--{$arrErr.addr02}--></span>
	                    <input type="text" name="addr02" value="<!--{$arrForm.addr02|h}-->"    maxlength="<!--{$smarty.const.STEXT_LEN}-->"class="span5" style="<!--{if $arrErr.addr02 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" id="addr02" /><span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span><br /><span class="sample"><!--{$smarty.const.SAMPLE_ADDRESS2}--></span>
	                </p>
	            </td>
	        </tr>
	        <tr>
	            <th>TEL</th>
	            <td>
	                <span class="attention"><!--{$arrErr.tel01}--></span>
	                <input type="text" name="tel01" value="<!--{$arrForm.tel01|h}-->" maxlength="6" class="input-mini" style="<!--{if $arrErr.tel01 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" /> -
	                <input type="text" name="tel02" value="<!--{$arrForm.tel02|h}-->" maxlength="6" class="input-small" style="<!--{if $arrErr.tel01 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" /> -
	                <input type="text" name="tel03" value="<!--{$arrForm.tel03|h}-->" maxlength="6" class="input-small" style="<!--{if $arrErr.tel01 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	            </td>
	        </tr>
	        <tr>
	            <th>FAX</th>
	            <td>
	                <span class="attention"><!--{$arrErr.fax01}--></span>
	                <input type="text" name="fax01" value="<!--{$arrForm.fax01|h}-->" maxlength="6" class="input-mini" style="<!--{if $arrErr.fax01 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" /> -
	                <input type="text" name="fax02" value="<!--{$arrForm.fax02|h}-->" maxlength="6" class="input-small" style="<!--{if $arrErr.fax02 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" /> -
	                <input type="text" name="fax03" value="<!--{$arrForm.fax03|h}-->" maxlength="6" class="input-small" style="<!--{if $arrErr.fax03 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	            </td>
	        </tr>
	        <tr>
	            <th>店舗営業時間</th>
	            <td>
	                <span class="attention"><!--{$arrErr.business_hour}--></span>
	                <input type="text" name="business_hour" value="<!--{$arrForm.business_hour|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="span5" style="<!--{if $arrErr.business_hour != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	                <span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>商品注文受付メールアドレス<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.email01}--></span>
	                <input type="text" name="email01" value="<!--{$arrForm.email01|h}-->" class="span5" style="<!--{if $arrErr.email01 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" />
	            </td>
	        </tr>
	        <tr>
	            <th>問い合わせ受付メールアドレス<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.email02}--></span>
	                <input type="text" name="email02" value="<!--{$arrForm.email02|h}-->" class="span5" style="<!--{if $arrErr.email02 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->"/>
	            </td>
	        </tr>
	        <tr>
	            <th>メール送信元メールアドレス<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.email03}--></span>
	                <input type="text" name="email03" value="<!--{$arrForm.email03|h}-->" class="span5" style="<!--{if $arrErr.email03 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->"/>
	            </td>
	        </tr>
	        <tr>
	            <th>送信エラー受付メールアドレス<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.email04}--></span>
	                <input type="text" name="email04" value="<!--{$arrForm.email04|h}-->" class="span5" style="<!--{if $arrErr.email04 != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->"/>
	            </td>
	        </tr>
	        <tr>
	            <th>取扱商品</th>
	            <td>
	                <!--{assign var=key value="good_traded"}-->
	                <span class="attention"><!--{$arrErr[$key]}--></span>
	                <textarea name="<!--{$key}-->" rows="10" class="span6" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" ><!--{"\n"}--><!--{$arrForm[$key]|h}--></textarea>
	                <span class="warning"> (上限<!--{$smarty.const.LLTEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>メッセージ</th>
	            <td>
	                <!--{assign var=key value="message"}-->
	                <span class="attention"><!--{$arrErr[$key]}--></span>
	                <textarea name="<!--{$key}-->" rows="10" class="span6" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" ><!--{"\n"}--><!--{$arrForm[$key]|h}--></textarea>
	                <span class="warning"> (上限<!--{$smarty.const.LLTEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	    </table>
	
	    <h2>定休日設定</h2>
	    <table class="table">
	        <tr>
	            <th>定休日</th>
	            <td>
	                <span class="attention"><!--{$arrErr.regular_holiday_ids}--></span>
	                <div class="inline">
	                <!--{html_checkboxes name="regular_holiday_ids" options=$arrRegularHoliday selected=$arrForm.regular_holiday_ids}-->
	                </div>
	            </td>
	        </tr>
	    </table>
	
	    <h2>SHOP機能</h2>
	    <table class="table">
	        <tr>
	            <th>消費税率<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.tax}--></span>
	                <div class="input-append">
	                <input type="text" name="tax" value="<!--{$arrForm.tax|h}-->" maxlength="<!--{$smarty.const.PERCENTAGE_LEN}-->" class="input-mini" style="<!--{if $arrErr.tax != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" /><span class="add-on">％</span>
	                </div>
	            </td>
	        </tr>
	        <tr>
	            <th>課税規則<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.tax_rule}--></span>
	                <div class="inline">
	                <!--{html_radios name="tax_rule" options=$arrTAXRULE selected=$arrForm.tax_rule}-->
	                </div>
	            </td>
	        </tr>
	        <tr>
	            <th>送料無料条件</th>
	            <td>
	            	<span class="attention"><!--{$arrErr.free_rule}--></span>
	            	<div class="input-append">
	                <input type="text" name="free_rule" value="<!--{$arrForm.free_rule|h}-->" maxlength="<!--{$smarty.const.PRICE_LEN}-->" class="input-mini" style="<!--{if $arrErr.free_rule != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" /><span class="add-on">円</span>
	                </div>
	                <span class="vac">&nbsp;&nbsp;以上購入時無料</span>
	            </td>
	        </tr>
	        <tr>
	            <th>ダウンロード可能日数</th>
	            <td>
	                <span class="attention"><!--{$arrErr.downloadable_days}--></span>
	                <input type="text" name="downloadable_days" value="<!--{$arrForm.downloadable_days|h}-->" maxlength="<!--{$smarty.const.DOWNLOAD_DAYS_LEN}-->" size="6" class="box6" style="<!--{if $arrErr.downloadable_days != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}--><!--{/if}-->" /> 日間有効
	                <input type="checkbox" name="downloadable_days_unlimited" value="1" <!--{if $arrForm.downloadable_days_unlimited == "1"}-->checked<!--{/if}--> onclick="fnCheckLimit('downloadable_days', 'downloadable_days_unlimited', '<!--{$smarty.const.DISABLED_RGB}-->');"/>無制限
	            </td>
	        </tr>
	    </table>
	
	    <h2>地図設定</h2>
	    <table class="table">
	        <tr>
	            <th>緯度/経度情報</th>
	            <td>
	            	
	                <span class="attention"><!--{$arrErr.latitude}--></span>
	                <span class="attention"><!--{$arrErr.longitude}--></span>
	                <div class="input-prepend"><span class="add-on">緯度</span>
	                <input type="text" name="latitude" value="<!--{$arrForm.latitude|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="input-medium" style="<!--{if $arrErr.latitude != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" id="latitude" />
	                </div>
	                <div class="input-prepend">
	                <span class="add-on">経度</span><input type="text" name="longitude" value="<!--{$arrForm.longitude|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="input-medium" style="<!--{if $arrErr.longitude != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" id="longitude" />
	                </div>
	                <a class="btn" href="javascript:;" name="codeAddress" id="codeAddress" onclick="">所在地より自動取得</a>
	                <a class="btn" href="#maparea" id="mapAddress"><i class="icon-map-marker"></i> 地図で設定</a>
	            </td>
	        </tr>
	    </table>
	
	    <div class="btn-area">
	        <a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form1', '<!--{$tpl_mode}-->', '', ''); return false;">
	        	<span class="btn-next">この内容で登録する</span>
	        </a>
	    </div>
	</div>
	
	<div style="display: none">
	    <div id="maparea">
	        <div id="maps" style="width: 600px; height: 500px"></div>
	        <div class="btn-area popup-btn-area">
	        <a class="btn btn-primary" href="javascript:;" id="inputPoint">この位置を入力</a>
	        </div>
	    </div>
	</div>

</form>