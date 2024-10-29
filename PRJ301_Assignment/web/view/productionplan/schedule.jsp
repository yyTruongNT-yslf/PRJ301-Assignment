<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import="entity.Plan" %>
<%@page import="entity.Product" %>
<%@page import="entity.SchedualCampaign" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lịch sản xuất</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #dee2e6;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: #ffffff;
        }
        .message {
            padding: 10px;
            margin: 15px 0;
            border-radius: 5px;
            font-weight: bold;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #0056b3;
        }
        input[type="number"] {
            width: 60px;
            padding: 5px;
            font-size: 14px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
    </style>
</head>
<body>

    <!-- Hiển thị thông báo cập nhật -->
    <c:choose>
        <c:when test="${param.updateSuccess == 'true'}">
            <div class="message success">Update Successfully!</div>
        </c:when>
        <c:when test="${param.updateSuccess == 'false'}">
            <div class="message error">Update failed!</div>
        </c:when>
    </c:choose>

    <!-- Form cập nhật lịch sản xuất -->
    <form action="${pageContext.request.contextPath}/productionplan/schedule/update" method="POST">
        <table>
            <!-- Hàng đầu tiên: tên sản phẩm và các ngày -->
            <tr>
                <th>Sản phẩm</th>
                <c:forEach var="date" items="${dateList}">
                    <th colspan="3"><fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/></th>
                </c:forEach>
            </tr>

            <!-- Hàng thứ hai: các ca làm việc -->
            <tr>
                <td></td>
                <c:forEach var="date" items="${dateList}">
                    <th>Ca 1</th>
                    <th>Ca 2</th>
                    <th>Ca 3</th>
                </c:forEach>
            </tr>

            <!-- Dữ liệu sản phẩm và số lượng theo từng ca -->
            <c:forEach var="product" items="${listProduct}">
                <tr>
                    <td>${product.name}</td>
                    <c:forEach var="date" items="${dateList}">
                        <c:forEach var="shift" begin="1" end="3">
                            <td>
                                <c:set var="campaignList" value="${map[product.id]}" />
                                <c:forEach var="sc" items="${campaignList}">
                                    <c:if test="${sc.date.time == date.time && sc.shift == shift}">
                                        <input type="number" name="quantity_${product.id}_${date.time}_${shift}" value="${sc.quantity}" required>
                                        <input type="hidden" name="scId_${product.id}_${date.time}_${shift}" value="${sc.id}">
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        <button type="submit">Lưu thay đổi</button>
    </form>

    <!-- Hiển thị thông báo khác nếu có -->
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

</body>
</html>