IN=graph.ml main.ml netlist_ast.ml netlist_dumb.ml netlist_lexer.mll netlist.ml netlist_parser.mly netlist_printer.ml scheduler.ml simplify.ml

all: sched

sched: $(IN)
	ocamlbuild main.native
	mv main.native sched

clean:
	rm sched
	rm -rf _build
