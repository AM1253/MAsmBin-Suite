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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gon1332
 */
public class MIPSAssembler {

    private String assembly;
    private List<String> binary;

    public MIPSAssembler()
    {
        this.assembly = "";
        this.binary =null;
    }
    
    public MIPSAssembler(String asm) throws IOException
    {
        this.assembly = asm;
        this.binary = this.asm_to_bin();
    }
    
    public void setAssembly(String asm)
    {
        this.assembly = asm;
    }
    
    public String getAssembly()
    {
        return this.assembly;
    }
    
    public List<String> getBinary()
    {
        return this.binary;
    }
    
    private List<String> asm_to_bin() throws IOException
    {
        String result;
        StringBuilder output = new StringBuilder();
        Process p;
        
        try {
            String[] cmd = { "/bin/sh",
                             "-c",
                             "cd ~/Development/Repositories/MAsmBin\\ Suite/" +
                             "src/java/Assembler/;" +
                             "./masmbin program.masm out.mbin;" };
            p = Runtime.getRuntime().exec(cmd);
            p.waitFor();
            BufferedReader reader = 
                new BufferedReader(new InputStreamReader(p.getInputStream()));
            
            String line = "";			
            while ((line = reader.readLine())!= null) {
                    output.append(line).append("\n");
            }
        } catch (IOException | InterruptedException ex) {
            Logger.getLogger(MIPSAssembler.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(output.toString());
      
        
        //java.nio.file.Path path = Paths.get("/home/gon1332/Development/" + 
        //            "Repositories/MAsmBin\\ Suite/src/java/Assembler/out.mbin");
        String path = "/home/gon1332/Development/Repositories/MAsmBin Suite/src/java/Assembler/";
        String filename = "out.mbin";
        
        List<String> lines;
        lines = Files.readAllLines(Paths.get(path, filename), Charset.defaultCharset());
        
        //result = "ASM converted to BINARY!\n" + this.getAssembly();
        return lines;
    }
}
