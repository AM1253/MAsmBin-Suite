<%-- 
    Document   : index
    Created on : Nov 14, 2014, 7:26:25 PM
    Author     : gon1332
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
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
                <li><a href="#">MIPS Assembly</a></li>
                    <%
                        List<String> bin = (List<String>) request.getAttribute("bin");
                    %>
                    <c:if test="${bin != null}" >
                    <li><a href="#binary">Binary</a></li>
                    </c:if>
            </ul>
        </div>

        <article>
            <h2>Assembler</h2>
            <section class="first">

                <form method="post" action="assemble.do">
                    <textarea id="code" name="asm_code"><%
                        String asm = (String) request.getAttribute("asm");
                        if (asm == null) {
                            asm = "";
                        }
                        out.print(asm);
                        %></textarea>
                    <br />

                    <div style="position: relative; margin: 1em 0;">
                        <button type="submit" class="btn bigbutton left">Convert</button>
                    </div>
                </form>
                <script>
                    var asm_editor = CodeMirror.fromTextArea(document.getElementById("code"), {
                        mode: "application/xml",
                        styleActiveLine: true,
                        lineNumbers: true,
                        lineWrapping: true
                    });
                </script>
            </section>

            <c:if test="${bin != null}">
                <section>
                    <form method="post" action="BinaryHandler">
                        <textarea id="binary" name="binary_code"><%
                            for (String line : bin) {
                                out.print(line + "\n");
                            }
                            %></textarea>

                        <div style="position: relative; margin: 1em 0;">
                            <button type="submit" name="exe" value="BLA" class="btn bigbutton left">Execute</button>
                            <button type="submit" name="gwf" value="gtkwave_filters.do" class="btn bigbutton right stickToRight">GTKWave</button>
                        </div>
                    </form>
                    <script>
                        var bin_editor = CodeMirror.fromTextArea(document.getElementById("binary"), {
                            mode: "application/xml",
                            styleActiveLine: true,
                            lineNumbers: true,
                            lineWrapping: true
                        });
                    </script>
                </section>
            </c:if>
        </article>
    </body>

</html>