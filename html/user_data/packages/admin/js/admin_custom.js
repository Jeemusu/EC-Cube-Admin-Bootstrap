$(function(){
	$.eccube.init();
});

$(window).load(function () {
	$.eccube.load();
});

$.eccube = {
	init: function() {
		for (module in $.eccube) {
			if ($.eccube[module].init){
				$.eccube[module].init();
			}
		}
	},
	load:function(){
		for (module in $.eccube) {
			if ($.eccube[module].load){
				$.eccube[module].load();
			}
		}
	}
};


$.eccube.returntotop = {
	init: function() {

		var html_element = '<a id="back-to-top" href="#top"><i class="icon-chevron-up"></i></a>';
		
		$('body').append(html_element);
	
		html_element_in_dom = $('#back-to-top');
	    html_element_in_dom.hide();

	    $(window).scroll(function () {
	        if ($(this).scrollTop() > 200) {
	            html_element_in_dom.fadeIn ();
	        } else {
	            html_element_in_dom.fadeOut ();
	        }
	    });

	    html_element_in_dom.click (function (e) {
	    	e.preventDefault ();

	        $('body, html').animate({
	            scrollTop: 0
	        }, 600);
	    });
	
	}
}


/**
*	BASIS FUNCTIONS
*/

$.eccube.basis_master = {
	init: function() {

		var map;
		var marker;
		
		$(function() {
		    var geocoder = new google.maps.Geocoder();
		
		    $("#codeAddress").click(function() {
		        var result = true;
		        var address = $("#addr01").val() + $("#addr02").val();
		        if (geocoder && address) {
		            geocoder.geocode({'address': address}, function (results, status) {
		                if (status == google.maps.GeocoderStatus.OK) {
		                    latlng = results[0].geometry.location;
		                    $("#latitude").val(latlng.lat());
		                    $("#longitude").val(latlng.lng());
		                } else {
		                    alert('所在地の場所が見つかりません');
		                }
		            });
		        } else {
		            alert('所在地の場所が見つかりません');
		        }
		    });
			
			if($('a#mapAddress').length > 0) {
			
		    $("a#mapAddress").fancybox({onStart: function() {
		        var lat = $("#latitude").val();
		        var lng = $("#longitude").val();
		
		        var latlng;
		        if (lat && lng) {
		            latlng = new google.maps.LatLng(lat, lng);
		        } else {
		            var address = $("#addr01").val() + $("#addr02").val();
		            if (geocoder) {
		                geocoder.geocode({'address': address}, function(results, status) {
		                    if (status == google.maps.GeocoderStatus.OK) {
		                        latlng = results[0].geometry.location;
		                    }
		                });
		            }
		        }
		
		        if (!latlng) {
		            // 座標が取得できない場合は北緯35度東経135度から取得
		            latlng = new google.maps.LatLng(34.60758803245114, 135.5767822265625);
		        }
		
		        var mapOptions = {
		            zoom: 10,
		            disableDefaultUI: true,
		            center: latlng,
		            mapTypeId: google.maps.MapTypeId.ROADMAP
		        };
		
		        if (!map)
		        {
		            map = new google.maps.Map($("#maps").get(0), mapOptions);
		        }
		        else
		        {
		            map.panTo(latlng);
		        }
		
		        if (!marker)
		        {
		            marker = new google.maps.Marker({map: map, flat: true, 
		            icon: new google.maps.MarkerImage(
					    "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|FFFF00",
					    null, /* size is determined at runtime */
					    null, /* origin is 0,0 */
					    null, /* anchor is bottom center of the scaled image */
					    new google.maps.Size(25, 40)
					),  
					
					position: latlng});
		            marker.setDraggable(true);
		        }
		        else
		        {
		            marker.setPosition(latlng);
		        }
		
		
		        // TODO Maker のダブルクリックにも対応したい
		        $("#inputPoint").click(function() {
		            latlng = marker.getPosition();
		            $("#latitude").val(latlng.lat());
		            $("#longitude").val(latlng.lng());
		            $.fancybox.close();
		        });
		    }});
		    }
		    
		});


	}
};



/**
*	PRODUCT FUNCTIONS
*/

$.eccube.products_index = {
	init: function() {
		
		$('#lfnDispChange').click( function(e){
			
			e.preventDefault();
			
			var url = $('.disp_url');
			var cat = $('.disp_cat');
			
			url.toggle();
			cat.toggle();
		});
	    
	}
}