`ifndef AXI_IF_SV
`define AXI_IF_SV

interface axi_if
#(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)
(
    input logic ACLK,
    input logic ARESETn
);

    //------------------------------------------------------------
    // Local Parameters
    //------------------------------------------------------------

    localparam STRB_WIDTH = DATA_WIDTH/8;

    //------------------------------------------------------------
    // Write Address Channel (AW)
    //------------------------------------------------------------

    logic [ADDR_WIDTH-1:0] AWADDR;
    logic [7:0]            AWLEN;
    logic [2:0]            AWSIZE;
    logic [1:0]            AWBURST;
    logic                  AWVALID;
    logic                  AWREADY;

    //------------------------------------------------------------
    // Write Data Channel (W)
    //------------------------------------------------------------

    logic [DATA_WIDTH-1:0] WDATA;
    logic [STRB_WIDTH-1:0] WSTRB;
    logic                  WLAST;
    logic                  WVALID;
    logic                  WREADY;

    //------------------------------------------------------------
    // Write Response Channel (B)
    //------------------------------------------------------------

    logic [1:0]            BRESP;
    logic                  BVALID;
    logic                  BREADY;

    //------------------------------------------------------------
    // Read Address Channel (AR)
    //------------------------------------------------------------

    logic [ADDR_WIDTH-1:0] ARADDR;
    logic [7:0]            ARLEN;
    logic [2:0]            ARSIZE;
    logic [1:0]            ARBURST;
    logic                  ARVALID;
    logic                  ARREADY;

    //------------------------------------------------------------
    // Read Data Channel (R)
    //------------------------------------------------------------

    logic [DATA_WIDTH-1:0] RDATA;
    logic [1:0]            RRESP;
    logic                  RLAST;
    logic                  RVALID;
    logic                  RREADY;

    //------------------------------------------------------------
    // Master Modport
    //------------------------------------------------------------

    modport master
    (
        input  ACLK,
        input  ARESETn,

        // Write Address Channel
        output AWADDR,
        output AWLEN,
        output AWSIZE,
        output AWBURST,
        output AWVALID,
        input  AWREADY,

        // Write Data Channel
        output WDATA,
        output WSTRB,
        output WLAST,
        output WVALID,
        input  WREADY,

        // Write Response Channel
        input  BRESP,
        input  BVALID,
        output BREADY,

        // Read Address Channel
        output ARADDR,
        output ARLEN,
        output ARSIZE,
        output ARBURST,
        output ARVALID,
        input  ARREADY,

        // Read Data Channel
        input  RDATA,
        input  RRESP,
        input  RLAST,
        input  RVALID,
        output RREADY
    );

    //------------------------------------------------------------
    // Slave Modport
    //------------------------------------------------------------

    modport slave
    (
        input  ACLK,
        input  ARESETn,

        // Write Address Channel
        input  AWADDR,
        input  AWLEN,
        input  AWSIZE,
        input  AWBURST,
        input  AWVALID,
        output AWREADY,

        // Write Data Channel
        input  WDATA,
        input  WSTRB,
        input  WLAST,
        input  WVALID,
        output WREADY,

        // Write Response Channel
        output BRESP,
        output BVALID,
        input  BREADY,

        // Read Address Channel
        input  ARADDR,
        input  ARLEN,
        input  ARSIZE,
        input  ARBURST,
        input  ARVALID,
        output ARREADY,

        // Read Data Channel
        output RDATA,
        output RRESP,
        output RLAST,
        output RVALID, 
        input  RREADY
    );

endinterface

`endif
