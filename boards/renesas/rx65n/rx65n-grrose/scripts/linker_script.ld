/****************************************************************************
 * boards/renesas/rx65n/rx65n-grrose/scripts/linker_script.ld
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.  The
 * ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 ****************************************************************************/

MEMORY
{
/*	RSK-RX65N-1MB */
/*
	RAM : ORIGIN = 0x0, LENGTH = 262144
	ROM : ORIGIN = 0xFFF00000, LENGTH = 1048576
	OFS : ORIGIN = 0xFE7F5D00, LENGTH = 256
*/
/*	RSK-RX65N-2MB | GR-ROSE */
	RAM : ORIGIN = 0x0, LENGTH = 262144
	RAMHI : ORIGIN = 0x800000, LENGTH = 393216
	ROM : ORIGIN = 0xFFE00000, LENGTH = 2097152
	OFS : ORIGIN = 0xFE7F5D00, LENGTH = 256
}
SECTIONS
{
	.exvectors 0xFFFFFF80: AT(0xFFFFFF80)
	{
		_exvectors_start = .;
		KEEP(*(.exvectors))
		_exvectors_end = .;
	} > ROM
	.fvectors 0xFFFFFFFC: AT(0xFFFFFFFC)
	{
		KEEP(*(.fvectors))
	} > ROM
/*	RSK-RX65N-1MB */

/*	.text 0xFFF00000: AT(0xFFF00000) */

/*	RSK-RX65N-2MB | GR-ROSE */
	.text 0xFFE00000: AT(0xFFE00000)
	{
		*(.text)
		. = ALIGN(4);
		*(.text.*)
		. = ALIGN(4);
		*(P)
		etext = .;
	} > ROM
	.rvectors :
	{
		_rvectors_start = .;
		KEEP(*(.rvectors))
		_rvectors_end = .;
	} > ROM
	/*.exvectors :
	{
		_exvectors_start = .;
		KEEP(*(.exvectors))
		_exvectors_end = .;
	} > ROM */
	.init :
	{
		KEEP(*(.init))
		__preinit_array_start = .;
		KEEP(*(.preinit_array))
		__preinit_array_end = .;
		__init_array_start = (. + 3) & ~ 3;
		KEEP(*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
		KEEP(*(.init_array EXCLUDE_FILE(*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o) .ctors))
		__init_array_end = .;
		__fini_array_start = .;
		KEEP(*(.fini_array))
		KEEP(*(SORT(.fini_array.*)))
		__fini_array_end = .;
	} > ROM
	.fini :
	{
		KEEP(*(.fini))
	} > ROM
	.got :
	{
		*(.got)
		*(.got.plt)
	} > ROM
	.rodata :
	{
		*(.rodata)
		*(.rodata.*)
		*(C_1)
		*(C_2)
		*(C)
		_erodata = .;
	} > ROM
	.eh_frame_hdr :
	{
		*(.eh_frame_hdr)
	} > ROM
	.eh_frame :
	{
		*(.eh_frame)
	} > ROM
	.jcr :
	{
		*(.jcr)
	} > ROM
	.tors :
	{
		__CTOR_LIST__ = .;
		. = ALIGN(2);
		___ctors = .;
		*(.ctors)
		___ctors_end = .;
		__CTOR_END__ = .;
		__DTOR_LIST__ = .;
		___dtors = .;
		*(.dtors)
		___dtors_end = .;
		__DTOR_END__ = .;
		. = ALIGN(2);
		_mdata = .;
	} > ROM
	.ustack 0x400: AT(0x200)
	{
		_ustack = .;
	} > RAM
	.istack 0x200: AT(0x200)
	{
		_istack = .;
	} > RAM
	.data 0x404: AT(_mdata)
	{
		_data = .;
		*(.data)
		*(.data.*)
		*(D)
		*(D_1)
		*(D_2)
		_edata = .;
	} > RAM
	.gcc_exc :
	{
		*(.gcc_exc)
	} > RAM
	.bss :
	{
		_bss = .;
		*(.bss)
		*(.bss.**)
		*(COMMON)
		*(B)
		*(B_1)
		*(B_2)
		_ebss = .;
		_end = .;
	} >RAM
	.ofs1 0xFE7F5D40: AT(0xFE7F5D00)
	{
		KEEP(*(.ofs1))
	} > OFS
	.ofs2 0xFE7F5D48: AT(0xFE7F5D10)
	{
		KEEP(*(.ofs2))
	} > OFS
	.ofs3 0xFE7F5D50: AT(0xFE7F5D40)
	{
		KEEP(*(.ofs3))
	} > OFS
	.ofs4 0xFE7F5D10: AT(0xFE7F5D48)
	{
		KEEP(*(.ofs4))
	} > OFS
	.ofs5 0xFE7F5D10: AT(0xFE7F5D50)
	{
		KEEP(*(.ofs5))
	} > OFS
	.ofs6 0xFE7F5D10: AT(0xFE7F5D64)
	{
		KEEP(*(.ofs6))
	} > OFS
	.ofs7 0xFE7F5D10: AT(0xFE7F5D70)
	{
		KEEP(*(.ofs7))
	} > OFS
}
