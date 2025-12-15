module array_multiplier #(
    parameter WIDTH = 32
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [(2*WIDTH)-1:0] product
);

    // Partial products
    logic [WIDTH-1:0] pp [WIDTH-1:0];

    // Generate partial products
    genvar i;
    generate
        for (i = 0; i < WIDTH; i++) begin : gen_pp
            assign pp[i] = a & {WIDTH{b[i]}};
        end
    endgenerate

    // Compute product by summing shifted partial products
    always_comb begin
        product = '0; // initialize to zero
        for (int j = 0; j < WIDTH; j++) begin
            product += {{WIDTH{1'b0}}, pp[j]} << j;
        end
    end

endmodule

//HD: module array_multiplier (
//HD:     input  logic [31:0] a,
//HD:     input  logic [31:0] b,
//HD:     output logic [63:0] product
//HD: );
//HD: 
//HD: // Partial products
//HD: logic [31:0] pp0; 
//HD: logic [31:0] pp1; 
//HD: logic [31:0] pp2; 
//HD: logic [31:0] pp3; 
//HD: logic [31:0] pp4; 
//HD: logic [31:0] pp5; 
//HD: logic [31:0] pp6; 
//HD: logic [31:0] pp7; 
//HD: logic [31:0] pp8; 
//HD: logic [31:0] pp9; 
//HD: logic [31:0] pp10; 
//HD: logic [31:0] pp11; 
//HD: logic [31:0] pp12; 
//HD: logic [31:0] pp13; 
//HD: logic [31:0] pp14; 
//HD: logic [31:0] pp15; 
//HD: logic [31:0] pp16; 
//HD: logic [31:0] pp17; 
//HD: logic [31:0] pp18; 
//HD: logic [31:0] pp19; 
//HD: logic [31:0] pp20; 
//HD: logic [31:0] pp21; 
//HD: logic [31:0] pp22; 
//HD: logic [31:0] pp23; 
//HD: logic [31:0] pp24; 
//HD: logic [31:0] pp25; 
//HD: logic [31:0] pp26; 
//HD: logic [31:0] pp27; 
//HD: logic [31:0] pp28; 
//HD: logic [31:0] pp29; 
//HD: logic [31:0] pp30; 
//HD: logic [31:0] pp31; 
//HD: 
//HD: // Generate partial products
//HD: assign pp0  = a & {32{b[0]}};
//HD: assign pp1  = a & {32{b[1]}};
//HD: assign pp2  = a & {32{b[2]}};
//HD: assign pp3  = a & {32{b[3]}};
//HD: assign pp4  = a & {32{b[4]}};
//HD: assign pp5  = a & {32{b[5]}};
//HD: assign pp6  = a & {32{b[6]}};
//HD: assign pp7  = a & {32{b[7]}};
//HD: assign pp8  = a & {32{b[8]}};
//HD: assign pp9  = a & {32{b[9]}};
//HD: assign pp10 = a & {32{b[10]}};
//HD: assign pp11 = a & {32{b[11]}};
//HD: assign pp12 = a & {32{b[12]}};
//HD: assign pp13 = a & {32{b[13]}};
//HD: assign pp14 = a & {32{b[14]}};
//HD: assign pp15 = a & {32{b[15]}};
//HD: assign pp16 = a & {32{b[16]}};
//HD: assign pp17 = a & {32{b[17]}};
//HD: assign pp18 = a & {32{b[18]}};
//HD: assign pp19 = a & {32{b[19]}};
//HD: assign pp20 = a & {32{b[20]}};
//HD: assign pp21 = a & {32{b[21]}};
//HD: assign pp22 = a & {32{b[22]}};
//HD: assign pp23 = a & {32{b[23]}};
//HD: assign pp24 = a & {32{b[24]}};
//HD: assign pp25 = a & {32{b[25]}};
//HD: assign pp26 = a & {32{b[26]}};
//HD: assign pp27 = a & {32{b[27]}};
//HD: assign pp28 = a & {32{b[28]}};
//HD: assign pp29 = a & {32{b[29]}};
//HD: assign pp30 = a & {32{b[30]}};
//HD: assign pp31 = a & {32{b[31]}};
//HD: 
//HD: // 64-bit product from partial products
//HD: assign product =
//HD:     {32'b0, pp0} +
//HD:     {31'b0, pp1, 1'b0} +
//HD:     {30'b0, pp2, 2'b0} +
//HD:     {29'b0, pp3, 3'b0} +
//HD:     {28'b0, pp4, 4'b0} +
//HD:     {27'b0, pp5, 5'b0} +
//HD:     {26'b0, pp6, 6'b0} +
//HD:     {25'b0, pp7, 7'b0} +
//HD:     {24'b0, pp8, 8'b0} +
//HD:     {23'b0, pp9, 9'b0} +
//HD:     {22'b0, pp10, 10'b0} +
//HD:     {21'b0, pp11, 11'b0} +
//HD:     {20'b0, pp12, 12'b0} +
//HD:     {19'b0, pp13, 13'b0} +
//HD:     {18'b0, pp14, 14'b0} +
//HD:     {17'b0, pp15, 15'b0} +
//HD:     {16'b0, pp16, 16'b0} +
//HD:     {15'b0, pp17, 17'b0} +
//HD:     {14'b0, pp18, 18'b0} +
//HD:     {13'b0, pp19, 19'b0} +
//HD:     {12'b0, pp20, 20'b0} +
//HD:     {11'b0, pp21, 21'b0} +
//HD:     {10'b0, pp22, 22'b0} +
//HD:     {9'b0,  pp23, 23'b0} +
//HD:     {8'b0,  pp24, 24'b0} +
//HD:     {7'b0,  pp25, 25'b0} +
//HD:     {6'b0,  pp26, 26'b0} +
//HD:     {5'b0,  pp27, 27'b0} +
//HD:     {4'b0,  pp28, 28'b0} +
//HD:     {3'b0,  pp29, 29'b0} +
//HD:     {2'b0,  pp30, 30'b0} +
//HD:     {1'b0,  pp31, 31'b0};
//HD: 
//HD: endmodule
