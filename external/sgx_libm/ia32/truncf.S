/*
* Math library
*
* Copyright (C) 2016 Intel Corporation. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above copyright
*     notice, this list of conditions and the following disclaimer in
*     the documentation and/or other materials provided with the
*     distribution.
*   * Neither the name of Intel Corporation nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
* OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
* THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*
* Author Name <jingwei.zhang@intel.com>
*   History:
*   03-14-2016 Initial version. numerics svn rev. 12864
*/
	.file "truncf.c"
	.text
..TXTST0:
# -- Begin  truncf
	.text
       .align    16,0x90
	.globl truncf
truncf:
# parameter 1: 4 + %esp
..B1.1:
..L1:

        movl      4(%esp), %eax
        movl      %eax, %ecx
        andl      $2147483647, %ecx
        addl      $-1065353216, %ecx
        cmpl      $192937984, %ecx
        jb        ..B1.5
..B1.2:
        testl     %ecx, %ecx
        jl        ..B1.6
..B1.3:
        flds      4(%esp)
..B1.4:
        ret       
..B1.5:
        shrl      $23, %ecx
        movl      $-1, %edx
        negl      %ecx
        addl      $23, %ecx
        shll      %cl, %edx
        andl      %edx, %eax
        movl      %eax, 4(%esp)
        flds      4(%esp)
        ret       
..B1.6:
        andl      $-2147483648, %eax
        movl      %eax, 4(%esp)
        flds      4(%esp)
        ret       
        .align    16,0x90
	.type	truncf,@function
	.size	truncf,.-truncf
	.data
# -- End  truncf
	.data
	.section .note.GNU-stack, ""
# End
