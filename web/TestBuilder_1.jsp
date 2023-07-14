<%-- 
    Document   : TestBuilder
    Created on : 24 Feb, 2021, 9:54:53 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%! String processors="",pcCases="",motherBoards="",rams="",ssds="",videoCards="",powerSupplies="",cpuCoolers="";%>
       
        <%
            HashMap<String,String> processor=new HashMap<String,String>();
            HashMap<String,String> pcCase = new HashMap<String,String>();
            HashMap<String,String> motherBoard = new HashMap<String,String>();
            HashMap<String,String> ram = new HashMap<String,String>();
            HashMap<String,String> ssd = new HashMap<String,String>();
            HashMap<String,String> videoCard = new HashMap<String,String>();
            HashMap<String,String> powerSupply = new HashMap<String,String>();
            HashMap<String,String> cpuCooler = new HashMap<String,String>();    
            Vector<HashMap<String,String>> products = new Vector<HashMap<String,String>>(); 
            
            processors = request.getParameter("pid1");
            rams = request.getParameter("pid2");
            motherBoards = request.getParameter("pid3");
            pcCases = request.getParameter("pid4");
            cpuCoolers = request.getParameter("pid5");
            ssds = request.getParameter("pid6");
            videoCards = request.getParameter("pid7");
            powerSupplies = request.getParameter("pid8");
//            out.print(processors);
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps1 = c1.prepareStatement("select * from products where Product_ID = ?");
            ps1.setString(1,processors);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                String val = rs1.getString(8);
                String[] str = val.split(",");
                for(int i=0;i<str.length;i++)
                {
//                   out.print(str[i] + ":" + str[i+1]);
                   String[] temp = str[i].split(":");
                   processor.put(temp[0],temp[1]);
                }
//                for (Map.Entry<String,String> entry : processor.entrySet()) 
//                {
//                    out.println(entry.getKey() + ":" + entry.getValue());
//                }
//                processor.put("Socket","AM5");
//                processor.put("Maximum-Supported-Memory","128-GB");
//                String[] pid1type = str[3].split(" ");
//                conclude1 = (pid1type[0]);
            }
            
            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps2 = c2.prepareStatement("select * from products where Product_ID = ?");
//            out.print(rams + "<br>");
            ps2.setString(1,rams);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next())
            {
                String val = rs2.getString(8);
                String[] str = val.split(",");
                for(int i=0;i<str.length;i++)
                {
                    String[] temp = str[i].split(":");
                    ram.put(temp[0],temp[1]);
                }
            }
            
            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps3 = c3.prepareStatement("select * from products where Product_ID = ?");
            ps3.setString(1,motherBoards);
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next())
            {
                String val = rs3.getString(8);
                String[] str = val.split(",");
                for(int i=0;i<str.length;i++)
                {
                   String[] temp = str[i].split(":");
                   motherBoard.put(temp[0],temp[1]);
                }
            }
            
            Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps4 = c4.prepareStatement("select * from products where Product_ID = ?");
            ps4.setString(1,pcCases);
            ResultSet rs4 = ps4.executeQuery();
            while(rs4.next())
            {
                String val = rs4.getString(8);
//                out.print(val);
                String[] str = val.split(",");
//                out.print(str.length);
                for(int i=0;i<str.length;i++)
                {
                   String[] temp = str[i].split(":");
                   pcCase.put(temp[0],temp[1]);
                }
            }
