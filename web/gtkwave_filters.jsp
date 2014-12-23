<%-- 
    Document   : gtkwave_filters
    Created on : Dec 5, 2014, 5:12:06 PM
    Author     : gon1332
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
 The MIT License

 Copyright 2014 gon1332.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
-->
<html>
    
    <!--head>
    <%@ include file="header.jsp" %>
    </head-->

    <body>
        <div id="nav">
            <a href="index.jsp">
                <h1>MAsmBin</h1>
                <img id="logo" alt="masmbin logo" src="logo-small.png" />
            </a>

            <ul>
                <li><a class="active" data-default="true" href="codemirror-4.7/index.html">Home</a></li>
                <li><a href="codemirror-4.7/doc/manual.html">Manual</a></li>
                <li><a href="https://github.com/AM1253/MAsmBin-Suite">Code</a></li>
            </ul>
            <ul>
                <li><a href="#">GTK Wave Filters</a></li>
                    <%
                        String filter1 = (String) request.getAttribute("filter_1");
                        String filter2 = (String) request.getAttribute("filter_2");
                        String filter3 = (String) request.getAttribute("filter_3");
                    %>
                    <c:set var="f1" value="{filter1}" />
                    <c:set var="f2" value="{filter2}" />
                    <c:set var="f3" value="{filter3}" />
                    <c:if test="${f1 != null}" >
                    <li><a href="#filt_1">Filter 1</a></li>
                    </c:if>
                    <c:if test="${f2 != null}" >
                    <li><a href="#filt_2">Filter 2</a></li>
                    </c:if>
                    <c:if test="${f3 != null}" >
                    <li><a href="#filt_3">Filter 3</a></li>
                    </c:if>
            </ul>
        </div>

        <article>
            <h2>GTK Wave Filters</h2>
            <section class="first">
                <c:if test="${f1 != null}">
                    <div style="position: relative; margin: 1em 0;">
                        <a id="filt_1"><h3>Filter 1</h3></a>
                        <button type="submit" class="btn bigbutton right stickToRight">Download</button>
                    </div>
                    <textarea id="filter1" name="filter1"><%
                        out.print(filter1);
                        %></textarea>
                    <br />
                </c:if>
                <c:if test="${f2 != null}">
                    <div style="position: relative; margin: 1em 0;">
                        <a id="filt_2"><h3>Filter 2</h3></a>
                        <button type="submit" class="btn bigbutton right stickToRight">Download</button>
                    </div>
                    <textarea id="filter2" name="filter2"><%
                        out.print(filter2);
                        %></textarea>
                    <br />
                </c:if>
                <c:if test="${f3 != null}">
                    <div style="position: relative; margin: 1em 0;">
                        <a id="filt_3"><h3>Filter 3</h3></a>
                        <button type="submit" class="btn bigbutton right stickToRight">Download</button>
                    </div>
                    <textarea id="filter3" name="filter3"><%
                            out.print(filter3);
                        %></textarea>
                    <br />
                </c:if>
                <script>
                    var filt_1 = CodeMirror.fromTextArea(document.getElementById("filter1"), {
                        mode: "application/xml",
                        styleActiveLine: true,
                        lineNumbers: true,
                        lineWrapping: true,
                        readOnly: true
                    });
                    var filt_2 = CodeMirror.fromTextArea(document.getElementById("filter2"), {
                        mode: "application/xml",
                        styleActiveLine: true,
                        lineNumbers: true,
                        lineWrapping: true,
                        readOnly: true
                    });
                    var filt_3 = CodeMirror.fromTextArea(document.getElementById("filter3"), {
                        mode: "application/xml",
                        styleActiveLine: true,
                        lineNumbers: true,
                        lineWrapping: true,
                        readOnly: true
                    });
                </script>
            </section>

        </article>
    </body>

</html>
