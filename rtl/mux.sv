module MUX (
    input a,
    input b,
    input sel,
    output y
);
    assign y = sel ? b : a;
endmodule