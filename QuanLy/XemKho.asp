﻿<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/cnn.asp"-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<META name="viewport" content="width=device-width">
<title>TNTT Shop - The Famous Technology</title>
<link rel="stylesheet" href="../css/csshome.css">
<link rel="shortcut icon" href="../Templates/mobilesmartphoneicon.ico">
<script type="text/javascript" src="../jquery/cursor.js"></script>
</head>

<body onselectstart="return false" oncontextmenu="return false" style="background-image:url(../photo/background.jpg);background-attachment:fixed;">
<div class="div">
  <div style="float:left;">
        <a href="../home.asp" target="_blank">
            <img src="../photo/logo.png" width="120px" height="120px" alt="Cửa hàng SmartPhone" title="Cửa hàng SmartPhone">
        </a>
  </div>
  <div style="padding-top:50px;">
    <form action="../SanPham/TimKiem.asp">
          <input class="boxtimkiem" style="background-color:transparent;" type="search" placeholder="Nhập tên sản phẩm bạn muốn tìm" name="TimKiem">
          <button type="submit" class="nuttimkiem"><img src="../photo/Search.ico" title="Tìm kiếm" width="32px" /></button>
    </form>
  </div>
</div>
<br /><br /><br /><br /><br />
<ul class="XTSX1">
    <li id="XTSX2" class="XTSX2"><a href="PhanHoi.asp">Quản lý</a></li>
    <li id="XTSX2" class="dropdown">
        <a href="#" class="dropbtn">Sản phẩm</a>
        <div class="dropdown-content">
            <a href="XemSP.asp">Thông tin sản phẩm</a>
            <a href="ThemSP.asp">Thêm sản phẩm</a>
        </div>
    </li>
    <li id="XTSX2" class="dropdown">
        <a href="#" class="dropbtn">Nhà sản xuất</a>
        <div class="dropdown-content">
            <a href="XemNSX.asp">Thông tin NSX</a>
            <a href="ThemNSX.asp">Thêm thông tin NSX</a>
        </div>
    </li>
    <li id="XTSX2" class="dropdown">
        <a href="#" class="dropbtn">Kho hàng</a>
        <div class="dropdown-content">
            <a href="XemKho.asp">Kiểm tra kho hàng</a>
            <a href="NhapKho.asp">Nhập kho hàng</a>
        </div>
    </li>
</ul>
<div class="div" style="margin-top: 30px">
        <table border="1" style="width:100%;color:white;">
            <tr>
                <td align="center" width="10%">Mã lô hàng</td>
                <td align="center" width="25%">Tên sản phẩm</td>
                <td align="center" width="15%">Thời gian nhập</td>
                <td align="center" width="5%">Số lượng nhập</td>
                <td align="center" width="15%">Đơn giá</td>
                <td align="center" width="20%">Thời gian cập nhật cuối</td>
                <td align="center" width="5%">Số lượng hiện có</td>
                <td align="center" width="5%">Chức năng</td>
            </tr>
            <%
                cnn=Server.CreateObject("ADODB.Connection");
                cnn.Open(cStr);
                rs=Server.CreateObject("ADODB.Recordset");
                NSX = "SELECT MaLoHang,TenSP,TGNhapKho,SLNhap,FORMAT(GiaNhap, '#,##0') AS GiaNhap,GiaBan, TGCNCuoi,SLHienCo FROM Kho ORDER BY MaLoHang DESC";
                rs.Open(NSX,cnn);
                if(!rs.EOF){
                var index=0;
                rs.MoveFirst();
                while(!rs.EOF){
                    index++;
                    var MaLoHang = rs.Fields.Item("MaLoHang");
                    TenSP = rs.Fields.Item("TenSP");
                    TGNhapKho = rs.Fields.Item("TGNhapKho");
                    SLNhap = rs.Fields.Item("SLNhap");
                    GiaNhap = rs.Fields.Item("GiaNhap");
                    TGCNCuoi = rs.Fields.Item("TGCNCuoi");
                    SLHienCo = rs.Fields.Item("SLHienCo");
            %>
            <form action="SuaKho.asp">
            <tr>
                <td align="center" style="color:red;"><input style="background-color:transparent;border:none;outline:none;color:red;width:10px;font-weight:bold;" name="MaLoHang" value="<%=MaLoHang%>" readonly/></td>
                <td align="center" style="color:red;"><%=TenSP%></td>
                <td align="center" style="color:red;"><%=TGNhapKho%></td>
                <td align="center" style="color:red;"><%=SLNhap%></td>
                <td align="center" style="color:red;"><%=GiaNhap%> VNĐ</td>
                <td align="center" style="color:red;"><%=TGCNCuoi%></td>
                <td align="center" style="color:red;"><%=SLHienCo%></td>
                <td align="center" style="color:red;"><input type="submit" name="submit" value="Cập nhật" /></td>
            </tr>
            </form>
            <%
                    rs.MoveNext();
                }}
            %>
        </table>
</div>
<!--Footer-->
<div class="div" id="footer">
    <center>
    	-------------------------------------------<br>
    	&#169 2016 Copyright by TNTT Shop
    </center>
</div>
<script type="text/javascript" src="../css/ToTop.js"></script>
<div id="top"><a href="#"><img src="../photo/backtotop.png" width="40px" /></a></div>
</body>
</html>
