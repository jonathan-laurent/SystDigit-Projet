IN=graph.ml main.ml netlist_ast.ml netlist_dumb.ml netlist_lexer.mll netlist.ml netlist_parser.mly netlist_printer.ml scheduler.ml simplify.ml

all: main.native

main.native: $(IN)
	ocamlbuild -libs unix main.native

clean:
	rm -rf _build
	rm main.native
