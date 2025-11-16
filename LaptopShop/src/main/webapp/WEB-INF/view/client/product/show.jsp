<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách sản phẩm - Laptopshop</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet" />
    <style>
      /* Page-specific tweaks to stabilize card layout */
      .fruite-item {
        border: 0 !important;
      }
      .product-card {
        border-color: #dee2e6 !important;
        min-height: 220px;
      }
      .product-card-title {
        font-size: 15px;
        line-height: 1.25;
        min-height: 38px;
        line-clamp: 2;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }
      .product-card-desc {
        color: #555;
        min-height: 42px;
        margin-bottom: 0.5rem;
        line-clamp: 2;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }
      .product-img-fixed {
        height: auto;
        width: 100%;
      }
      .pagination {
        display: flex;
        flex-wrap: wrap;
        gap: 4px;
      }
      .pagination .page-item.active .page-link {
        background-color: #0d6efd;
        border-color: #0d6efd;
        color: #fff;
      }
    </style>
  </head>

  <body>
    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Breadcrumb -->
    <div class="container-fluid page-header py-5">
      <h1 class="text-center text-white display-6">Sản Phẩm</h1>
      <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item active text-white">Danh Sách Sản Phẩm</li>
      </ol>
    </div>

    <!-- Products + Filters -->
    <div class="container-fluid fruite py-5">
      <div class="container py-5">
        <div class="row g-4">
          <!-- Sidebar filters -->
          <div class="col-lg-4 col-xl-3">
            <div class="bg-white p-4 rounded shadow-sm">
              <h5 class="mb-3">Hãng sản xuất</h5>
              <div class="d-flex flex-column gap-2 mb-4">
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    checked
                    id="brandApple"
                  /><label class="form-check-label ms-2" for="brandApple"
                    >Apple</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="brandAsus"
                  /><label class="form-check-label ms-2" for="brandAsus"
                    >Asus</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="brandLenovo"
                  /><label class="form-check-label ms-2" for="brandLenovo"
                    >Lenovo</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="brandDell"
                  /><label class="form-check-label ms-2" for="brandDell"
                    >Dell</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="brandLG"
                  /><label class="form-check-label ms-2" for="brandLG"
                    >LG</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="brandAcer"
                  /><label class="form-check-label ms-2" for="brandAcer"
                    >Acer</label
                  >
                </div>
              </div>

              <h5 class="mb-3">Mục đích sử dụng</h5>
              <div class="d-flex flex-column gap-2 mb-4">
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="useGaming"
                  /><label class="form-check-label ms-2" for="useGaming"
                    >Gaming</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="useOffice"
                  /><label class="form-check-label ms-2" for="useOffice"
                    >Sinh viên - văn phòng</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="useDesign"
                  /><label class="form-check-label ms-2" for="useDesign"
                    >Thiết kế đồ họa</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="useLight"
                  /><label class="form-check-label ms-2" for="useLight"
                    >Mỏng nhẹ</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="useBiz"
                  /><label class="form-check-label ms-2" for="useBiz"
                    >Doanh nhân</label
                  >
                </div>
              </div>

              <h5 class="mb-3">Mức giá</h5>
              <div class="d-flex flex-column gap-2 mb-4">
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    checked
                    id="price1"
                  /><label class="form-check-label ms-2" for="price1"
                    >Dưới 10 triệu</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="price2"
                  /><label class="form-check-label ms-2" for="price2"
                    >Từ 10 - 15 triệu</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="price3"
                  /><label class="form-check-label ms-2" for="price3"
                    >Từ 15 - 20 triệu</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="price4"
                  /><label class="form-check-label ms-2" for="price4"
                    >Trên 20 triệu</label
                  >
                </div>
              </div>

              <h5 class="mb-3">Sắp xếp</h5>
              <div class="d-flex flex-column gap-2 mb-4">
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="sort"
                    id="sortAsc"
                  /><label class="form-check-label ms-2" for="sortAsc"
                    >Giá tăng dần</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="sort"
                    id="sortDesc"
                  /><label class="form-check-label ms-2" for="sortDesc"
                    >Giá giảm dần</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="sort"
                    id="sortNone"
                    checked
                  /><label class="form-check-label ms-2" for="sortNone"
                    >Không sắp xếp</label
                  >
                </div>
              </div>

              <button class="btn btn-success w-100 rounded-pill">
                Lọc sản phẩm
              </button>
            </div>
          </div>

          <!-- Product list -->
          <div class="col-lg-8 col-xl-9">
            <div class="row g-4">
              <c:forEach var="product" items="${products}">
                <c:set var="imgSrc" value="/client/img/fruite-item-1.png" />
                <c:if test="${not empty product.image}">
                  <c:choose>
                    <c:when test="${fn:startsWith(product.image, '/')}">
                      <c:set var="imgSrc" value="${product.image}" />
                    </c:when>
                    <c:otherwise>
                      <c:set
                        var="imgSrc"
                        value="/images/product/${product.image}"
                      />
                    </c:otherwise>
                  </c:choose>
                </c:if>

                <div class="col-md-6 col-lg-4 col-xl-4">
                  <div class="rounded position-relative fruite-item">
                    <div class="fruite-img">
                      <a href="/product/${product.id}">
                        <img
                          src="${imgSrc}"
                          class="img-fluid w-100 rounded-top product-img-fixed"
                          alt="${product.name}"
                        />
                      </a>
                    </div>
                    <div
                      class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                      style="top: 10px; left: 10px"
                    >
                      Laptop
                    </div>
                    <div
                      class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-column product-card"
                    >
                      <h4 class="product-card-title">
                        <a href="/product/${product.id}">${product.name}</a>
                      </h4>
                      <p class="product-card-desc">${product.shortDesc}</p>
                      <div
                        class="d-flex justify-content-between align-items-center mt-auto"
                      >
                        <p class="text-dark fs-5 fw-bold mb-0">
                          <fmt:formatNumber
                            value="${product.price}"
                            type="currency"
                            currencySymbol="₫"
                          />
                        </p>
                        <form
                          method="post"
                          action="/add-product-to-cart/${product.id}"
                        >
                          <input
                            type="hidden"
                            name="${_csrf.parameterName}"
                            value="${_csrf.token}"
                          />
                          <button
                            class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"
                          >
                            <i class="fa fa-shopping-bag me-2 text-primary"></i>
                            Add to cart
                          </button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>

            <!-- Pagination -->
            <c:set
              var="prevPage"
              value="${currentPage > 1 ? currentPage - 1 : 1}"
            />
            <c:set
              var="nextPage"
              value="${currentPage < totalPages ? currentPage + 1 : totalPages}"
            />
            <nav aria-label="Page navigation" class="mt-4">
              <ul class="pagination justify-content-center">
                <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
                  <a
                    class="page-link"
                    href="/products?page=${prevPage}"
                    aria-label="Previous"
                  >
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>

                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                  <li
                    class="page-item ${ (loop.index + 1) eq currentPage ? 'active' : '' }"
                  >
                    <a
                      class="page-link"
                      href="/products?page=${loop.index + 1}"
                    >
                      ${loop.index + 1}
                    </a>
                  </li>
                </c:forEach>

                <li
                  class="page-item ${currentPage eq totalPages ? 'disabled' : ''}"
                >
                  <a
                    class="page-link"
                    href="/products?page=${nextPage}"
                    aria-label="Next"
                  >
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <!-- Back to Top -->
    <a
      href="#"
      class="btn btn-primary border-3 border-primary rounded-circle back-to-top"
      ><i class="fa fa-arrow-up"></i
    ></a>

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>
  </body>
</html>
