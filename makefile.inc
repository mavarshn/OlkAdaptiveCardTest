# Add Ostrman strings to viewer resource
OSTRMAN_DIR = $(H_EXPORTSDIR)

$(OBJ_PATH)\$O\ostrman.resb: $(OSTRMAN_DIR)\nuiostrman.h $(H_EXPORTSDIR)\NUIPlatform.resT $(ORESMAN_DEPS)
	$(ORESMAN) -hb -rest $(H_EXPORTSDIR)\NUIPlatform.resT -binary $(OBJ_PATH)\$O\ostrman.resB

.SUFFIXES:.ho
{}.ho{$(OBJ_PATH)\$O}.h: INPUTS> $(PERL_DEPS) $(C_COMPILER_DEPS)
	$(C_COMPILER) /EP $< > $@
	$(PERL) -pi.old -e "s/\"##\"/ /;s/define/#define/;" $@
