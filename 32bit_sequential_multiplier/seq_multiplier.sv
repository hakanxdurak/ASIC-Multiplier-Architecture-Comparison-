module seq_multiplier(
    input  logic        clk_i    , 
    input  logic        rst_n_i  , 
    input  logic        start_i  , 
    input  logic [31:0] a_i      , 
    input  logic [31:0] b_i      ,
    output logic [63:0] product_o 
);

logic [31:0] mr;
logic md_ld, mr_ld, rs_load, rs_clear, rs_shr;

controller u_controller(
    .clk_i     (clk_i),
    .rst_n_i   (rst_n_i),
    .start     (start_i),
    .mr_i      (mr),
    .mr_ld_o   (mr_ld),
    .md_ld_o   (md_ld),
    .rs_load_o (rs_load),
    .rs_clear_o(rs_clear),
    .rs_shr_o  (rs_shr)
);

datapath u_datapath(
    .clk_i         (clk_i),
    .rst_n_i       (rst_n_i),
    .multiplier_i  (a_i),
    .multiplicand_i(b_i),
    .mr_ld_i       (mr_ld),
    .md_ld_i       (md_ld),
    .rs_load_i     (rs_load),
    .rs_clear_i    (rs_clear),
    .rs_shr_i      (rs_shr),
    .mr_o          (mr),     
    .product_o     (product_o)
);

endmodule 
