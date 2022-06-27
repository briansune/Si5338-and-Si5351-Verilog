`timescale 1ns / 1ps

module golden_si5338_si5351(
	
	input				sys_clk_p,
	input				sys_clk_n,
	input 				sys_nrst,
	
	output				SCL,
	inout				SDA,
	
	input				se_clk0,
	input				se_clk1,
	
	input				si5338_clk0_p,
	input				si5338_clk0_n,
	
	input				si5338_clk2_p,
	input				si5338_clk2_n,
	
	output	[7 : 0]		leds
);
	
	wire				sys_clk;
	wire				si5351_rdy_r;
	wire				si5338_rdy_r;

	IBUFDS #(
		.DIFF_TERM		("FALSE"),
		.IBUF_LOW_PWR	("FALSE"),
		.IOSTANDARD		("DIFF_SSTL15")
	)IBUFDS_inst(
		.O		(sys_clk),
		.I		(sys_clk_p),
		.IB		(sys_clk_n)
	);
	
	si5338_5351_iic si5338_5351_iic_u0(
		.sys_clk	(sys_clk),
		.sys_nrst	(sys_nrst),
		.scl		(SCL),
		.sda		(SDA),
		.si5351_rdy	(si5351_rdy_r),
		.si5338_rdy	(si5338_rdy_r)
	);
	
	reg		leds_osc0_r;
	reg		leds_osc1_r;
	reg		leds_osc2_r;
	reg		leds_osc3_r;
	assign leds = ~{leds_osc0_r, leds_osc1_r, leds_osc2_r, leds_osc3_r, 2'b00, si5338_rdy_r, si5351_rdy_r};
	
	wire si5338_clk2;
	wire si5338_clk2_g;
	reg [31 : 0] pll_div_si5338_clk2;
	
	wire si5338_clk0;
	wire si5338_clk0_g;
	reg [31 : 0] pll_div_si5338_clk0;
	
	initial begin
		pll_div_si5338_clk0 <= 32'd0;
		pll_div_si5338_clk2 <= 32'd0;
		leds_osc0_r <= 1'b0;
		leds_osc1_r <= 1'b0;
		leds_osc2_r <= 1'b0;
		leds_osc3_r <= 1'b0;
	end
	
	IBUFDS_GTE2 #(
		.CLKCM_CFG		("TRUE"),
		.CLKRCV_TRST	("TRUE"),
		.CLKSWING_CFG	(2'b11)
	) IBUFDS_GTE2_inst0 (
		
		.ODIV2	(),
		.CEB	(1'b0),
		
		.O	(si5338_clk2),
		.I	(si5338_clk2_p),
		.IB	(si5338_clk2_n)
	);
	
	BUFG BUFG_inst0(
		.O(si5338_clk2_g),
		.I(si5338_clk2)
	);
	
	always@(posedge si5338_clk2_g)begin
		
		if(pll_div_si5338_clk2 == 32'd124_999_999)begin
			pll_div_si5338_clk2 <= 32'd0;
			leds_osc1_r <= leds_osc1_r + 1'b1;
		end else begin
			pll_div_si5338_clk2 <= pll_div_si5338_clk2 + 32'd1;
		end
	end
	
	IBUFDS_GTE2 #(
		.CLKCM_CFG		("TRUE"),
		.CLKRCV_TRST	("TRUE"),
		.CLKSWING_CFG	(2'b11)
	) IBUFDS_GTE2_inst1 (
		
		.ODIV2	(),
		.CEB	(1'b0),
		
		.O	(si5338_clk0),
		.I	(si5338_clk0_p),
		.IB	(si5338_clk0_n)
	);
	
	BUFG BUFG_inst1(
		.O(si5338_clk0_g),
		.I(si5338_clk0)
	);
	
	always@(posedge si5338_clk0_g)begin
		
		if(pll_div_si5338_clk0 == 32'd49_999_999)begin
			pll_div_si5338_clk0 <= 32'd0;
			leds_osc0_r <= leds_osc0_r + 1'b1;
		end else begin
			pll_div_si5338_clk0 <= pll_div_si5338_clk0 + 32'd1;
		end
	end
	
	// =================================================
	wire se_glb_clk0;
	wire se_glb_clk1;
	reg [31 : 0] pll_div_si5351_clk0;
	reg [31 : 0] pll_div_si5351_clk1;
	
	initial begin
		pll_div_si5351_clk0 <= 32'd0;
		pll_div_si5351_clk1 <= 32'd0;
	end
	
	BUFG BUFG_inst2(
		.O(se_glb_clk0),
		.I(se_clk0)
	);
	
	always@(posedge se_glb_clk0)begin
		
		if(pll_div_si5351_clk0 == 32'd148_499_999)begin
			pll_div_si5351_clk0 <= 32'd0;
			leds_osc2_r <= leds_osc2_r + 1'b1;
		end else begin
			pll_div_si5351_clk0 <= pll_div_si5351_clk0 + 32'd1;
		end
	end
	
	BUFG BUFG_inst3(
		.O(se_glb_clk1),
		.I(se_clk1)
	);
	
	always@(posedge se_glb_clk1)begin
		
		if(pll_div_si5351_clk1 == 32'd49_999_999)begin
			pll_div_si5351_clk1 <= 32'd0;
			leds_osc3_r <= leds_osc3_r + 1'b1;
		end else begin
			pll_div_si5351_clk1 <= pll_div_si5351_clk1 + 32'd1;
		end
	end
	
endmodule
