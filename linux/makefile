# This is a general cross-platform template and not
# all of the sections may apply to the project.

# Environment
SHELL=bash
CC=g++
ACC=arm-linux-gnueabi-g++

# Directories
SRCDIR=src
TSTDIR=test
DBGDIR=debug
RELDIR=release
LINRELDIR=$(RELDIR)/linux
ANDRELDIR=$(RELDIR)/android
MACRELDIR=$(RELDIR)/macos
LINDBGDIR=$(DBGDIR)/linux
ANDDBGDIR=$(DBGDIR)/android
MACDBGDIR=$(DBGDIR)/macos
LINTSTDIR=$(TSTDIR)/linux
ANDTSTDIR=$(TSTDIR)/android
MACTSTDIR=$(TSTDIR)/macos
LINTSTDYNDIR=$(LINTSTDIR)/dynamic
LINTSTSTTDIR=$(LINTSTDIR)/static
ANDTSTDYNDIR=$(ANDTSTDIR)/dynamic
ANDTSTSTTDIR=$(ANDTSTDIR)/static
MACTSTDYNDIR=$(MACTSTDIR)/dynamic
MACTSTSTTDIR=$(MACTSTDIR)/static
LINDBGDYNDIR=$(LINDBGDIR)/dynamic
LINDBGSTTDIR=$(LINDBGDIR)/static
ANDDBGDYNDIR=$(ANDDBGDIR)/dynamic
ANDDBGSTTDIR=$(ANDDBGDIR)/static
MACDBGDYNDIR=$(MACDBGDIR)/dynamic
MACDBGSTTDIR=$(MACDBGDIR)/static
LINRELDYNDIR=$(LINRELDIR)/dynamic
LINRELSTTDIR=$(LINRELDIR)/static
ANDRELDYNDIR=$(ANDRELDIR)/dynamic
ANDRELSTTDIR=$(ANDRELDIR)/static
MACRELDYNDIR=$(MACRELDIR)/dynamic
MACRELSTTDIR=$(MACRELDIR)/static
LIBDIR=$(SRCDIR)/lib
LIBANDROID=$(LIBDIR)/android
LIBLINUX=$(LIBDIR)/linux
LIBWINDOWS=$(LIBDIR)/windows
LIBMACOS=$(LIBDIR)/macos
INCDIR=$(SRCDIR)/include

