`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2024 12:27:58 PM
// Design Name: 
// Module Name: ALU_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_8bit(
    input [7:0] A,
    input [7:0] B,
    input [3:0] operation,
    output [7:0] result,
    output Cout
    );
    
    reg [7:0] ALU_Result;
    wire [8:0] extended_result;
    assign result = ALU_Result;
    assign extended_result = {1'b0,A}+{1'b0,B};
    assign Cout = extended_result[8];
    
    always@(*)
    begin
    case(operation)
    4'b0000: ALU_Result = A+B;  // addition
    4'b0001: ALU_Result = A-B;  // subtraction
    4'b0010: ALU_Result = A*B;  // product
    4'b0011: ALU_Result = A/B;  //division
    4'b0100: ALU_Result = A&B;  //AND
    4'b0101: ALU_Result = A|B;  // OR
    4'b0110: ALU_Result = A^B;  //XOR
    4'b0111: ALU_Result = ~(A|B);  //NOR
    4'b1000: ALU_Result = ~(A&B);  //NAND
    4'b1001: ALU_Result = ~(A^B);  //XNOR
    default ALU_Result = 8'bxxxx_xxxx;
    
    endcase
    end
    
    
    
endmodule
