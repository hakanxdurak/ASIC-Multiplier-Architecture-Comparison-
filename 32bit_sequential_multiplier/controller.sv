module controller(
    input  logic        clk_i,
    input  logic        rst_n_i,
    input  logic        start,
    input  logic [31:0] mr_i,
    output logic        mr_ld_o,
    output logic        md_ld_o,
    output logic        rs_load_o,
    output logic        rs_clear_o,
    output logic        rs_shr_o
);
typedef enum logic [6:0] {
    STATE0, STATE1, STATE2, STATE3, STATE4, STATE5, STATE6, STATE7, STATE8,
    STATE9, STATE10, STATE11, STATE12, STATE13, STATE14, STATE15, STATE16, STATE17,
    STATE18, STATE19, STATE20, STATE21, STATE22, STATE23, STATE24, STATE25, STATE26,
    STATE27, STATE28, STATE29, STATE30, STATE31, STATE32, STATE33, STATE34, STATE35,
    STATE36, STATE37, STATE38, STATE39, STATE40, STATE41, STATE42, STATE43, STATE44,
    STATE45, STATE46, STATE47, STATE48, STATE49, STATE50, STATE51, STATE52, STATE53,
    STATE54, STATE55, STATE56, STATE57, STATE58, STATE59, STATE60, STATE61, STATE62,
    STATE63, STATE64, STATE65, STATE66
} controller_fsm_t;

controller_fsm_t controller_fsm, controller_fsm_next;

always_ff @(posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) controller_fsm <= STATE0;
  else          controller_fsm <= controller_fsm_next;
end

// one-cycle control strobes by state decode
assign md_ld_o    = (controller_fsm == STATE1);
assign mr_ld_o    = (controller_fsm == STATE1);
assign rs_clear_o = (controller_fsm == STATE1);

assign rs_load_o =
   (controller_fsm == STATE3 ) || (controller_fsm == STATE5 ) ||
   (controller_fsm == STATE7 ) || (controller_fsm == STATE9 ) ||
   (controller_fsm == STATE11) || (controller_fsm == STATE13) ||
   (controller_fsm == STATE15) || (controller_fsm == STATE17) ||
   (controller_fsm == STATE19) || (controller_fsm == STATE21) ||
   (controller_fsm == STATE23) || (controller_fsm == STATE25) ||
   (controller_fsm == STATE27) || (controller_fsm == STATE29) ||
   (controller_fsm == STATE31) || (controller_fsm == STATE33) ||
   (controller_fsm == STATE35) || (controller_fsm == STATE37) ||
   (controller_fsm == STATE39) || (controller_fsm == STATE41) ||
   (controller_fsm == STATE43) || (controller_fsm == STATE45) ||
   (controller_fsm == STATE47) || (controller_fsm == STATE49) ||
   (controller_fsm == STATE51) || (controller_fsm == STATE53) ||
   (controller_fsm == STATE55) || (controller_fsm == STATE57) ||
   (controller_fsm == STATE59) || (controller_fsm == STATE61) ||
   (controller_fsm == STATE63) || (controller_fsm == STATE65);

assign rs_shr_o =
   (controller_fsm == STATE4 ) || (controller_fsm == STATE6 ) ||
   (controller_fsm == STATE8 ) || (controller_fsm == STATE10) ||
   (controller_fsm == STATE12) || (controller_fsm == STATE14) ||
   (controller_fsm == STATE16) || (controller_fsm == STATE18) ||
   (controller_fsm == STATE20) || (controller_fsm == STATE22) ||
   (controller_fsm == STATE24) || (controller_fsm == STATE26) ||
   (controller_fsm == STATE28) || (controller_fsm == STATE30) ||
   (controller_fsm == STATE32) || (controller_fsm == STATE34) ||
   (controller_fsm == STATE36) || (controller_fsm == STATE38) ||
   (controller_fsm == STATE40) || (controller_fsm == STATE42) ||
   (controller_fsm == STATE44) || (controller_fsm == STATE46) ||
   (controller_fsm == STATE48) || (controller_fsm == STATE50) ||
   (controller_fsm == STATE52) || (controller_fsm == STATE54) ||
   (controller_fsm == STATE56) || (controller_fsm == STATE58) ||
   (controller_fsm == STATE60) || (controller_fsm == STATE62) ||
   (controller_fsm == STATE64) || (controller_fsm == STATE66);

