#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "alt_types.h"
#include "io.h"
#include "unistd.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "sys/alt_sys_init.h"


int cnt = 0;			// Calcul le nombre

static void TIMER_IRQ(void *Context)
{
	if(cnt < 999){
		int2seg(cnt);
		cnt ++ ;	
	}else{
		cnt = 0;
	}
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0b01);
}

// nombre => 3 bits Seg
void int2seg(int nbr)
{
	int i,j,k = 0;
	
	i = nbr % 10;			// digit
	j = nbr/10 % 10;		// 10 digit
	k = nbr/100 % 10;		// 100 digit

	IOWR_ALTERA_AVALON_PIO_DATA(SEG1_BASE,i);
	IOWR_ALTERA_AVALON_PIO_DATA(SEG2_BASE,j);
	IOWR_ALTERA_AVALON_PIO_DATA(SEG3_BASE,k);
}

int main()
{
	alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID,TIMER_0_IRQ, TIMER_IRQ,NULL,NULL);
	return 0;
}