////            
////            
//////                Class.forName("com.mysql.jdbc.Driver");
            Connection c5 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps5 = c5.prepareStatement("select * from products where Product_ID = ?");
            ps5.setString(1,cpuCoolers);
            ResultSet rs5 = ps5.executeQuery();
            while(rs5.next())
            {
                String val = rs5.getString(8);
                String[] str = val.split(",");
//                out.print(str.length);
                for(int i=0;i<str.length;i++)
                {
//                    out.print(str[i]+" ");
                   String[] temp = str[i].split(":");
                   cpuCooler.put(temp[0],temp[1]);
                }
//                String[] pid2type = str[3].split(" ");
//                conclude2 = (pid2type[0]);
            }
            
            Connection c6 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps6 = c6.prepareStatement("select * from products where Product_ID = ?");
            ps6.setString(1,powerSupplies);
            ResultSet rs6 = ps6.executeQuery();
            while(rs6.next())
            {
                String val = rs6.getString(8);
                String[] str = val.split(",");
                for(int i=0;i<str.length;i++)
                {
                   String[] temp = str[i].split(":");
                   powerSupply.put(temp[0],temp[1]);
                }
//                String[] pid2type = str[3].split(" ");
//                conclude2 = (pid2type[0]);
            }

            Connection c7 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps7 = c7.prepareStatement("select * from products where Product_ID = ?");
            ps7.setString(1,videoCards);
            ResultSet rs7 = ps7.executeQuery();
            while(rs7.next())
            {
                String val = rs7.getString(8);
                String[] str = val.split(",");
                for(int i=0;i<str.length;i++)
                {
                   String[] temp = str[i].split(":");
                   videoCard.put(temp[0],temp[1]);
                }
//                String[] pid2type = str[3].split(" ");
//                conclude2 = (pid2type[0]);
            }
            
            
            Connection c8 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps8 = c8.prepareStatement("select * from products where Product_ID = ?");
            ps8.setString(1,ssds);
            ResultSet rs8 = ps8.executeQuery();
            while(rs8.next())
            {
                String val = rs8.getString(8);
                String[] str = val.split(",");
                for(int i=0;i<str.length;i++)
                {
                   String[] temp = str[i].split(":");
                   videoCard.put(temp[0],temp[1]);
                }
//                String[] pid2type = str[3].split(" ");
//                conclude2 = (pid2type[0]);
            }
////                Class.forName("com.mysql.jdbc.Driver");
//            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
//            PreparedStatement ps3 = c3.prepareStatement("select * from test where P_id = ?");
//            ps3.setString(1,request.getParameter("MotherBoard"));
//            ResultSet rs3 = ps3.executeQuery();
//            while(rs3.next())
//            {
//                String val = rs3.getString(8);
//                String[] str = val.split(";");
//                    pid3type = (str[3]);
//                    String[] pid3type = str[3].split(" ");
////                    conclude3 = (pid3type[0]);                
//            }
//            
//            <% }
        
