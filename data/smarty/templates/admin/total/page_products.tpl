<!--{if $arrForm.page.value == 'products'}-->
<div id="placeholder" style="width:1040px;height:600px"></div>
<script>
	var data = <!--{$tpl_json}-->;
	$.plot('#placeholder', data, {
	    series: {
	        pie: {
	            show: true,
	            radius: 5/6,
	       		label: {
	                show: true,
	                radius: 1,
	                background: {
	                    opacity: 0.7
	                },
	                formatter: function (label, series) {               
    					return '<div style="font-size:8pt;text-align:center;padding:5px;color:white;">' +
   						label + ' : ' +
    					Math.round(series.percent) + '%</div>';
					},
	            }
	        }
	    },
	    legend: {
	        show: false
	    }
	});
</script>			
<!--{/if}-->

<table id="total-products" class="table">
    <tr>
        <th>順位</th>
        <th>商品コード</th>
        <th>商品名</th>
        <th>購入件数</th>
        <th>数量</th>
        <th>単価</th>
        <th>金額</th>
    </tr>

    <!--{section name=cnt loop=$arrResults}-->
        <!--{* 色分け判定 *}-->
        <!--{assign var=type value="`$smarty.section.cnt.index%2`"}-->
        <!--{if $type == 0}-->
            <!--{* 偶数行 *}-->
            <!--{assign var=color value="even"}-->
        <!--{else}-->
            <!--{* 奇数行 *}-->
            <!--{assign var=color value="odd"}-->
        <!--{/if}-->

        <tr class="<!--{$color}-->">
            <td class="center"><!--{*順位*}--><!--{$smarty.section.cnt.iteration}--></td>
            <td class="right"><!--{*商品コード*}--><!--{$arrResults[cnt].product_code|h}--></td>
            <td class="left"><!--{*商品名*}--><!--{$arrResults[cnt].product_name|sfCutString:40:false|h}--></td>
            <td class="right"><!--{*購入件数*}--><!--{$arrResults[cnt].order_count}-->件</td>
            <td class="right"><!--{*数量*}--><!--{$arrResults[cnt].products_count}--></td>
            <td class="right"><!--{*単価*}--><!--{$arrResults[cnt].price|number_format}-->円</td>
            <td class="right"><!--{*金額*}--><!--{$arrResults[cnt].total|number_format}-->円</td>
        </tr>
    <!--{/section}-->

</table>
