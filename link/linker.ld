ENTRY(_start)
PHDRS { 
  text PT_LOAD; 
  data PT_LOAD; 
}

SECTIONS {
  /* _pmem_start and _entry_offset are defined in LDFLAGS */
  . = _pmem_start + _entry_offset;
  
  .text : {
    *(entry)
    *(.text*)
  } : text
  etext = .;
  _etext = .;
  
  .rodata : {
    *(.rodata*)
  }

  .data : {
    __data_start = .; 
    *(.data)
    __data_end = .;  
  } : data
  edata = .;
  _data = .;

  .bss : {
    __bss_start = .; 
    *(.bss*)
    *(.sbss*)
    *(.scommon)
    __bss_end = .; 
  }

  __global_pointer$ = _pmem_start + 0x100; 

  _stack_top = ALIGN(0x1000);
  . = _stack_top + 0x8000;
  _stack_pointer = .;

  end = .;
  _end = .;
  _heap_start = ALIGN(0x1000);
}
