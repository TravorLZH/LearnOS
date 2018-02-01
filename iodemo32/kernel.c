/* Program 5.1 Embedded assembly demo and IO registers manipulation */
#include "basic_io.h"

int main(void){
	__asm__("mov $0xb8000,%edx");
	__asm__("mov $65,%al");
	__asm__("mov $0xF,%ah");
	__asm__("mov %ax,(%edx)");
}
