<%-- 
    Document   : update
    Created on : Jun 22, 2025, 2:00:49 PM
    Author     : HP - Gia Khiêm
--%>

<%@page import="model.ProductDetail"%>
<%@page import="model.CategoryDetail"%>
<%@page import="model.CategoryDetailGroup"%>
<%@page import="model.Brand"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
    List<CategoryDetailGroup> categoryDetailGroupList = (List<CategoryDetailGroup>) request.getAttribute("categoryGroupList");
    List<CategoryDetail> categoryDetailList = (List<CategoryDetail>) request.getAttribute("categoryDetailList");
    List<ProductDetail> productDetailList = (List<ProductDetail>) request.getAttribute("productDetailList");
    Product product = (Product) request.getAttribute("product");
%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="Css/productDetail1.css">

        <style>
            .img-thumbnail {
                padding: .25rem;
            }
        </style>

    </head>
    <body>
        <div class="container divAllImg">

            <!--            <======================================================= xu ly anh ================================================>-->
            <h3><%= product.getProductName()%></h3>
            <div class = "divAllImg col-md-12">
                <%
                    if (productDetailList != null && product != null) {
                        for (ProductDetail proDetail : productDetailList) {
                %>

                <form method="post" action="AdminUpdateProductDetail?productId=<%= product.getProductId()%>" enctype="multipart/form-data">
                    <div class = "row" style = "gap: 2%">
                        <!-- ✅ Div cha bọc cả ảnh lớn và 4 ảnh nhỏ — có nền trắng -->
                        <div style="width: 38.5%; background-color: #ffffff; border-radius: 15px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); height: 290px;">

                            <!-- Ảnh lớn - KHÔNG CÓ nền trắng -->
                            <div class="text-center divAnhLon" style="width: 100%; border-radius: 15px;">
                                <label for="fileInputMain" style="cursor: pointer; width: 74%;">
                                    <img id="previewMainImage" src="<%= product.getImageUrl()%>"
                                         style="width: 100%;"
                                         alt="Click to change image"
                                         title="Click to change image">
                                </label>
                                <input type="file" name="fileMain" id="fileInputMain" accept="image/*"
                                       style="display: none;" onchange="previewSelectedImage(this, 'previewMainImage')">
                            </div>


                            <!-- 4 ảnh nhỏ -->
                            <div class="d-flex flex-wrap gap-3 row div4AnhNho" style="gap: .5rem !important;  justify-content: center;">

                                <!-- Ảnh nhỏ 1 -->
                                <div class="img-thumbnail text-center" style="border: 1px solid #ccc; border-radius: 10px; max-height: 500px; width: 20%;">
                                    <label for="fileInput1" style="cursor: pointer; width: 100%;">
                                        <img id="previewImage1" src="<%= proDetail.getImageUrl1()%>"
                                             style="width: 100%; object-fit: cover; border-radius: 10px; max-height: 465px"
                                             alt="Click to change image"
                                             title="Click to change image">
                                    </label>
                                    <input type="file" name="file1" id="fileInput1" accept="image/*"
                                           style="display: none;" onchange="previewSelectedImage(this, 'previewImage1')">
                                </div>

                                <!-- Ảnh nhỏ 2 -->
                                <div class=" img-thumbnail text-center"
                                     style="border: 1px solid #ccc; border-radius: 10px; max-height: 500px; width: 20%;">
                                    <label for="fileInput2" style="cursor: pointer;">
                                        <img id="previewImage2" src="<%= proDetail.getImageUrl2()%>"
                                             style="width: 100%; object-fit: cover; border-radius: 10px; max-height: 465px"
                                             alt="Click to change image"
                                             title="Click to change image">
                                    </label>
                                    <input type="file" name="file2" id="fileInput2" accept="image/*"
                                           style="display: none;" onchange="previewSelectedImage(this, 'previewImage2')">
                                </div>

                                <!-- Ảnh nhỏ 3 -->
                                <div class="img-thumbnail text-center"
                                     style="border: 1px solid #ccc; border-radius: 10px; max-height: 500px; width: 20%;">
                                    <label for="fileInput3" style="cursor: pointer;">
                                        <img id="previewImage3" src="<%= proDetail.getImageUrl3()%>"
                                             style="width: 100%; object-fit: cover; border-radius: 10px; max-height: 465px"
                                             alt="Click to change image"
                                             title="Click to change image">
                                    </label>
                                    <input type="file" name="file3" id="fileInput3" accept="image/*"
                                           style="display: none;" onchange="previewSelectedImage(this, 'previewImage3')">
                                </div>

                                <!-- Ảnh nhỏ 4 -->
                                <div class="img-thumbnail text-center"
                                     style="border: 1px solid #ccc; border-radius: 10px; max-height: 500px; width: 20%;">
                                    <label for="fileInput4" style="cursor: pointer;">
                                        <img id="previewImage4" src="<%= proDetail.getImageUrl4()%>"
                                             style="width: 100%; object-fit: cover; border-radius: 10px; max-height: 465px"
                                             alt="Click to change image"
                                             title="Click to change image">
                                    </label>
                                    <input type="file" name="file4" id="fileInput4" accept="image/*"
                                           style="display: none;" onchange="previewSelectedImage(this, 'previewImage4')">
                                </div>
                            </div>
                        </div>

                        <%
                                break;
                            }
                        } else {
                        %>
                        <div class="alert alert-warning">Không có dữ liệu sản phẩm!</div>
                        <% }
                        %>
                        <!--            <======================================================= xu ly anh ================================================>-->


                        <!--            <======================================================= xu ly du lieu ================================================>-->



                        <div class = "" style = "background-color: #FFFFFF; border-radius: 15px; width: 58%;">
                            <div style = "width: 100%; display: flex; ">
                                <h4>
                                    Technical specifications
                                </h4>

                                <div style = "margin-left: auto; display: flex;">
                                    <a href="AdminProduct" class="btn btn-back" style = "text-decoration: none">Back</a>
                                </div>
                            </div>

                            <div style = "width: 100%">
                                <table class="category-table">
                                    <%
                                        if (categoryDetailGroupList != null) {
                                            int groupIndex = 0;
                                            for (CategoryDetailGroup cateGroup : categoryDetailGroupList) {
                                    %>
                                    <!-- Tên nhóm -->
                                    <tr class="group-header" onclick="toggleDetails(<%= groupIndex%>)">
                                        <td colspan="2" class="group-cell">
                                            <div class="group-header-content">
                                                <h2><%= cateGroup.getNameCategoryDetailsGroup()%></h2>
                                                <span class="arrow-icon" id="arrow<%= groupIndex%>">▼</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tbody id="detailGroup<%= groupIndex%>" class="group-details hidden">
                                        <%
                                            if (categoryDetailList != null && !categoryDetailList.isEmpty()) {
                                                for (CategoryDetail cateList : categoryDetailList) {
                                                    if (cateList.getCategoryDetailsGroupID() == cateGroup.getCategoryDetailsGroupID()) {
                                                        boolean hasValue = false;
                                        %>
                                        <tr>
                                            <td class="category-name">
                                                <%= cateList.getCategoryDatailName()%>
                                            </td>
                                            <td class="attribute-values">
                                                <%
                                                    if (productDetailList != null) {
                                                        for (ProductDetail proDetail : productDetailList) {
                                                            if (proDetail.getCategoryDetailID() == cateList.getCategoryDetailID()) {
                                                                hasValue = true;
                                                %>
                                                <input type="text" 
                                                       style="width: auto; max-width: 300px;"
                                                       class="attribute-input" 
                                                       name="attribute_<%= proDetail.getCategoryDetailID()%>" 
                                                       value="<%= proDetail.getAttributeValue()%>">
                                                <%
                                                            }
                                                        }
                                                    }
                                                    if (!hasValue) {
                                                %>
                                                <div class="attribute-item">No data</div>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                                    }
                                                }
                                            }
                                        %>
                                    </tbody>

                                    <%
                                            groupIndex++;
                                        }
                                    } else {
                                    %>
                                    <tr><td colspan="2" class="no-data-message">No data</td></tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
            </div>

            <!--            <======================================================= xu ly du lieu ================================================>-->
            <div style = "text-align: right">
                <a href="AdminProduct" class="btn-back" style = "text-decoration: none">Back</a>
                <button type="submit" class=" btn-edit" >Edit</button>
            </div>

        </form>
    </div>

</div>
</div>
</body>

<script>

    function previewSelectedImage(input, imgId) {
        const preview = document.getElementById(imgId);
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    }


    window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        const success = urlParams.get("success");
        const error = urlParams.get("error");
        if (success === "1") {
            Swal.fire({
                icon: 'success',
                title: 'Update Successful!',
                text: 'The product information has been updated.',
                timer: 2000,
                showConfirmButton: false
            });
        }

        if (error === "1") {
            Swal.fire({
                icon: 'error',
                title: 'Update Failed!',
                text: 'Unable to update the product. Please try again.',
                timer: 2000,
                showConfirmButton: false
            });
        }
    };

    function toggleDetails(index) {
        const detailGroup = document.getElementById("detailGroup" + index);
        const arrowIcon = document.getElementById("arrow" + index);

        if (detailGroup.classList.contains("hidden")) {
            detailGroup.classList.remove("hidden");
            arrowIcon.innerText = "▲"; // hoặc dùng ▾ nếu thích
        } else {
            detailGroup.classList.add("hidden");
            arrowIcon.innerText = "▼";
        }
    }
</script>

<style>
    .form-check-input.rounded-circle {
        border-radius: 50% !important;
        width: 1.2em;
        height: 1.2em;
    }
</style>

<style>
    .btn-edit {
        background-color: #198754;
        color: white;
        border: 1px solid #198754;

        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    .btn-edit:hover {
        background-color: #157347;
        border-color: #146c43;
    }

    .btn-back {
        color: #fff;
        background-color: #6c757d;
        border: 1px solid #6c757d;

        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-back:hover {
        background-color: #5c636a;
        border-color: #565e64;
    }

    .btn-edit, .btn-back {
        padding: 8px 16px;  /* trước là 10px 20px */
        font-size: 14px;
    }

</style>
</html>

