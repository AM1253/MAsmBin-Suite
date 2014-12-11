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
<html>

    <head>
        <title>MAsmBin</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="codemirror-4.7/lib/codemirror.css" />

        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
        </script>
        <![endif]-->

        <!-- Bootstrap form -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />

        <script src="codemirror-4.7/lib/codemirror.js"></script>
        <script src="codemirror-4.7/mode/xml/xml.js"></script>
        <script src="codemirror-4.7/addon/selection/active-line.js"></script>

        <script src="codemirror-4.7/doc/activebookmark.js"></script>

        <style type="text/css">
            <%@ include file="style.css" %>
        </style>
        <style type="text/css">
            .CodeMirror {
                border-top: 1px solid black;
                border-bottom: 1px solid black;
            }
            section
        </style>
        <style type="text/css">
            .stickToRight {
                position: absolute;
                top: 0;
                right: 0;
                text-align: right
            }
        </style>
    </head>

    <body>
        <div id="nav">
            <a href="index.jsp">
                <h1>MAsmBin</h1>
                <img id="logo" alt="masmbin logo" src="logo-small.png" />
            </a>

            <ul>
                <li><a class="active" data-default="true" href="codemirror-4.7/index.html">Home</a></li>
                <li><a href="codemirror-4.7/doc/manual.html">Manual</a></li>
                <li><a href="https://github.com/codemirror/codemirror">Code</a></li>
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