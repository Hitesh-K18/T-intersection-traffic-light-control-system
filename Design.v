
/*
                |       |       
                |       |                  Side : 90 degree Turn from side road to M1 road     
       _ _ _ _ _|       |_ _ _ _ _ 
 M2-->             
       _ _ _ _ _ _ _ _ _ _ _ _ _ _ <--M1    M1Turn : 90 degree Turn from M1 road to right side road
       
  Always allowed paths :-
  Person on M1 road is always allowed to go in straight road.(From right to left <---)  
  Person on M2 road is always allowed to turn to side road.(From left to right --->
  Person on Side road is always allowed to turn to M2 road.(From upper side to right |__> )  
        
*/
`timescale 1ns/10ps

module Traffic_Light_Controller(
    input clk,rst,
    output reg [2:0]light_M1,
    output reg [2:0]light_M2,
    output reg [2:0]light_Side,
    output reg [2:0]light_M1Turn
    );
    
    parameter  S1=0, S2=1, S3 =2, S4=3, S5=4,S6=5;
    parameter  T_20=19, T_15=14, T_10=9, T_5=4;
    reg [4:0]count;
    reg[2:0] present,next;
    

    always@(posedge clk or posedge rst)
        begin
         if(rst)
           begin
           present<=S1;
           count<=0;
         end
         else 
           begin
           present<=next;
           end     
       end
     always@(posedge clk)
        if(rst)
         next<=S1;
        else
          case(next)
                S1: if(count<T_20)
                        begin
                        next<=S1;
                        count<=count+1;
                        end
                    else
                        begin
                        next<=S2;
                        count<=0;
                        end
                S2: if(count<T_5)
                        begin
                        next<=S2;
                        count<=count+1;
                        end

                    else
                        begin
                        next<=S3;
                        count<=0;
                        end
                S3: if(count<T_15)
                        begin
                        next<=S3;
                        count<=count+1;
                        end

                    else
                        begin
                        next<=S4;
                        count<=0;
                        end
                S4:if(count<T_5)
                        begin
                        next<=S4;
                        count<=count+1;
                        end

                    else
                        begin
                        next<=S5;
                        count<=0;
                        end
                S5:if(count<T_10)
                        begin
                        next<=S5;
                        count<=count+1;
                        end

                    else
                        begin
                        next<=S6;
                        count<=0;
                        end

                S6:if(count<T_5)
                        begin
                        next<=S6;
                        count<=count+1;
                        end

                    else
                        begin
                        next<=S1;
                        count<=0;
                        end
                default: next<=S1;
                endcase
              

       always@(present)    
            begin
              case(present)
                     S1:
                    begin
                       light_M1<=3'b001;
                       light_M2<=3'b001;
                       light_M1Turn<=3'b100;
                       light_Side<=3'b100;
                    end
                    S2:
                    begin 
                       light_M1<=3'b001;
                       light_M2<=3'b010;
                       light_M1Turn<=3'b010;
                       light_Side<=3'b100;
                    end
                    S3:
                    begin
                       light_M1<=3'b001;
                       light_M2<=3'b100;
                       light_M1Turn<=3'b001;
                       light_Side<=3'b100;
                    end
                    S4:
                    begin
                       light_M1<=3'b010;
                       light_M2<=3'b100;
                       light_M1Turn<=3'b010;
                       light_Side<=3'b010;
                    end
                    S5:
                    begin
                       light_M1<=3'b100;
                       light_M2<=3'b100;
                       light_M1Turn<=3'b100;
                       light_Side<=3'b001;
                    end
                    S6:
                    begin 
                       light_M1<=3'b010;
                       light_M2<=3'b010;
                       light_M1Turn<=3'b100;
                       light_Side<=3'b010;
                    end
                    default:
                    begin 
                       light_M1<=3'b000;
                       light_M2<=3'b000;
                       light_M1Turn<=3'b000;
                       light_Side<=3'b000;
                    end
                    endcase
            end                
endmodule