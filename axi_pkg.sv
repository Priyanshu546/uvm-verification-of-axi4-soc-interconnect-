`ifndef AXI_PKG_SV
`define AXI_PKG_SV

package axi_pkg;

    // ------------------------------------------------------------
    // Global Parameters
    // ------------------------------------------------------------

    parameter int ADDR_WIDTH = 32;
    parameter int DATA_WIDTH = 32;
    parameter int STRB_WIDTH = DATA_WIDTH/8;

    parameter int NUM_MASTERS = 3;
    parameter int NUM_SLAVES  = 3;

    // ------------------------------------------------------------
    // Address Map
    // ------------------------------------------------------------

    parameter logic [ADDR_WIDTH-1:0] SLAVE0_BASE = 32'h0000_0000;
    parameter logic [ADDR_WIDTH-1:0] SLAVE0_END  = 32'h0FFF_FFFF;

    parameter logic [ADDR_WIDTH-1:0] SLAVE1_BASE = 32'h1000_0000;
    parameter logic [ADDR_WIDTH-1:0] SLAVE1_END  = 32'h1FFF_FFFF;

    parameter logic [ADDR_WIDTH-1:0] SLAVE2_BASE = 32'h2000_0000;
    parameter logic [ADDR_WIDTH-1:0] SLAVE2_END  = 32'h2FFF_FFFF;

    // ------------------------------------------------------------
    // Slave Selection
    // ------------------------------------------------------------

    typedef enum logic [1:0]
    {
        SLAVE0 = 2'd0,
        SLAVE1 = 2'd1,
        SLAVE2 = 2'd2,
        INVALID_SLAVE = 2'd3
    } slave_sel_t;

    // ------------------------------------------------------------
    // AXI Response Codes
    // ------------------------------------------------------------

    typedef enum logic [1:0]
    {
        AXI_RESP_OKAY   = 2'b00,
        AXI_RESP_EXOKAY = 2'b01,
        AXI_RESP_SLVERR = 2'b10,
        AXI_RESP_DECERR = 2'b11
    } axi_resp_t;

    // ------------------------------------------------------------
    // AXI Burst Types
    // (Used in Stage-2)
    // ------------------------------------------------------------

    typedef enum logic [1:0]
    {
        AXI_BURST_FIXED = 2'b00,
        AXI_BURST_INCR  = 2'b01,
        AXI_BURST_WRAP  = 2'b10
    } axi_burst_t;

    // ------------------------------------------------------------
    // AXI Transfer Size
    // (Used in Stage-2)
    // ------------------------------------------------------------

    typedef enum logic [2:0]
    {
        AXI_SIZE_1B   = 3'd0,
        AXI_SIZE_2B   = 3'd1,
        AXI_SIZE_4B   = 3'd2,
        AXI_SIZE_8B   = 3'd3,
        AXI_SIZE_16B  = 3'd4,
        AXI_SIZE_32B  = 3'd5,
        AXI_SIZE_64B  = 3'd6,
        AXI_SIZE_128B = 3'd7
    } axi_size_t;

    // ------------------------------------------------------------
    // Master IDs
    // ------------------------------------------------------------

    typedef enum logic [1:0]
    {
        MASTER0 = 2'd0,
        MASTER1 = 2'd1,
        MASTER2 = 2'd2
    } master_id_t;

endpackage

`endif
