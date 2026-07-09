`ifndef ADDRESS_DECODER_SV
`define ADDRESS_DECODER_SV

import axi_pkg::*;

module address_decoder
(
    input  logic [ADDR_WIDTH-1:0] addr,
    output slave_sel_t            slave_sel
);

    //------------------------------------------------------------
    // Address Decode Logic
    //------------------------------------------------------------

    always_comb
    begin

        // Default assignment
        slave_sel = INVALID_SLAVE;

        if ((addr >= SLAVE0_BASE) && (addr <= SLAVE0_END))
            slave_sel = SLAVE0;

        else if ((addr >= SLAVE1_BASE) && (addr <= SLAVE1_END))
            slave_sel = SLAVE1;

        else if ((addr >= SLAVE2_BASE) && (addr <= SLAVE2_END))
            slave_sel = SLAVE2;

        else
            slave_sel = INVALID_SLAVE;

    end

endmodule

`endif
