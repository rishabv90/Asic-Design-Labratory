module fir_filter
(
input  wire clk,
input  wire n_reset,
input  wire [15:0] sample_data,
input  wire [15:0] fir_coefficient,
input  wire data_ready,
input  wire load_coeff,
output wire one_k_samples,
output wire modwait,
output wire [15:0] fir_out,
output wire err
);
 

//make function call here
logic count_up;
logic clear;
logic [16:0] dpout;
logic [2:0] operation;
logic [3:0] source1;
logic [3:0] source2;
logic [3:0] destination;
logic overflow;
logic syncdr;
logic synclc;   

sync syn1 (
	   .clk(clk),
	   .n_rst(n_reset),
	   .async_in(data_ready),
	   .sync_out(syncdr)
	   );

sync syn2 (
	   .clk(clk),
	   .n_rst(n_reset),
	   .async_in(load_coeff),
	   .sync_out(synclc)
	   );
   
   
controller ctlr (
		 .clk(clk),
		 .n_reset(n_reset),
		 .dr(syncdr),
		 .lc(synclc),
		 .overflow(overflow),
		 .cnt_up(count_up),
		 .clear(clear),
		 .modwait(modwait),
		 .op(operation),
		 .src1(source1),
		 .src2(source2),
		 .dest(destination),
		 .err(err)
		);

counter cnt (
		.clk(clk),
		.n_reset(n_reset),
		.cnt_up(count_up),
		.clear(clear),
		.one_k_samples(one_k_samples)
		);
   
magnitude mag (
		  .in(dpout),
		  .out(fir_out)
		  );

datapath dp (
		.clk(clk),
		.n_reset(n_reset),
		.op(operation),
		.src1(source1),
		.src2(source2),
		.dest(destination),
		.ext_data1(sample_data),
		.ext_data2(fir_coefficient),
		.outreg_data(dpout),
		.overflow(overflow)
		);
   

endmodule   

/*
endmodule
`timescale 1ns /100ps

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	
	output reg sum,
	output reg carry_out
);
 
always @ (a,b, carry_in)
   begin
      assert(( a == 1'b1) || (a == 1'b0))
      else $error("Input 'a' of component is not a digital logic value");

      assert((b == 1'b1) || (b == 1'b0))
      else $error("Input 'b' of component is not a digital logic value");

      assert((carry_in == 1'b1) || (carry_in == 1'b0))
      else $error("Input 'carry_in' of component is not a digital logic value");
	
   end



  assign sum = carry_in ^ (a ^ b);
  assign carry_out = ((! carry_in) & b & a) | (carry_in & (b | a));


   
   always @ (a, b, carry_in)
   begin
     #(2) assert (((a+b+carry_in)%2) == sum)
       else $error("Output 's' of first 1 bit adder is not correct");
   end
	

endmodule

*/

/*
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libgen.h>

#include "answer07.h"
#include "treefun.h"

#define TRUE 1
#define FALSE 0

static int process_file(const char * filename, int is_textmode)
{
    printf("Reading file: '%s', textmode = %s.\n", 
	   filename, (is_textmode ? "TRUE" : "FALSE"));

    FILE * fp = fopen(filename, "rb");
    if(fp == NULL) {
	fprintf(stderr, "Failed to open file '%s'\n", filename);
	return FALSE;
    }

    // Read in the Huffman Coding Tree
    HuffNode * codetree = NULL;
    if(is_textmode)
	codetree = HuffTree_readTextHeader(fp);
    else
	codetree = HuffTree_readBinaryHeader(fp);
    printf("Huffman coding tree is:\n");
    HuffNode_print(stdout, codetree);

    // Apply the tree
    size_t len;
    unsigned char * buffer = Huffman_applyTree(fp, codetree, &len);
    printf("\nMessage is:\n%s\n", buffer);

    // Cleanup
    fclose(fp);
    HuffNode_destroy(codetree);
    free(buffer);
    
    return TRUE;
}

static void print_usage(char * argv0)
{
    printf("\n"
	   "   Usage: %s <mode> <filename>\n"
	   "\n"
	   "      <mode>       Can be one of 't' or 'b', for Huffman files\n"
	   "                   with (respectively) text or binary headers.\n"
	   "      <filename>   Name of the file to attempt to decode\n"
	   "\n",
	   basename(argv0));
}

int main(int argc, char * * argv)
{
    if(argc == 2 && strcmp(argv[1], "--help") == 0) {
	print_usage(argv[0]);
	return EXIT_SUCCESS;
    } else if(argc != 3) {
	print_usage(argv[0]);
	return EXIT_FAILURE;
    }

    const char * textmode_arg = argv[1];
    const char * filename = argv[2];
    int is_textmode = FALSE;
    if(strcmp(textmode_arg, "t") == 0) {
	is_textmode = TRUE;
    } else if(strcmp(textmode_arg, "b") == 0) {
	is_textmode = FALSE;
    } else {
	fprintf(stderr, "Invalid argument: '%s'. Expected either 't' or 'b'\n", 
		textmode_arg);
	return EXIT_FAILURE;
    }

    if(process_file(filename, is_textmode))
	return EXIT_SUCCESS;
    return EXIT_FAILURE;
}
*/

