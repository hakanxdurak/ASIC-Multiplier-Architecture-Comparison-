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
// ============================================================================
//  FSM states
// ============================================================================
typedef enum logic [6:0] {  
    STATE0,
    STATE1,
    STATE2,
    STATE3,
    STATE4,
    STATE5,
    STATE6,
    STATE7,
    STATE8,
    STATE9,
    STATE10,
    STATE11,
    STATE12,
    STATE13,
    STATE14,
    STATE15,
    STATE16,
    STATE17,
    STATE18,
    STATE19,
    STATE20,
    STATE21,
    STATE22,
    STATE23,
    STATE24,
    STATE25,
    STATE26,
    STATE27,
    STATE28,
    STATE29,
    STATE30,
    STATE31,
    STATE32,
    STATE33,
    STATE34,
    STATE35,
    STATE36,
    STATE37,
    STATE38,
    STATE39,
    STATE40,
    STATE41,
    STATE42,
    STATE43,
    STATE44,
    STATE45,
    STATE46,
    STATE47,
    STATE48,
    STATE49,
    STATE50,
    STATE51,
    STATE52,
    STATE53,
    STATE54,
    STATE55,
    STATE56,
    STATE57,
    STATE58,
    STATE59,
    STATE60,
    STATE61,
    STATE62,
    STATE63,
    STATE64,
    STATE65,
    STATE66
} controller_fsm_t;


// FSM state variables
controller_fsm_t controller_fsm, controller_fsm_next;

// FSM state logic
always_ff @(posedge clk_i or negedge rst_n_i) begin
   if (!rst_n_i) begin : controller_fsm_seq
      controller_fsm <= STATE0;
   end else begin
      controller_fsm <= controller_fsm_next;
   end
end

// ============================================================================
// Next State decoding combo logic
// ============================================================================
// Assign statements for the output signals with default values
assign md_ld_o =    (controller_fsm == STATE1) ? 1'b1 : 1'b0; 
assign mr_ld_o =    (controller_fsm == STATE1) ? 1'b1 : 1'b0; 
assign rs_clear_o = (controller_fsm == STATE1) ? 1'b1 : 1'b0; 

// RS_LOAD
assign rs_load_o = (controller_fsm == STATE3)  || (controller_fsm == STATE5)  ||
                   (controller_fsm == STATE7)  || (controller_fsm == STATE9)  ||
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
                   (controller_fsm == STATE63) || (controller_fsm == STATE65) ? 1'b1 : 1'b0;

// RS_SHR
assign rs_shr_o = (controller_fsm == STATE4)  || (controller_fsm == STATE6)  ||
                  (controller_fsm == STATE8)  || (controller_fsm == STATE10) ||
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
                  (controller_fsm == STATE64) || (controller_fsm == STATE66) ? 1'b1 : 1'b0;

