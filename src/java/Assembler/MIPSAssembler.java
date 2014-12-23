/*
 * The MIT License
 *
 * Copyright 2014 gon1332.
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
package Assembler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gon1332
 */
public class MIPSAssembler {

    private List<String> assembly;
    private List<String> binary;

    public MIPSAssembler()
    {
        this.assembly = null;
        this.binary =null;
    }
    
    public MIPSAssembler(String asm) throws IOException
    {
        this.assembly = this.str_to_list(asm);
        this.binary = this.asm_to_bin(this.assembly);
    }
    
    public void setAssembly(String asm)
    {
        this.assembly = this.str_to_list(asm);
    }
    
    public List<String> getAssembly()
    {
        return this.assembly;
    }
    
    public List<String> getBinary()
    {
        return this.binary;
    }
    
    private List<String> str_to_list(String in)
    {
        List<String> out = new ArrayList<>();
        
        String[] temp = in.split("\n");
        out.addAll(Arrays.asList(temp));
        
        return out;
    }
    
    private List<String> asm_to_bin(List<String> asm) throws IOException
    {
        /*=============   Prepare input for the core program   ===============*/
        
        String path = "/home/gon1332/Development/Repositories/MAsmBin Suite/src/java/Assembler/";
        String filename = "in.masm";
        
        Files.write(Paths.get(path, filename), asm, Charset.defaultCharset());

        
        
        /*==================   Execute the core program   ====================*/
        
        StringBuilder output = new StringBuilder();
        Process p;
        
        try {
            String[] cmd = { "/bin/sh",
                             "-c",
                             "cd ~/Development/Repositories/MAsmBin\\ Suite/" +
                             "src/java/Assembler/;" +
                             "./masmbin in.masm out.mbin;" };
            p = Runtime.getRuntime().exec(cmd);
            p.waitFor();
            
            /* [DEBUG] Read the output of the core execution in the terminal */
            BufferedReader reader = 
                new BufferedReader(new InputStreamReader(p.getInputStream()));
            
            String line = "";			
            while ((line = reader.readLine())!= null) {
                    output.append(line).append("\n");
            }
        } catch (IOException | InterruptedException ex) {
            Logger.getLogger(MIPSAssembler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        /* [DEBUG] Print the output of core to the Java terminal   ---------- */
        System.out.println(output.toString());
      
        
        
        /*======================   Extract the output   ======================*/
        
        path = "/home/gon1332/Development/Repositories/MAsmBin Suite/src/java/Assembler/";
        filename = "out.mbin";
        
        /* Transfer the file in memory line by line. */
        List<String> lines;
        lines = Files.readAllLines(Paths.get(path, filename), Charset.defaultCharset());
        
        return lines;
    }
}
