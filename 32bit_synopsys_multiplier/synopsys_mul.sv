module synopsys_mul(
    input  logic        start_i  , 
    input  logic [31:0] a_i      , 
    input  logic [31:0] b_i      ,
    output logic [63:0] product_o 
);

assign product_o = a_i * b_i;

endmodule 