//                 
//            
////            processor.put("Socket","LGA1700");
////            processor.put("Maximum-Supported-Memory","128-GB");
////            
//////          CASE
//////          4 Full Tower
//////          3 Mid Tower
//////          2 mini Tower
//////          1 SFF
////
////            pcCase.put("Type","3");
////            pcCase.put("Maximum-Video-Card-Length","400"); // in mm
////            pcCase.put("Max-CPU-Cooler-height","162");
////            pcCase.put("Max-CPU-PSU-Length","280");
////            
//////          MotherBoard            
//////          4 EATX
//////          3 ATX
//////          2 micro ATX
//////          1 mini ITX
////
////            motherBoard.put("Socket","LGA1700");
////            motherBoard.put("Form-Factor","2");
////            motherBoard.put("Memory-Type" , "DDR4");
////            motherBoard.put("Memory-Slots" , "4");
////            motherBoard.put("Memory-Speed" , "DDR4-2133;DDR4-2400;DDR4-2666;DDR4-2933;DDR4-3000;DDR4-3200;DDR4-3466;DDR4-3600;DDR4-3733;DDR4-3800;DDR4-4000;DDR4-4200;DDR4-4266;DDR4-4600;DDR4-4800");
////            motherBoard.put("PCIex16Slots" , "2");
////            motherBoard.put("M.2Slots" , "2242/2260/2280Mkey;2280Mkey;2230Ekey");
////            motherBoard.put("SATA6.0Gb/s" , "4");
////            
////            ram.put("Speed","DDR4-3200");
////            ram.put("Modules" , "2x8GB");
////            ram.put("totalSize","16"); // in GB
////            ram.put("Max-Memory","128"); // in GB
////            
////            ssd.put("Form-Factor","M.2/2280");
////            
////            videoCard.put("Interface","PCIex16");
////            videoCard.put("Length","247"); // in mm
////            videoCard.put("recommended-psu","450"); //in watt
////            
////            powerSupply.put("Type","ATX");
////            powerSupply.put("Wattage","600"); //in Watt
////            powerSupply.put("Length","140");
//////            powerSupply.put();
////
////            cpuCooler.put("Height" , "157");
////            cpuCooler.put("CPU-Socket","AM4;AM5;LGA1150;LGA1151;LGA1155;LGA1156;LGA1200;LGA1700;LGA2011;LGA2011-3;LGA2066");
////          
//            
//
////            processor.put("Socket","AM4");
////            processor.put("Maximum-Supported-Memory","128-GB");
////            
//////          CASE
//////          4 Full Tower
//////          3 Mid Tower
//////          2 mini Tower
//////          1 SFF
////
////            pcCase.put("Type","3");
////            pcCase.put("Maximum-Video-Card-Length","400"); // in mm
////            pcCase.put("Max-CPU-Cooler-height","162");
////            pcCase.put("Max-CPU-PSU-Length","280");
////            
//////          MotherBoard            
//////          4 EATX
//////          3 ATX
//////          2 micro ATX
//////          1 mini ITX
////
////            motherBoard.put("Socket","AM4");
////            motherBoard.put("Form-Factor","2");
////            motherBoard.put("Memory-Type" , "DDR4");
////            motherBoard.put("Memory-Slots" , "4");
////            motherBoard.put("Memory-Speed" , "DDR4-2133;DDR4-2400;DDR4-2666;DDR4-2933;DDR4-3200;DDR4-3400;DDR4-3466;DDR4-3600;DDR4-3733;DDR4-3866;DDR4-4000;DDR4-4133;DDR4-4266;DDR4-4400;DDR4-4600;DDR4-4733");
////            motherBoard.put("PCIex16Slots" , "1");
////            motherBoard.put("M.2Slots" , "2280M-key;2280M-key");
////            motherBoard.put("SATA6.0Gb/s" , "4");
////            motherBoard.put("Max-Memory","128"); // in GB
////            
////            ram.put("Speed","DDR4-3600");
////            ram.put("Modules" , "2x8GB");
////            ram.put("totalSize","16"); // in GB
////           
////            
////            ssd.put("Form-Factor","M.2/2280");
////            
////            videoCard.put("Interface","PCIex16");
////            videoCard.put("Length","247"); // in mm
////            videoCard.put("recommended-psu","450"); //in watt
////            
////            powerSupply.put("Type","ATX");
////            powerSupply.put("Wattage","600"); //in Watt
////            powerSupply.put("Length","140");
//////            powerSupply.put();
////
////            cpuCooler.put("Height" , "157");
////            cpuCooler.put("CPU-Socket","AM4;AM5;LGA1150;LGA1151;LGA1155;LGA1156;LGA1200;LGA1700;LGA2011;LGA2011-3;LGA2066");
////          
////
////            products.add(processor);
////            products.add(pcCase);
////            products.add(motherBoard);
////            products.add(ram);
////            products.add(ssd);
////            products.add(videoCard);
////            products.add(powerSupply);
////            products.add(cpuCooler);
//
//            
//            
////          CASE
////          4 Full Tower
////          3 Mid Tower
////          2 mini Tower
////          1 SFF
//
//            pcCase.put("Type","3");
//            pcCase.put("Maximum-Video-Card-Length","400"); // in mm
//            pcCase.put("Max-CPU-Cooler-height","162");
//            pcCase.put("Max-CPU-PSU-Length","280");
//            
////          MotherBoard            
////          4 EATX
////          3 ATX
////          2 micro ATX
////          1 mini ITX
//
//            motherBoard.put("Socket","AM4");
//            motherBoard.put("Form-Factor","2");
//            motherBoard.put("Memory-Type" , "DDR4");
//            motherBoard.put("Memory-Slots" , "4");
//            motherBoard.put("Memory-Speed" , "DDR4-2133;DDR4-2400;DDR4-2666;DDR4-2933;DDR4-3200;DDR4-3400;DDR4-3466;DDR4-3600;DDR4-3733;DDR4-3866;DDR4-4000;DDR4-4133;DDR4-4266;DDR4-4400;DDR4-4600;DDR4-4733");
//            motherBoard.put("PCIex16Slots" , "1");
//            motherBoard.put("M.2Slots" , "2280M-key;2280M-key");
//            motherBoard.put("SATA6.0Gb/s" , "4");
//            motherBoard.put("Max-Memory","128"); // in GB
//            
//            ram.put("Speed","DDR4-3600");
//            ram.put("Modules" , "2x8GB");
//            ram.put("totalSize","16"); // in GB
//           
//            
//            ssd.put("Form-Factor","M.2/2280");
//            
//            videoCard.put("Interface","PCIex16");
//            videoCard.put("Length","247"); // in mm
//            videoCard.put("recommended-psu","450"); //in watt
//            
//            powerSupply.put("Type","ATX");
//            powerSupply.put("Wattage","600"); //in Watt
//            powerSupply.put("Length","140");
////            powerSupply.put();
//
//            cpuCooler.put("Height" , "157");
//            cpuCooler.put("CPU-Socket","AM4;AM5;LGA1150;LGA1151;LGA1155;LGA1156;LGA1200;LGA1700;LGA2011;LGA2011-3;LGA2066");
//          
//
            products.add(processor);
            products.add(pcCase);
            products.add(motherBoard);
            products.add(ram);
            products.add(ssd);
            products.add(videoCard);
            products.add(powerSupply);
            products.add(cpuCooler);
