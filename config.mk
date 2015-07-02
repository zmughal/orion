CPPFLAGS := -Ilib
CFLAGS   := -std=c11
LDFLAGS  := -lm
CMAKEFLAGS :=

DEBUGFLAGS := -g
RELEASEFLAGS :=
CMAKEDEBUGFLAGS := -DCMAKE_BUILD_TYPE=debug
CMAKERELEASEFLAGS :=

ifdef DEBUG
CFLAGS   := $(CFLAGS) $(DEBUGFLAGS)
LDFLAGS   := $(LDFLAGS) $(DEBUGFLAGS)
CMAKEFLAGS := $(CMAKEFLAGS) $(CMAKEDEBUGFLAGS)
else
CFLAGS   := $(CFLAGS) $(RELEASEFLAGS)
LDFLAGS   := $(LDFLAGS) $(RELEASEFLAGS)
CMAKEFLAGS := $(CMAKEFLAGS) $(CMAKERELEASEFLAGS)
endif

CMAKE := cmake
CMAKE.generate = $(CMAKE) $(CMAKEFLAGS)

## Directories
SRCDIR   := src
BINDIR   := bin
BUILDDIR := .build
LIBDIR   := lib
TESTDIR  := lib/t
DEPDIR   := .deps
OUTPUT_DIRS := $(BUILDDIR) $(DEPDIR) $(BINDIR)

FULL_LIBDIR := `cd ${LIBDIR}; pwd`
FULL_BUILDDIR := `cd ${BUILDDIR}; pwd`

include dep.mk
include platform.mk
