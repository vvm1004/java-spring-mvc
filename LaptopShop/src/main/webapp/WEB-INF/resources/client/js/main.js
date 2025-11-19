(function ($) {
  "use strict";

  // Spinner
  var spinner = function () {
    setTimeout(function () {
      if ($('#spinner').length > 0) {
        $('#spinner').removeClass('show');
      }
    }, 1);
  };
  spinner(0);


  // Fixed Navbar
  $(window).scroll(function () {
    if ($(window).width() < 992) {
      if ($(this).scrollTop() > 55) {
        $('.fixed-top').addClass('shadow');
      } else {
        $('.fixed-top').removeClass('shadow');
      }
    } else {
      if ($(this).scrollTop() > 55) {
        $('.fixed-top').addClass('shadow').css('top', 0);
      } else {
        $('.fixed-top').removeClass('shadow').css('top', 0);
      }
    }
  });


  // Back to top button
  $(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
      $('.back-to-top').fadeIn('slow');
    } else {
      $('.back-to-top').fadeOut('slow');
    }
  });
  $('.back-to-top').click(function () {
    $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
    return false;
  });


  // Testimonial carousel
  $(".testimonial-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 2000,
    center: false,
    dots: true,
    loop: true,
    margin: 25,
    nav: true,
    navText: [
      '<i class="bi bi-arrow-left"></i>',
      '<i class="bi bi-arrow-right"></i>'
    ],
    responsiveClass: true,
    responsive: {
      0: {
        items: 1
      },
      576: {
        items: 1
      },
      768: {
        items: 1
      },
      992: {
        items: 2
      },
      1200: {
        items: 2
      }
    }
  });


  // vegetable carousel
  $(".vegetable-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1500,
    center: false,
    dots: true,
    loop: true,
    margin: 25,
    nav: true,
    navText: [
      '<i class="bi bi-arrow-left"></i>',
      '<i class="bi bi-arrow-right"></i>'
    ],
    responsiveClass: true,
    responsive: {
      0: {
        items: 1
      },
      576: {
        items: 1
      },
      768: {
        items: 2
      },
      992: {
        items: 3
      },
      1200: {
        items: 4
      }
    }
  });


  // Modal Video
  $(document).ready(function () {
    var $videoSrc;
    $('.btn-play').click(function () {
      $videoSrc = $(this).data("src");
    });
    console.log($videoSrc);

    $('#videoModal').on('shown.bs.modal', function (e) {
      $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
    })

    $('#videoModal').on('hide.bs.modal', function (e) {
      $("#video").attr('src', $videoSrc);
    })
  });

  //add active class to current nav link
  const navElements = $("#navbarCollapse");
  const currentPath = window.location.pathname;

  // Correct selector: anchors with class nav-link (not descendant of <a>)
  // Mark active for exact match or prefix match (e.g. /products?page=2 still highlights /products)
  navElements.find("a.nav-link").each(function () {
    const link = $(this);
    const href = (link.attr("href") || "").trim();
    const isActive = href && (
      href === "/" ? currentPath === "/" : currentPath.startsWith(href)
    );
    link.toggleClass("active", isActive);
  });


  // Product Quantity
  $('.quantity button').on('click', function () {
    let change = 0;

    var button = $(this);
    var oldValue = button.parent().parent().find('input').val();
    if (button.hasClass('btn-plus')) {
      var newVal = parseFloat(oldValue) + 1;
      change = 1
    } else {
      if (oldValue > 1) {
        var newVal = parseFloat(oldValue) - 1;
        change = -1;
      } else {
        newVal = 1;
        //alert("Min");
      }
    }
    const input = button.parent().parent().find('input');
    input.val(newVal);
    
    //set form index
    const index = input.attr("data-cart-detail-index");
    const element = document.getElementById(`cartDetails${index}.quantity`);
    $(element).val(newVal);

    //get price
    const price = input.attr("data-cart-detail-price");
    const id = input.attr("data-cart-detail-id");
    
    const priceElement = $(`p[data-cart-detail-id='${id}']`);
    if (priceElement) {
      const newPrice = +price * newVal;
      priceElement.text(formatCurrency(newPrice.toFixed(2)) + " đ");
    }

    //update total cart price
    const totalPriceElement = $(`p[data-cart-total-price]`);

    if (totalPriceElement && totalPriceElement.length) {
      const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
      let newTotal = +currentTotal;
      if (change === 0) {
        newTotal = +currentTotal;
      } else {
        newTotal = change * (+price) + (+currentTotal);
      }

      //reset change
      change = 0;

      //update
      totalPriceElement?.each(function (index, element) {
        //update text
        $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + " đ");

        //update data-attribute
        $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
      });
    }
  });

    function formatCurrency(value) {
        // Use the 'vi-VN' locale to format the number according to Vietnamese currency format
        // and 'VND' as the currency type for Vietnamese đồng
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0, // No decimal part for whole numbers
        });

        let formatted = formatter.format(value);
        // Replace dots with commas for thousands separator
        formatted = formatted.replace(/\./g, '.');
        return formatted;
    }

    // Product filter functionality
    $('#filterBtn').on('click', function(e) {
        e.preventDefault();
        
        const currentUrl = new URL(window.location.href);
        const params = new URLSearchParams();
        
        // Get selected factories
        const factories = [];
        $('input[type="checkbox"][id^="brand"]:checked').each(function() {
            const brand = $(this).attr('id').replace('brand', '').toUpperCase();
            factories.push(brand);
        });
        if (factories.length > 0) {
            params.set('factory', factories.join(','));
        }
        
        // Get selected targets
        const targets = [];
        $('input[type="checkbox"][id^="use"]:checked').each(function() {
            const useId = $(this).attr('id');
            let target = '';
            if (useId === 'useGaming') target = 'GAMING';
            else if (useId === 'useOffice') target = 'SINH-VIEN-VAN-PHONG';
            else if (useId === 'useDesign') target = 'THIET-KE-DO-HOA';
            else if (useId === 'useLight') target = 'MONG-NHE';
            else if (useId === 'useBiz') target = 'DOANH-NHAN';
            if (target) targets.push(target);
        });
        if (targets.length > 0) {
            params.set('target', targets.join(','));
        }
        
        // Get selected price ranges
        const prices = [];
        if ($('#price1').is(':checked')) prices.push('duoi-10-trieu');
        if ($('#price2').is(':checked')) prices.push('10-toi-15-trieu');
        if ($('#price3').is(':checked')) prices.push('15-toi-20-trieu');
        if ($('#price4').is(':checked')) prices.push('tren-20-trieu');
        if (prices.length > 0) {
            params.set('price', prices.join(','));
        }
        
        // Get sort option
        if ($('#sortAsc').is(':checked')) {
            params.set('sort', 'gia-tang-dan');
        } else if ($('#sortDesc').is(':checked')) {
            params.set('sort', 'gia-giam-dan');
        }
        
        // Reset to page 1
        params.set('page', '1');
        
        // Redirect with new filters
        window.location.href = '/products?' + params.toString();
    });

    // AJAX Add to cart
    $('form[action^="/add-product-to-cart/"]').on('submit', function(e) {
        e.preventDefault();
        
        const form = $(this);
        const actionUrl = form.attr('action');
        const productId = actionUrl.split('/').pop();
        const csrfToken = form.find('input[name="_csrf"]').val();
        const addButton = form.find('button[type="submit"]');
        
        // Disable button to prevent double-click
        addButton.prop('disabled', true);
        
        $.ajax({
            url: '/api/add-product-to-cart/' + productId,
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': csrfToken
            },
            success: function(response) {
                if (response.success) {
                    // Update cart count
                    $('#cartCount').text(response.cartSum);
                    
                    // Show success toast
                    showToast('success', response.message);
                } else {
                    showToast('error', response.message);
                }
            },
            error: function() {
                showToast('error', 'Có lỗi xảy ra, vui lòng thử lại');
            },
            complete: function() {
                // Re-enable button
                addButton.prop('disabled', false);
            }
        });
    });
    
    // Toast notification function
    function showToast(type, message) {
        const toastHtml = `
            <div class="toast align-items-center text-white bg-${type === 'success' ? 'success' : 'danger'} border-0 position-fixed end-0 m-3" 
                 role="alert" aria-live="assertive" aria-atomic="true" style="z-index: 9999; top: 80px;">
                <div class="d-flex">
                    <div class="toast-body">
                        <i class="fas fa-${type === 'success' ? 'check-circle' : 'exclamation-circle'} me-2"></i>
                        ${message}
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                </div>
            </div>
        `;
        
        const toast = $(toastHtml);
        $('body').append(toast);
        
        const bsToast = new bootstrap.Toast(toast[0], {
            delay: 3000
        });
        bsToast.show();
        
        // Remove toast from DOM after it's hidden
        toast.on('hidden.bs.toast', function() {
            toast.remove();
        });
    }



})(jQuery);