//            for (Integer i = 0; i < v.size(); i++)
//        {
//            System.out.print(v.get(i) + " ");
//        }
//          Comparing MotherBoard Form Factor and Processor Type
            int type=0,form_factor=0,videoCardLength=0,maxVideoCardLength=0,MaxCpuCoolerheight=0,CpucoolerHeight=0,maxCpuPsuLength=0,psuLength=0,no_of_strips=0,MotherBoardmemoryslots=0,MaxRamMemorySupported=0,totalRamRequired=0,no_of_PCIex16Slots=0,recommendedPSU=0,wattage=0;
            String cpuSocketType="",motherBoardSocketType="",ramType="",MotherboardMemoryType="",ramSpeed="",MotherBoardSupportedRamSpeed="",videoCardInterface="",motherBoardSocket="",SSDtype="",motherBoardSupportSSDTYPE="";
            for(int i=0;i<products.size();i++)  
            {
                for(Map.Entry m : products.get(i).entrySet())
                {
//                  out.println(m.getKey()+" "+m.getValue());    
//                  out.println("<br>");
//                    Comparing MotherBoard Form Factor and Processor Type
                    if(i==2 && m.getKey().equals("Form-Factor"))
                    {
//                            MotherBoard
                        form_factor = Integer.parseInt(m.getValue().toString());
//                            out.println(m.getKey()+" "+m.getValue());    
//                            out.println("<br>");
                    }
                    if(i==1 && m.getKey().equals("Type"))
                    {
//                            case
                        type = Integer.parseInt(m.getValue().toString());
                            out.println(m.getKey()+" "+m.getValue());    
                            out.println("<br>");
                    }
                    if(i==1 && m.getKey().equals("Max-CPU-PSU-Length"))
                    {
                        
                    }
                    if(m.getKey().equals("Maximum-Video-Card-Length"))
                    {
//                            MotherBoard
                        maxVideoCardLength = Integer.parseInt(m.getValue().toString());
//                            out.println(m.getKey()+" "+m.getValue());    
//                            out.println("<br>");
                    }
                    if(i==5 && m.getKey().equals("Length"))
                    {
//                            case
                        videoCardLength = Integer.parseInt(m.getValue().toString());
//                            out.println(m.getKey()+" "+m.getValue());    
//                            out.println("<br>");
                    }
                    if(m.getKey().equals("Max-CPU-Cooler-height"))
                    {
                        MaxCpuCoolerheight = Integer.parseInt(m.getValue().toString());
                        
                    }
                    if(i==7 && m.getKey().equals("Height"))
                    {
                        CpucoolerHeight = Integer.parseInt(m.getValue().toString());
                    }
                    if(i==6 && m.getKey().equals("Length"))
                    {
                        psuLength = Integer.parseInt(m.getValue().toString());           
                    }
                    if(m.getKey().equals("Max-CPU-PSU-Length"))
                    {
                        maxCpuPsuLength = Integer.parseInt(m.getValue().toString());
                    }
                    
//                  Comparing CPU AND MOTHERBOARD                
                    if(i==0 && m.getKey().equals("Socket"))
                    {
                        cpuSocketType = m.getValue().toString();
                    }
                    if(i==2 && m.getKey().equals("Socket"))
                    {
                        motherBoardSocketType = m.getValue().toString();
                    }
                    if(i==3 && m.getKey().equals("Speed"))
                    {
                        ramType = m.getValue().toString().substring(0,4); 
                    }
                    if(m.getKey().equals("Memory-Type"))
                    {
                        MotherboardMemoryType = m.getValue().toString();
                    }
                    if(i==3 && m.getKey().toString().equals("speed"))
                    {
                        ramSpeed = m.getValue().toString();
                    }
                    if(m.getKey().toString().equals("Memory-Speed"))
                    {
                        MotherBoardSupportedRamSpeed = m.getValue().toString();
                    }
                    if(i==3 && m.getValue().toString().equals("Modules"))
                    {
                        no_of_strips = Integer.parseInt(m.getValue().toString().substring(0,2));
                    }
                    if(m.getKey().toString().equals("Memory-Slots"))
                    {
                        MotherBoardmemoryslots = Integer.parseInt(m.getValue().toString());
                    }
                    if(m.getKey().toString().equals("Max-Memory"))
                    {
                        MaxRamMemorySupported = Integer.parseInt(m.getValue().toString());
                    }
                    if(m.getKey().toString().equals("totalSize"))
                    {
                       totalRamRequired = Integer.parseInt(m.getValue().toString());
                    }
                    if(m.getKey().toString().equals("Interface"))
                    {
//                        out.print(" IN "+m.getValue().toString());
                        videoCardInterface = m.getValue().toString();
                    }
                    if(m.getKey().toString().equals("PCIex16Slots"))
                    {
                        no_of_PCIex16Slots = Integer.parseInt(m.getValue().toString());
                    }
//                    CpucoolerHeight = Integer.parseInt(m.getValue().toString());
                    if(m.getKey().toString().equals("CPU-Socket"))
                    {
                        motherBoardSocket = m.getValue().toString();
                    }
                    if(m.getKey().toString().equals("Form-Factor"))
                    {
                        SSDtype = m.getValue().toString();
                    }
                    if(m.getKey().toString().equals("M.2Slots"))
                    {
                        motherBoardSupportSSDTYPE = m.getValue().toString();
                    }
                    if(m.getKey().toString().equals("recommended-psu"))
                    {
                        recommendedPSU = Integer.parseInt(m.getValue().toString());
                    }
                    if(m.getKey().toString().equals("Wattage"))
                    {
                        wattage = Integer.parseInt(m.getValue().toString());
                    }
//                  motherBoard.put( , "2242/2260/2280Mkey;2280Mkey;2230Ekey");
                }
//                out.println("<br>");
            }