# Source & Files
BIN=strcase
SRCNAM=main
SRCEXT=cpp
SRC=$(SRCNAM).$(SRCEXT)
EXTRA_SOURCE= # $(LIBDIR)/*.o
SRCPTH=$(SRCDIR)/$(SRC)
HEADERCPP=$(shell ls src/include/*.cpp)
HEADERTMP1=$(shell var='$(HEADERCPP)'; echo $${var//.cpp/.o})
HEADEROBJ=$(shell var='$(HEADERTMP1)'; echo $${var//include/lib})
MAINLIBNAME=$(BIN)
ARCHIVELOBJ=$(shell ls $(LIBLINUX)/*.o)
ARCHIVEAOBJ=$(shell ls $(LIBANDROID)/*.o)
ARCHIVEWOBJ=$(shell ls $(LIBWINDOWS)/*.obj)
ARCHIVEMOBJ=$(shell ls $(LIBMACOS)/*.o)

# Flags
CF_STATIC=-static -static-libgcc -static-libstdc++
CF_GTK= # `pkg-config --cflags --libs gtk+-3.0`
CF_DBG_STATIC=-g -Wall -Wextra -fsanitize=undefined -fno-sanitize-recover=all -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize=null -fno-sanitize=alignment -std=c++17 -fsanitize=address
CF_DBG=$(CF_DBG_STATIC) -fsanitize=address
CF_REL=-O3 -std=c++17
CF_REL_STATIC=$(CF_STATIC) $(CF_REL)
CF_AND=$(CF_REL) -march=armv8-a
CF_AND_STATIC=$(CF_STATIC) $(CF_AND)

# Libraries
LIBS=-l$(BIN)
# LIBSA=-l$(BIN)

# Arguments
TSTARG=--help

# Functions
define create_dir
	@echo Creating $(1) directory.
	@mkdir -p $(1)
endef

define compile_bin
	@echo Compiling $(SRCPTH) and $(EXTRA_SOURCE) to $(3)
	@$(1) $(2) -I$(INCDIR) -L$(3) $(SRCPTH) $(EXTRA_SOURCE) -o $(4) $(5) $(CF_GTK)
endef

define buildobjects
	@echo Building objects from $(INCDIR) to $(3)
	$(foreach cpp, $(HEADERCPP), \
		$(1) $(2) -L$(3) -I$(INCDIR) -c ${cpp} -o $(shell var='$(cpp)'; var=$${var//include/lib\/$(4)}; echo $${var//.cpp/.$(5)}) \
	)
endef

# Labels
$(SRCNAM): releasedynamiclinux

linux: releasedynamiclinux releasestaticlinux

releasedynamiclinux: builddynamiclinuxrelease

builddynamiclinuxrelease: cleandynamiclinuxrelease
	$(call create_dir,$(LINRELDYNDIR))
	$(call compile_bin,$(CC),$(CF_REL),$(LIBLINUX),$(LINRELDYNDIR)/$(BIN),$(LIBS))

releasestaticlinux: buildstaticlinuxrelease

buildstaticlinuxrelease: cleanstaticlinuxrelease
	$(call create_dir,$(LINRELSTTDIR))
	$(call compile_bin,$(CC),$(CF_STATIC),$(LIBLINUX),$(LINRELSTTDIR)/$(BIN),$(LIBS))

android: releasedynamicandroid releasestaticandroid

releasedynamicandroid: builddynamicandroidrelease

builddynamicandroidrelease: cleandynamicandroidrelease
	$(call create_dir,$(ANDRELDYNDIR))
	$(call compile_bin,$(ACC),$(CF_AND),$(LIBANDROID),$(ANDRELDYNDIR)/$(BIN),$(LIBS))

releasestaticandroid: buildstaticandroidrelease

buildstaticandroidrelease: cleanstaticandroidrelease
	$(call create_dir,$(ANDRELSTTDIR))
	$(call compile_bin,$(ACC),$(CF_AND_STATIC),$(LIBANDROID),$(ANDRELSTTDIR)/$(BIN),$(LIBS))

macos: releasedynamicmacos releasestaticmacos

releasedynamicmacos: builddynamicmacosrelease

builddynamicmacosrelease: cleandynamicmacosrelease
	$(call create_dir,$(MACRELDYNDIR))
	$(call compile_bin,$(CC),$(CF_REL),$(LIBMACOS),$(MACRELDYNDIR)/$(BIN),$(LIBS))

releasestaticmacos: buildstaticmacosrelease

buildstaticmacosrelease: cleanstaticmacosrelease
# $(call create_dir,$(MACRELSTTDIR))
# @echo Compiling $(SRCDIR)/main.cpp and $(EXTRA_SOURCE) to $(MACRELSTTDIR)/$(BIN)
# # $(CC) $(CF_REL_STATIC) -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include -I$(INCDIR) -L$(LIBMACOS) $(SRCPTH) $(EXTRA_SOURCE) -o $(MACRELSTTDIR)/$(BIN)

# Debug
debugdynamiclinux: cleandynamiclinuxdebug
	$(call create_dir,$(LINDBGDYNDIR))
	$(call compile_bin,$(CC),$(CF_DBG),$(LIBLINUX),$(LINDBGDYNDIR)/$(BIN),$(LIBS))

debugstaticlinux: cleanstaticlinuxdebug
	$(call create_dir,$(LINDBGSTTDIR))
	$(call compile_bin,$(CC),$(CF_DBG_STATIC),$(LIBLINUX),$(LINDBGSTTDIR)/$(BIN),$(LIBS))

debugdynamicandroid: cleandynamicandroiddebug
	$(call create_dir,$(ANDDBGDYNDIR))
	$(call compile_bin,$(ACC),$(CF_AND),$(LIBANDROID),$(ANDDBGDYNDIR)/$(BIN),$(LIBS))

debugstaticandroid: cleanstaticandroiddebug
	$(call create_dir,$(ANDDBGSTTDIR))
	$(call compile_bin,$(ACC),$(CF_AND_STATIC),$(LIBANDROID),$(ANDDBGSTTDIR)/$(BIN),$(LIBS))

debugdynamicmacos: cleandynamicmacosdebug
	$(call create_dir,$(MACDBGDYNDIR))
	$(call compile_bin,$(CC),$(CF_DBG),$(LIBMACOS),$(MACDBGDYNDIR)/$(BIN),$(LIBS))

debugstaticmacos: cleanstaticmacosdebug
	$(call create_dir,$(MACDBGSTTDIR))
	$(call compile_bin,$(CC),$(CF_DBG_STATIC),$(LIBMACOS),$(MACDBGSTTDIR)/$(BIN),$(LIBS))

# Tests
testdynamiclinux: cleandynamiclinuxtest
	$(call create_dir,$(LINTSTDYNDIR))
	$(call compile_bin,$(CC),$(CF_DBG),$(LIBLINUX),$(LINTSTDYNDIR)/$(BIN),$(LIBS))
	@echo Running Debug Dynamic test
	./$(LINTSTDYNDIR)/$(BIN) $(TSTARG)

teststaticlinux: cleanstaticlinuxtest
	$(call create_dir,$(LINTSTSTTDIR))
	$(call compile_bin,$(CC),$(CF_DBG_STATIC),$(LIBLINUX),$(LINTSTSTTDIR)/$(BIN),$(LIBS))
	@echo Running Debug Static test
	./$(LINTSTSTTDIR)/$(BIN) $(TSTARG)

testdynamicandroid: cleandynamicandroidtest
	$(call create_dir,$(ANDTSTDYNDIR))
	$(call compile_bin,$(ACC),$(CF_AND),$(LIBANDROID),$(ANDTSTDYNDIR)/$(BIN),$(LIBS))
	@echo Running Android Dynamic test
	./$(ANDTSTDYNDIR)/$(BIN) $(TSTARG)

teststaticandroid: cleanstaticandroidtest
	$(call create_dir,$(ANDTSTDYNDIR))
	$(call compile_bin,$(ACC),$(CF_AND),$(LIBANDROID),$(ANDTSTDYNDIR)/$(BIN),$(LIBS))
	@echo Running Android Static test
	./$(ANDTSTDYNDIR)/$(BIN) $(TSTARG)

testdynamicmacos: cleandynamicmacostest
	$(call create_dir,$(MACTSTDYNDIR))
	$(call compile_bin,$(CC),$(CF_DBG),$(LIBMACOS),$(MACTSTDYNDIR)/$(BIN),$(LIBS))
	@echo Running MacOs Dynamic test
	./$(MACTSTDYNDIR)/$(BIN) $(TSTARG)

teststaticmacos: cleanstaticmacostest
	$(call create_dir,$(MACTSTSTTDIR))
	$(call compile_bin,$(CC),$(CF_DBG_STATIC),$(LIBMACOS),$(MACTSTSTTDIR)/$(BIN),$(LIBS))
	@echo Running MacOs Static test
	./$(MACTSTSTTDIR)/$(BIN) $(TSTARG)

# Install
install: installdynamiclinux

# Install Linux
installdynamiclinux: builddynamiclinuxrelease
	@echo Installing $(LINRELDYNDIR)/$(BIN) to /usr/bin/$(BIN)
	cp -f "$(LINRELDYNDIR)/$(BIN)" "/usr/bin/$(BIN)"
#$(shell make cleandynamiclinuxrelease)

installstaticlinux: buildstaticlinuxrelease
	@echo Installing $(LINRELSTTDIR)/$(BIN) to /usr/bin/$(BIN)
	cp -f "$(LINRELSTTDIR)/$(BIN)" "/usr/bin/$(BIN)"

# Cleanup
clean:  cleanlinux cleanmacos cleanandroid

cleanlinux: cleanlinuxrelease cleanlinuxdebug cleanlinuxtest

cleanlinuxrelease: cleandynamiclinuxrelease cleanstaticlinuxrelease

cleandynamiclinuxrelease:
	@echo Cleaning Linux Release Dynamic.
	rm -rf $(LINRELDYNDIR)/*

cleanstaticlinuxrelease:
	@echo Cleaning Linux Release Static.
	rm -rf $(LINRELSTTDIR)/*

cleanlinuxdebug: cleandynamiclinuxdebug cleanstaticlinuxdebug

cleandynamiclinuxdebug:
	@echo Cleaning Linux Debug Dynamic.
	rm -rf $(LINDBGDYNDIR)/*

cleanstaticlinuxdebug:
	@echo Cleaning Linux Debug Static.
	rm -rf $(LINDBGSTTDIR)/*

cleanlinuxtest: cleandynamiclinuxtest cleanstaticlinuxtest

cleandynamiclinuxtest:
	@echo Cleaning Linux Test Dynamic.
	rm -rf $(LINTSTDYNDIR)/*

cleanstaticlinuxtest:
	@echo Cleaning Linux Test Static.
	rm -rf $(LINTSTSTTDIR)/*

cleanandroid: cleanandroidrelease cleanandroiddebug cleanandroidtest

cleanandroidrelease: cleandynamicandroidrelease cleanstaticandroidrelease

cleandynamicandroidrelease:
	@echo Cleaning Android Release Dynamic.
	rm -rf $(ANDRELDYNDIR)/*

cleanstaticandroidrelease:
	@echo Cleaning Android Release Static.
	rm -rf $(ANDRELSTTDIR)/*

cleanandroiddebug: cleandynamicandroiddebug cleanstaticandroiddebug

cleandynamicandroiddebug:
	@echo Cleaning Android Debug Dynamic.
	rm -rf $(ANDDBGDYNDIR)/*

cleanstaticandroiddebug:
	@echo Cleaning Android Debug Static.
	rm -rf $(ANDDBGSTTDIR)/*

cleanandroidtest: cleandynamicandroidtest cleanstaticandroidtest

cleandynamicandroidtest:
	@echo Cleaning Android Test Dynamic.
	rm -rf $(ANDTSTDYNDIR)/*

cleanstaticandroidtest:
	@echo Cleaning Android Test Static.
	rm -rf $(ANDTSTSTTDIR)/*

cleanmacos: cleanmacosrelease cleanmacosdebug cleanmacostest

cleanmacosrelease: cleandynamicmacosrelease cleanstaticmacosrelease

cleandynamicmacosrelease:
	@echo Cleaning MacOs Release Dynamic.
	rm -rf $(MACRELDYNDIR)/*

cleanstaticmacosrelease:
	@echo Cleaning MacOs Release Static.
	rm -rf $(MACRELSTTDIR)/*

cleanmacosdebug: cleandynamicmacosdebug cleanstaticmacosdebug

cleandynamicmacosdebug:
	@echo Cleaning MacOs Debug Dynamic.
	rm -rf $(MACDBGDYNDIR)/*

cleanstaticmacosdebug:
	@echo Cleaning MacOs Debug Static.
	rm -rf $(MACDBGSTTDIR)/*

cleanmacostest: cleandynamicmacostest cleanstaticmacostest

cleandynamicmacostest:
	@echo Cleaning MacOs Test Dynamic.
	rm -rf $(MACTSTDYNDIR)/*

cleanstaticmacostest:
	@echo Cleaning MacOs Test Static.
	rm -rf $(MACTSTSTTDIR)/*

cleanlibs:
	@echo Cleaning lib directory.
	rm -rf $(LIBDIR)/*/*

# Build Libraries
buildlinuxobjects:
	$(call buildobjects,$(CC),$(CF_REL),$(LIBLINUX),"linux","o")

buildandroidobjects:
	$(call buildobjects,$(ACC),$(CF_AND),$(LIBANDROID),"android","o")

buildwindowsobjects:
	$(call buildobjects,$(CC),$(CF_REL),$(LIBWINDOWS),"windows","obj")

buildmacosobjects:
	$(call buildobjects,$(CC),$(CF_REL),$(LIBMACOS),"macos","o")

buildlinuxarchive:
	@echo Building archive from $(ARCHIVELOBJ) to $(LIBLINUX)/lib$(MAINLIBNAME).a
	ar rcs $(LIBLINUX)/lib$(MAINLIBNAME).a $(ARCHIVELOBJ)

buildandroidarchive:
	@echo Building archive from $(ARCHIVEAOBJ) to $(LIBANDROID)/lib$(MAINLIBNAME).a
	arm-linux-gnueabi-ar rcs $(LIBANDROID)/lib$(MAINLIBNAME).a $(ARCHIVEAOBJ)

buildwindowsarchive:
	@echo Building archive from $(ARCHIVEWOBJ) to $(LIBWINDOWS)/lib$(MAINLIBNAME).lib
	ar rcs $(LIBWINDOWS)/lib$(MAINLIBNAME).lib $(ARCHIVEWOBJ)

buildmacosarchive:
	@echo Building archive from $(ARCHIVEMOBJ) to $(LIBMACOS)/lib$(MAINLIBNAME).a
	ar rcs $(LIBMACOS)/lib$(MAINLIBNAME).a $(ARCHIVEMOBJ)

listheaders:
	@echo Headers in $(INCDIR):
	@echo $(shell ls $(INCDIR)/*.h)

listobjects:
	@echo Objects in $(LIBDIR):
	@echo $(shell ls $(LIBDIR)/*.o)

listarchives:
	@echo Archives in $(LIBDIR):
	@echo $(shell ls $(LIBDIR)/*.a)

createlibdirs: \
	createlinuxlibdir \
	createandroidlibdir \
	createwindowslibdir \
	createmacoslibdir

createlinuxlibdir:
	$(call create_dir, $(LIBLINUX))

createandroidlibdir:
	$(call create_dir, $(LIBANDROID))

createwindowslibdir:
	$(call create_dir, $(LIBWINDOWS))

createmacoslibdir:
	$(call create_dir, $(LIBMACOS))
