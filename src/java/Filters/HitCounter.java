/*
 * The MIT License
 *
 * Copyright 2015 gon1332.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package Filters;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.*;


/**
 *
 * @author gon1332
 */
public class HitCounter implements Filter{
    
    private int hitCount; 

    @Override
    public void  init(FilterConfig config) 
                      throws ServletException{
        // Reset hit counter.
        hitCount = 0;
    }

    /**
     *
     * @param request
     * @param response
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest request, 
              ServletResponse response,
              FilterChain chain) 
              throws java.io.IOException, ServletException {

        // increase counter by one
        hitCount++;

        // Print the counter.
        System.out.println("Site visits count :" + hitCount);

        // Pass request back down the filter chain
        chain.doFilter(request,response);
    }
    
    
    @Override
    public void destroy() 
    { 
        // This is optional step but if you like you
        // can write hitCount value in your database.
    }

}
