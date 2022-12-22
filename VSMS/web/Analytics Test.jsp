<%-- 
    Document   : Analytics Test
    Created on : Jan 27, 2016, 4:45:38 PM
    Author     : vincentt.2013
--%>

<%@page import="Controller.UserController"%>
<%@page import="Model.Vendor"%>
<%@page import="Controller.OrderController"%>
<%@page import="Controller.IngredientController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@ include file="protect.jsp" %>
        <%
            
            Vendor currentVendor = (Vendor) session.getAttribute("currentVendor");
            //in case current vendor does not exist
            if (currentVendor == null) {
                currentVendor = UserController.retrieveVendorByID(1);
            }
            int vendor_id= currentVendor.getVendor_id();
        %>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {packages: ['corechart', 'table']});
//            google.charts.setOnLoadCallback(drawDishOrderChart);
            google.charts.setOnLoadCallback(drawSupplierSalesAmountChart);
            google.charts.setOnLoadCallback(drawDishChart);
            google.charts.setOnLoadCallback(drawOrderChart);
            google.charts.setOnLoadCallback(drawBarChart);
            google.charts.setOnLoadCallback(drawTable);
            google.charts.setOnLoadCallback(drawTimeChart);
//            function drawDishOrderChart() {
//                // Create the data table.
//                var data = new google.visualization.DataTable();
//                data.addColumn('string', 'Dishes');
//                data.addColumn('number', '#of Orders created');
//                data.addRows();
//
//                // Set chart options
//                var options = {'title': 'Orders by Dishes created',
//                    'width': 400,
//                    'height': 300};
//
//                // Instantiate and draw our chart, passing in some options.
//                var chart = new google.visualization.PieChart(document.getElementById('chart_dish_order_pie_div'));
//
//                function selectHandler() {
//                    var selectedItem = chart.getSelection()[0];
//                    if (selectedItem) {
//                        var topping = data.getValue(selectedItem.row, 0);
//                        alert('The user selected ' + topping);
//                    }
//                }
//
//                google.visualization.events.addListener(chart, 'select', selectHandler);
//                chart.draw(data, options);
//            }
            function drawSupplierSalesAmountChart() {
                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Supplier');
                data.addColumn('number', 'Sales Amount');
                data.addRows(<%=OrderController.getSupplierSalesAmountDataTable(vendor_id)%>);

                // Set chart options
                var options = {'title': 'Supplier and Sales Amount created',
                    'width': 400,
                    'height': 300};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_supplier_sales_amount_pie_div'));

                function selectHandler() {
                    var selectedItem = chart.getSelection()[0];
                    if (selectedItem) {
                        var topping = data.getValue(selectedItem.row, 0);
                        alert('The user selected ' + topping);
                    }
                }

                google.visualization.events.addListener(chart, 'select', selectHandler);
                chart.draw(data, options);
            }
            function drawDishChart() {
                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Dishes');
                data.addColumn('number', '#ofIngredients');
                data.addRows(<%=IngredientController.getDishDataTable()%>);

                // Set chart options
                var options = {'title': 'Dishes and Ingredients created',
                    'width': 400,
                    'height': 300};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_dish_pie_div'));

                function selectHandler() {
                    var selectedItem = chart.getSelection()[0];
                    if (selectedItem) {
                        var topping = data.getValue(selectedItem.row, 0);
                        alert('The user selected ' + topping);
                    }
                }

                google.visualization.events.addListener(chart, 'select', selectHandler);
                chart.draw(data, options);
            }
            function drawOrderChart() {
                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Vendor');
                data.addColumn('number', '#ofOrders');
                data.addRows(<%=OrderController.getVendorOrderDataTable()%>);

                // Set chart options
                var options = {'title': 'Vendor and Orders created',
                    'width': 400,
                    'height': 300};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_order_pie_div'));

                function selectHandler() {
                    var selectedItem = chart.getSelection()[0];
                    if (selectedItem) {
                        var topping = data.getValue(selectedItem.row, 0);
                        alert('The user selected ' + topping);
                    }
                }

                google.visualization.events.addListener(chart, 'select', selectHandler);
                chart.draw(data, options);
            }
            function drawBarChart() {

                var data = google.visualization.arrayToDataTable([
                    ['City', '2010 Population', ],
                    ['New York City, NY', 8175000],
                    ['Los Angeles, CA', 3792000],
                    ['Chicago, IL', 2695000],
                    ['Houston, TX', 2099000],
                    ['Philadelphia, PA', 1526000]
                ]);

                var options = {
                    title: 'Population of Largest U.S. Cities',
                    chartArea: {width: '50%'},
                    hAxis: {
                        title: 'Total Population',
                        minValue: 0
                    },
                    vAxis: {
                        title: 'City'
                    }
                };

                var chart = new google.visualization.BarChart(document.getElementById('chart_bar_div'));

                chart.draw(data, options);
            }
            function drawTable() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Vendor');
                data.addColumn('number', 'Total Order Sales');
                data.addRows(<%=OrderController.getVendorSalesDataTable()%>);

                var table = new google.visualization.Table(document.getElementById('table_div'));
                var options = {
                    title: 'Vendor and Sales',
                    chartArea: {width: '50%'}
                };
                table.draw(data, options);
            }
            function drawTimeChart() {

                var data = new google.visualization.DataTable();
                data.addColumn('date', 'Time of Day');
                data.addColumn('number', '#Orders Made');

                data.addRows(<%=OrderController.getDateOrderDataTable()%>);


                var options = {
                    title: 'Orders Made',
                    width: 900,
                    height: 500,
                    hAxis: {
                        format: 'M/d/yy',
                        gridlines: {count: 15}
                    },
                    vAxis: {
                        gridlines: {color: 'none'},
                        minValue: 0
                    }
                };

                var chart = new google.visualization.LineChart(document.getElementById('order_timeline_div'));

                chart.draw(data, options);

                var button = document.getElementById('change');

                button.onclick = function() {

                    // If the format option matches, change it to the new option,
                    // if not, reset it to the original format.
                    options.hAxis.format === 'M/d/yy' ?
                            options.hAxis.format = 'MMM dd, yyyy' :
                            options.hAxis.format = 'M/d/yy';

                    chart.draw(data, options);
                };
            }
        </script>
    </head>
    <body>
        <!-- Identify where the pie chart should be drawn. -->
        <div id="chart_dish_order_pie_div"></div>
        <!-- Identify where the pie chart should be drawn. -->
        <div id="chart_supplier_sales_amount_pie_div"></div> 
        <!-- Identify where the pie chart should be drawn. -->
        <div id="chart_dish_pie_div"></div>
        <!-- Identify where the pie chart should be drawn. -->
        <div id="chart_order_pie_div"></div>
        <!-- Identify where the table should be drawn. -->
        <div id="table_div"></div>
        <!-- Identify where the timeline chart should be drawn. -->
        <div id="order_timeline_div"></div>
        <!-- Identify where the bar chart should be drawn. -->
        <div id="chart_bar_div"></div>

    </body>
</html>