always_comb begin : fsm
   case (controller_fsm)
       STATE0 : begin
         if      (start)                controller_fsm_next = STATE1;
         else                           controller_fsm_next = STATE0;
       end
       
       STATE1 : begin
                                         controller_fsm_next = STATE2; 
       end
       
       STATE2 : begin // check mr_i[0]
         if      (mr_i[0])              controller_fsm_next = STATE3;  
         else                           controller_fsm_next = STATE4;  
       end
       
       STATE3 : begin // add for bit 0
                                         controller_fsm_next = STATE4;
       end
       
       STATE4 : begin // check mr_i[1]
         if      (mr_i[1])              controller_fsm_next = STATE5;
         else                           controller_fsm_next = STATE6;
       end
       
       STATE5 : begin // add for bit 1
                                         controller_fsm_next = STATE6;
       end
       
       STATE6 : begin // check mr_i[2]
         if      (mr_i[2])              controller_fsm_next = STATE7;
         else                           controller_fsm_next = STATE8;
       end
       
       STATE7 : begin // add for bit 2
                                         controller_fsm_next = STATE8;
       end
       
       STATE8  : begin // check mr_i[3]
         if      (mr_i[3])              controller_fsm_next = STATE9;
         else                           controller_fsm_next = STATE10;
       end
       STATE9  : begin // add for bit 3
                                         controller_fsm_next = STATE10;
       end
       
       STATE10 : begin // check mr_i[4]
         if      (mr_i[4])              controller_fsm_next = STATE11;
         else                           controller_fsm_next = STATE12;
       end
       STATE11 : begin // add for bit 4
                                         controller_fsm_next = STATE12;
       end
       
       STATE12 : begin // check mr_i[5]
         if      (mr_i[5])              controller_fsm_next = STATE13;
         else                           controller_fsm_next = STATE14;
       end
       STATE13 : begin // add for bit 5
                                         controller_fsm_next = STATE14;
       end
       
       STATE14 : begin // check mr_i[6]
         if      (mr_i[6])              controller_fsm_next = STATE15;
         else                           controller_fsm_next = STATE16;
       end
       STATE15 : begin // add for bit 6
                                         controller_fsm_next = STATE16;
       end
       
       STATE16 : begin // check mr_i[7]
         if      (mr_i[7])              controller_fsm_next = STATE17;
         else                           controller_fsm_next = STATE18;
       end
       STATE17 : begin // add for bit 7
                                         controller_fsm_next = STATE18;
       end
       
       STATE18 : begin // check mr_i[8]
         if      (mr_i[8])              controller_fsm_next = STATE19;
         else                           controller_fsm_next = STATE20;
       end
       STATE19 : begin // add for bit 8
                                         controller_fsm_next = STATE20;
       end
       
       STATE20 : begin // check mr_i[9]
         if      (mr_i[9])              controller_fsm_next = STATE21;
         else                           controller_fsm_next = STATE22;
       end
       STATE21 : begin // add for bit 9
                                         controller_fsm_next = STATE22;
       end
       
       STATE22 : begin // check mr_i[10]
         if      (mr_i[10])             controller_fsm_next = STATE23;
         else                           controller_fsm_next = STATE24;
       end
       STATE23 : begin // add for bit 10
                                         controller_fsm_next = STATE24;
       end
       
       STATE24 : begin // check mr_i[11]
         if      (mr_i[11])             controller_fsm_next = STATE25;
         else                           controller_fsm_next = STATE26;
       end
       STATE25 : begin // add for bit 11
                                         controller_fsm_next = STATE26;
       end
       
       STATE26 : begin // check mr_i[12]
         if      (mr_i[12])             controller_fsm_next = STATE27;
         else                           controller_fsm_next = STATE28;
       end
       STATE27 : begin // add for bit 12
                                         controller_fsm_next = STATE28;
       end
       
       STATE28 : begin // check mr_i[13]
         if      (mr_i[13])             controller_fsm_next = STATE29;
         else                           controller_fsm_next = STATE30;
       end
       STATE29 : begin // add for bit 13
                                         controller_fsm_next = STATE30;
       end
       
       STATE30 : begin // check mr_i[14]
         if      (mr_i[14])             controller_fsm_next = STATE31;
         else                           controller_fsm_next = STATE32;
       end
       STATE31 : begin // add for bit 14
                                         controller_fsm_next = STATE32;
       end
       
       STATE32 : begin // check mr_i[15]
         if      (mr_i[15])             controller_fsm_next = STATE33;
         else                           controller_fsm_next = STATE34;
       end
       STATE33 : begin // add for bit 15
                                         controller_fsm_next = STATE34;
       end
       
       STATE34 : begin // check mr_i[16]
         if      (mr_i[16])             controller_fsm_next = STATE35;
         else                           controller_fsm_next = STATE36;
       end
       STATE35 : begin // add for bit 16
                                         controller_fsm_next = STATE36;
       end
       
       STATE36 : begin // check mr_i[17]
         if      (mr_i[17])             controller_fsm_next = STATE37;
         else                           controller_fsm_next = STATE38;
       end
       STATE37 : begin // add for bit 17
                                         controller_fsm_next = STATE38;
       end
       
       STATE38 : begin // check mr_i[18]
         if      (mr_i[18])             controller_fsm_next = STATE39;
         else                           controller_fsm_next = STATE40;
       end
       STATE39 : begin // add for bit 18
                                         controller_fsm_next = STATE40;
       end
       
       STATE40 : begin // check mr_i[19]
         if      (mr_i[19])             controller_fsm_next = STATE41;
         else                           controller_fsm_next = STATE42;
       end
       STATE41 : begin // add for bit 19
                                         controller_fsm_next = STATE42;
       end
       
       STATE42 : begin // check mr_i[20]
         if      (mr_i[20])             controller_fsm_next = STATE43;
         else                           controller_fsm_next = STATE44;
       end
       STATE43 : begin // add for bit 20
                                         controller_fsm_next = STATE44;
       end
       
       STATE44 : begin // check mr_i[21]
         if      (mr_i[21])             controller_fsm_next = STATE45;
         else                           controller_fsm_next = STATE46;
       end
       STATE45 : begin // add for bit 21
                                         controller_fsm_next = STATE46;
       end
       
       STATE46 : begin // check mr_i[22]
         if      (mr_i[22])             controller_fsm_next = STATE47;
         else                           controller_fsm_next = STATE48;
       end
       STATE47 : begin // add for bit 22
                                         controller_fsm_next = STATE48;
       end
       
       STATE48 : begin // check mr_i[23]
         if      (mr_i[23])             controller_fsm_next = STATE49;
         else                           controller_fsm_next = STATE50;
       end
       STATE49 : begin // add for bit 23
                                         controller_fsm_next = STATE50;
       end
       
       STATE50 : begin // check mr_i[24]
         if      (mr_i[24])             controller_fsm_next = STATE51;
         else                           controller_fsm_next = STATE52;
       end
       STATE51 : begin // add for bit 24
                                         controller_fsm_next = STATE52;
       end
       
       STATE52 : begin // check mr_i[25]
         if      (mr_i[25])             controller_fsm_next = STATE53;
         else                           controller_fsm_next = STATE54;
       end
       STATE53 : begin // add for bit 25
                                         controller_fsm_next = STATE54;
       end
       
       STATE54 : begin // check mr_i[26]
         if      (mr_i[26])             controller_fsm_next = STATE55;
         else                           controller_fsm_next = STATE56;
       end
       STATE55 : begin // add for bit 26
                                         controller_fsm_next = STATE56;
       end
       
       STATE56 : begin // check mr_i[27]
         if      (mr_i[27])             controller_fsm_next = STATE57;
         else                           controller_fsm_next = STATE58;
       end
       STATE57 : begin // add for bit 27
                                         controller_fsm_next = STATE58;
       end
       
       STATE58 : begin // check mr_i[28]
         if      (mr_i[28])             controller_fsm_next = STATE59;
         else                           controller_fsm_next = STATE60;
       end
       STATE59 : begin // add for bit 28
                                         controller_fsm_next = STATE60;
       end
       
       STATE60 : begin // check mr_i[29]
         if      (mr_i[29])             controller_fsm_next = STATE61;
         else                           controller_fsm_next = STATE62;
       end
       STATE61 : begin // add for bit 29
                                         controller_fsm_next = STATE62;
       end
       
       STATE62 : begin // check mr_i[30]
         if      (mr_i[30])             controller_fsm_next = STATE63;
         else                           controller_fsm_next = STATE64;
       end
       STATE63 : begin // add for bit 30
                                         controller_fsm_next = STATE64;
       end
       
       STATE64 : begin // check mr_i[31] (you already wrote this)
         if      (mr_i[31])             controller_fsm_next = STATE65;
         else                           controller_fsm_next = STATE66;
       end
       
       STATE65 : begin // add for bit 31
                                         controller_fsm_next = STATE66;
       end
       
       STATE66 : begin 
                                         controller_fsm_next = STATE0;
       end

       default : begin
                                         controller_fsm_next = STATE0;
       end
   endcase
end : fsm

endmodule 
