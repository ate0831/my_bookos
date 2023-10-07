 /*Memory lay/* Memory layout of the LM 3 S 6965 microcontroller */ 
 /* 1 K = 1 KiBi = 1024 bytes */ 
 MEMORY 
 { 
   FLASH : ORIGIN = 0 x 00000000, LENGTH = 256 K 
   RAM : ORIGIN = 0 x 20000000, LENGTH = 64 K 
 }
 /* The entry point is the reset handler */
 ENTRY( Reset); 

 EXTERN( RESET_ VECTOR); 

 SECTIONS 
 {
    .vector_ table ORIGIN( FLASH) : 
    { 
       /* First entry: initial Stack Pointer value */ 
       LONG( ORIGIN( RAM) + LENGTH( RAM)); 
       /* Second entry: reset vector */ 
       KEEP(*(. vector_ table. reset_ vector)); 
    } > FLASH 

    .text : 
    { 
      *(.text .text.*);
    } > FLASH 
    
    /DISCARD/ : 
    { 
      *(.ARM. exidx .ARM. exidx.*); 
    } 
}

MEMORY
{
   FLASH:ORIGIN = 0x00000000 + 16K, LENGTH = 512K - 16K
   RAM:ORIGIN =   0x20000000        LENGTH = 192K
}
