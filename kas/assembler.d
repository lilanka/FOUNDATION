import std.stdio;
import std.file;
import std.algorithm;
import std.string;
import std.conv;
import std.exception;

// line number 
private size_t line_no;

// output string
private ubyte[] output;

// which pass currently in
private int pass;

// address of labels
private ushort addr;

// RISC-V assm instructions
private string label;
private string op;
private string r1;
private string r2;
private string r3;
private string cmnt;

private void error(string err) {
	stderr.writeln("kas: " ~ to!string(line_no + 1) ~ ": " ~ err);
	enforce(0);
}

private void file_write(string outfile) {
	import std.file : write;
	write(outfile, output);
}

private void parse(string line) {
	label = null;
	op = null;
	r1 = null;
	r2 = null;
	r3 = null;
	cmnt = null;

	// remove whitespaces from beginning of the line
	auto preprocess = stripLeft(line);

	// split comment
	auto splitcomm = preprocess.findSplit("#");
	if (!splitcomm[2].empty)
		cmnt = strip(splitcomm[2]);

	// split 3rd and 2nd arguments from the reminder
	auto splitr3 = splitcomm[0].findSplit(",");
	auto splitr2 = splitr3[2].findSplit(",");
	if (!splitr2[2].empty || !splitr2[0].empty) {
		r3 = strip(splitr2[2]);
		r2 = strip(splitr2[0]);
	}

	// split 1st argument from the reminder
	auto splitr1 = splitr3[0].findSplit(" ");
	if (!splitr1[2].empty)
		r1 = strip(splitr1[2]);

	// split op code 
	auto splitop = splitr1[0].findSplit(":");
	if (!splitop[1].empty) {
		op = strip(splitop[2]);
		label = strip(splitop[0]);
	} else {
		op = strip(splitop[0]);
	}

	// todo: don't code as "label: op". If you do, add supportive module for that 
	// I'm too lazy :)
}


private void assemble(string[] lines, string outfile) {
	pass = 1;
	for (line_no = 0; line_no < lines.length; line_no++) {
		parse(lines[line_no]);
	}

	pass = 2;
	for (line_no = 0; line_no < lines.length; line_no++) {
		parse(lines[line_no]);
	}
	file_write(outfile);
}

void main(string[] args) {
	if (args.length != 2) {
		stderr.writeln("kas: Input '.asm' file");
		return;
	}
	string[] lines = splitLines(cast(string)read(args[1]));
	auto split = args[1].findSplit(".asm");	// assembly code should be written in .asm file format
	auto outfile = split[0] ~ ".kbin";			// The output binary format

	assemble(lines, outfile);
}