//            out.println(form_factor +" "+ type);
            if(form_factor<=type)
            {
                out.println(" MOTHERBOARD WILL FIT IN CASE ");
            }
            else
            {
                out.println(" MOTHERBOARD WILL Not FIT IN CASE HENCE INCOMPATIBLE ");
            }
            out.println("<br>");
            if(videoCardLength<=maxVideoCardLength)
            {
                out.println(" VIDEO CARD WILL FIT IN CASE ");
            }
            else
            {
                out.println(" VIDEO CARD WILL Not FIT IN CASE HENCE INCOMPATIBLE ");
            }
            out.println("<br>");
//            out.println(CpucoolerHeight +" "+ MaxCpuCoolerheight);

            if(CpucoolerHeight<=MaxCpuCoolerheight)
            {
                out.println(" CPU COOLER WILL FIT IN CASE ");
            }
            else
            {
                out.println(" CPU COOLER WILL Not FIT IN CASE HENCE INCOMPATIBLE ");
            }
            out.println("<br>");
            
            if(psuLength<=maxCpuPsuLength)
            {
                out.println(" POWER SUPPLY WILL FIT IN CASE ");
            }
            else
            {
                out.println(" POWER SUPPLY WILL Not FIT IN CASE HENCE INCOMPATIBLE ");
            }
            out.println("<br>");
            if(cpuSocketType.equals(motherBoardSocketType))
            {
                out.println(" PROCESSOR IS COMPATIBLE WITH MotherBoard ");
            }
            else
            {
                out.println(" PROCESSOR IS NOT COMPATIBLE WITH MotherBoard ");
            }
            out.println("<br>");
            if(ramType.equals(MotherboardMemoryType))
            {
                out.println(" Ram type IS COMPATIBLE WITH MotherBoard type ");
            }
            else
            {
                out.println(" Ram type IS not COMPATIBLE WITH MotherBoard type ");
            }
            out.println("<br>");
            if(MotherBoardSupportedRamSpeed.contains(ramSpeed))
            {
                out.println(" Ram Speed IS COMPATIBLE WITH MotherBoard ");
            }
            else
            {
                out.println(" Ram Speed IS not COMPATIBLE WITH MotherBoard ");
            }
            out.println("<br>");
            if(MotherBoardmemoryslots>=no_of_strips)
            {
                out.println(" Ram strips is enough within available memory Slots ");
            }
            else
            {
                out.println(" Ram strips is not enough within available memory Slots ");
            }
