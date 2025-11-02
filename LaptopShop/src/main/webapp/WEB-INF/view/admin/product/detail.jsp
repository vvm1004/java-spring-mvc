<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="vvm1004 - Dự án laptopshop" />
    <meta name="author" content="vvm1004" />
    <title>Product Detail</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Product Details</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item">
                <a href="/admin/product">Products</a>
              </li>
              <li class="breadcrumb-item active">Detail</li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>Product ID: ${product.id}</h3>
                  </div>
                  <hr />
                  <div class="card">
                    <div class="card-header">Product Information</div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">
                        <strong>Name:</strong> ${product.name}
                      </li>
                      <li class="list-group-item">
                        <strong>Price:</strong> ${product.price} VND
                      </li>
                      <li class="list-group-item">
                        <strong>Quantity:</strong> ${product.quantity}
                      </li>
                      <li class="list-group-item">
                        <strong>Factory:</strong> ${product.factory}
                      </li>
                      <li class="list-group-item">
                        <strong>Target:</strong> ${product.target}
                      </li>
                      <li class="list-group-item">
                        <strong>Short Description:</strong> ${product.shortDesc}
                      </li>
                      <li class="list-group-item">
                        <strong>Detail Description:</strong>
                        ${product.detailDesc}
                      </li>
                      <li class="list-group-item">
                        <strong>Image:</strong>
                        <c:if test="${not empty product.image}">
                          <br />
                          <img
                            src="/images/product/${product.image}"
                            alt="${product.name}"
                            style="max-width: 300px; margin-top: 10px"
                          />
                        </c:if>
                        <c:if test="${empty product.image}">
                          No image available
                        </c:if>
                      </li>
                    </ul>
                  </div>
                  <div class="mt-3">
                    <a href="/admin/product" class="btn btn-success"
                      >Back to Products</a
                    >
                    <a
                      href="/admin/product/update/${product.id}"
                      class="btn btn-warning"
                      >Update</a
                    >
                    <a
                      href="/admin/product/delete/${product.id}"
                      class="btn btn-danger"
                      >Delete</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
