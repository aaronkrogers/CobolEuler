COBOL ?= gcobol
COBOLFLAGS ?=

ENTRY_SOURCES := $(filter Euler%.cbl,$(wildcard Euler*.cbl))
PROGRAMS := $(ENTRY_SOURCES:.cbl=)

# Define library dependencies for programs that need them
PROG_LIBS_Euler3 = library/is_prime.cbl

# Function to get libraries for a program
get_libs = $(PROG_LIBS_$(1))

.PHONY: all clean

all: $(PROGRAMS)

%: %.cbl
	$(COBOL) $(COBOLFLAGS) -o $@ $< $(call get_libs,$@)

clean:
	rm -f $(PROGRAMS) *.o *.so *.dll *.mod *.exe
