<%@ page import="example.QuadraticEquation" %>
<%@ page import="example.exceptions.AnyXException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    try {
        String aStr = request.getParameter("a");
        String bStr = request.getParameter("b");
        String cStr = request.getParameter("c");

        //File file = new File();
        if (aStr != null && bStr != null && cStr != null) {
            double a = Double.parseDouble(aStr);
            double b = Double.parseDouble(bStr);
            double c = Double.parseDouble(cStr);
            QuadraticEquation equation = new QuadraticEquation(a, b, c);
%> <%=a%> x<sup>2</sup> + <%=b%> x + <%=c%> = 0<br> <%
    try {
        double[] x = equation.solve();
%> <%="<span class='step'>1: </span>"%>D = <%=b%>^2 - 4 * <%=a%> * <%=c%> =
<% double d = b*b - 4*a*c;
    out.print(d);%>
<br />
<%
    if(d > 0) {
        out.println("<span class='step'>2: </span>x1 = (-b + D^(1/2))/(2 * a) <br />");
        out.println("x2 = (-b - D^(1/2))/(2 * a) <br />");
    } else if(d == 0) {
        out.println("<span class='step'>2: </span>x = (-b + D^(1/2))/(2 * a) <br />");
    }
%>
<p><span class="step">Итог:</span> Решений: <%=x.length%></p>
<p><%
    for (int i = 0; i < x.length; ++i) {
%> x<sub><%=(i + 1)%>
</sub> = <%=x[i]%></p>
<%
    }
} catch (AnyXException e) {
%> <%=e.getMessage()%> <%
        }
    }
} catch (NumberFormatException nfe) {
%>   <%out.print(nfe.getMessage());
    }
%>