always_comb begin
  controller_fsm_next = controller_fsm;
  unique case (controller_fsm)
    STATE0:  controller_fsm_next = start ? STATE1 : STATE0;
    STATE1:  controller_fsm_next = STATE2;
    STATE2:  controller_fsm_next = mr_i[0]  ? STATE3  : STATE4;
    STATE3:  controller_fsm_next = STATE4;
    STATE4:  controller_fsm_next = mr_i[1]  ? STATE5  : STATE6;
    STATE5:  controller_fsm_next = STATE6;
    STATE6:  controller_fsm_next = mr_i[2]  ? STATE7  : STATE8;
    STATE7:  controller_fsm_next = STATE8;
    STATE8:  controller_fsm_next = mr_i[3]  ? STATE9  : STATE10;
    STATE9:  controller_fsm_next = STATE10;
    STATE10: controller_fsm_next = mr_i[4]  ? STATE11 : STATE12;
    STATE11: controller_fsm_next = STATE12;
    STATE12: controller_fsm_next = mr_i[5]  ? STATE13 : STATE14;
    STATE13: controller_fsm_next = STATE14;
    STATE14: controller_fsm_next = mr_i[6]  ? STATE15 : STATE16;
    STATE15: controller_fsm_next = STATE16;
    STATE16: controller_fsm_next = mr_i[7]  ? STATE17 : STATE18;
    STATE17: controller_fsm_next = STATE18;
    STATE18: controller_fsm_next = mr_i[8]  ? STATE19 : STATE20;
    STATE19: controller_fsm_next = STATE20;
    STATE20: controller_fsm_next = mr_i[9]  ? STATE21 : STATE22;
    STATE21: controller_fsm_next = STATE22;
    STATE22: controller_fsm_next = mr_i[10] ? STATE23 : STATE24;
    STATE23: controller_fsm_next = STATE24;
    STATE24: controller_fsm_next = mr_i[11] ? STATE25 : STATE26;
    STATE25: controller_fsm_next = STATE26;
    STATE26: controller_fsm_next = mr_i[12] ? STATE27 : STATE28;
    STATE27: controller_fsm_next = STATE28;
    STATE28: controller_fsm_next = mr_i[13] ? STATE29 : STATE30;
    STATE29: controller_fsm_next = STATE30;
    STATE30: controller_fsm_next = mr_i[14] ? STATE31 : STATE32;
    STATE31: controller_fsm_next = STATE32;
    STATE32: controller_fsm_next = mr_i[15] ? STATE33 : STATE34;
    STATE33: controller_fsm_next = STATE34;
    STATE34: controller_fsm_next = mr_i[16] ? STATE35 : STATE36;
    STATE35: controller_fsm_next = STATE36;
    STATE36: controller_fsm_next = mr_i[17] ? STATE37 : STATE38;
    STATE37: controller_fsm_next = STATE38;
    STATE38: controller_fsm_next = mr_i[18] ? STATE39 : STATE40;
    STATE39: controller_fsm_next = STATE40;
    STATE40: controller_fsm_next = mr_i[19] ? STATE41 : STATE42;
    STATE41: controller_fsm_next = STATE42;
    STATE42: controller_fsm_next = mr_i[20] ? STATE43 : STATE44;
    STATE43: controller_fsm_next = STATE44;
    STATE44: controller_fsm_next = mr_i[21] ? STATE45 : STATE46;
    STATE45: controller_fsm_next = STATE46;
    STATE46: controller_fsm_next = mr_i[22] ? STATE47 : STATE48;
    STATE47: controller_fsm_next = STATE48;
    STATE48: controller_fsm_next = mr_i[23] ? STATE49 : STATE50;
    STATE49: controller_fsm_next = STATE50;
    STATE50: controller_fsm_next = mr_i[24] ? STATE51 : STATE52;
    STATE51: controller_fsm_next = STATE52;
    STATE52: controller_fsm_next = mr_i[25] ? STATE53 : STATE54;
    STATE53: controller_fsm_next = STATE54;
    STATE54: controller_fsm_next = mr_i[26] ? STATE55 : STATE56;
    STATE55: controller_fsm_next = STATE56;
    STATE56: controller_fsm_next = mr_i[27] ? STATE57 : STATE58;
    STATE57: controller_fsm_next = STATE58;
    STATE58: controller_fsm_next = mr_i[28] ? STATE59 : STATE60;
    STATE59: controller_fsm_next = STATE60;
    STATE60: controller_fsm_next = mr_i[29] ? STATE61 : STATE62;
    STATE61: controller_fsm_next = STATE62;
    STATE62: controller_fsm_next = mr_i[30] ? STATE63 : STATE64;
    STATE63: controller_fsm_next = STATE64;
    STATE64: controller_fsm_next = mr_i[31] ? STATE65 : STATE66;
    STATE65: controller_fsm_next = STATE66;
    STATE66: controller_fsm_next = STATE0;
    default: controller_fsm_next = STATE0;
  endcase
end
endmodule
