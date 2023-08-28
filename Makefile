JAVAC=/usr/bin/javac
JAVA=/usr/bin/java
.SUFFIXES: .java .class

SRCDIR=src/clubSimulation
BINDIR=bin
SRCDIRX=./src
DOCDIR=./java_doc
SOURCELIST=$(shell find $(SRCDIRX) -name '*.java' | sed "s.[.]/,,g")

$(BINDIR)/%.class:$(SRCDIR)/%.java
	$(JAVAC) -d $(BINDIR)/ -cp $(BINDIR) $<

CLASSES = PeopleCounter.class GridBlock.class PeopleLocation.class ClubGrid.class Clubgoer.class ClubView.class CounterDisplay.class ClubSimulation.class
CLASS_FILES=$(CLASSES:%.class=$(BINDIR)/%.class)

default: $(CLASS_FILES)

clean:
	rm $(BINDIR)/clubSimulation/*.class
	@if [ -d $(DOCDIR) ]; then rm -r $(DOCDIR); fi;

run: $(CLASS_FILES)
	$(JAVA) -cp bin clubSimulation.ClubSimulation 40 20 20 30