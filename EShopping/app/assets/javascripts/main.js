/*price range*/

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	

function myFunction(cartId,product_id,min,max) {
    var value = document.getElementById("quantity-update-"+cartId).value;
    if( value == '' || value > max || value <= 0 )
    {
      alert("Quantity should be between "+min+" and "+max);
    }
    else
    {
      $.ajax({
      url: "/cart_items/"+cartId,
      type: "PUT",
      data: {"product_id" : product_id,"quantity" :value},
      dataType: "script"
      });
    }
}

$(document).ready(function(){
  // $(document).on("change",".cart_quantity_input",function() {
  //   var x= $(this).val();
  //   debugger
  //   if(x<0 || x>10)
  //     {
  //       alert("Product limit exceeded");
  //     }
  //   else
  //     {
  //       alert($(this).val());
  //     }
  // });

	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});
