## Swift compiler flags

```md
#Every Single Option Under The Sun

- optimization level options
- automatic crashing options
- debug info options
- swift internal options
- swift debug/development internal options
- linker-specific options
- mode options

Flag | Description
-----|------------
Xcc	|	Pass <arg> to the C/C++/Objective-C compiler
Xfrontend	|	Pass <arg> to the Swift frontend
Xlinker	|	Specifies an option which should be passed to the linker
Xllvm	|	Pass <arg> to LLVM.
application-extension	|	Restrict code to those available for App Extensions
assert-config	|	Specify the assert_configuration replacement. Possible values are Debug, Release, Replacement.
autolink-force-load	|	Force ld to link against this module even if no symbols are used
color-diagnostics	|	Print diagnostics in color
debug-assert-after	|	Force an assertion failure after parsing
debug-assert-immediately	|	Force an assertion failure immediately
debug-constraints-attempt	|	Debug the constraint solver at a given attempt
debug-constraints	|	Debug the constraint-based type checker
debug-crash-after	|	Force a crash after parsing
debug-crash-immediately	|	Force a crash immediately
debug-forbid-typecheck	|	Triggers llvm fatal_error if typechecker tries to typecheck a decl with the provided prefix name
debug-generic-signatures	|	Debug generic signatures
debug-time-function	|	Dumps the time it takes to type-check each function body
debugger-support	|	Process swift code as if running in the debugger
delayed-function-body	|	Delay function body parsing until the end of all files
deprecated-integrated-repl	|
disable-access-control	|	Don't respect access control restrictions
disable-arc-opts	|	Don't run SIL ARC optimization passes.
disable-diagnostic-passes	|	Don't run diagnostic passes
disable-func-sig	|	Disable function signature optimizations
disable-llvm-arc	|	Don't run LLVM ARC optimization passes.
disable-llvm-optzns	|	Don't run LLVM optimization passes
disable-llvm-slp	|	Don't run LLVM SLP vectorizer
disable-llvm-verify	|	Don't run the LLVM IR verifier.
disable-objc-attr	|	Disable requiring uses of @objc to require importing the Foundation module
disable-objc-interop	|	Disable Objective-C interop code generation and config directives
disable-playground-transform	|	Disable playground transformation
disable-sil-linking	|	Don't link SIL functions
disable-target-os	|	Disable checking the target OS of serialized modules
driver-mode=    |   Set the driver mode to either 'swift' or 'swiftc' or 'swift-update'
driver-print-actions	|	Dump list of actions to perform
driver-print-bindings	|	Dump list of bindings
driver-print-jobs	|	Dump list of jobs to execute
driver-print-output	|	Dump the contents of the output file map
driver-skip-execution	|	Skip execution of subtasks when performing compilation
driver-use-frontend	|	Use the given executable to perform compilations
dump-ast	|	Parse and type-check input file(s) and dump AST(s)
dump-clang-diagnostics	|	Dump Clang diagnostics to stderr
dump-parse	|	Parse input file(s) and dump AST(s)
D	|	Specifies one or more build configuration options
emit-assembly	|	Emit assembly file(s) (-S)
emit-bc	|	Emit LLVM BC file(s)
emit-dependencies-path	|	Output basic Make-compatible dependencies file to <path>
emit-dependencies	|	Emit basic Make-compatible dependencies files
emit-executable	|	Emit a linked executable
emit-ir	|	Emit LLVM IR file(s)
emit-library	|	Emit a linked library
emit-module-doc	|	Output module documentation file <path>
emit-module-doc	|	Emit a module documentation file based on documentation comments
emit-module-path	|	emit-module-path	|	Emit an importable module to <path>
emit-module	|	Emit an importable module
emit-objc-header-path	|	Emit an Objective-C header file to `<path>`
emit-objc-header	|	Emit an Objective-C header file
emit-object	|	Emit object file(s) (-c)
emit-reference-dependencies	|	Output Swift-style dependencies file to <path>
emit-reference-dependencies	|	Emit a Swift-style dependencies file
emit-silgen	|	Emit raw SIL file(s)
emit-sil	|	Emit canonical SIL file(s)
emit-sorted-sil	|	When printing SIL, print out all sil entities sorted by name to ease diffing
emit-verbose-sil	|	Emit locations during SIL emission
enable-access-control	|	Respect access control restrictions
enable-character-literals	|	Enable legacy character literals
enable-dynamic-value	|	Enable experimental dynamic generic struct/enum/class type layout
enable-experimental-availability	|	Enable experimental checking for API availability
enable-experimental-patterns	|	Enable experimental 'switch' pattern matching features
enable-experimental-unavailable	|	Enable experimental treat unavailable symbols as optional
enable-guaranteed-self	|	Enable the passing of self as a guaranteed parameter
enable-objc-attr	|	Enable requiring uses of @objc to require importing the Foundation module
enable-objc-implicit	|	 Import Objective-C \"implicit properties\" as properties
enable-objc-interop	|	Enable Objective-C interop code generation and config directives
enable-private-discriminators	|	Mangle discriminators into the symbol names for private entities
enable-source-import	|	Enable importing of Swift source files
enable-target-os	|	Enable checking the target OS of serialized modules
enable-union-import	|	Import C unions
external-pass-pipeline	|	Use the pass pipeline defined by <pass_pipeline_file>
force-single-frontend	|	framework
F=  |   Specifies a framework which should be linked against
F	|	Add directory to framework search path
gline-tables-only	|	Emit minimal debug info for backtraces only
gnone	|	Don't emit debug info
g	|	Emit debug info
help-hidden	|	Display available options, including hidden options
help    |   Display available options
import-cf-types	|	Recognize and import CF types as class types
import-module	|	Implicitly import the specified module
import-objc-header	|	Implicitly imports an Objective-C header file
import-underlying-module	|	Implicitly imports the Objective-C half of a module
incremental	|	Perform an incremental build if possible
interpret	|	Immediate mode
I	|	Add directory to the import search path
j	|	Number of commands to execute in parallel
link-objc-runtime	|	Link in additions to the Objective-C runtime
lldb-repl	|	LLDB-enhanced REPL mode
L=  |   Add directory to library link search path
L	|	Specifies a library which should be linked against
module-cache-path	|	Specifies the Clang module cache path
module-link-name=	|	Library to link against when using this module
module-name=	|	Name of the module to build
no-link-objc	|	Don't link in additions to the Objective-C runtime
nostdimport	|	Don't search the standard library import path for modules
Onone	|	Compile without any optimization
Ounchecked	|	Compile with optimizations and remove runtime safety checks
output-file-map	|	A file which specifies the location of outputs
O	|	Compile with optimizations
o	|	Write output to <file>
parse-as-library	|	Parse the input file(s) as libraries, not scripts
parse-sil	|	Parse the input file as SIL code, not Swift source
parse-stdlib	|	Parse the input file(s) as the Swift standard library
parseable-output	|	Emit textual output in a parseable format
parse	|	Parse input file(s)
playground	|	Apply the playground semantics and transformation
primary-file	|	Produce output for this file, not the whole module
print-ast	|	Parse and type-check input file(s) and pretty print AST(s)
print-clang-stats	|	Print Clang importer statistics
print-inst-counts	|	Before IRGen, count all the various SIL instructions. Must be used in conjunction with -print-stats.
print-stats	|	Print various statistics
remove-runtime-asserts	|	Remove runtime asserts.
repl	|	REPL mode (the default if there is no input file)
resource-dir	|	The directory that holds the compiler resource files </usr/lib/swift>
save-temps	|	Save intermediate compilation results
sdk	|	Compile against <sdk>
serialize-debugging-options	|	Always serialize options for debugging (default: only for apps)
serialize-diagnostics-path	|	Output serialized diagnostics to <path>
serialize-diagnostics	|	Serialize diagnostics in a binary format
show-diagnostics-after	|	Keep emitting subsequent diagnostics after a fatal error
sil-debug-serialization	|	Do not eliminate functions in Mandatory Inlining/SILCombine dead functions. (for debugging only)
sil-devirt-threshold	|	Controls the aggressiveness of devirtualization
sil-inline-threshold	|	Controls the aggressiveness of performance inlining
sil-link-all	|	Link all SIL functions
sil-opt-pass	|	Stop optimizing after <N> optimization passes
sil-print-all	|	Print SIL after each transform
sil-print-pass	|	Print SIL pass name before each transform
sil-serialize-all	|	Serialize all generated SIL
sil-time-transforms	|	Time each SIL transform invocation
sil-verify-all	|	Verify SIL after each transform
solver-memory-threshold	|	Set the upper bound for memory consumption, in bytes, by the constraint solver
split-objc-selectors	|	Split imported Objective-C selectors based on prepositions
target-cpu	|	Generate code for a particular CPU variant
target=`<target triple>`	|	Generate code for the given target
typecheck | Parse and typecheck Swift code
update-code	|	Update Swift code
use-jit	|	Register Objective-C classes as if the JIT were in use
use-malloc	|	Allocate internal data structures using malloc (for memory debugging)
verify-type-layout	|	Verify compile-time and runtime type layout information for type <type>
verify	|	Verify diagnostics against expected-{error|warning|note} annotations
version	|	Print version information and exit
v	|	Show commands to run and use verbose output
whole-module-optimization	|	Optimize input files together instead of individually
```

[CodaFi/alltheflags.md](https://gist.github.com/CodaFi/b1e0d0f37cd2890c07c5)
