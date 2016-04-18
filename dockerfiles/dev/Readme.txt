

Usage:

	docker run --rm -v $(pwd):/app vmizoules/dev

(tip: make and alias on this line, for example 'ubuntu')

Available commands: (add at the end of the docker run command)

  * make
  * gcc
  * g++
  * java
  * javac
  * dos2unix
  * and basic linux commands (ls, cat, ./exec)

Exemple:

	ubuntu g++ myprog.cpp -o runnable
	ubuntu ./runnable


