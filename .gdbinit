source /home/darkstar/pwndbg/gdbinit.py

set disassembly-flavor intel
source /home/darkstar/gdbscript/splitmind/gdbinit.py
shell test "$PWNLIB_GDB" && echo "[+] Pwntools launched GDB" || echo "[-] Normal GDB launch"
python
import splitmind
(splitmind.Mind()
  .tell_splitter(show_titles=True)
  .tell_splitter(set_title="Main")
  .right(display="legend", size="30%")
  .show("regs", on="legend")
  #.above(of="main", display="ghidra", size="30%", banner="top")
  #.above(of="disasm", display="stack", size="40%")
  #.show("code", on="disasm", banner="none")
  #.above(display="stack", size="40%")
  #.above(display="legend", size="25")
  #.show("regs", on="legend")
  .below(of="legend", display="backtrace", size="45%")
  #.below(of="backtrace", cmd="ipython", size="50%")
).build(nobanner=True)
end
set context-code-lines 30
set context-source-code-lines 30
set context-sections  "regs args code disasm stack backtrace"