//            out.println(ramType + " " + MotherboardMemoryType);
            out.println("<br>");
            if(MaxRamMemorySupported>=totalRamRequired)
            {
                out.println(" Total Ram pass");
            }
            else
            {
                out.println(" Total Ram fails ");
            }
            out.println("<br>");
//            out.println(" VIDEO CARD" + videoCardInterface + " ");
            if(videoCardInterface.contains("PCIex16") && no_of_PCIex16Slots>=1)
            {
                out.print(" Video Card Slot Compatible with Motherboard Slot");
            }
            else
            {
                out.print(" Video card Slot is incompatible With motherboard Slot");
            }  
            out.println("<br>");
            if(motherBoardSocket.contains(cpuSocketType))
            {
                out.print(" Video Card Socket Compatible with Motherboard ");
            }
            else
            {
                out.print(" Video Card Socket Compatible with Motherboard ");
            }
            out.println("<br>");
            if(motherBoardSocketType.contains(cpuSocketType))
            {
                out.print(" CPU COOLER CAN BE MOUNTED ");
            }
            else
            {
                out.print(" CPU COOLER CAN NOT BE MOUNTED ");
            }
            out.println("<br>");
//            out.print(motherBoardSupportSSDTYPE + " <br>   " + SSDtype);
            if(motherBoardSupportSSDTYPE.contains(SSDtype.substring(4)))
            {
//                out.print(SSDtype.substring(4)+" ");s
                out.print(" SSD CAN BE MOUNTED ON MOTHERBOARD ");
            }
            else
            {
                out.print(" SSD CANNOT BE MOUNTED ON MOTHERBOARD ");
            }
            out.println("<br>");
            if(recommendedPSU<=wattage)
            {
                out.print(" PSU IS COMPATIBLE WITH MOTHERBOARD ");
            }
            else
            {
                out.print(" PSU IS NOT COMPATIBLE WITH MOTHERBOARD ");
            }
            ps1.close();
            ps2.close();        
            ps3.close();        
            ps4.close();
            ps5.close();
            ps6.close();
            ps7.close();
            ps8.close();
            rs1.close();
            rs2.close();        
            rs3.close();        
            rs4.close();
            rs5.close();
            rs6.close();
            rs7.close();
            rs8.close();
            c1.close();
            c2.close();
            c3.close();
            c4.close();
            c5.close();
            c6.close();
            c7.close();
            c8.close();
        %>
    </body>
</html>
