module datapath(
  input  logic        clk_i,
  input  logic        rst_n_i,
  input  logic [31:0] multiplier_i,
  input  logic [31:0] multiplicand_i,
  input  logic        mr_ld_i,
  input  logic        md_ld_i,
  input  logic        rs_load_i,
  input  logic        rs_clear_i,
  input  logic        rs_shr_i,
  output logic [31:0] mr_o,     
  output logic [63:0] product_o
);
logic [31:0] sum;

//============================================================================
// MULTIPLICAND REGISTER
//============================================================================
logic [31:0] multiplicand_reg;
logic [31:0] multiplicand_reg_next;
always_comb begin
  if(md_ld_i)   multiplicand_reg_next = multiplicand_i;
  else          multiplicand_reg_next = multiplicand_reg;
end
always_ff @(posedge clk_i or negedge rst_n_i) begin
  if (~rst_n_i) begin
    multiplicand_reg <= '0;
  end else begin
    multiplicand_reg <= multiplicand_reg_next;
  end
end

//============================================================================
// MULTIPLIER REGISTER
//============================================================================
logic [31:0] multiplier_reg;
logic [31:0] multiplier_reg_next;
always_comb begin
  if(mr_ld_i)   multiplier_reg_next = multiplier_i;
  else          multiplier_reg_next = multiplier_reg;
end
always_ff @(posedge clk_i or negedge rst_n_i) begin
  if (~rst_n_i) begin
    multiplier_reg <= '0;
  end else begin
    multiplier_reg <= multiplier_reg_next;
  end
end

assign mr_o = multiplier_reg;

//============================================================================
// RUNNING SUM REGISTER
//============================================================================
logic [63:0] run_sum_reg;
logic [63:0] run_sum_reg_next;
always_comb begin
  if      (rs_clear_i)  run_sum_reg_next = '0;
  else if (rs_shr_i)    run_sum_reg_next = run_sum_reg >> 1;
  else if (rs_load_i)   run_sum_reg_next = {sum, run_sum_reg[31:0]};
  else                  run_sum_reg_next = run_sum_reg;
end
always_ff @(posedge clk_i or negedge rst_n_i) begin
  if (~rst_n_i) begin
    run_sum_reg <= '0;
  end else begin
    run_sum_reg <= run_sum_reg_next;
  end
end

assign product_o = run_sum_reg;

//============================================================================
// 32-BIT ADDER 
//============================================================================
assign sum = run_sum_reg[63:32] + multiplicand_reg;

endmodule
