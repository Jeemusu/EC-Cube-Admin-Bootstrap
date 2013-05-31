<!--{if $graph_type == 'term'}-->
	
	<!--{if $arrForm.type.value == 'wday' || $arrForm.type.value == 'year' || $arrForm.type.value == 'hour' || $arrForm.type.value == 'month'}-->
		<div id="placeholder" style="width:1040px;height:600px"></div>
		<script>
			var data = <!--{$tpl_json}-->;

			
			$.plot("#placeholder", [ data ], {
				series: {
					bars: {
						show: true,
						

						barWidth: 0.7,

						align: "center"
					}
				},
				xaxis: {
					mode: "categories",
					tickLength: 0,
					autoscaleMargin: 0.1
				}
			});
		</script>

	<!--{elseif $arrForm.type.value == 'day' || $type == ''}-->

		<div id="placeholder" style="width:1040px;height:500px"></div>
		<div id="overview" style="width:1040px;height:100px"></div>			
		<script>

			$(function() {
				var d = <!--{$tpl_json}-->;
		
				// first correct the timestamps - they are recorded as the daily
				// midnights in UTC+0100, but Flot always displays dates in UTC
				// so we have to add one hour to hit the midnights in the plot
		
		
				for (var i = 0; i < d.length; ++i) {
					d[i][0] += 540 * 60 * 1000;
				}
		
				function weekendAreas(axes) {
		
					var markings = [],
						d = new Date(axes.xaxis.min);
		
					// go to the first Saturday
		
					d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7))
					d.setUTCSeconds(0);
					d.setUTCMinutes(0);
					d.setUTCHours(0);
		
					var i = d.getTime();
		
					// when we dont set yaxis, the rectangle automatically
					// extends to infinity upwards and downwards
		
					do {
						markings.push({ xaxis: { from: i, to: i + 2 * 24 * 60 * 60 * 1000 } });
						i += 7 * 24 * 60 * 60 * 1000;
					} while (i < axes.xaxis.max);
		
					return markings;
				}
		
				var options = {
					xaxis: {
						mode: "time",
						tickLength: 5
					},
					selection: {
						mode: "x"
					},
					grid: {
						markings: weekendAreas
					}
				};
		
				var plot = $.plot("#placeholder", [d], options);
		
				var overview = $.plot("#overview", [d], {
					series: {
						lines: {
							show: true,
							lineWidth: 1
						},
						shadowSize: 0
					},
					xaxis: {
						ticks: [],
						mode: "date"
					},
					yaxis: {
						ticks: [],
						min: 0,
						autoscaleMargin: 0.1
					},
					selection: {
						mode: "x"
					}
				});
		
				// now connect the two
		
				$("#placeholder").bind("plotselected", function (event, ranges) {
		
					// do the zooming
		
					plot = $.plot("#placeholder", [d], $.extend(true, {}, options, {
						xaxis: {
							min: ranges.xaxis.from,
							max: ranges.xaxis.to
						}
					}));
		
		
					overview.setSelection(ranges, true);
				});
		
				$("#overview").bind("plotselected", function (event, ranges) {
					plot.setSelection(ranges);
				});
		
				// Add the Flot version string to the footer
		
				$("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
			});

	

		</script>
	<!--{/if}-->
<!--{/if}-->
			
<table id="total-term" class="table">
    <tr>
        <th>期間</th>
        <th>購入件数</th>
        <th>男性</th>
        <th>女性</th>
        <th>男性(会員)</th>
        <th>男性<br />(非会員)</th>
        <th>女性(会員)</th>
        <th>女性<br />(非会員)</th>
        <th>購入合計</th>
        <th>購入平均</th>
    </tr>

    <!--{section name=cnt loop=$arrResults}-->
        <!--{* 色分け判定 *}-->
        <!--{if !$smarty.section.cnt.last}-->
            <!--{assign var=type value="`$smarty.section.cnt.index%2`"}-->
            <!--{if $type == 0}-->
                <!--{* 偶数行 *}-->
                <!--{assign var=color value="even"}-->
            <!--{else}-->
                <!--{* 奇数行 *}-->
                <!--{assign var=color value="odd"}-->
            <!--{/if}-->
        <!--{else}-->
            <!--{* 最終行 *}-->
            <!--{assign var=color value="last"}-->
        <!--{/if}-->

        <tr class="<!--{$color}-->">
            <!--{assign var=wday value="`$arrResults[cnt].wday`"}-->

            <!--{if !$smarty.section.cnt.last}-->
                <td class="center"><!--{*期間*}--><!--{$arrResults[cnt].str_date}--></td>
            <!--{else}-->
                <td class="center"><!--{*期間*}-->合計</td>
            <!--{/if}-->

            <td class="right"><!--{*購入件数*}--><!--{$arrResults[cnt].total_order|number_format}-->件</td>
            <td class="right"><!--{*男性*}--><!--{$arrResults[cnt].men|number_format}--></td>
            <td class="right"><!--{*女性*}--><!--{$arrResults[cnt].women|number_format}--></td>
            <td class="right"><!--{*男性(会員)*}--><!--{$arrResults[cnt].men_member|number_format}--></td>
            <td class="right"><!--{*男性(非会員)*}--><!--{$arrResults[cnt].men_nonmember|number_format}--></td>
            <td class="right"><!--{*女性(会員)*}--><!--{$arrResults[cnt].women_member|number_format}--></td>
            <td class="right"><!--{*女性(非会員)*}--><!--{$arrResults[cnt].women_nonmember|number_format}--></td>
            <td class="right"><!--{*購入合計*}--><!--{$arrResults[cnt].total|number_format}-->円</td>
            <td class="right"><!--{*購入平均*}--><!--{$arrResults[cnt].total_average|number_format}-->円</td>
        </tr>
    <!--{/section}-->

</table>
