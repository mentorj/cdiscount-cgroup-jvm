# cdiscount-cgroup-jvm
A small demo about JVM heuristics tweak inside docker containers


## Creer un numcpus.c  allant chercher dans son environnement un parametre

#include <stdlib.h>
#include <unistd.h>

int JVM_ActiveProcessorCount(void) {
    char* val = getenv("_NUM_CPUS");
    return val != NULL ? atoi(val) : sysconf(_SC_NPROCESSORS_ONLN);
}

## Compilation de ce fichier 

gcc -O3 -fPIC -shared -Wl,-soname,libnumcpus.so -o libnumcpus.so numcpus.c


## Creation d'une classe de test Java
package demo;

public class NumProcessors{
  public static void main(String[] args){
    System.out.println("Core seen by this JVM = " + Runtime.getRuntime().availableProcessors());
  }
}

## Compilation de la classe 
javac demo/NumProcessors.java

## Lancement de la demo:
Se placer dans le bon repertoire (la ou est generee la lib .so)
LD_PRELOAD=./libnumcpus.so  _NUM_CPUS=2 java demo.NumProcessors
Core seen by this JVM = 2
