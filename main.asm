;
; segment_and_digital_test.asm
;
; Created: 10/27/2021 7:03:18 PM
; Author : vish7
;

; Replace with your application code
Start:
  ldi r16, 0xFF
  out VPORTD_DIR, r16 ;all of port will be output
  ldi r16, 0xF0
  out VPORTA_DIR, r16 ;4 most significant bits will be output
  ldi r16, 0x01
  out VPORTE_DIR, r16 ;PE1 will be output

loop:
  ldi r16, 0x70 ;light up digit 1
  ldi r17, 0x00
  out VPORTA_OUT, r16
  out VPORTD_OUT, r17
  ldi r18, 0x00
  rcall one_sec_delay ;delays for 1 second, then goes to next command light up digit 2
  ldi r16, 0xB0
  out VPORTA_OUT, r16
  out VPORTD_OUT, r17
  ldi r18, 0x00
  rcall one_sec_delay ;light up digit 3
  ldi r16, 0xD0
  out VPORTA_OUT, r16
  out VPORTD_OUT, r17
  ldi r18, 0x00
  rcall one_sec_delay ;light up digit 4
  ldi r16, 0xE0
  out VPORTA_OUT, r16
  out VPORTD_OUT, r17
  ldi r18, 0x00
  call one_sec_delay
  rjmp loop ;starts lighting up digit again

one_sec_delay:
  cpi r18, 0x28 ; .0255 * 40 = 1
  brne delay
  ret

delay:
var_delay:
  inc r18
  rjmp one_sec_delay
