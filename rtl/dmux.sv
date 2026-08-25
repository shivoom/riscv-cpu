module DMUX (
    input a,
    input sel,
    output y0,
    output y1
);
    assign y0 = sel ? a : sel;
    assign y1 = sel ? sel : a;
endmodule
