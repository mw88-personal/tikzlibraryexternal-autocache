# This setup makes the following assumptions:
#  1. Source code resides in $source_dir
#  2. All artifacts are placed inside $aux_dir
#  3. The output (and synctex) is placed inside th $build_dir
# with the following consequences
#  1. for distribution, only the $src_dir and this .latexmkrc are necessary



# Set the program used to generate the PDF
# 1: pdflatex
# 2: postscript conversion, don't use this
# 3: dvi conversion, don't use this
# 4: lualatex
# 5: xelatex
$pdf_mode = 4;

# Move all axuiliary files to a separate directory, so they do not clutter up the project directory
# $emulate_aux = 1;
# $aux_dir = "tmp";

# Move the compiled files (and synctex) to a separate directory
$out_dir = 'tmp';
$out2_dir = "build";

# Location of source files
$source_dir = 'src';

# By default, every *.tex file in the project root will be compiled on its own when running latexmk
#  If you wish to change this behaviour, specify an array of filenames or one single filename for your document
# @default_files = ($source_dir.'/*.tex');
# @default_files = ('file1.tex', 'file2.tex', ..., 'fileN.tex');
# @default_files = ('*.tex');
# @default_files = ('main1.tex', 'main2.tex');
@default_files = ('main2.tex', 'main1.tex');


# add the source dir as a lookup path when using include or input
ensure_path('TEXINPUTS', "./$source_dir/");
# ensure_path('TEXINPUTS', "./include/");
# if there is a local texmf tree in this project directory, make it available
ensure_path('TEXINPUTS', "./texmf/tex/latex//");

# add src and include directories as lookup path for bibliography files
ensure_path('BIBINPUTS', "./$source_dir/");
# ensure_path('BIBINPUTS', "./include/");

# add texmf tree search path for truetype fonts
ensure_path('TTFONTS', "./texmf/fonts/truetype//");


# necessary workaround to finde bib resources
# $bibtex_fudge=1;
$bibtex_use = 1;


# Produce less console output
# $silent = 1;

# print informaton about used directories to console
$aux_out_dir_report = 1;

# for debugging:
$kpsewhich_show = 1;
$show_time = 1;

$cleanup_includes_generated  = 1;

#  This command updates all the variables $pdflatex, $lualatex, $xelatex and $latex to be equipped with the given additional arguments and flags
set_tex_cmds(" --shell-escape  -interaction=batchmode  --file-line-error --synctex=1 ");