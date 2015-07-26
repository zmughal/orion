include make/platform.mk

CPPFLAGS := -Ilib
CFLAGS   := -std=c99 -fsanitize=address -O2 -Wall
#CFLAGS   := -std=c11
LDFLAGS  := -lm $(CPPFLAGS)
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

# output of ${SRCDIR}
BINDIR   := bin

LIBDIR   := lib
TESTDIR  := lib/t

# output of ${LIBDIR} and ${TESTDIR}
BUILDDIR := .build
BUILDTESTDIR := $(BUILDDIR)/t

# output used to build deps information for make(1)
DEPDIR   := .deps

OUTPUT_DIRS := $(BUILDDIR) $(DEPDIR) $(BINDIR)

FULL_LIBDIR := `cd ${LIBDIR}; pwd`
FULL_BUILDDIR := `cd ${BUILDDIR}; pwd`

### Set variables to pass into CMakeLists.txt
CMAKEFLAGS := -D LIBDIR=${FULL_LIBDIR} -D BUILDDIR=${FULL_BUILDDIR}

include make/dep.mk
