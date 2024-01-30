<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.manage.timegood" %>
<%@ page import="com.manage.f" %><%--
  Created by IntelliJ IDEA.
  User: Heartsea18
  Date: 2022/7/18
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Chart page</title>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>
<body>
<%
    int i=0;
    Map<String,Integer> map = (HashMap<String,Integer>)request.getAttribute("map");
    List<timegood> timegoods[] = (ArrayList<timegood>[]) request.getAttribute("list");
    List<timegood> timegoodList= (ArrayList<timegood>) request.getAttribute("list2");
    List<timegood> timegoods2[] = (ArrayList<timegood>[]) request.getAttribute("list3");
    int red  = map.get("red");
    int blue = map.get("blue");
    int green = map.get("green");
    int yellow = map.get("yellow");
%>

<div id="main1" style="width: 45%;height:40%;position: absolute;left: 0%;top:   5%;"></div>
<div id="main2" style="width: 45%;height:40%;position: absolute;left: 50%;top:  5%;"></div>
<div id="main3" style="width: 45%;height:40%;position: absolute;left: 0%;top:  50%;"></div>
<div id="main4" style="width: 45%;height:40%;position: absolute;left: 50%;top: 50%;"></div>
<script type="text/javascript" src="js/jquery-3.6.0.min.js">
    $(window).resize(myChart1.resize);
    $(window).resize(myChart2.resize);
    $(window).resize(myChart3.resize);
    $(window).resize(myChart4.resize);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('main1'));
    var myChart2 = echarts.init(document.getElementById('main2'));
    var myChart3 = echarts.init(document.getElementById('main3'));
    var myChart4 = echarts.init(document.getElementById('main4'));
    myChart1.setOption({
        legend: {

        },
        title: {
            text: 'Proportion'
        },
        series : [
            {
                name: 'Proportion of different categories of goods',
                type: 'pie',    // 设置图表类型为饼图
                radius: '60%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                data: [          // 数据数组，name 为数据项名称，value 为数据项值
                    {value:<%=yellow%>, name: 'Yellow Goods'},
                    {value:<%=blue%>, name: 'Blue Goods'},
                    {value:<%=green%>, name: 'Green Goods'},
                    {value:<%=red%>, name: 'Red Goods'}
                ],
                itemStyle: {
                    normal: {
                        label: {
                            show: true,
                            formatter: '{b} : {c} ({d}%)'  //展示的文字   类型+百分比
                        },
                        labelLine: {show: true}
                    }
                }
            }
                ]
        }
    )
    myChart2.setOption({
        tooltip: {
            trigger: 'axis',

        },
        legend: {
            <%
            if(timegoods.length==1){
            %>
            data: 'position<%=request.getParameter("position")%>'
            <%
            }else{
            %>
            data:['postionA','postionB','postionC','postionD','postionE','postionF','postionG',],
            <%
            }
            %>
        },
        xAxis: {
            <%
            if(timegoods.length==1){
            %>
            type: 'category',
            <%
            }else{
            %>
            type:'time',
            <%
            }
            %>
            //interval:0,
            fontSize:1,
            name:'Time',   // x轴名称
            min:'2022-10-<%=request.getParameter("day1")%> <%=request.getParameter("hour1")%>:<%=request.getParameter("min1")%>:00',
            max:'2022-10-<%=request.getParameter("day2")%> <%=request.getParameter("hour2")%>:<%=request.getParameter("min2")%>:00',
            // x轴名称样式--%>
            nameTextStyle:{
                fontWeight: 600,
                fontSize:18,
            }
        },

        yAxis: {
            grid:{
                left: '10%',// 调整这个属性
            },
            type: 'value',
            name: '            Total Good<%
            if(timegoods.length==1){
            %>（position<%=request.getParameter("position")%>）<%}
            %>',
            // y轴名称样式
            nameTextStyle: {
                fontWeight: 600,
                fontSize: 18
            }
        },

        tooltip: {
            "trigger": 'axis'   // axis   item   none三个值
        },
        series: [
            <%
            if(timegoods.length==1){
            %>{
                name: 'position<%=request.getParameter("position")%>',
              data: [/*["2022-10-01 00:00:00",0]*/,<%
                for(timegood t:timegoods[0]){
                    i+=t.getS();
                    if(f.convert(t.getTime())>f.convert("2022-10-"+request.getParameter("day1")+" "+request.getParameter("hour1")+":"+request.getParameter("min1")+":00")&&
                    f.convert(t.getTime())<f.convert("2022-10-"+request.getParameter("day2")+" "+request.getParameter("hour2")+":"+request.getParameter("min2")+":00")){
                    %>["<%=t.getTime()%>",<%=i%>],
                    <%
                }}
                %>
                    ],
type: 'line'
},
<%
}else {
    for(int j = 0;j<7;j++){
        %>
            {
                name:'position<%=f.convert2(j)%>',
                data:[/*["2022-10-01 00:00:00",0]*/,
            <%
        for(timegood t:timegoods[j]){
            i+=t.getS();
            if(f.convert(t.getTime())>f.convert("2022-10-"+request.getParameter("day1")+" "+request.getParameter("hour1")+":"+request.getParameter("min1")+":00")&&
             f.convert(t.getTime())<f.convert("2022-10-"+request.getParameter("day2")+" "+request.getParameter("hour2")+":"+request.getParameter("min2")+":00")){
            %>["<%=t.getTime()%>",<%=i%>],
             <%
                }}
 %>
            ],
                type:"line",
            },
<%
    i=0;
    }
}
%>
]

})
    myChart3.setOption({
        tooltip: {
            trigger: 'axis',

        },
            legend: {
                data:'                      Total number of goods',

            },
            xAxis: {
                type: 'time',
                fontSize:1,
                name:'Time',   // x轴名称
                nameTextStyle:{
                    fontWeight: 600,
                    fontSize:18
                }
            },

            yAxis: {
                type: 'value',
                name: '                     Total number of goods',   // y轴名称
                // y轴名称样式
                nameTextStyle: {
                    fontWeight: 600,
                    fontSize: 18
                }
            },
            series: [
                {name: '        Total number of goods',
                    data: [<%
                    i = 0;
                for(timegood t:timegoodList){
                    i+=t.getS();
                    if(f.convert(t.getTime())>f.convert("2022-10-"+request.getParameter("day1")+" "+request.getParameter("hour1")+":"+request.getParameter("min1")+":00")&&
                    f.convert(t.getTime())<f.convert("2022-10-"+request.getParameter("day2")+" "+request.getParameter("hour2")+":"+request.getParameter("min2")+":00")){
                    %>["<%=t.getTime()%>",<%=i%>],
                        <%
                    }}
                    %>
                    ],
                    type:"line",
                }

    ],


        })
    myChart4.setOption({
            tooltip: {
                trigger: 'axis',

            },
            legend: {
                <%
                if(timegoods2.length==1){
                %>
                data: '<%=request.getParameter("kind")%>'
                <%
                }else{
                %>
                data:['yellow','green','blue','red'],
                <%
                }
                %>
            },
            xAxis: {
                <%
                if(timegoods2.length==1){
                %>
                type: 'category',
                <%
                }else{
                %>
                type:'time',
                <%
                }
                %>
                //interval:0,
                fontSize:1,
                name:'Time',   // x轴名称
                min:'2022-10-<%=request.getParameter("day1")%> <%=request.getParameter("hour1")%>:<%=request.getParameter("min1")%>:00',
                max:'2022-10-<%=request.getParameter("day2")%> <%=request.getParameter("hour2")%>:<%=request.getParameter("min2")%>:00',
                // x轴名称样式--%>
                nameTextStyle:{
                    fontWeight: 600,
                    fontSize:18
                }
            },
            yAxis: {
                type: 'value',
                name: '                 Total number of goods<%
            if(timegoods2.length==1){
            %>（<%=request.getParameter("kind")%>）<%}
            %>',
                // y轴名称样式
                nameTextStyle: {
                    fontWeight: 600,
                    fontSize: 18
                }
            },
            series: [
                    <%
                    if(timegoods2.length==1){
                        i=0;
                    %>{
                    name: '<%=request.getParameter("kind")%>',
                    data: [["2022-10-01 00:00:00",0],<%
                for(timegood t:timegoods2[0]){
                    i+=t.getS();
                    if(f.convert(t.getTime())>f.convert("2022-10-"+request.getParameter("day1")+" "+request.getParameter("hour1")+":"+request.getParameter("min1")+":00")&&
                    f.convert(t.getTime())<f.convert("2022-10-"+request.getParameter("day2")+" "+request.getParameter("hour2")+":"+request.getParameter("min2")+":00")){
                    %>["<%=t.getTime()%>",<%=i%>],
                        <%
                    }}
                    %>
                    ],
                    <%--data: [ ["2021-01-04 08:14:36", 60],["2021-01-05 08:14:46", 56],
                        ["2021-01-06 08:20:46", 23],["2021-01-10 08:22:46", 40],],--%>
                    type: 'line'
                },
                <%
                }else {
                    for(int k = 0;k<4;k++){
                        i =0;
                        %>
                {
                    name:'<%=f.kind(k)%>',
                    data:[["2022-10-01 00:00:00",0],
                            <%
                        for(timegood t:timegoods2[k]){

                            i+=t.getS();
                            if(f.convert(t.getTime())>f.convert("2022-10-"+request.getParameter("day1")+" "+request.getParameter("hour1")+":"+request.getParameter("min1")+":00")&&
                             f.convert(t.getTime())<f.convert("2022-10-"+request.getParameter("day2")+" "+request.getParameter("hour2")+":"+request.getParameter("min2")+":00")){
                            %>["<%=t.getTime()%>",<%=i%>],
                        <%
                           }}
            %>
                    ],
                    type:"line",
                },
                <%

                    }
                }
                %>
            ]

        })
// 指定图表的配置项和数据
/*var option = {
title: {
text: '第一个 ECharts 实例'
},
tooltip: {},
legend: {
data:['销量']
},
xAxis: {
data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
},
yAxis: {},
series: [{
name: '销量',
type: 'bar',
data: [5, 20, 36, 10, 10, 20]
}]
};*/
/*myChart1.setOption(option);*/
// 使用刚指定的配置项和数据显示图表。
</script>

</body>
</html>
