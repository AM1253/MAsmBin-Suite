<%-- 
    Document   : header
    Created on : Dec 23, 2014, 2:03:17 PM
    Author     : gon1332
--%>

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
<head>
        <title>MAsmBin</title>
        <link rel="shortcut icon" href="static/favicon.ico" type="image/x-icon">
        <link rel="icon" href="static/favicon.ico" type="image/x-icon">
        
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