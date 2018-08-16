# A simple makefile example
SOURCE  := $(wildcard *.c) $(wildcard *.cpp)
OBJS    := $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SOURCE)))

TARGET  :=
CC      :=
CXX	:=
DEFINES :=
INCLUDE :=
LIBS    +=
CFLAGS  += -g -Wall -O3 $(DEFINES) $(INCLUDE) -std=c++11
LDFLAGS := 
CXXFLAGS：= $(CFLAGS) -DHAVE_CONFIG_H
  
.PHONY : everything objs clean distclean rebuild
  
all : $(TARGET)
  
objs : $(OBJS)
  
rebuild: distclean all
                
clean :
	rm -rf *~
	rm -rf *.o
    
distclean : clean
	rm -rf $(TARGET)
  
$(TARGET) : $(OBJS)
	$(CC) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
