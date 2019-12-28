	.text
	.file	"posix_allocator.cpp"
	.section	.text.halide_default_malloc,"ax",@progbits
	.weak	halide_default_malloc   // -- Begin function halide_default_malloc
	.p2align	2
	.type	halide_default_malloc,@function
halide_default_malloc:                  // @halide_default_malloc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	add	x0, x1, #128            // =128
	mov	x29, sp
	bl	malloc
	cbz	x0, .LBB0_2
// %bb.1:                               // %if.end
	add	x9, x0, #135            // =135
	mov	x8, x0
	and	x0, x9, #0xffffffffffffff80
	stur	x8, [x0, #-8]
.LBB0_2:                                // %cleanup
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	halide_default_malloc, .Lfunc_end0-halide_default_malloc
                                        // -- End function
	.section	.text.halide_default_free,"ax",@progbits
	.weak	halide_default_free     // -- Begin function halide_default_free
	.p2align	2
	.type	halide_default_free,@function
halide_default_free:                    // @halide_default_free
// %bb.0:                               // %entry
	ldur	x0, [x1, #-8]
	b	free
.Lfunc_end1:
	.size	halide_default_free, .Lfunc_end1-halide_default_free
                                        // -- End function
	.section	.text.halide_set_custom_malloc,"ax",@progbits
	.weak	halide_set_custom_malloc // -- Begin function halide_set_custom_malloc
	.p2align	2
	.type	halide_set_custom_malloc,@function
halide_set_custom_malloc:               // @halide_set_custom_malloc
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal13custom_mallocE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal13custom_mallocE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end2:
	.size	halide_set_custom_malloc, .Lfunc_end2-halide_set_custom_malloc
                                        // -- End function
	.section	.text.halide_set_custom_free,"ax",@progbits
	.weak	halide_set_custom_free  // -- Begin function halide_set_custom_free
	.p2align	2
	.type	halide_set_custom_free,@function
halide_set_custom_free:                 // @halide_set_custom_free
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal11custom_freeE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal11custom_freeE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end3:
	.size	halide_set_custom_free, .Lfunc_end3-halide_set_custom_free
                                        // -- End function
	.section	.text.halide_malloc,"ax",@progbits
	.weak	halide_malloc           // -- Begin function halide_malloc
	.p2align	2
	.type	halide_malloc,@function
halide_malloc:                          // @halide_malloc
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13custom_mallocE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13custom_mallocE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end4:
	.size	halide_malloc, .Lfunc_end4-halide_malloc
                                        // -- End function
	.section	.text.halide_free,"ax",@progbits
	.weak	halide_free             // -- Begin function halide_free
	.p2align	2
	.type	halide_free,@function
halide_free:                            // @halide_free
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal11custom_freeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal11custom_freeE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end5:
	.size	halide_free, .Lfunc_end5-halide_free
                                        // -- End function
	.section	.text.halide_default_error,"ax",@progbits
	.weak	halide_default_error    // -- Begin function halide_default_error
	.p2align	2
	.type	halide_default_error,@function
halide_default_error:                   // @halide_default_error
// %bb.0:                               // %entry
	stp	x28, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	sub	sp, sp, #1, lsl #12     // =4096
	mov	x21, sp
	adrp	x2, .L.str
	mov	x20, x1
	mov	x19, x0
	add	x1, x21, #4094          // =4094
	add	x2, x2, :lo12:.L.str
	mov	x0, sp
	bl	halide_string_to_string
	add	x1, x0, #4094           // =4094
	mov	x2, x20
	bl	halide_string_to_string
	ldurb	w8, [x0, #-1]
	cmp	w8, #10                 // =10
	b.eq	.LBB6_2
// %bb.1:                               // %if.then
	mov	w8, #10
	strh	w8, [x0], #1
.LBB6_2:                                // %if.end
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x1, sp
	mov	x0, x19
	bl	halide_msan_annotate_memory_is_initialized
	mov	x1, sp
	mov	x0, x19
	bl	halide_print
	bl	abort
	add	sp, sp, #1, lsl #12     // =4096
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end6:
	.size	halide_default_error, .Lfunc_end6-halide_default_error
                                        // -- End function
	.section	.text.halide_error,"ax",@progbits
	.weak	halide_error            // -- Begin function halide_error
	.p2align	2
	.type	halide_error,@function
halide_error:                           // @halide_error
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13error_handlerE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13error_handlerE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end7:
	.size	halide_error, .Lfunc_end7-halide_error
                                        // -- End function
	.section	.text.halide_set_error_handler,"ax",@progbits
	.weak	halide_set_error_handler // -- Begin function halide_set_error_handler
	.p2align	2
	.type	halide_set_error_handler,@function
halide_set_error_handler:               // @halide_set_error_handler
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal13error_handlerE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal13error_handlerE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end8:
	.size	halide_set_error_handler, .Lfunc_end8-halide_set_error_handler
                                        // -- End function
	.section	.text.halide_print,"ax",@progbits
	.weak	halide_print            // -- Begin function halide_print
	.p2align	2
	.type	halide_print,@function
halide_print:                           // @halide_print
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal12custom_printE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal12custom_printE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end9:
	.size	halide_print, .Lfunc_end9-halide_print
                                        // -- End function
	.section	.text.halide_set_custom_print,"ax",@progbits
	.weak	halide_set_custom_print // -- Begin function halide_set_custom_print
	.p2align	2
	.type	halide_set_custom_print,@function
halide_set_custom_print:                // @halide_set_custom_print
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal12custom_printE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal12custom_printE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end10:
	.size	halide_set_custom_print, .Lfunc_end10-halide_set_custom_print
                                        // -- End function
	.section	.text.halide_start_clock,"ax",@progbits
	.weak	halide_start_clock      // -- Begin function halide_start_clock
	.p2align	2
	.type	halide_start_clock,@function
halide_start_clock:                     // @halide_start_clock
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:halide_reference_clock_inited
	ldr	x19, [x19, :got_lo12:halide_reference_clock_inited]
	add	x29, sp, #16            // =16
	ldrb	w8, [x19]
	cbz	w8, .LBB11_2
// %bb.1:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB11_2:                               // %if.then
	adrp	x2, :got:halide_reference_clock
	ldr	x2, [x2, :got_lo12:halide_reference_clock]
	mov	w0, #113
	mov	w1, wzr
	bl	syscall
	mov	w8, #1
	strb	w8, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end11:
	.size	halide_start_clock, .Lfunc_end11-halide_start_clock
                                        // -- End function
	.section	.text.halide_current_time_ns,"ax",@progbits
	.weak	halide_current_time_ns  // -- Begin function halide_current_time_ns
	.p2align	2
	.type	halide_current_time_ns,@function
halide_current_time_ns:                 // @halide_current_time_ns
// %bb.0:                               // %entry
	sub	sp, sp, #32             // =32
	mov	x2, sp
	mov	w0, #113
	mov	w1, wzr
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	syscall
	adrp	x8, :got:halide_reference_clock
	ldr	q0, [sp]
	ldr	x8, [x8, :got_lo12:halide_reference_clock]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w10, #51712
	movk	w10, #15258, lsl #16
	ldr	q1, [x8]
	sub	v0.2d, v0.2d, v1.2d
	mov	x8, v0.d[1]
	fmov	x9, d0
	madd	x0, x9, x10, x8
	add	sp, sp, #32             // =32
	ret
.Lfunc_end12:
	.size	halide_current_time_ns, .Lfunc_end12-halide_current_time_ns
                                        // -- End function
	.section	.text.halide_sleep_ms,"ax",@progbits
	.weak	halide_sleep_ms         // -- Begin function halide_sleep_ms
	.p2align	2
	.type	halide_sleep_ms,@function
halide_sleep_ms:                        // @halide_sleep_ms
// %bb.0:                               // %entry
	mov	w8, #1000
	mul	w0, w1, w8
	b	usleep
.Lfunc_end13:
	.size	halide_sleep_ms, .Lfunc_end13-halide_sleep_ms
                                        // -- End function
	.section	.text.halide_default_print,"ax",@progbits
	.weak	halide_default_print    // -- Begin function halide_default_print
	.p2align	2
	.type	halide_default_print,@function
halide_default_print:                   // @halide_default_print
// %bb.0:                               // %entry
	adrp	x8, .L.str.5
	add	x8, x8, :lo12:.L.str.5
	adrp	x2, .L.str.1
	add	x2, x2, :lo12:.L.str.1
	mov	w0, #4
	mov	x3, x1
	mov	x1, x8
	b	__android_log_print
.Lfunc_end14:
	.size	halide_default_print, .Lfunc_end14-halide_default_print
                                        // -- End function
	.section	.text.halide_host_cpu_count,"ax",@progbits
	.weak	halide_host_cpu_count   // -- Begin function halide_host_cpu_count
	.p2align	2
	.type	halide_host_cpu_count,@function
halide_host_cpu_count:                  // @halide_host_cpu_count
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	w0, #97
	mov	x29, sp
	bl	sysconf
                                        // kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end15:
	.size	halide_host_cpu_count, .Lfunc_end15-halide_host_cpu_count
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal19halide_thread_yieldEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv // -- Begin function _ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv,@function
_ZN6Halide7Runtime8Internal19halide_thread_yieldEv: // @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
// %bb.0:                               // %entry
	b	sched_yield
.Lfunc_end16:
	.size	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv, .Lfunc_end16-_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
                                        // -- End function
	.section	.text.halide_default_do_task,"ax",@progbits
	.weak	halide_default_do_task  // -- Begin function halide_default_do_task
	.p2align	2
	.type	halide_default_do_task,@function
halide_default_do_task:                 // @halide_default_do_task
// %bb.0:                               // %entry
	mov	x4, x1
	mov	w1, w2
	mov	x2, x3
	br	x4
.Lfunc_end17:
	.size	halide_default_do_task, .Lfunc_end17-halide_default_do_task
                                        // -- End function
	.section	.text.halide_default_do_loop_task,"ax",@progbits
	.weak	halide_default_do_loop_task // -- Begin function halide_default_do_loop_task
	.p2align	2
	.type	halide_default_do_loop_task,@function
halide_default_do_loop_task:            // @halide_default_do_loop_task
// %bb.0:                               // %entry
	mov	x6, x1
	mov	w1, w2
	mov	w2, w3
	mov	x3, x4
	mov	x4, x5
	br	x6
.Lfunc_end18:
	.size	halide_default_do_loop_task, .Lfunc_end18-halide_default_do_loop_task
                                        // -- End function
	.section	.text.halide_default_do_par_for,"ax",@progbits
	.weak	halide_default_do_par_for // -- Begin function halide_default_do_par_for
	.p2align	2
	.type	halide_default_do_par_for,@function
halide_default_do_par_for:              // @halide_default_do_par_for
// %bb.0:                               // %entry
	cmp	w3, #1                  // =1
	b.lt	.LBB19_2
// %bb.1:                               // %if.end
	sub	sp, sp, #160            // =160
	mov	x8, sp
	str	x19, [sp, #128]         // 8-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	stp	xzr, x4, [sp]
	stp	w3, wzr, [sp, #40]
	strb	wzr, [sp, #48]
	stp	wzr, w2, [sp, #32]
	stp	xzr, xzr, [sp, #16]
	stp	x0, xzr, [sp, #104]
	stur	xzr, [sp, #117]
	str	wzr, [sp, #80]
	str	x8, [sp, #72]
	str	x1, [sp, #56]
	str	xzr, [sp, #88]
	adrp	x19, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	add	x29, sp, #144           // =144
	mov	x0, x19
	bl	halide_mutex_lock
	mov	x1, sp
	mov	w0, #1
	mov	x2, xzr
	bl	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	mov	x0, sp
	bl	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	mov	x0, x19
	bl	halide_mutex_unlock
	ldr	w0, [sp, #116]
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldr	x19, [sp, #128]         // 8-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB19_2:
	mov	w0, wzr
	ret
.Lfunc_end19:
	.size	halide_default_do_par_for, .Lfunc_end19-halide_default_do_par_for
                                        // -- End function
	.section	.text.halide_mutex_lock,"ax",@progbits
	.weak	halide_mutex_lock       // -- Begin function halide_mutex_lock
	.p2align	2
	.type	halide_mutex_lock,@function
halide_mutex_lock:                      // @halide_mutex_lock
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	ldaxr	x8, [x0]
	mov	x19, x0
	add	x29, sp, #96            // =96
	cbz	x8, .LBB20_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	b	.LBB20_3
.LBB20_2:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x19]
	cbz	w9, .LBB20_20
.LBB20_3:                               // %if.then.i.critedge
	adrp	x20, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x21, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	adrp	x22, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x23, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x9, [x19]
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	mov	w8, #40
.LBB20_4:                               // %while.cond.outer.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB20_8 Depth 2
	tbz	w9, #0, .LBB20_8
.LBB20_5:                               //   in Loop: Header=BB20_4 Depth=1
	mov	x10, x9
	b	.LBB20_10
.LBB20_6:                               // %cmpxchg.nostore3
                                        //   in Loop: Header=BB20_8 Depth=2
	clrex
.LBB20_7:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.critedge
                                        //   in Loop: Header=BB20_8 Depth=2
	mov	x9, x10
	tbnz	w10, #0, .LBB20_10
.LBB20_8:                               // %if.then.i.i
                                        //   Parent Loop BB20_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	x10, [x19]
	cmp	x10, x9
	b.ne	.LBB20_6
// %bb.9:                               // %cmpxchg.trystore6
                                        //   in Loop: Header=BB20_8 Depth=2
	orr	x9, x9, #0x1
	stxr	w11, x9, [x19]
	cbnz	w11, .LBB20_7
	b	.LBB20_20
.LBB20_10:                              // %if.end4.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	tbnz	w10, #1, .LBB20_14
// %bb.11:                              // %land.lhs.true.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	subs	w24, w8, #1             // =1
	b.ge	.LBB20_16
// %bb.12:                              // %if.then12.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	ldxr	x9, [x19]
	cmp	x9, x10
	b.ne	.LBB20_19
.LBB20_13:                              // %cmpxchg.trystore16
                                        //   in Loop: Header=BB20_4 Depth=1
	orr	x10, x10, #0x2
	stxr	w11, x10, [x19]
	cbnz	w11, .LBB20_4
.LBB20_14:                              // %if.end21.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	add	x1, sp, #8              // =8
	mov	x0, x19
	stp	x20, x23, [sp, #16]
	stp	x21, x19, [sp, #32]
	str	x22, [sp, #8]
	bl	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	cmp	x0, x19
	b.eq	.LBB20_20
// %bb.15:                              // %if.end26.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	ldr	x9, [x19]
	mov	w8, #40
	tbz	w9, #0, .LBB20_8
	b	.LBB20_5
.LBB20_16:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	cmp	w24, #1                 // =1
	b.lt	.LBB20_18
// %bb.17:                              // %if.then7.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	bl	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	ldr	x9, [x19]
	mov	w8, w24
	tbz	w9, #0, .LBB20_8
	b	.LBB20_5
.LBB20_18:                              //   in Loop: Header=BB20_4 Depth=1
	mov	w8, wzr
	ldxr	x9, [x19]
	cmp	x9, x10
	b.eq	.LBB20_13
.LBB20_19:                              // %cmpxchg.nostore13
                                        //   in Loop: Header=BB20_4 Depth=1
	clrex
	tbz	w9, #0, .LBB20_8
	b	.LBB20_5
.LBB20_20:                              // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.Lfunc_end20:
	.size	halide_mutex_lock, .Lfunc_end20-halide_mutex_lock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_ // -- Begin function _ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,@function
_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_: // @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	adrp	x23, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x19, x2
	mov	x20, x1
	mov	w21, w0
	ldrb	w8, [x23, #2121]
	add	x29, sp, #96            // =96
	cbz	w8, .LBB21_11
// %bb.1:                               // %if.end4
	cmp	w21, #1                 // =1
	b.lt	.LBB21_19
.LBB21_2:                               // %for.body.preheader
	mov	w8, wzr
	mov	w25, wzr
	mov	w24, wzr
	mov	w9, wzr
	mov	w10, w21
	add	x11, x20, #48           // =48
	mov	w26, #-1
	b	.LBB21_4
.LBB21_3:                               // %if.then23
                                        //   in Loop: Header=BB21_4 Depth=1
	add	w26, w26, #1            // =1
	subs	x10, x10, #1            // =1
	add	x11, x11, #128          // =128
	b.eq	.LBB21_6
.LBB21_4:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	ldur	w13, [x11, #-16]
	ldrb	w14, [x11]
	cmp	w12, #0                 // =0
	csinc	w9, w9, wzr, ne
	csinc	w25, w25, wzr, eq
	cmp	w13, #0                 // =0
	add	w8, w12, w8
	csinc	w24, w24, wzr, eq
	cbnz	w14, .LBB21_3
// %bb.5:                               // %if.else24
                                        //   in Loop: Header=BB21_4 Depth=1
	ldur	w12, [x11, #-8]
	add	w26, w12, w26
	subs	x10, x10, #1            // =1
	add	x11, x11, #128          // =128
	b.ne	.LBB21_4
.LBB21_6:                               // %for.cond.cleanup.loopexit
	and	w22, w9, #0x1
	cbz	x19, .LBB21_20
.LBB21_7:                               // %if.else54
	ldr	w10, [x19, #96]
	ldr	w9, [x19, #44]
	ldr	w11, [x19, #112]
	neg	w10, w10
	madd	w9, w11, w9, w10
	cmp	w8, w9
	b.le	.LBB21_9
// %bb.8:                               // %if.then59
	adrp	x1, .L.str.3
	add	x1, x1, :lo12:.L.str.3
	mov	x0, xzr
	bl	halide_print
	bl	abort
.LBB21_9:                               // %if.end60
	orr	w8, w25, w24
	tbz	w8, #0, .LBB21_27
// %bb.10:                              // %if.then64
	ldr	w8, [x19, #96]
	add	w8, w8, #1              // =1
	str	w8, [x19, #96]
	cmp	w21, #1                 // =1
	b.ge	.LBB21_28
	b	.LBB21_31
.LBB21_11:                              // %land.rhs.i.preheader
	add	x8, x23, #12            // =12
.LBB21_12:                              // %land.rhs.i
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x8]
	cbnz	w9, .LBB21_14
// %bb.13:                              // %while.body.i
                                        //   in Loop: Header=BB21_12 Depth=1
	add	x8, x8, #1              // =1
	add	x9, x23, #2128          // =2128
	cmp	x8, x9
	b.lo	.LBB21_12
.LBB21_14:                              // %while.end.i
	add	x9, x23, #2128          // =2128
	cmp	x8, x9
	b.eq	.LBB21_16
// %bb.15:                              // %if.then.i
	adrp	x1, .L.str.7
	add	x1, x1, :lo12:.L.str.7
	mov	x0, xzr
	bl	halide_print
	bl	abort
.LBB21_16:                              // %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
	ldr	w0, [x23, #8]
	cbnz	w0, .LBB21_18
// %bb.17:                              // %if.then2
	bl	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	str	w0, [x23, #8]
.LBB21_18:                              // %if.end
	bl	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	mov	w8, #1
	str	w0, [x23, #8]
	strb	w8, [x23, #2121]
	cmp	w21, #1                 // =1
	b.ge	.LBB21_2
.LBB21_19:
	mov	w22, wzr
	mov	w24, wzr
	mov	w25, wzr
	mov	w8, wzr
	mov	w26, #-1
	cbnz	x19, .LBB21_7
.LBB21_20:                              // %if.then32
	ldr	w9, [x23, #24]
	orr	w28, w25, w24
	str	w22, [sp, #12]          // 4-byte Folded Spill
	cmp	w9, #255                // =255
	b.gt	.LBB21_25
// %bb.21:                              // %land.rhs.preheader
	adrp	x22, :got:_ZN6Halide7Runtime8Internal13worker_threadEPv
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal13worker_threadEPv]
	and	w10, w28, #0x1
	add	w27, w8, w10
	ldr	w8, [x23, #8]
	sub	w8, w8, #1              // =1
	cmp	w9, w8
	b.ge	.LBB21_24
.LBB21_22:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x23, #28]
	mov	x0, x22
	mov	x1, xzr
	add	w8, w8, #1              // =1
	str	w8, [x23, #28]
	bl	halide_spawn_thread
	ldrsw	x8, [x23, #24]
	add	w9, w8, #1              // =1
	add	x8, x23, x8, lsl #3
	cmp	w9, #256                // =256
	str	w9, [x23, #24]
	str	x0, [x8, #72]
	b.ge	.LBB21_25
// %bb.23:                              // %land.rhs
                                        //   in Loop: Header=BB21_22 Depth=1
	ldr	w8, [x23, #8]
	sub	w8, w8, #1              // =1
	cmp	w9, w8
	b.lt	.LBB21_22
.LBB21_24:                              // %lor.rhs
	ldr	w8, [x23, #2124]
	sub	w8, w9, w8
	add	w8, w8, #1              // =1
	cmp	w8, w27
	b.lt	.LBB21_22
.LBB21_25:                              // %while.end
	ldr	w22, [sp, #12]          // 4-byte Folded Reload
	tbz	w28, #0, .LBB21_27
// %bb.26:                              // %if.then51
	ldr	w8, [x23, #2124]
	add	w8, w8, #1              // =1
	str	w8, [x23, #2124]
.LBB21_27:                              // %if.end68
	cmp	w21, #1                 // =1
	b.lt	.LBB21_31
.LBB21_28:                              // %for.body74.preheader
	ldr	x10, [x23, #16]
	sxtw	x8, w21
	sbfiz	x9, x21, #7, #32
.LBB21_29:                              // %for.body74
                                        // =>This Inner Loop Header: Depth=1
	sub	x8, x8, #1              // =1
	add	x11, x20, x9
	stp	x10, x20, [x11, #-64]
	sub	x10, x11, #128          // =128
	cmp	x8, #0                  // =0
	sub	x9, x9, #128            // =128
	stur	w21, [x11, #-48]
	stur	wzr, [x11, #-32]
	b.gt	.LBB21_29
// %bb.30:                              // %for.cond.cleanup73.loopexit
	str	x20, [x23, #16]
.LBB21_31:                              // %for.cond.cleanup73
	ldr	w8, [x23, #68]
	cbz	w8, .LBB21_40
// %bb.32:                              // %for.cond.cleanup73.if.then94_crit_edge
	ldr	w8, [x23, #24]
.LBB21_33:                              // %if.then94
	mov	w26, w8
.LBB21_34:                              // %if.end96
	add	x0, x23, #40            // =40
	str	w26, [x23, #32]
	bl	halide_cond_broadcast
	ldp	w8, w9, [x23, #28]
	cmp	w9, w8
	b.le	.LBB21_37
// %bb.35:                              // %if.then98
	add	x0, x23, #48            // =48
	bl	halide_cond_broadcast
	cbz	w22, .LBB21_37
// %bb.36:                              // %if.then100
	add	x0, x23, #56            // =56
	bl	halide_cond_broadcast
.LBB21_37:                              // %if.end102
	orr	w8, w25, w24
	tbz	w8, #0, .LBB21_43
// %bb.38:                              // %if.then106
	cbz	x19, .LBB21_42
// %bb.39:                              // %if.then108
	ldr	w8, [x19, #96]
	sub	w8, w8, #1              // =1
	str	w8, [x19, #96]
	b	.LBB21_43
.LBB21_40:                              // %lor.rhs88
	ldr	w9, [x23, #64]
	ldr	w8, [x23, #24]
	cmp	w26, w9
	b.gt	.LBB21_33
// %bb.41:                              // %lor.rhs88
	cmp	w9, w8
	b.ge	.LBB21_34
	b	.LBB21_33
.LBB21_42:                              // %if.else111
	ldr	w8, [x23, #2124]
	sub	w8, w8, #1              // =1
	str	w8, [x23, #2124]
.LBB21_43:                              // %if.end114
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.Lfunc_end21:
	.size	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_, .Lfunc_end21-_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE // -- Begin function _ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,@function
_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE: // @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x19, x0
	mov	w27, #1
	add	x29, sp, #80            // =80
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_1:                               // %if.then15
	str	w8, [x19, #116]
.LBB22_2:                               // %if.then257
	add	x0, x20, #56            // =56
	bl	halide_cond_broadcast
.LBB22_3:                               // %while.cond
	cbz	x19, .LBB22_14
.LBB22_4:                               // %cond.true
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_9 Depth 2
	ldr	w8, [x19, #40]
	cbnz	w8, .LBB22_6
// %bb.5:                               // %cond.end
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	w8, [x19, #112]
	cbz	w8, .LBB22_91
.LBB22_6:                               // %if.then
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	w8, [x19, #116]
	ldr	x21, [x20, #16]
	cbz	w8, .LBB22_11
// %bb.7:                               // %if.then3
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	w8, [x19, #112]
	cbnz	w8, .LBB22_16
// %bb.8:                               // %while.cond6.preheader
                                        //   in Loop: Header=BB22_4 Depth=1
	cmp	x21, x19
	add	x8, x21, #64            // =64
	b.eq	.LBB22_13
.LBB22_9:                               // %while.body8
                                        //   Parent Loop BB22_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x9, x8
	ldr	x8, [x8]
	cmp	x8, x19
	add	x8, x8, #64             // =64
	b.ne	.LBB22_9
// %bb.10:                              // %while.end
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	x8, [x8]
	str	x8, [x9]
	str	wzr, [x19, #40]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_11:                              // %if.else
	ldr	x8, [x19, #88]
	cbz	x8, .LBB22_16
// %bb.12:                              // %land.lhs.true
	ldr	w8, [x8, #116]
	cbnz	w8, .LBB22_1
	b	.LBB22_16
.LBB22_13:                              //   in Loop: Header=BB22_4 Depth=1
	add	x9, x20, #16            // =16
	ldr	x8, [x8]
	str	x8, [x9]
	str	wzr, [x19, #40]
	cbnz	x19, .LBB22_4
.LBB22_14:                              // %cond.false
	ldrb	w8, [x20, #2120]
	cbnz	w8, .LBB22_91
// %bb.15:                              // %while.body
	ldr	x21, [x20, #16]
.LBB22_16:                              // %if.end21
	cbz	x21, .LBB22_58
// %bb.17:                              // %while.body24.lr.ph
	add	x28, x20, #16           // =16
	cbnz	x19, .LBB22_19
	b	.LBB22_34
.LBB22_18:                              // %cleanup.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	x8, [x21, #64]!
	mov	x28, x21
	mov	x21, x8
	cbz	x8, .LBB22_58
.LBB22_19:                              // %while.body24.us
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_31 Depth 2
	ldr	x8, [x21, #88]
	cbz	x8, .LBB22_22
// %bb.20:                              // %if.else29.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w10, [x8, #112]
	ldr	w9, [x8, #44]
	cbz	w10, .LBB22_23
// %bb.21:                              // %if.else35.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x8, #96]
	neg	w8, w8
	madd	w8, w9, w10, w8
	b	.LBB22_24
.LBB22_22:                              // %if.then28.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x20, #24]
	ldr	w9, [x20, #2124]
	sub	w8, w8, w9
	add	w8, w8, #1              // =1
	b	.LBB22_24
.LBB22_23:                              // %if.then32.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x8, #96]
	sub	w8, w9, w8
.LBB22_24:                              // %if.end42.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w9, [x21, #44]
	ldr	x11, [x21, #72]
	ldrb	w10, [x21, #48]
	ldr	x12, [x19, #72]
	cbz	w10, .LBB22_26
// %bb.25:                              // %lor.rhs61.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w10, [x21, #112]
	cmp	w10, #0                 // =0
	cset	w10, eq
	b	.LBB22_27
.LBB22_26:                              //   in Loop: Header=BB22_19 Depth=1
	mov	w10, #1
.LBB22_27:                              // %lor.end64.us
                                        //   in Loop: Header=BB22_19 Depth=1
	cmp	w9, #0                  // =0
	cset	w13, ne
	cmp	x11, x12
	cset	w11, ne
	cmp	w8, w9
	b.lt	.LBB22_18
// %bb.28:                              // %lor.end64.us
                                        //   in Loop: Header=BB22_19 Depth=1
	and	w8, w13, w11
	tbnz	w8, #0, .LBB22_18
// %bb.29:                              // %lor.end64.us
                                        //   in Loop: Header=BB22_19 Depth=1
	cbz	w10, .LBB22_18
// %bb.30:                              // %if.then74.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	cmp	w8, w9
	b.ge	.LBB22_45
.LBB22_31:                              // %for.body.i.us
                                        //   Parent Loop BB22_19 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x21, #24]
	add	x8, x9, w8, sxtw #4
	ldr	x0, [x8]
	ldr	w1, [x8, #8]
	bl	halide_default_semaphore_try_acquire
	cbz	w0, .LBB22_18
// %bb.32:                              // %for.inc.i.us
                                        //   in Loop: Header=BB22_31 Depth=2
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	add	w8, w8, #1              // =1
	cmp	w8, w9
	str	w8, [x21, #120]
	b.lt	.LBB22_31
	b	.LBB22_45
.LBB22_33:                              // %cleanup
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	x8, [x21, #64]!
	mov	x28, x21
	mov	x21, x8
	cbz	x8, .LBB22_58
.LBB22_34:                              // %while.body24
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_40 Depth 2
	ldr	x8, [x21, #88]
	cbz	x8, .LBB22_42
// %bb.35:                              // %if.else29
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w10, [x8, #112]
	ldr	w9, [x8, #44]
	cbz	w10, .LBB22_44
// %bb.36:                              // %if.else35
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x8, #96]
	neg	w8, w8
	madd	w8, w9, w10, w8
	ldrb	w10, [x21, #48]
	ldr	w9, [x21, #44]
	cbz	w10, .LBB22_43
.LBB22_37:                              // %lor.rhs61
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w10, [x21, #112]
	cmp	w10, #0                 // =0
	cset	w10, eq
	cmp	w8, w9
	b.lt	.LBB22_33
.LBB22_38:                              // %lor.end64
                                        //   in Loop: Header=BB22_34 Depth=1
	cbz	w10, .LBB22_33
// %bb.39:                              // %if.then74
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	cmp	w8, w9
	b.ge	.LBB22_45
.LBB22_40:                              // %for.body.i
                                        //   Parent Loop BB22_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x21, #24]
	add	x8, x9, w8, sxtw #4
	ldr	x0, [x8]
	ldr	w1, [x8, #8]
	bl	halide_default_semaphore_try_acquire
	cbz	w0, .LBB22_33
// %bb.41:                              // %for.inc.i
                                        //   in Loop: Header=BB22_40 Depth=2
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	add	w8, w8, #1              // =1
	cmp	w8, w9
	str	w8, [x21, #120]
	b.lt	.LBB22_40
	b	.LBB22_45
.LBB22_42:                              // %if.then28
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x20, #24]
	ldr	w9, [x20, #2124]
	sub	w8, w8, w9
	add	w8, w8, #1              // =1
	ldrb	w10, [x21, #48]
	ldr	w9, [x21, #44]
	cbnz	w10, .LBB22_37
.LBB22_43:                              //   in Loop: Header=BB22_34 Depth=1
	mov	w10, #1
	cmp	w8, w9
	b.ge	.LBB22_38
	b	.LBB22_33
.LBB22_44:                              // %if.then32
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x8, #96]
	sub	w8, w9, w8
	ldrb	w10, [x21, #48]
	ldr	w9, [x21, #44]
	cbnz	w10, .LBB22_37
	b	.LBB22_43
.LBB22_45:                              // %if.end102
	ldr	w10, [x21, #112]
	ldr	x9, [x21, #88]
	ldr	w8, [x21, #44]
	str	wzr, [x21, #120]
	add	w10, w10, #1            // =1
	str	w10, [x21, #112]
	cbz	x9, .LBB22_64
// %bb.46:                              // %if.else111
	ldr	w10, [x9, #96]
	add	w8, w10, w8
	str	w8, [x9, #96]
	ldrb	w8, [x21, #48]
	cbz	w8, .LBB22_65
.LBB22_47:                              // %if.then121
	ldr	x8, [x21, #64]
	mov	x0, x20
	str	x8, [x28]
	bl	halide_mutex_unlock
	mov	w24, wzr
	mov	w23, #1
.LBB22_48:                              // %while.cond126.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_52 Depth 2
                                        //     Child Loop BB22_50 Depth 2
	ldr	w8, [x21, #40]
	sub	w9, w8, w24
	cmp	w9, w23
	b.le	.LBB22_55
// %bb.49:                              // %land.rhs.preheader
                                        //   in Loop: Header=BB22_48 Depth=1
	ldr	w9, [x21, #120]
	ldr	w10, [x21, #32]
	cmp	w9, w10
	b.lt	.LBB22_52
.LBB22_50:                              // %while.body132
                                        //   Parent Loop BB22_48 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	w23, w23, #1            // =1
	sub	w11, w8, w24
	mov	w9, wzr
	cmp	w11, w23
	str	wzr, [x21, #120]
	b.le	.LBB22_56
// %bb.51:                              // %land.rhs
                                        //   in Loop: Header=BB22_50 Depth=2
	cmp	w9, w10
	b.ge	.LBB22_50
.LBB22_52:                              // %for.body.i417
                                        //   Parent Loop BB22_48 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x8, [x21, #24]
	add	x8, x8, w9, sxtw #4
	ldr	x0, [x8]
	ldr	w1, [x8, #8]
	bl	halide_default_semaphore_try_acquire
	cbz	w0, .LBB22_55
// %bb.53:                              // %for.inc.i420
                                        //   in Loop: Header=BB22_52 Depth=2
	ldr	w8, [x21, #120]
	ldr	w10, [x21, #32]
	add	w9, w8, #1              // =1
	cmp	w9, w10
	str	w9, [x21, #120]
	b.lt	.LBB22_52
// %bb.54:                              // %while.body132.loopexit
                                        //   in Loop: Header=BB22_48 Depth=1
	ldr	w8, [x21, #40]
	b	.LBB22_50
.LBB22_55:                              // %while.end134
                                        //   in Loop: Header=BB22_48 Depth=1
	cbz	w23, .LBB22_60
.LBB22_56:                              // %if.end137
                                        //   in Loop: Header=BB22_48 Depth=1
	ldr	w8, [x21, #36]
	ldr	x0, [x21, #104]
	ldp	x1, x4, [x21]
	mov	w3, w23
	add	w2, w8, w24
	mov	x5, x21
	bl	halide_do_loop_task
	add	w24, w23, w24
	mov	w23, wzr
	cbz	w0, .LBB22_48
// %bb.57:
	mov	w22, w0
	mov	w23, wzr
	b	.LBB22_61
.LBB22_58:                              // %if.then88
	cbz	x19, .LBB22_69
// %bb.59:                              // %if.then90
	ldr	w8, [x20, #68]
	add	x0, x20, #56            // =56
	mov	x1, x20
	add	w8, w8, #1              // =1
	str	w8, [x20, #68]
	strb	w27, [x19, #124]
	bl	halide_cond_wait
	strb	wzr, [x19, #124]
	ldr	w8, [x20, #68]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #68]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_60:
	mov	w22, wzr
	mov	w23, #1
.LBB22_61:                              // %while.end144
	mov	x0, x20
	bl	halide_mutex_lock
	ldp	w8, w9, [x21, #36]
	add	w10, w8, w24
	sub	w8, w9, w24
	stp	w10, w8, [x21, #36]
	tbz	w23, #0, .LBB22_68
// %bb.62:                              // %if.else155
	cmp	w8, #1                  // =1
	b.lt	.LBB22_89
// %bb.63:                              // %if.then159
	ldr	x9, [x20, #16]
	mov	w8, wzr
	str	x9, [x21, #64]
	str	x21, [x20, #16]
	ldr	x10, [x21, #88]
	ldr	w9, [x21, #44]
	cbnz	x10, .LBB22_84
	b	.LBB22_90
.LBB22_64:                              // %if.then107
	ldr	w9, [x20, #2124]
	add	w8, w9, w8
	str	w8, [x20, #2124]
	ldrb	w8, [x21, #48]
	cbnz	w8, .LBB22_47
.LBB22_65:                              // %if.else163
	ldp	w23, w8, [x21, #36]
	ldp	x24, x22, [x21]
	ldr	x26, [x21, #56]
	ldr	x25, [x21, #104]
	add	w9, w23, #1             // =1
	subs	w8, w8, #1              // =1
	stp	w9, w8, [x21, #36]
	b.eq	.LBB22_71
// %bb.66:                              // %if.end175
	mov	x0, x20
	bl	halide_mutex_unlock
	cbz	x26, .LBB22_72
.LBB22_67:                              // %if.then177
	mov	x0, x25
	mov	x1, x26
	mov	w2, w23
	mov	x3, x22
	bl	halide_do_task
	mov	w22, w0
	mov	x0, x20
	bl	halide_mutex_lock
	cbnz	w22, .LBB22_73
	b	.LBB22_82
.LBB22_68:                              // %if.end195.thread439
	str	wzr, [x21, #40]
	b	.LBB22_73
.LBB22_69:                              // %if.else92
	ldr	w9, [x20, #64]
	ldp	w8, w10, [x20, #28]
	add	w9, w9, #1              // =1
	cmp	w8, w10
	str	w9, [x20, #64]
	b.le	.LBB22_81
// %bb.70:                              // %if.then95
	sub	w8, w8, #1              // =1
	add	x0, x20, #48            // =48
	mov	x1, x20
	str	w8, [x20, #28]
	bl	halide_cond_wait
	ldr	w8, [x20, #28]
	add	w8, w8, #1              // =1
	str	w8, [x20, #28]
	ldr	w8, [x20, #64]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #64]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_71:                              // %if.then173
	ldr	x8, [x21, #64]
	str	x8, [x28]
	mov	x0, x20
	bl	halide_mutex_unlock
	cbnz	x26, .LBB22_67
.LBB22_72:                              // %if.else185
	mov	w3, #1
	mov	x0, x25
	mov	x1, x24
	mov	w2, w23
	mov	x4, x22
	mov	x5, x21
	bl	halide_do_loop_task
	mov	w22, w0
	mov	x0, x20
	bl	halide_mutex_lock
	cbz	w22, .LBB22_82
.LBB22_73:                              // %if.then200
	ldrsw	x9, [x21, #80]
	mov	w8, wzr
	str	w22, [x21, #116]
	cmp	w9, #1                  // =1
	b.lt	.LBB22_83
// %bb.74:                              // %for.body.lr.ph
	ldr	x10, [x21, #72]
	ldr	w11, [x10, #116]!
	cbnz	w11, .LBB22_77
	b	.LBB22_79
.LBB22_75:                              // %land.rhs213
	ldrb	w11, [x10, #8]
.LBB22_76:                              // %land.end219
	and	w8, w8, #0x1
	orr	w8, w11, w8
.LBB22_77:                              // %for.inc
                                        // =>This Inner Loop Header: Depth=1
	subs	x9, x9, #1              // =1
	add	x10, x10, #128          // =128
	b.eq	.LBB22_83
// %bb.78:                              // %for.body
                                        //   in Loop: Header=BB22_77 Depth=1
	ldr	w11, [x10]
	cbnz	w11, .LBB22_77
.LBB22_79:                              // %if.then206
	str	w22, [x10]
	ldr	w11, [x21, #112]
	cbz	w11, .LBB22_75
// %bb.80:
	mov	w11, wzr
	b	.LBB22_76
.LBB22_81:                              // %if.else98
	add	x0, x20, #40            // =40
	mov	x1, x20
	bl	halide_cond_wait
	ldr	w8, [x20, #64]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #64]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_82:
	mov	w8, wzr
.LBB22_83:                              // %if.end227
	ldr	x10, [x21, #88]
	ldr	w9, [x21, #44]
	cbz	x10, .LBB22_90
.LBB22_84:                              // %if.else234
	ldr	w11, [x10, #96]
	sub	w9, w11, w9
	str	w9, [x10, #96]
	ldr	w9, [x21, #112]
	sub	w9, w9, #1              // =1
	str	w9, [x21, #112]
	tbnz	w8, #0, .LBB22_2
.LBB22_85:                              // %lor.lhs.false244
	cbnz	w9, .LBB22_3
// %bb.86:                              // %land.lhs.true247
	ldr	w8, [x21, #40]
	cbz	w8, .LBB22_88
// %bb.87:                              // %lor.lhs.false251
	ldr	w8, [x21, #116]
	cbz	w8, .LBB22_3
.LBB22_88:                              // %land.lhs.true254
	ldrb	w8, [x21, #124]
	cbz	w8, .LBB22_3
	b	.LBB22_2
.LBB22_89:
	mov	w8, wzr
	ldr	x10, [x21, #88]
	ldr	w9, [x21, #44]
	cbnz	x10, .LBB22_84
.LBB22_90:                              // %if.then230
	ldr	w10, [x20, #2124]
	sub	w9, w10, w9
	str	w9, [x20, #2124]
	ldr	w9, [x21, #112]
	sub	w9, w9, #1              // =1
	str	w9, [x21, #112]
	tbnz	w8, #0, .LBB22_2
	b	.LBB22_85
.LBB22_91:                              // %while.end263
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end22:
	.size	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE, .Lfunc_end22-_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
                                        // -- End function
	.section	.text.halide_mutex_unlock,"ax",@progbits
	.weak	halide_mutex_unlock     // -- Begin function halide_mutex_unlock
	.p2align	2
	.type	halide_mutex_unlock,@function
halide_mutex_unlock:                    // @halide_mutex_unlock
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldxr	x8, [x0]
	add	x29, sp, #48            // =48
	cmp	x8, #1                  // =1
	b.eq	.LBB23_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.ne	.LBB23_4
.LBB23_2:                               // %cmpxchg.trystore
                                        // =>This Inner Loop Header: Depth=1
	stlxr	w8, xzr, [x0]
	cbz	w8, .LBB23_5
// %bb.3:                               // %cmpxchg.start8
                                        //   in Loop: Header=BB23_2 Depth=1
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.eq	.LBB23_2
.LBB23_4:                               // %cmpxchg.nostore3
	clrex
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	add	x1, sp, #8              // =8
	stp	x9, x0, [sp, #32]
	stp	x8, x10, [sp, #16]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	str	x8, [sp, #8]
	bl	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
.LBB23_5:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end23:
	.size	halide_mutex_unlock, .Lfunc_end23-halide_mutex_unlock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv: // @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
// %bb.0:                               // %entry
	ret
.Lfunc_end24:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, .Lfunc_end24-_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	ret
.Lfunc_end25:
	.size	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end25-_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	ldr	x8, [x0, #32]
	ldr	x8, [x8]
	cmp	x8, #3                  // =3
	cset	w0, eq
	ret
.Lfunc_end26:
	.size	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end26-_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
// %bb.0:                               // %entry
	ldr	x8, [x0, #32]
	cmp	w2, #0                  // =0
	mov	w9, #2
	csel	x9, x9, xzr, ne
	mov	x0, xzr
	stlr	x9, [x8]
	ret
.Lfunc_end27:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, .Lfunc_end27-_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE: // @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x21, x1
	mov	x22, x0
	bl	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	mov	x10, x0
	ldr	x8, [x10, #8]!
	mov	x19, x0
	mov	x12, xzr
.LBB28_1:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	cbz	x8, .LBB28_8
// %bb.2:                               // %while.body
                                        //   in Loop: Header=BB28_1 Depth=1
	mov	x9, x12
	mov	x11, x10
	ldr	x12, [x8, #136]
	mov	x10, x8
	mov	x20, x8
	ldr	x8, [x10, #144]!
	cmp	x12, x22
	mov	x12, x20
	b.ne	.LBB28_1
// %bb.3:                               // %if.then
	str	x8, [x11]
	ldr	x10, [x19, #16]
	cmp	x10, x20
	b.eq	.LBB28_13
// %bb.4:                               // %while.cond6.preheader
	cbz	x8, .LBB28_14
.LBB28_5:                               // %while.body8
                                        // =>This Inner Loop Header: Depth=1
	ldr	x9, [x8, #136]
	ldr	x8, [x8, #144]
	cbz	x8, .LBB28_7
// %bb.6:                               // %while.body8
                                        //   in Loop: Header=BB28_5 Depth=1
	cmp	x9, x22
	b.ne	.LBB28_5
.LBB28_7:                               // %if.end.loopexit
	cmp	x9, x22
	cset	w22, eq
	b	.LBB28_15
.LBB28_8:                               // %while.end21
	ldr	x8, [x21, #16]
	mov	x0, x21
	mov	w1, wzr
	mov	w2, wzr
	blr	x8
.LBB28_9:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x19]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB28_9
// %bb.10:                              // %atomicrmw.end1
	cmp	x8, #4                  // =4
	mov	x22, xzr
	b.lo	.LBB28_21
// %bb.11:                              // %atomicrmw.end1
	tbnz	w8, #1, .LBB28_21
// %bb.12:                              // %if.then.i
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	mov	x22, xzr
	b	.LBB28_21
.LBB28_13:                              // %if.then4
	mov	w22, wzr
	str	x9, [x19, #16]
	b	.LBB28_15
.LBB28_14:
	mov	w22, wzr
.LBB28_15:                              // %if.end
	ldr	x8, [x21, #16]
	mov	w1, #1
	mov	x0, x21
	mov	w2, w22
	blr	x8
	str	x0, [x20, #152]
	mov	x0, x20
	bl	pthread_mutex_lock
.LBB28_16:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x19]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB28_16
// %bb.17:                              // %atomicrmw.end
	cmp	x8, #4                  // =4
	b.lo	.LBB28_20
// %bb.18:                              // %atomicrmw.end
	tbnz	w8, #1, .LBB28_20
// %bb.19:                              // %if.then.i66
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB28_20:                              // %cleanup.thread
	add	x0, x20, #64            // =64
	strb	wzr, [x20, #128]
	bl	pthread_cond_signal
	mov	x0, x20
	bl	pthread_mutex_unlock
.LBB28_21:                              // %cleanup25
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x22
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end28:
	.size	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE, .Lfunc_end28-_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,@function
_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy: // @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	mov	x8, #31765
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	movk	x8, #32586, lsl #16
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	movk	x8, #31161, lsl #32
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE]
	movk	x8, #40503, lsl #48
	mul	x8, x0, x8
	mov	w9, #24
	lsr	x8, x8, #54
	madd	x19, x8, x9, x10
	ldaxr	x8, [x19]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB29_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	b	.LBB29_3
.LBB29_2:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x19]
	cbz	w9, .LBB29_4
.LBB29_3:                               // %if.then.i.critedge
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB29_4:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end29:
	.size	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy, .Lfunc_end29-_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	ldr	x8, [x0]
	mov	x19, x0
	add	x29, sp, #64            // =64
	cmp	x8, #4                  // =4
	b.hs	.LBB30_3
	b	.LBB30_21
.LBB30_1:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB30_3 Depth=1
	clrex
	mov	x8, x22
.LBB30_2:                               // %while.cond
                                        //   in Loop: Header=BB30_3 Depth=1
	cmp	x8, #4                  // =4
	b.lo	.LBB30_21
.LBB30_3:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	tbnz	w8, #1, .LBB30_21
// %bb.4:                               // %if.end
                                        //   in Loop: Header=BB30_3 Depth=1
	ldaxr	x22, [x19]
	cmp	x22, x8
	b.ne	.LBB30_1
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB30_3 Depth=1
	orr	x8, x8, #0x2
	stxr	w9, x8, [x19]
	mov	x8, x22
	cbnz	w9, .LBB30_2
// %bb.6:
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	and	x23, x22, #0xfffffffffffffffc
	ldr	x21, [x23, #152]
	cbnz	x21, .LBB30_13
	b	.LBB30_9
.LBB30_7:                               // %cmpxchg.nostore3
                                        //   in Loop: Header=BB30_13 Depth=1
	clrex
.LBB30_8:                               // %cleanup70
                                        //   in Loop: Header=BB30_13 Depth=1
	dmb	ishld
	mov	x22, x8
	and	x23, x22, #0xfffffffffffffffc
	ldr	x21, [x23, #152]
	cbnz	x21, .LBB30_13
.LBB30_9:                               // %while.body17.preheader
	mov	x24, x23
	ldr	x25, [x24, #136]
	cbz	x25, .LBB30_12
.LBB30_10:                              // %if.end21
	ldr	x21, [x25, #152]
	str	x24, [x25, #144]
	mov	x24, x25
	cbnz	x21, .LBB30_13
.LBB30_11:                              // %while.body17
	ldr	x25, [x24, #136]
	cbnz	x25, .LBB30_10
.LBB30_12:                              // %if.then20
	mov	x0, xzr
	mov	x1, x20
	bl	halide_print
	bl	abort
	ldr	x21, [x25, #152]
	str	x24, [x25, #144]
	mov	x24, x25
	cbz	x21, .LBB30_11
.LBB30_13:                              // %while.end23
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB30_17 Depth 2
	str	x21, [x23, #152]
	tbnz	w22, #0, .LBB30_19
// %bb.14:                              // %if.end35
                                        //   in Loop: Header=BB30_13 Depth=1
	ldr	x8, [x21, #144]
	cbz	x8, .LBB30_17
	b	.LBB30_22
.LBB30_15:                              // %cmpxchg.nostore13
                                        //   in Loop: Header=BB30_17 Depth=2
	clrex
.LBB30_16:                              // %if.end47.critedge
                                        //   in Loop: Header=BB30_17 Depth=2
	cmp	x8, #4                  // =4
	mov	x22, x8
	b.hs	.LBB30_8
.LBB30_17:                              // %while.body41
                                        //   Parent Loop BB30_13 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	x8, [x19]
	cmp	x8, x22
	b.ne	.LBB30_15
// %bb.18:                              // %cmpxchg.trystore16
                                        //   in Loop: Header=BB30_17 Depth=2
	and	x9, x22, #0x1
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB30_16
	b	.LBB30_24
.LBB30_19:                              // %if.then27
                                        //   in Loop: Header=BB30_13 Depth=1
	ldaxr	x8, [x19]
	cmp	x8, x22
	b.ne	.LBB30_7
// %bb.20:                              // %cmpxchg.trystore6
                                        //   in Loop: Header=BB30_13 Depth=1
	and	x9, x22, #0xfffffffffffffffd
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB30_8
.LBB30_21:                              // %cleanup76
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	ret
.LBB30_22:                              // %if.else62
	str	x8, [x23, #152]
.LBB30_23:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x19]
	and	x8, x8, #0xfffffffffffffffd
	stlxr	w9, x8, [x19]
	cbnz	w9, .LBB30_23
.LBB30_24:                              // %if.end66
	mov	x0, x21
	bl	pthread_mutex_lock
	add	x0, x21, #64            // =64
	strb	wzr, [x21, #128]
	bl	pthread_cond_signal
	mov	x0, x21
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	b	pthread_mutex_unlock
.Lfunc_end30:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv, .Lfunc_end30-_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
// %bb.0:                               // %entry
	sub	sp, sp, #256            // =256
	str	x27, [sp, #160]         // 8-byte Folded Spill
	stp	x26, x25, [sp, #176]    // 16-byte Folded Spill
	stp	x24, x23, [sp, #192]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #208]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #224]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #240]    // 16-byte Folded Spill
	ldr	x26, [x0]
	mov	x21, sp
	mov	x19, x0
	add	x20, x21, #64           // =64
	add	x22, x21, #136          // =136
	mov	w24, #40
	mov	w23, #1
	add	x29, sp, #240           // =240
	tbz	w26, #0, .LBB31_6
	b	.LBB31_3
.LBB31_1:                               // %cmpxchg.nostore3
	clrex
.LBB31_2:                               // %if.end22
	mov	x0, x20
	bl	pthread_cond_destroy
	mov	x0, sp
	bl	pthread_mutex_destroy
	tbz	w26, #0, .LBB31_6
.LBB31_3:
	mov	x25, x26
	b	.LBB31_8
.LBB31_4:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB31_6 Depth=1
	clrex
.LBB31_5:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.critedge
                                        //   in Loop: Header=BB31_6 Depth=1
	mov	x26, x25
	tbnz	w25, #0, .LBB31_8
.LBB31_6:                               // %if.then
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x25, [x19]
	orr	x8, x26, #0x1
	cmp	x25, x26
	b.ne	.LBB31_4
// %bb.7:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB31_6 Depth=1
	stxr	w9, x8, [x19]
	cbnz	w9, .LBB31_5
	b	.LBB31_20
.LBB31_8:                               // %if.end4
	subs	w27, w24, #1            // =1
	b.lt	.LBB31_13
// %bb.9:                               // %if.end4
	cmp	x25, #4                 // =4
	b.lo	.LBB31_13
// %bb.10:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit
	cmp	w27, #1                 // =1
	b.lt	.LBB31_12
// %bb.11:                              // %if.then7
	bl	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	ldr	x26, [x19]
	mov	w24, w27
	tbz	w26, #0, .LBB31_6
	b	.LBB31_3
.LBB31_12:
	mov	w24, wzr
.LBB31_13:                              // %if.end9
	mov	x0, sp
	mov	x1, xzr
	strb	wzr, [sp, #128]
	bl	pthread_mutex_init
	mov	x0, x20
	mov	x1, xzr
	bl	pthread_cond_init
	ands	x8, x25, #0xfffffffffffffffc
	stp	xzr, xzr, [x22, #8]
	str	xzr, [x22]
	strb	w23, [sp, #128]
	b.eq	.LBB31_19
// %bb.14:                              // %if.else
	str	x8, [sp, #136]
	ldxr	x26, [x19]
	cmp	x26, x25
	b.ne	.LBB31_1
.LBB31_15:                              // %cmpxchg.trystore6
	mov	x8, sp
	bfxil	x8, x25, #0, #2
	stlxr	w9, x8, [x19]
	cbnz	w9, .LBB31_2
// %bb.16:                              // %if.then19
	mov	x0, sp
	bl	pthread_mutex_lock
	ldrb	w8, [sp, #128]
	cbz	w8, .LBB31_18
.LBB31_17:                              // %while.body.i
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, sp
	mov	x0, x20
	bl	pthread_cond_wait
	ldrb	w8, [sp, #128]
	cbnz	w8, .LBB31_17
.LBB31_18:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	mov	x0, sp
	bl	pthread_mutex_unlock
	ldr	x26, [x19]
	mov	w24, #40
	b	.LBB31_2
.LBB31_19:                              // %if.then12
	str	x21, [sp, #152]
	ldxr	x26, [x19]
	cmp	x26, x25
	b.ne	.LBB31_1
	b	.LBB31_15
.LBB31_20:                              // %cleanup23
	ldp	x29, x30, [sp, #240]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #224]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #208]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #192]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #176]    // 16-byte Folded Reload
	ldr	x27, [sp, #160]         // 8-byte Folded Reload
	add	sp, sp, #256            // =256
	ret
.Lfunc_end31:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv, .Lfunc_end31-_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
                                        // -- End function
	.section	.text.halide_cond_broadcast,"ax",@progbits
	.weak	halide_cond_broadcast   // -- Begin function halide_cond_broadcast
	.p2align	2
	.type	halide_cond_broadcast,@function
halide_cond_broadcast:                  // @halide_cond_broadcast
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x1, [x0]
	add	x29, sp, #48            // =48
	cbz	x1, .LBB32_2
// %bb.1:                               // %if.end.i
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib]
	stp	x0, x1, [sp, #32]
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x11, :got:_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	mov	x2, sp
	mov	x3, xzr
	stp	x10, x8, [sp]
	stp	x9, x11, [sp, #16]
	bl	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
.LBB32_2:                               // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end32:
	.size	halide_cond_broadcast, .Lfunc_end32-halide_cond_broadcast
                                        // -- End function
	.section	.text.halide_default_semaphore_try_acquire,"ax",@progbits
	.weak	halide_default_semaphore_try_acquire // -- Begin function halide_default_semaphore_try_acquire
	.p2align	2
	.type	halide_default_semaphore_try_acquire,@function
halide_default_semaphore_try_acquire:   // @halide_default_semaphore_try_acquire
// %bb.0:                               // %entry
	cbz	w1, .LBB33_6
// %bb.1:                               // %if.end
	ldar	w8, [x0]
	subs	w9, w8, w1
	b.pl	.LBB33_4
	b	.LBB33_7
.LBB33_2:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB33_4 Depth=1
	clrex
.LBB33_3:                               // %if.end
                                        //   in Loop: Header=BB33_4 Depth=1
	subs	w9, w8, w1
	b.mi	.LBB33_7
.LBB33_4:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	mov	w10, w8
	ldaxr	w8, [x0]
	cmp	w8, w10
	b.ne	.LBB33_2
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB33_4 Depth=1
	stlxr	w10, w9, [x0]
	cbnz	w10, .LBB33_3
.LBB33_6:
	mov	w0, #1
	ret
.LBB33_7:
	mov	w0, wzr
	ret
.Lfunc_end33:
	.size	halide_default_semaphore_try_acquire, .Lfunc_end33-halide_default_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_cond_wait,"ax",@progbits
	.weak	halide_cond_wait        // -- Begin function halide_cond_wait
	.p2align	2
	.type	halide_cond_wait,@function
halide_cond_wait:                       // @halide_cond_wait
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	stp	x0, x1, [sp, #40]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib]
	mov	x19, x1
	add	x1, sp, #8              // =8
	add	x29, sp, #144           // =144
	stp	x8, x9, [sp, #8]
	stp	x10, x20, [sp, #24]
	bl	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	cmp	x0, x19
	b.ne	.LBB34_3
// %bb.1:                               // %if.else.i
	ldr	x8, [x19]
	tbnz	w8, #0, .LBB34_23
// %bb.2:                               // %if.then2.i
	adrp	x1, .L.str.6.7
	add	x1, x1, :lo12:.L.str.6.7
	mov	x0, xzr
	bl	halide_print
	bl	abort
	b	.LBB34_23
.LBB34_3:                               // %cmpxchg.start
	ldaxr	x8, [x19]
	cbz	x8, .LBB34_5
// %bb.4:                               // %cmpxchg.nostore
	clrex
	b	.LBB34_6
.LBB34_5:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x19]
	cbz	w9, .LBB34_23
.LBB34_6:                               // %if.then.i.i.critedge
	adrp	x21, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x22, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x23, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x9, [x19]
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	mov	w8, #40
.LBB34_7:                               // %while.cond.outer.i.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB34_11 Depth 2
	tbz	w9, #0, .LBB34_11
.LBB34_8:                               //   in Loop: Header=BB34_7 Depth=1
	mov	x10, x9
	b	.LBB34_13
.LBB34_9:                               // %cmpxchg.nostore3
                                        //   in Loop: Header=BB34_11 Depth=2
	clrex
.LBB34_10:                              // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.i.critedge
                                        //   in Loop: Header=BB34_11 Depth=2
	mov	x9, x10
	tbnz	w10, #0, .LBB34_13
.LBB34_11:                              // %if.then.i.i.i
                                        //   Parent Loop BB34_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	x10, [x19]
	cmp	x10, x9
	b.ne	.LBB34_9
// %bb.12:                              // %cmpxchg.trystore6
                                        //   in Loop: Header=BB34_11 Depth=2
	orr	x9, x9, #0x1
	stxr	w11, x9, [x19]
	cbnz	w11, .LBB34_10
	b	.LBB34_23
.LBB34_13:                              // %if.end4.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	tbnz	w10, #1, .LBB34_17
// %bb.14:                              // %land.lhs.true.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	subs	w24, w8, #1             // =1
	b.ge	.LBB34_19
// %bb.15:                              // %if.then12.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	ldxr	x9, [x19]
	cmp	x9, x10
	b.ne	.LBB34_22
.LBB34_16:                              // %cmpxchg.trystore16
                                        //   in Loop: Header=BB34_7 Depth=1
	orr	x10, x10, #0x2
	stxr	w11, x10, [x19]
	cbnz	w11, .LBB34_7
.LBB34_17:                              // %if.end21.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	add	x1, sp, #56             // =56
	mov	x0, x19
	stp	x21, x23, [sp, #64]
	stp	x20, x19, [sp, #80]
	str	x22, [sp, #56]
	bl	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	cmp	x0, x19
	b.eq	.LBB34_23
// %bb.18:                              // %if.end26.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	ldr	x9, [x19]
	mov	w8, #40
	tbz	w9, #0, .LBB34_11
	b	.LBB34_8
.LBB34_19:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	cmp	w24, #1                 // =1
	b.lt	.LBB34_21
// %bb.20:                              // %if.then7.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	bl	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	ldr	x9, [x19]
	mov	w8, w24
	tbz	w9, #0, .LBB34_11
	b	.LBB34_8
.LBB34_21:                              //   in Loop: Header=BB34_7 Depth=1
	mov	w8, wzr
	ldxr	x9, [x19]
	cmp	x9, x10
	b.eq	.LBB34_16
.LBB34_22:                              // %cmpxchg.nostore13
                                        //   in Loop: Header=BB34_7 Depth=1
	clrex
	tbz	w9, #0, .LBB34_11
	b	.LBB34_8
.LBB34_23:                              // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end34:
	.size	halide_cond_wait, .Lfunc_end34-halide_cond_wait
                                        // -- End function
	.section	.text.halide_do_loop_task,"ax",@progbits
	.weak	halide_do_loop_task     // -- Begin function halide_do_loop_task
	.p2align	2
	.type	halide_do_loop_task,@function
halide_do_loop_task:                    // @halide_do_loop_task
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE]
	ldr	x6, [x8]
	br	x6
.Lfunc_end35:
	.size	halide_do_loop_task, .Lfunc_end35-halide_do_loop_task
                                        // -- End function
	.section	.text.halide_do_task,"ax",@progbits
	.weak	halide_do_task          // -- Begin function halide_do_task
	.p2align	2
	.type	halide_do_task,@function
halide_do_task:                         // @halide_do_task
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal14custom_do_taskE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal14custom_do_taskE]
	ldr	x4, [x8]
	br	x4
.Lfunc_end36:
	.size	halide_do_task, .Lfunc_end36-halide_do_task
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	ldp	x9, x8, [x0, #32]
	ldr	x10, [x9]
	cbz	x10, .LBB37_3
// %bb.1:                               // %if.else
	cmp	x10, x8
	b.ne	.LBB37_4
// %bb.2:
	mov	w0, #1
	ret
.LBB37_3:                               // %if.then
	mov	w0, #1
	str	x8, [x9]
	ret
.LBB37_4:                               // %if.then4
	mov	w0, wzr
	str	x8, [x1, #8]
	ret
.Lfunc_end37:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end37-_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv: // @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x0, [x0, #40]
	add	x29, sp, #48            // =48
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.eq	.LBB38_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.ne	.LBB38_4
.LBB38_2:                               // %cmpxchg.trystore
                                        // =>This Inner Loop Header: Depth=1
	stlxr	w8, xzr, [x0]
	cbz	w8, .LBB38_5
// %bb.3:                               // %cmpxchg.start8
                                        //   in Loop: Header=BB38_2 Depth=1
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.eq	.LBB38_2
.LBB38_4:                               // %cmpxchg.nostore3
	clrex
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	add	x1, sp, #8              // =8
	stp	x9, x0, [sp, #32]
	stp	x8, x10, [sp, #16]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	str	x8, [sp, #8]
	bl	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
.LBB38_5:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end38:
	.size	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv, .Lfunc_end38-_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
// %bb.0:                               // %entry
	tbnz	w2, #0, .LBB39_2
// %bb.1:                               // %if.then
	ldr	x8, [x0, #32]
	str	xzr, [x8]
.LBB39_2:                               // %if.end
	mov	x0, xzr
	ret
.Lfunc_end39:
	.size	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib, .Lfunc_end39-_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE: // @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
// %bb.0:                               // %entry
	sub	sp, sp, #240            // =240
	stp	x22, x21, [sp, #192]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #208]    // 16-byte Folded Spill
	mov	x20, x1
	mov	x22, x0
	add	x0, sp, #16             // =16
	mov	x1, xzr
	stp	x24, x23, [sp, #176]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #224]    // 16-byte Folded Spill
	add	x29, sp, #224           // =224
	strb	wzr, [sp, #144]
	add	x23, sp, #16            // =16
	bl	pthread_mutex_init
	add	x19, x23, #64           // =64
	mov	x0, x19
	mov	x1, xzr
	bl	pthread_cond_init
	mov	x0, x22
	strb	wzr, [sp, #144]
	stp	xzr, xzr, [sp, #152]
	str	xzr, [sp, #168]
	bl	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	strb	wzr, [sp]
	str	xzr, [sp, #8]
	ldr	x8, [x20]
	mov	x21, x0
	mov	x1, sp
	mov	x0, x20
	mov	x24, sp
	blr	x8
	tbz	w0, #0, .LBB40_9
// %bb.1:                               // %if.end
	mov	w8, #1
	stp	x22, xzr, [sp, #152]
	mov	x9, x21
	strb	w8, [sp, #144]
	ldr	x8, [x9, #8]!
	add	x22, x23, #152          // =152
	ldr	x10, [x9, #8]
	cmp	x8, #0                  // =0
	add	x8, x10, #144           // =144
	csel	x8, x9, x8, eq
	str	x23, [x8]
	str	x23, [x9, #8]
.LBB40_2:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x21]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x21]
	cbnz	w10, .LBB40_2
// %bb.3:                               // %atomicrmw.end1
	cmp	x8, #4                  // =4
	b.lo	.LBB40_6
// %bb.4:                               // %atomicrmw.end1
	tbnz	w8, #1, .LBB40_6
// %bb.5:                               // %if.then.i27
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB40_6:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28
	ldr	x8, [x20, #8]
	mov	x0, x20
	blr	x8
	add	x0, sp, #16             // =16
	bl	pthread_mutex_lock
	ldrb	w8, [sp, #144]
	cbz	w8, .LBB40_8
.LBB40_7:                               // %while.body.i
                                        // =>This Inner Loop Header: Depth=1
	add	x1, sp, #16             // =16
	mov	x0, x19
	bl	pthread_cond_wait
	ldrb	w8, [sp, #144]
	cbnz	w8, .LBB40_7
.LBB40_8:                               // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	add	x0, sp, #16             // =16
	bl	pthread_mutex_unlock
	b	.LBB40_14
.LBB40_9:                               // %if.then
	add	x22, x24, #8            // =8
.LBB40_10:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x21]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x21]
	cbnz	w10, .LBB40_10
// %bb.11:                              // %atomicrmw.end
	cmp	x8, #4                  // =4
	b.lo	.LBB40_14
// %bb.12:                              // %atomicrmw.end
	tbnz	w8, #1, .LBB40_14
// %bb.13:                              // %if.then.i
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB40_14:                              // %cleanup
	ldr	x20, [x22]
	mov	x0, x19
	bl	pthread_cond_destroy
	add	x0, sp, #16             // =16
	bl	pthread_mutex_destroy
	mov	x0, x20
	ldp	x29, x30, [sp, #224]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #208]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #192]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #176]    // 16-byte Folded Reload
	add	sp, sp, #240            // =240
	ret
.Lfunc_end40:
	.size	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE, .Lfunc_end40-_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
// %bb.0:                               // %entry
	mov	x0, xzr
	ret
.Lfunc_end41:
	.size	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib, .Lfunc_end41-_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	ldp	x8, x10, [x0, #32]
	ldr	x9, [x8]
	cmp	x9, x10
	b.ne	.LBB42_7
// %bb.1:                               // %if.end
	str	xzr, [x8]
	ldr	x8, [x0, #40]
	ldr	x9, [x8]
	tbnz	w9, #0, .LBB42_4
	b	.LBB42_8
.LBB42_2:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB42_4 Depth=1
	clrex
.LBB42_3:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.critedge
                                        //   in Loop: Header=BB42_4 Depth=1
	mov	x9, x10
	tbz	w10, #0, .LBB42_8
.LBB42_4:                               // %if.end.i
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x10, [x8]
	cmp	x10, x9
	b.ne	.LBB42_2
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB42_4 Depth=1
	orr	x9, x9, #0x2
	stxr	w11, x9, [x8]
	cbnz	w11, .LBB42_3
// %bb.6:
	mov	w8, wzr
	mov	w0, #1
	strb	w8, [x1]
	ret
.LBB42_7:
	mov	w0, wzr
	ret
.LBB42_8:
	mov	w8, #1
	mov	w0, #1
	strb	w8, [x1]
	ret
.Lfunc_end42:
	.size	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end42-_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	ldrb	w8, [x1]
	cbz	w8, .LBB43_4
// %bb.1:                               // %entry
	cbz	w3, .LBB43_4
// %bb.2:                               // %if.then
	ldr	x8, [x0, #40]
.LBB43_3:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x9, [x8]
	orr	x9, x9, #0x2
	stxr	w10, x9, [x8]
	cbnz	w10, .LBB43_3
.LBB43_4:                               // %if.end
	ret
.Lfunc_end43:
	.size	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end43-_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy,@function
_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy: // @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
// %bb.0:                               // %entry
	sub	sp, sp, #96             // =96
	add	x8, sp, #16             // =16
	str	x23, [sp, #32]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	mov	x19, x3
	mov	x20, x2
	mov	x21, x1
	mov	x22, x0
	bl	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	strb	wzr, [sp]
	str	xzr, [sp, #8]
	ldr	x8, [x20]
	mov	x1, sp
	mov	x0, x20
	blr	x8
	tbz	w0, #0, .LBB44_13
// %bb.1:                               // %if.end
	ldr	x8, [sp, #16]
	mov	x11, x8
	ldr	x12, [x11, #8]!
	cbz	x12, .LBB44_14
// %bb.2:                               // %while.body.lr.ph
	ldrb	w9, [sp]
	cbz	w9, .LBB44_15
// %bb.3:                               // %while.body.us.preheader
	mov	x23, xzr
	mov	x10, xzr
	mov	x9, xzr
	mov	x13, xzr
	b	.LBB44_5
.LBB44_4:                               //   in Loop: Header=BB44_5 Depth=1
	mov	x11, x15
	mov	x13, x14
	cbz	x12, .LBB44_24
.LBB44_5:                               // %while.body.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x16, [x12, #136]
	mov	x15, x12
	mov	x14, x12
	ldr	x12, [x15, #144]!
	cmp	x16, x22
	b.ne	.LBB44_4
// %bb.6:                               // %if.then3.us
                                        //   in Loop: Header=BB44_5 Depth=1
	str	x12, [x11]
	ldr	x15, [x8, #16]
	cmp	x15, x14
	b.eq	.LBB44_11
// %bb.7:                               // %if.end9.us
                                        //   in Loop: Header=BB44_5 Depth=1
	cbz	x23, .LBB44_12
.LBB44_8:                               // %if.else.us
                                        //   in Loop: Header=BB44_5 Depth=1
	mov	x0, x14
	cbz	x9, .LBB44_10
// %bb.9:                               // %if.else14.us
                                        //   in Loop: Header=BB44_5 Depth=1
	mov	x0, x9
	str	x14, [x10, #144]
.LBB44_10:                              // %if.end16.us
                                        //   in Loop: Header=BB44_5 Depth=1
	mov	x9, x0
	mov	x10, x14
	str	x21, [x14, #136]
	cbnz	x12, .LBB44_5
	b	.LBB44_24
.LBB44_11:                              // %if.then6.us
                                        //   in Loop: Header=BB44_5 Depth=1
	str	x13, [x8, #16]
	cbnz	x23, .LBB44_8
.LBB44_12:                              //   in Loop: Header=BB44_5 Depth=1
	mov	x23, x14
	cbnz	x12, .LBB44_5
	b	.LBB44_24
.LBB44_13:                              // %if.then
	add	x0, sp, #16             // =16
	bl	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	mov	w0, wzr
	b	.LBB44_33
.LBB44_14:
	mov	w3, wzr
	mov	x23, xzr
	b	.LBB44_29
.LBB44_15:                              // %while.body.preheader
	mov	x10, xzr
	mov	x9, xzr
	mov	x13, xzr
	b	.LBB44_17
.LBB44_16:                              //   in Loop: Header=BB44_17 Depth=1
	mov	x11, x15
	mov	x13, x12
	mov	x12, x14
	cbz	x14, .LBB44_23
.LBB44_17:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x16, [x12, #136]
	mov	x15, x12
	ldr	x14, [x15, #144]!
	cmp	x16, x22
	b.ne	.LBB44_16
// %bb.18:                              // %if.then3
                                        //   in Loop: Header=BB44_17 Depth=1
	str	x14, [x11]
	ldr	x15, [x8, #16]
	cmp	x15, x12
	b.eq	.LBB44_22
// %bb.19:                              // %if.else
                                        //   in Loop: Header=BB44_17 Depth=1
	mov	x0, x12
	cbz	x9, .LBB44_21
.LBB44_20:                              // %if.else14
                                        //   in Loop: Header=BB44_17 Depth=1
	mov	x0, x9
	str	x12, [x10, #144]
.LBB44_21:                              // %if.end16
                                        //   in Loop: Header=BB44_17 Depth=1
	mov	x9, x0
	mov	x10, x12
	str	x21, [x12, #136]
	mov	x12, x14
	cbnz	x14, .LBB44_17
	b	.LBB44_23
.LBB44_22:                              // %if.then6
                                        //   in Loop: Header=BB44_17 Depth=1
	str	x13, [x8, #16]
	mov	x0, x12
	cbnz	x9, .LBB44_20
	b	.LBB44_21
.LBB44_23:
	mov	x23, xzr
.LBB44_24:                              // %while.end
	cbz	x9, .LBB44_28
// %bb.25:                              // %if.then23
	str	xzr, [x10, #144]
	ldr	x8, [sp, #24]
	mov	x11, x8
	ldr	x12, [x11, #8]!
	cbz	x12, .LBB44_27
// %bb.26:                              // %if.else30
	ldr	x11, [x8, #16]
	add	x11, x11, #144          // =144
.LBB44_27:                              // %if.end34
	mov	w3, #1
	str	x9, [x11]
	str	x10, [x8, #16]
	b	.LBB44_29
.LBB44_28:
	mov	w3, wzr
.LBB44_29:                              // %if.end37
	ldr	x8, [x20, #24]
	cmp	x23, #0                 // =0
	cset	w2, ne
	mov	x1, sp
	mov	x0, x20
	blr	x8
	cbz	x23, .LBB44_31
// %bb.30:                              // %if.then41
	mov	x0, x23
	str	x19, [x23, #152]
	bl	pthread_mutex_lock
	add	x0, sp, #16             // =16
	bl	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	add	x0, x23, #64            // =64
	strb	wzr, [x23, #128]
	bl	pthread_cond_signal
	mov	x0, x23
	bl	pthread_mutex_unlock
	b	.LBB44_32
.LBB44_31:                              // %if.else45
	add	x0, sp, #16             // =16
	bl	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
.LBB44_32:                              // %if.end46
	ldrb	w8, [sp]
	cmp	x23, #0                 // =0
	cset	w9, ne
	and	w0, w8, w9
.LBB44_33:                              // %cleanup
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.Lfunc_end44:
	.size	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy, .Lfunc_end44-_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,@function
_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy: // @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	mov	x9, #31765
	movk	x9, #32586, lsl #16
	movk	x9, #31161, lsl #32
	movk	x9, #40503, lsl #48
	mul	x10, x0, x9
	mul	x11, x1, x9
	lsr	x9, x10, #54
	lsr	x10, x11, #54
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	cmp	x9, x10
	mov	x19, x8
	mov	w8, #24
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	b.ne	.LBB45_3
// %bb.1:                               // %if.then
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE]
	madd	x20, x9, x8, x10
	ldaxr	x8, [x20]
	cbz	x8, .LBB45_8
// %bb.2:                               // %cmpxchg.nostore
	clrex
	b	.LBB45_9
.LBB45_3:                               // %if.else
	adrp	x11, :got:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE]
	b.hs	.LBB45_6
// %bb.4:                               // %if.then3
	madd	x20, x9, x8, x11
	ldaxr	x9, [x20]
	madd	x21, x10, x8, x11
	cbz	x9, .LBB45_10
// %bb.5:                               // %cmpxchg.nostore3
	clrex
	b	.LBB45_11
.LBB45_6:                               // %if.else9
	madd	x21, x10, x8, x11
	ldaxr	x10, [x21]
	madd	x20, x9, x8, x11
	cbz	x10, .LBB45_14
// %bb.7:                               // %cmpxchg.nostore23
	clrex
	b	.LBB45_15
.LBB45_8:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x20]
	cbz	w9, .LBB45_24
.LBB45_9:                               // %if.then.i53.critedge
	mov	x0, x20
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	mov	x21, x20
	b	.LBB45_23
.LBB45_10:                              // %cmpxchg.trystore6
	mov	w8, #1
	stxr	w9, x8, [x20]
	cbz	w9, .LBB45_12
.LBB45_11:                              // %if.then.i50.critedge
	mov	x0, x20
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB45_12:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit51
	ldaxr	x8, [x21]
	cbz	x8, .LBB45_18
// %bb.13:                              // %cmpxchg.nostore13
	clrex
	b	.LBB45_19
.LBB45_14:                              // %cmpxchg.trystore26
	mov	w8, #1
	stxr	w9, x8, [x21]
	cbz	w9, .LBB45_16
.LBB45_15:                              // %if.then.i42.critedge
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB45_16:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit43
	ldaxr	x8, [x20]
	cbz	x8, .LBB45_20
// %bb.17:                              // %cmpxchg.nostore33
	clrex
	b	.LBB45_21
.LBB45_18:                              // %cmpxchg.trystore16
	mov	w8, #1
	stxr	w9, x8, [x21]
	cbz	w9, .LBB45_23
.LBB45_19:                              // %if.then.i47.critedge
	mov	x0, x21
	b	.LBB45_22
.LBB45_20:                              // %cmpxchg.trystore36
	mov	w8, #1
	stxr	w9, x8, [x20]
	cbz	w9, .LBB45_23
.LBB45_21:                              // %if.then.i.critedge
	mov	x0, x20
.LBB45_22:                              // %cleanup
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB45_23:                              // %cleanup
	stp	x20, x21, [x19]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB45_24:
	mov	x21, x20
	b	.LBB45_23
.Lfunc_end45:
	.size	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy, .Lfunc_end45-_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,@function
_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE: // @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x0, [x0]
	ldr	x8, [x19, #8]
	add	x29, sp, #16            // =16
	cmp	x0, x8
	b.eq	.LBB46_8
// %bb.1:                               // %if.else
	b.ls	.LBB46_9
.LBB46_2:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_2
// %bb.3:                               // %atomicrmw.end1
	cmp	x8, #4                  // =4
	b.lo	.LBB46_6
// %bb.4:                               // %atomicrmw.end1
	tbnz	w8, #1, .LBB46_6
// %bb.5:                               // %if.then.i28
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB46_6:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit29
	ldr	x0, [x19, #8]
.LBB46_7:                               // %atomicrmw.start6
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_7
	b	.LBB46_15
.LBB46_8:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_8
	b	.LBB46_15
.LBB46_9:                               // %atomicrmw.start10
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x9, [x8]
	and	x10, x9, #0xfffffffffffffffe
	stlxr	w11, x10, [x8]
	cbnz	w11, .LBB46_9
// %bb.10:                              // %atomicrmw.end9
	cmp	x9, #4                  // =4
	b.lo	.LBB46_13
// %bb.11:                              // %atomicrmw.end9
	tbnz	w9, #1, .LBB46_13
// %bb.12:                              // %if.then.i42
	mov	x0, x8
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB46_13:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit43
	ldr	x0, [x19]
.LBB46_14:                              // %atomicrmw.start14
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_14
.LBB46_15:                              // %atomicrmw.end5
	cmp	x8, #4                  // =4
	b.lo	.LBB46_18
// %bb.16:                              // %atomicrmw.end5
	tbnz	w8, #1, .LBB46_18
// %bb.17:                              // %if.then.i
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	b	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB46_18:                              // %if.end15
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end46:
	.size	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE, .Lfunc_end46-_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv // -- Begin function _ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,@function
_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv: // @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x0, .L.str.1.8
	add	x0, x0, :lo12:.L.str.1.8
	mov	x29, sp
	bl	getenv
	cbnz	x0, .LBB47_2
// %bb.1:                               // %if.end
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	getenv
	cbz	x0, .LBB47_3
.LBB47_2:                               // %if.then3
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	b	atoi
.LBB47_3:                               // %if.else
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	b	halide_host_cpu_count
.Lfunc_end47:
	.size	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv, .Lfunc_end47-_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal17clamp_num_threadsEi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi // -- Begin function _ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi,@function
_ZN6Halide7Runtime8Internal17clamp_num_threadsEi: // @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
// %bb.0:                               // %entry
	cmp	w0, #256                // =256
	b.le	.LBB48_2
// %bb.1:                               // %if.end3
	mov	w0, #256
	ret
.LBB48_2:                               // %if.else
	cmp	w0, #1                  // =1
	csinc	w0, w0, wzr, gt
	ret
.Lfunc_end48:
	.size	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi, .Lfunc_end48-_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal13worker_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal13worker_threadEPv // -- Begin function _ZN6Halide7Runtime8Internal13worker_threadEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal13worker_threadEPv,@function
_ZN6Halide7Runtime8Internal13worker_threadEPv: // @_ZN6Halide7Runtime8Internal13worker_threadEPv
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x19, x0
	add	x29, sp, #16            // =16
	mov	x0, x20
	bl	halide_mutex_lock
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x20
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end49:
	.size	_ZN6Halide7Runtime8Internal13worker_threadEPv, .Lfunc_end49-_ZN6Halide7Runtime8Internal13worker_threadEPv
                                        // -- End function
	.section	.text.halide_spawn_thread,"ax",@progbits
	.weak	halide_spawn_thread     // -- Begin function halide_spawn_thread
	.p2align	2
	.type	halide_spawn_thread,@function
halide_spawn_thread:                    // @halide_spawn_thread
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x0
	mov	w0, #24
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x1
	bl	malloc
	mov	x21, x0
	stp	x20, x19, [x0]
	str	xzr, [x0, #16]!
	adrp	x2, :got:_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
	ldr	x2, [x2, :got_lo12:_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv]
	mov	x1, xzr
	mov	x3, x21
	bl	pthread_create
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end50:
	.size	halide_spawn_thread, .Lfunc_end50-halide_spawn_thread
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv // -- Begin function _ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,@function
_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv: // @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldp	x8, x0, [x0]
	mov	x29, sp
	blr	x8
	mov	x0, xzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end51:
	.size	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, .Lfunc_end51-_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
                                        // -- End function
	.section	.text.halide_default_do_parallel_tasks,"ax",@progbits
	.weak	halide_default_do_parallel_tasks // -- Begin function halide_default_do_parallel_tasks
	.p2align	2
	.type	halide_default_do_parallel_tasks,@function
halide_default_do_parallel_tasks:       // @halide_default_do_parallel_tasks
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	w20, w1
	sxtw	x8, w20
	mov	x9, sp
	mov	x21, x3
	sub	x19, x9, x8, lsl #7
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	sp, x19
	cmp	w1, #1                  // =1
	b.lt	.LBB52_6
// %bb.1:                               // %for.body.preheader
	mov	x8, xzr
	add	x9, x19, #112           // =112
	ldr	w10, [x2, #40]
	cmp	w10, #0                 // =0
	b.le	.LBB52_5
.LBB52_2:                               // %if.end
	ldp	q0, q1, [x2]
	ldr	q2, [x2, #32]
	ldr	x10, [x2, #48]
	add	x2, x2, #56             // =56
	stp	x0, xzr, [x9, #-8]
	stur	xzr, [x9, #5]
	stp	q1, q2, [x9, #-96]
	stur	q0, [x9, #-112]
	stp	x10, xzr, [x9, #-64]
	stur	x21, [x9, #-24]
.LBB52_3:                               // %for.inc
	add	x8, x8, #1              // =1
	cmp	x8, w20, sxtw
	add	x9, x9, #128            // =128
	b.ge	.LBB52_6
// %bb.4:                               // %for.body
	ldr	w10, [x2, #40]
	cmp	w10, #0                 // =0
	b.gt	.LBB52_2
.LBB52_5:                               // %if.then
	sub	w20, w20, #1            // =1
	b	.LBB52_3
.LBB52_6:                               // %for.cond.cleanup
	cbz	w20, .LBB52_10
// %bb.7:                               // %if.end19
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_lock
	mov	w0, w20
	mov	x1, x19
	mov	x2, x21
	bl	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	cmp	w20, #1                 // =1
	b.lt	.LBB52_11
// %bb.8:                               // %for.body25.preheader
	mov	w21, wzr
	mov	w20, w20
.LBB52_9:                               // %for.body25
                                        // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	ldr	w8, [x19, #116]
	add	x19, x19, #128          // =128
	cmp	w8, #0                  // =0
	csel	w21, w21, w8, eq
	subs	x20, x20, #1            // =1
	b.ne	.LBB52_9
	b	.LBB52_12
.LBB52_10:
	mov	w21, wzr
	b	.LBB52_13
.LBB52_11:
	mov	w21, wzr
.LBB52_12:                              // %for.cond.cleanup24
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_unlock
.LBB52_13:                              // %cleanup
	mov	w0, w21
	sub	sp, x29, #32            // =32
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end52:
	.size	halide_default_do_parallel_tasks, .Lfunc_end52-halide_default_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_default_semaphore_init,"ax",@progbits
	.weak	halide_default_semaphore_init // -- Begin function halide_default_semaphore_init
	.p2align	2
	.type	halide_default_semaphore_init,@function
halide_default_semaphore_init:          // @halide_default_semaphore_init
// %bb.0:                               // %entry
	stlr	w1, [x0]
	mov	w0, w1
	ret
.Lfunc_end53:
	.size	halide_default_semaphore_init, .Lfunc_end53-halide_default_semaphore_init
                                        // -- End function
	.section	.text.halide_default_semaphore_release,"ax",@progbits
	.weak	halide_default_semaphore_release // -- Begin function halide_default_semaphore_release
	.p2align	2
	.type	halide_default_semaphore_release,@function
halide_default_semaphore_release:       // @halide_default_semaphore_release
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	w19, w1
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
.LBB54_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w21, [x0]
	add	w8, w21, w19
	stlxr	w9, w8, [x0]
	cbnz	w9, .LBB54_1
// %bb.2:                               // %atomicrmw.end
	cbz	w19, .LBB54_5
// %bb.3:                               // %atomicrmw.end
	cbnz	w21, .LBB54_5
// %bb.4:                               // %if.then
	adrp	x20, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x0, x20
	bl	halide_mutex_lock
	add	x0, x20, #40            // =40
	bl	halide_cond_broadcast
	add	x0, x20, #56            // =56
	bl	halide_cond_broadcast
	mov	x0, x20
	bl	halide_mutex_unlock
.LBB54_5:                               // %if.end
	add	w0, w21, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end54:
	.size	halide_default_semaphore_release, .Lfunc_end54-halide_default_semaphore_release
                                        // -- End function
	.section	.text.halide_thread_pool_cleanup,"ax",@progbits
	.weak	halide_thread_pool_cleanup // -- Begin function halide_thread_pool_cleanup
	.p2align	2
	.type	halide_thread_pool_cleanup,@function
halide_thread_pool_cleanup:             // @halide_thread_pool_cleanup
// %bb.0:                               // %entry
	b	halide_shutdown_thread_pool
.Lfunc_end55:
	.size	halide_thread_pool_cleanup, .Lfunc_end55-halide_thread_pool_cleanup
                                        // -- End function
	.section	.text.halide_shutdown_thread_pool,"ax",@progbits
	.weak	halide_shutdown_thread_pool // -- Begin function halide_shutdown_thread_pool
	.p2align	2
	.type	halide_shutdown_thread_pool,@function
halide_shutdown_thread_pool:            // @halide_shutdown_thread_pool
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	add	x29, sp, #16            // =16
	ldrb	w8, [x19, #2121]
	cbz	w8, .LBB56_5
// %bb.1:                               // %if.then
	mov	x0, x19
	bl	halide_mutex_lock
	mov	w8, #1
	add	x0, x19, #56            // =56
	strb	w8, [x19, #2120]
	bl	halide_cond_broadcast
	add	x0, x19, #40            // =40
	bl	halide_cond_broadcast
	add	x0, x19, #48            // =48
	bl	halide_cond_broadcast
	mov	x0, x19
	bl	halide_mutex_unlock
	ldr	w8, [x19, #24]
	cmp	w8, #1                  // =1
	b.lt	.LBB56_4
// %bb.2:                               // %for.body.preheader
	mov	x20, xzr
.LBB56_3:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	add	x8, x19, x20, lsl #3
	ldr	x0, [x8, #72]
	bl	halide_join_thread
	ldrsw	x8, [x19, #24]
	add	x20, x20, #1            // =1
	cmp	x20, x8
	b.lt	.LBB56_3
.LBB56_4:                               // %for.cond.cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	x0, x19, #12            // =12
	mov	w2, #2116
	mov	w1, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	memset
.LBB56_5:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end56:
	.size	halide_shutdown_thread_pool, .Lfunc_end56-halide_shutdown_thread_pool
                                        // -- End function
	.section	.text.halide_join_thread,"ax",@progbits
	.weak	halide_join_thread      // -- Begin function halide_join_thread
	.p2align	2
	.type	halide_join_thread,@function
halide_join_thread:                     // @halide_join_thread
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	str	xzr, [sp, #8]
	mov	x19, x0
	ldr	x0, [x0, #16]
	add	x1, sp, #8              // =8
	add	x29, sp, #16            // =16
	bl	pthread_join
	mov	x0, x19
	bl	free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end57:
	.size	halide_join_thread, .Lfunc_end57-halide_join_thread
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	mov	w0, #1
	ret
.Lfunc_end58:
	.size	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end58-_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
// %bb.0:                               // %entry
	tbnz	w2, #0, .LBB59_2
// %bb.1:                               // %if.then
	ldr	x8, [x0, #32]
	str	xzr, [x8]
.LBB59_2:                               // %if.end
	mov	x0, xzr
	ret
.Lfunc_end59:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib, .Lfunc_end59-_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
                                        // -- End function
	.section	.text.halide_cond_signal,"ax",@progbits
	.weak	halide_cond_signal      // -- Begin function halide_cond_signal
	.p2align	2
	.type	halide_cond_signal,@function
halide_cond_signal:                     // @halide_cond_signal
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x0]
	add	x29, sp, #48            // =48
	cbz	x8, .LBB60_2
// %bb.1:                               // %if.end.i
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x11, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	stp	x0, x8, [sp, #32]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib]
	mov	x1, sp
	stp	x9, x10, [sp]
	stp	x8, x11, [sp, #16]
	bl	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
.LBB60_2:                               // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end60:
	.size	halide_cond_signal, .Lfunc_end60-halide_cond_signal
                                        // -- End function
	.section	.text.halide_set_num_threads,"ax",@progbits
	.weak	halide_set_num_threads  // -- Begin function halide_set_num_threads
	.p2align	2
	.type	halide_set_num_threads,@function
halide_set_num_threads:                 // @halide_set_num_threads
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	w20, w0
	add	x29, sp, #32            // =32
	tbnz	w0, #31, .LBB61_3
// %bb.1:                               // %if.end
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_lock
	cbnz	w20, .LBB61_4
// %bb.2:                               // %if.then2
	bl	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	mov	w20, w0
	b	.LBB61_4
.LBB61_3:                               // %if.end.thread
	adrp	x1, .L.str.4
	add	x1, x1, :lo12:.L.str.4
	mov	x0, xzr
	bl	halide_error
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_lock
.LBB61_4:                               // %if.end3
	ldr	w21, [x19, #8]
	mov	w0, w20
	bl	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	str	w0, [x19, #8]
	mov	x0, x19
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end61:
	.size	halide_set_num_threads, .Lfunc_end61-halide_set_num_threads
                                        // -- End function
	.section	.text.halide_set_custom_do_task,"ax",@progbits
	.weak	halide_set_custom_do_task // -- Begin function halide_set_custom_do_task
	.p2align	2
	.type	halide_set_custom_do_task,@function
halide_set_custom_do_task:              // @halide_set_custom_do_task
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal14custom_do_taskE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal14custom_do_taskE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end62:
	.size	halide_set_custom_do_task, .Lfunc_end62-halide_set_custom_do_task
                                        // -- End function
	.section	.text.halide_set_custom_do_loop_task,"ax",@progbits
	.weak	halide_set_custom_do_loop_task // -- Begin function halide_set_custom_do_loop_task
	.p2align	2
	.type	halide_set_custom_do_loop_task,@function
halide_set_custom_do_loop_task:         // @halide_set_custom_do_loop_task
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end63:
	.size	halide_set_custom_do_loop_task, .Lfunc_end63-halide_set_custom_do_loop_task
                                        // -- End function
	.section	.text.halide_set_custom_do_par_for,"ax",@progbits
	.weak	halide_set_custom_do_par_for // -- Begin function halide_set_custom_do_par_for
	.p2align	2
	.type	halide_set_custom_do_par_for,@function
halide_set_custom_do_par_for:           // @halide_set_custom_do_par_for
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal17custom_do_par_forE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal17custom_do_par_forE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end64:
	.size	halide_set_custom_do_par_for, .Lfunc_end64-halide_set_custom_do_par_for
                                        // -- End function
	.section	.text.halide_set_custom_parallel_runtime,"ax",@progbits
	.weak	halide_set_custom_parallel_runtime // -- Begin function halide_set_custom_parallel_runtime
	.p2align	2
	.type	halide_set_custom_parallel_runtime,@function
halide_set_custom_parallel_runtime:     // @halide_set_custom_parallel_runtime
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17custom_do_par_forE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17custom_do_par_forE]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	adrp	x10, :got:_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	adrp	x11, :got:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	str	x0, [x8]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal14custom_do_taskE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal14custom_do_taskE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE]
	str	x1, [x8]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal21custom_semaphore_initE]
	str	x2, [x9]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE]
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE]
	str	x3, [x8]
	str	x4, [x10]
	str	x5, [x9]
	str	x6, [x11]
	ret
.Lfunc_end65:
	.size	halide_set_custom_parallel_runtime, .Lfunc_end65-halide_set_custom_parallel_runtime
                                        // -- End function
	.section	.text.halide_do_par_for,"ax",@progbits
	.weak	halide_do_par_for       // -- Begin function halide_do_par_for
	.p2align	2
	.type	halide_do_par_for,@function
halide_do_par_for:                      // @halide_do_par_for
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17custom_do_par_forE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17custom_do_par_forE]
	ldr	x5, [x8]
	br	x5
.Lfunc_end66:
	.size	halide_do_par_for, .Lfunc_end66-halide_do_par_for
                                        // -- End function
	.section	.text.halide_do_parallel_tasks,"ax",@progbits
	.weak	halide_do_parallel_tasks // -- Begin function halide_do_parallel_tasks
	.p2align	2
	.type	halide_do_parallel_tasks,@function
halide_do_parallel_tasks:               // @halide_do_parallel_tasks
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE]
	ldr	x4, [x8]
	br	x4
.Lfunc_end67:
	.size	halide_do_parallel_tasks, .Lfunc_end67-halide_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_semaphore_init,"ax",@progbits
	.weak	halide_semaphore_init   // -- Begin function halide_semaphore_init
	.p2align	2
	.type	halide_semaphore_init,@function
halide_semaphore_init:                  // @halide_semaphore_init
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal21custom_semaphore_initE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end68:
	.size	halide_semaphore_init, .Lfunc_end68-halide_semaphore_init
                                        // -- End function
	.section	.text.halide_semaphore_release,"ax",@progbits
	.weak	halide_semaphore_release // -- Begin function halide_semaphore_release
	.p2align	2
	.type	halide_semaphore_release,@function
halide_semaphore_release:               // @halide_semaphore_release
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end69:
	.size	halide_semaphore_release, .Lfunc_end69-halide_semaphore_release
                                        // -- End function
	.section	.text.halide_semaphore_try_acquire,"ax",@progbits
	.weak	halide_semaphore_try_acquire // -- Begin function halide_semaphore_try_acquire
	.p2align	2
	.type	halide_semaphore_try_acquire,@function
halide_semaphore_try_acquire:           // @halide_semaphore_try_acquire
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end70:
	.size	halide_semaphore_try_acquire, .Lfunc_end70-halide_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_default_get_symbol,"ax",@progbits
	.weak	halide_default_get_symbol // -- Begin function halide_default_get_symbol
	.p2align	2
	.type	halide_default_get_symbol,@function
halide_default_get_symbol:              // @halide_default_get_symbol
// %bb.0:                               // %entry
	mov	x1, x0
	mov	x0, xzr
	b	dlsym
.Lfunc_end71:
	.size	halide_default_get_symbol, .Lfunc_end71-halide_default_get_symbol
                                        // -- End function
	.section	.text.halide_default_load_library,"ax",@progbits
	.weak	halide_default_load_library // -- Begin function halide_default_load_library
	.p2align	2
	.type	halide_default_load_library,@function
halide_default_load_library:            // @halide_default_load_library
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	mov	w1, #1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	dlopen
	mov	x19, x0
	cbz	x0, .LBB72_2
// %bb.1:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB72_2:                               // %if.then
	bl	dlerror
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end72:
	.size	halide_default_load_library, .Lfunc_end72-halide_default_load_library
                                        // -- End function
	.section	.text.halide_default_get_library_symbol,"ax",@progbits
	.weak	halide_default_get_library_symbol // -- Begin function halide_default_get_library_symbol
	.p2align	2
	.type	halide_default_get_library_symbol,@function
halide_default_get_library_symbol:      // @halide_default_get_library_symbol
// %bb.0:                               // %entry
	b	dlsym
.Lfunc_end73:
	.size	halide_default_get_library_symbol, .Lfunc_end73-halide_default_get_library_symbol
                                        // -- End function
	.section	.text.halide_set_custom_get_symbol,"ax",@progbits
	.weak	halide_set_custom_get_symbol // -- Begin function halide_set_custom_get_symbol
	.p2align	2
	.type	halide_set_custom_get_symbol,@function
halide_set_custom_get_symbol:           // @halide_set_custom_get_symbol
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal17custom_get_symbolE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal17custom_get_symbolE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end74:
	.size	halide_set_custom_get_symbol, .Lfunc_end74-halide_set_custom_get_symbol
                                        // -- End function
	.section	.text.halide_set_custom_load_library,"ax",@progbits
	.weak	halide_set_custom_load_library // -- Begin function halide_set_custom_load_library
	.p2align	2
	.type	halide_set_custom_load_library,@function
halide_set_custom_load_library:         // @halide_set_custom_load_library
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19custom_load_libraryE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19custom_load_libraryE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end75:
	.size	halide_set_custom_load_library, .Lfunc_end75-halide_set_custom_load_library
                                        // -- End function
	.section	.text.halide_set_custom_get_library_symbol,"ax",@progbits
	.weak	halide_set_custom_get_library_symbol // -- Begin function halide_set_custom_get_library_symbol
	.p2align	2
	.type	halide_set_custom_get_library_symbol,@function
halide_set_custom_get_library_symbol:   // @halide_set_custom_get_library_symbol
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end76:
	.size	halide_set_custom_get_library_symbol, .Lfunc_end76-halide_set_custom_get_library_symbol
                                        // -- End function
	.section	.text.halide_get_symbol,"ax",@progbits
	.weak	halide_get_symbol       // -- Begin function halide_get_symbol
	.p2align	2
	.type	halide_get_symbol,@function
halide_get_symbol:                      // @halide_get_symbol
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17custom_get_symbolE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17custom_get_symbolE]
	ldr	x1, [x8]
	br	x1
.Lfunc_end77:
	.size	halide_get_symbol, .Lfunc_end77-halide_get_symbol
                                        // -- End function
	.section	.text.halide_load_library,"ax",@progbits
	.weak	halide_load_library     // -- Begin function halide_load_library
	.p2align	2
	.type	halide_load_library,@function
halide_load_library:                    // @halide_load_library
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal19custom_load_libraryE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal19custom_load_libraryE]
	ldr	x1, [x8]
	br	x1
.Lfunc_end78:
	.size	halide_load_library, .Lfunc_end78-halide_load_library
                                        // -- End function
	.section	.text.halide_get_library_symbol,"ax",@progbits
	.weak	halide_get_library_symbol // -- Begin function halide_get_library_symbol
	.p2align	2
	.type	halide_get_library_symbol,@function
halide_get_library_symbol:              // @halide_get_library_symbol
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end79:
	.size	halide_get_library_symbol, .Lfunc_end79-halide_get_library_symbol
                                        // -- End function
	.section	.text.halide_set_gpu_device,"ax",@progbits
	.weak	halide_set_gpu_device   // -- Begin function halide_set_gpu_device
	.p2align	2
	.type	halide_set_gpu_device,@function
halide_set_gpu_device:                  // @halide_set_gpu_device
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	adrp	x9, :got:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE]
	mov	w10, #1
	str	w0, [x8]
	strb	w10, [x9]
	ret
.Lfunc_end80:
	.size	halide_set_gpu_device, .Lfunc_end80-halide_set_gpu_device
                                        // -- End function
	.section	.text.halide_get_gpu_device,"ax",@progbits
	.weak	halide_get_gpu_device   // -- Begin function halide_get_gpu_device
	.p2align	2
	.type	halide_get_gpu_device,@function
halide_get_gpu_device:                  // @halide_get_gpu_device
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE]
	mov	w8, #1
	add	x29, sp, #16            // =16
.LBB81_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x19]
	stlxr	w10, w8, [x19]
	orr	w9, w10, w9
	cbnz	w9, .LBB81_1
// %bb.2:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	adrp	x20, :got:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE]
	ldrb	w8, [x20]
	cbz	w8, .LBB81_4
// %bb.3:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit.if.end4_crit_edge
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE]
	ldr	w0, [x8]
	stlr	wzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB81_4:                               // %if.then
	adrp	x0, .L.str.10
	add	x0, x0, :lo12:.L.str.10
	bl	getenv
	cbz	x0, .LBB81_6
// %bb.5:                               // %if.then2
	bl	atoi
	b	.LBB81_7
.LBB81_6:
	mov	w0, #-1
.LBB81_7:                               // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE]
	mov	w9, #1
	strb	w9, [x20]
	str	w0, [x8]
	stlr	wzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end81:
	.size	halide_get_gpu_device, .Lfunc_end81-halide_get_gpu_device
                                        // -- End function
	.section	.text.halide_default_trace,"ax",@progbits
	.weak	halide_default_trace    // -- Begin function halide_default_trace
	.p2align	2
	.type	halide_default_trace,@function
halide_default_trace:                   // @halide_default_trace
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	sub	sp, sp, #1, lsl #12     // =4096
	sub	sp, sp, #48             // =48
	adrp	x8, _ZZ20halide_default_traceE3ids
	mov	x21, x1
	add	x8, x8, :lo12:_ZZ20halide_default_traceE3ids
	str	x0, [sp, #32]           // 8-byte Folded Spill
.LBB82_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w19, [x8]
	add	w9, w19, #1             // =1
	stlxr	w10, w9, [x8]
	cbnz	w10, .LBB82_1
// %bb.2:                               // %atomicrmw.end
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	bl	halide_get_trace_file
	cmp	w0, #1                  // =1
	str	w0, [sp, #28]           // 4-byte Folded Spill
	b.lt	.LBB82_5
// %bb.3:                               // %if.then
	ldrb	w8, [x21, #33]
	ldrh	w9, [x21, #34]
	ldr	w10, [x21, #48]
	ldr	x0, [x21]
	add	x8, x8, #7              // =7
	lsr	x8, x8, #3
	mul	x22, x8, x9
	lsl	w23, w10, #2
	bl	strlen
	ldr	x8, [x21, #24]
	add	w20, w0, #1             // =1
	cbz	x8, .LBB82_60
// %bb.4:                               // %cond.true
	mov	x0, x8
	bl	strlen
	add	w10, w0, #1             // =1
	b	.LBB82_61
.LBB82_5:                               // %if.else
	add	x8, sp, #40             // =40
	strb	wzr, [x8, #4095]
	ldrb	w8, [x21, #33]
	add	x9, sp, #40             // =40
	add	x22, x9, #4095          // =4095
	mov	w9, #8
.LBB82_6:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	mov	w26, w9
	cmp	w9, w8
	lsl	w9, w9, #1
	b.lt	.LBB82_6
// %bb.7:                               // %while.end
	cmp	w26, #65                // =65
	b.lt	.LBB82_9
// %bb.8:                               // %if.then63
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.2.13
	add	x1, x1, :lo12:.L.str.2.13
	bl	halide_print
	bl	abort
.LBB82_9:                               // %if.end64
	ldr	w20, [x21, #36]
	adrp	x8, .L__const.halide_default_trace.event_types
	add	x8, x8, :lo12:.L__const.halide_default_trace.event_types
	add	x0, sp, #40             // =40
	ldr	x2, [x8, x20, lsl #3]
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.20.189
	add	x2, x2, :lo12:.L.str.20.189
	mov	x1, x22
	bl	halide_string_to_string
	ldr	x2, [x21]
	cbnz	x2, .LBB82_11
// %bb.10:                              // %if.then.i462
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
.LBB82_11:                              // %if.else.i464
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x22
	bl	halide_string_to_string
	ldrsw	x2, [x21, #44]
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.22.191
	add	x2, x2, :lo12:.L.str.22.191
	mov	x1, x22
	bl	halide_string_to_string
	ldrh	w8, [x21, #34]
	cmp	w8, #2                  // =2
	b.lo	.LBB82_13
// %bb.12:                              // %if.then80
	adrp	x2, .L.str.17
	add	x2, x2, :lo12:.L.str.17
	mov	x1, x22
	bl	halide_string_to_string
.LBB82_13:                              // %if.end82
	ldr	w8, [x21, #48]
	cmp	w8, #1                  // =1
	b.lt	.LBB82_22
// %bb.14:                              // %for.body.lr.ph
	adrp	x24, .L.str.18
	adrp	x25, .L.str.55
	mov	x23, xzr
	add	x24, x24, :lo12:.L.str.18
	add	x25, x25, :lo12:.L.str.55
	cbnz	x23, .LBB82_19
	b	.LBB82_17
.LBB82_15:                              // %if.else97.split
	mov	x2, x25
.LBB82_16:                              // %if.end100.sink.split
	mov	x1, x22
	bl	halide_string_to_string
.LBB82_17:                              // %if.end100
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x21, #16]
	mov	w3, #1
	mov	x1, x22
	ldrsw	x2, [x8, x23, lsl #2]
	bl	halide_int64_to_string
	ldrsw	x8, [x21, #48]
	add	x23, x23, #1            // =1
	cmp	x23, x8
	b.ge	.LBB82_22
// %bb.18:                              // %for.body
                                        //   in Loop: Header=BB82_17 Depth=1
	cbz	x23, .LBB82_17
.LBB82_19:                              // %if.then86
	ldrh	w8, [x21, #34]
	cmp	w8, #2                  // =2
	b.lo	.LBB82_15
// %bb.20:                              // %land.lhs.true
	udiv	w9, w23, w8
	msub	w8, w9, w8, w23
	cbnz	w8, .LBB82_15
// %bb.21:
	mov	x2, x24
	b	.LBB82_16
.LBB82_22:                              // %for.cond.cleanup
	ldrh	w8, [x21, #34]
	adrp	x9, .L.str.5.170
	adrp	x10, .L.str.20
	add	x9, x9, :lo12:.L.str.5.170
	add	x10, x10, :lo12:.L.str.20
	cmp	w8, #1                  // =1
	csel	x2, x10, x9, hi
	mov	x1, x22
	bl	halide_string_to_string
	cmp	w20, #1                 // =1
	mov	x23, x0
	b.gt	.LBB82_106
// %bb.23:                              // %if.then115
	ldrh	w8, [x21, #34]
	adrp	x9, .L.str.23
	adrp	x10, .L.str.22
	add	x9, x9, :lo12:.L.str.23
	add	x10, x10, :lo12:.L.str.22
	cmp	w8, #1                  // =1
	csel	x2, x10, x9, hi
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	ldrh	w8, [x21, #34]
	mov	x23, x0
	cbz	w8, .LBB82_106
// %bb.24:                              // %for.body132.lr.ph
	adrp	x24, .L.str.24
	adrp	x25, .L.str.55
	mov	x27, xzr
	add	x24, x24, :lo12:.L.str.24
	add	x25, x25, :lo12:.L.str.55
	cbnz	x27, .LBB82_30
	b	.LBB82_31
.LBB82_25:                              // %if.then186
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrh	w2, [x8, x27, lsl #1]
.LBB82_26:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	w3, #1
	mov	x0, x23
	mov	x1, x22
	bl	halide_int64_to_string
.LBB82_27:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	x23, x0
.LBB82_28:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	ldrh	w8, [x21, #34]
	add	x27, x27, #1            // =1
	cmp	x27, x8
	b.hs	.LBB82_104
// %bb.29:                              // %for.body132
                                        //   in Loop: Header=BB82_31 Depth=1
	cbz	x27, .LBB82_31
.LBB82_30:                              // %if.then134
	mov	x0, x23
	mov	x1, x22
	mov	x2, x25
	bl	halide_string_to_string
	mov	x23, x0
.LBB82_31:                              // %if.end136
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w8, [x21, #32]
	cmp	w8, #1                  // =1
	b.gt	.LBB82_37
// %bb.32:                              // %if.end136
                                        //   in Loop: Header=BB82_31 Depth=1
	cbz	w8, .LBB82_40
// %bb.33:                              // %if.end136
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w8, #1                  // =1
	b.ne	.LBB82_28
// %bb.34:                              // %if.then176
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #16                // =16
	b.eq	.LBB82_25
// %bb.35:                              // %if.then176
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #8                 // =8
	b.ne	.LBB82_47
// %bb.36:                              // %if.then178
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrb	w2, [x8, x27]
	b	.LBB82_26
.LBB82_37:                              // %if.end136
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w8, #2                  // =2
	b.eq	.LBB82_43
// %bb.38:                              // %if.end136
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w8, #3                  // =3
	b.ne	.LBB82_28
// %bb.39:                              // %if.then241
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	mov	x0, x23
	mov	x1, x22
	ldr	x2, [x8, x27, lsl #3]
	bl	halide_pointer_to_string
	b	.LBB82_27
.LBB82_40:                              // %if.then140
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #16                // =16
	b.eq	.LBB82_49
// %bb.41:                              // %if.then140
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #8                 // =8
	b.ne	.LBB82_50
// %bb.42:                              // %if.then142
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrsb	x2, [x8, x27]
	b	.LBB82_26
.LBB82_43:                              // %if.then212
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #15                // =15
	b.le	.LBB82_46
// %bb.44:                              // %if.end215
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #32                // =32
	b.ne	.LBB82_52
// %bb.45:                              // %if.then217
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	mov	x0, x23
	mov	x1, x22
	mov	w2, wzr
	ldr	s0, [x8, x27, lsl #2]
	fcvt	d0, s0
	b	.LBB82_56
.LBB82_46:                              // %if.else222.thread
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	mov	x1, x24
	bl	halide_print
	bl	abort
	ldr	x8, [x21, #8]
	b	.LBB82_54
.LBB82_47:                              // %if.else192
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	cmp	w26, #32                // =32
	b.ne	.LBB82_57
// %bb.48:                              // %if.then194
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	w2, [x8, x27, lsl #2]
	b	.LBB82_58
.LBB82_49:                              // %if.then150
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrsh	x2, [x8, x27, lsl #1]
	b	.LBB82_26
.LBB82_50:                              // %if.else156
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	cmp	w26, #32                // =32
	b.ne	.LBB82_59
// %bb.51:                              // %if.then158
                                        //   in Loop: Header=BB82_31 Depth=1
	ldrsw	x2, [x8, x27, lsl #2]
	b	.LBB82_26
.LBB82_52:                              // %if.else222
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	cmp	w26, #16                // =16
	b.ne	.LBB82_54
// %bb.53:                              // %if.then224
                                        //   in Loop: Header=BB82_31 Depth=1
	ldrh	w0, [x8, x27, lsl #1]
	bl	halide_float16_bits_to_double
	b	.LBB82_55
.LBB82_54:                              // %if.else229
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	d0, [x8, x27, lsl #3]
.LBB82_55:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	w2, #1
	mov	x0, x23
	mov	x1, x22
.LBB82_56:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	bl	halide_double_to_string
	b	.LBB82_27
.LBB82_57:                              // %if.else199
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x2, [x8, x27, lsl #3]
.LBB82_58:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	w3, #1
	mov	x0, x23
	mov	x1, x22
	bl	halide_uint64_to_string
	b	.LBB82_27
.LBB82_59:                              // %if.else163
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x2, [x8, x27, lsl #3]
	b	.LBB82_26
.LBB82_60:
	mov	w10, #1
.LBB82_61:                              // %cond.end
	str	x22, [sp, #8]           // 8-byte Folded Spill
	str	w23, [sp, #4]           // 4-byte Folded Spill
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	add	w8, w23, w22
	add	w8, w8, w20
	add	w8, w8, w10
	ldr	x23, [x9]
	add	w8, w8, #31             // =31
	and	w28, w8, #0xfffffffc
	stp	w20, w10, [sp, #20]     // 8-byte Folded Spill
	add	x20, x23, #4            // =4
	add	x22, x23, #8            // =8
	cmp	w28, #256, lsl #12      // =1048576
	add	x24, x23, #12           // =12
	b.hi	.LBB82_81
// %bb.62:                              // %while.body.i.i.us.i.preheader
	mov	w27, #1073741824
	mov	w25, #-2147483648
	b	.LBB82_64
.LBB82_63:                              // %cmpxchg.nostore
                                        //   in Loop: Header=BB82_64 Depth=1
	clrex
.LBB82_64:                              // %while.body.i.i.us.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB82_65 Depth 2
                                        //     Child Loop BB82_67 Depth 2
                                        //     Child Loop BB82_69 Depth 2
                                        //     Child Loop BB82_70 Depth 2
                                        //     Child Loop BB82_72 Depth 2
                                        //       Child Loop BB82_73 Depth 3
                                        //     Child Loop BB82_77 Depth 2
                                        //     Child Loop BB82_80 Depth 2
	ldr	w8, [x23]
	and	x8, x8, #0x3fffffff
	add	x9, x8, #1              // =1
.LBB82_65:                              // %cmpxchg.start
                                        //   Parent Loop BB82_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w10, [x23]
	cmp	w10, w8
	b.ne	.LBB82_63
// %bb.66:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB82_65 Depth=2
	stlxr	w10, w9, [x23]
	cbnz	w10, .LBB82_65
.LBB82_67:                              // %atomicrmw.start2
                                        //   Parent Loop BB82_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x20]
	add	w9, w8, w28
	stlxr	w10, w9, [x20]
	cbnz	w10, .LBB82_67
// %bb.68:                              // %atomicrmw.end1
                                        //   in Loop: Header=BB82_64 Depth=1
	cmp	w9, #256, lsl #12       // =1048576
	b.ls	.LBB82_101
.LBB82_69:                              // %atomicrmw.start6
                                        //   Parent Loop BB82_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x22]
	add	w8, w8, w28
	stlxr	w9, w8, [x22]
	cbnz	w9, .LBB82_69
.LBB82_70:                              // %atomicrmw.start10
                                        //   Parent Loop BB82_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	sub	w8, w8, #1              // =1
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_70
	b	.LBB82_72
.LBB82_71:                              // %cmpxchg.nostore19
                                        //   in Loop: Header=BB82_72 Depth=2
	clrex
.LBB82_72:                              // %atomicrmw.start14
                                        //   Parent Loop BB82_64 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB82_73 Depth 3
	ldaxr	w8, [x23]
	orr	w8, w8, #0x40000000
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_72
.LBB82_73:                              // %cmpxchg.start24
                                        //   Parent Loop BB82_64 Depth=1
                                        //     Parent Loop BB82_72 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldaxr	w8, [x23]
	cmp	w8, w27
	b.ne	.LBB82_71
// %bb.74:                              // %cmpxchg.trystore22
                                        //   in Loop: Header=BB82_73 Depth=3
	stlxr	w8, w25, [x23]
	cbnz	w8, .LBB82_73
// %bb.75:                              // %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i
                                        //   in Loop: Header=BB82_64 Depth=1
	ldr	w8, [x20]
	cbz	w8, .LBB82_80
// %bb.76:                              // %if.then.i9.us.i
                                        //   in Loop: Header=BB82_64 Depth=1
	ldr	w9, [x22]
	ldr	w0, [sp, #28]           // 4-byte Folded Reload
	mov	x1, x24
	sub	w26, w8, w9
	mov	x2, x26
	str	w26, [x20]
	bl	write
	str	xzr, [x20]
.LBB82_77:                              // %atomicrmw.start28
                                        //   Parent Loop BB82_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_77
// %bb.78:                              // %atomicrmw.end27
                                        //   in Loop: Header=BB82_64 Depth=1
	cmp	w26, w0
	b.eq	.LBB82_64
// %bb.79:                              // %if.then10.i.us.i
                                        //   in Loop: Header=BB82_64 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.32
	add	x1, x1, :lo12:.L.str.32
	bl	halide_print
	bl	abort
	b	.LBB82_64
.LBB82_80:                              // %atomicrmw.start32
                                        //   Parent Loop BB82_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_80
	b	.LBB82_64
.LBB82_81:
	mov	w26, #1073741824
	mov	w25, #-2147483648
	b	.LBB82_83
.LBB82_82:                              // %cmpxchg.nostore37
                                        //   in Loop: Header=BB82_83 Depth=1
	clrex
.LBB82_83:                              // %while.body.i.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB82_84 Depth 2
                                        //     Child Loop BB82_87 Depth 2
                                        //     Child Loop BB82_89 Depth 2
                                        //     Child Loop BB82_90 Depth 2
                                        //     Child Loop BB82_92 Depth 2
                                        //       Child Loop BB82_93 Depth 3
                                        //     Child Loop BB82_97 Depth 2
                                        //     Child Loop BB82_100 Depth 2
	ldr	w8, [x23]
	and	x8, x8, #0x3fffffff
	add	x9, x8, #1              // =1
.LBB82_84:                              // %cmpxchg.start42
                                        //   Parent Loop BB82_83 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w10, [x23]
	cmp	w10, w8
	b.ne	.LBB82_82
// %bb.85:                              // %cmpxchg.trystore40
                                        //   in Loop: Header=BB82_84 Depth=2
	stlxr	w10, w9, [x23]
	cbnz	w10, .LBB82_84
// %bb.86:                              // %if.then.i.i
                                        //   in Loop: Header=BB82_83 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.31
	add	x1, x1, :lo12:.L.str.31
	bl	halide_print
	bl	abort
.LBB82_87:                              // %atomicrmw.start46
                                        //   Parent Loop BB82_83 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x20]
	add	w9, w8, w28
	stlxr	w10, w9, [x20]
	cbnz	w10, .LBB82_87
// %bb.88:                              // %atomicrmw.end45
                                        //   in Loop: Header=BB82_83 Depth=1
	cmp	w9, #256, lsl #12       // =1048576
	b.ls	.LBB82_101
.LBB82_89:                              // %atomicrmw.start50
                                        //   Parent Loop BB82_83 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x22]
	add	w8, w8, w28
	stlxr	w9, w8, [x22]
	cbnz	w9, .LBB82_89
.LBB82_90:                              // %atomicrmw.start54
                                        //   Parent Loop BB82_83 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	sub	w8, w8, #1              // =1
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_90
	b	.LBB82_92
.LBB82_91:                              // %cmpxchg.nostore63
                                        //   in Loop: Header=BB82_92 Depth=2
	clrex
.LBB82_92:                              // %atomicrmw.start58
                                        //   Parent Loop BB82_83 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB82_93 Depth 3
	ldaxr	w8, [x23]
	orr	w8, w8, #0x40000000
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_92
.LBB82_93:                              // %cmpxchg.start68
                                        //   Parent Loop BB82_83 Depth=1
                                        //     Parent Loop BB82_92 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldaxr	w8, [x23]
	cmp	w8, w26
	b.ne	.LBB82_91
// %bb.94:                              // %cmpxchg.trystore66
                                        //   in Loop: Header=BB82_93 Depth=3
	stlxr	w8, w25, [x23]
	cbnz	w8, .LBB82_93
// %bb.95:                              // %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i
                                        //   in Loop: Header=BB82_83 Depth=1
	ldr	w8, [x20]
	cbz	w8, .LBB82_100
// %bb.96:                              // %if.then.i9.i
                                        //   in Loop: Header=BB82_83 Depth=1
	ldr	w9, [x22]
	ldr	w0, [sp, #28]           // 4-byte Folded Reload
	mov	x1, x24
	sub	w27, w8, w9
	mov	x2, x27
	str	w27, [x20]
	bl	write
	str	xzr, [x20]
.LBB82_97:                              // %atomicrmw.start72
                                        //   Parent Loop BB82_83 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_97
// %bb.98:                              // %atomicrmw.end71
                                        //   in Loop: Header=BB82_83 Depth=1
	cmp	w27, w0
	b.eq	.LBB82_83
// %bb.99:                              // %if.then10.i.i
                                        //   in Loop: Header=BB82_83 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.32
	add	x1, x1, :lo12:.L.str.32
	bl	halide_print
	bl	abort
	b	.LBB82_83
.LBB82_100:                             // %atomicrmw.start76
                                        //   Parent Loop BB82_83 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_100
	b	.LBB82_83
.LBB82_101:                             // %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit
	ldr	x22, [sp, #8]           // 8-byte Folded Reload
	add	x8, x23, w8, uxtw
	cmp	w28, #1, lsl #12        // =4096
	add	x20, x8, #12            // =12
	b.ls	.LBB82_116
// %bb.102:                             // %if.then17
	mov	w1, #1024
	mov	x0, xzr
	bl	halide_malloc
	cbz	x0, .LBB82_114
// %bb.103:                             // %if.else.i416
	add	x25, x0, #1023          // =1023
	mov	w2, w28
	mov	w3, #1
	mov	x1, x25
	mov	x24, x0
	strb	wzr, [x0, #1023]
	bl	halide_uint64_to_string
	adrp	x2, .L.str.3.215
	add	x2, x2, :lo12:.L.str.3.215
	mov	x1, x25
	bl	halide_string_to_string
	sub	x8, x0, x24
	add	x2, x8, #1              // =1
	mov	x0, xzr
	mov	x1, x24
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, xzr
	mov	x1, x24
	bl	halide_print
	mov	x0, xzr
	mov	x1, x24
	b	.LBB82_115
.LBB82_104:                             // %for.cond.cleanup131
	cmp	w8, #1                  // =1
	b.ls	.LBB82_106
// %bb.105:                             // %if.then257
	adrp	x2, .L.str.25
	add	x2, x2, :lo12:.L.str.25
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	mov	x23, x0
.LBB82_106:                             // %if.end260
	ldr	x8, [x21, #24]
	cbz	x8, .LBB82_111
// %bb.107:                             // %land.lhs.true263
	ldrb	w8, [x8]
	cbz	w8, .LBB82_111
// %bb.108:                             // %if.then266
	adrp	x2, .L.str.26
	add	x2, x2, :lo12:.L.str.26
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	ldr	x2, [x21, #24]
	cbnz	x2, .LBB82_110
// %bb.109:                             // %if.then.i595
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
.LBB82_110:                             // %if.else.i597
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.27
	add	x2, x2, :lo12:.L.str.27
	mov	x1, x22
	bl	halide_string_to_string
	mov	x23, x0
.LBB82_111:                             // %if.end271
	adrp	x2, .L.str.3.215
	add	x2, x2, :lo12:.L.str.3.215
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	add	x8, sp, #40             // =40
	sub	x8, x0, x8
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	add	x21, x8, #1             // =1
	add	x1, sp, #40             // =40
	mov	x2, x21
	bl	halide_msan_annotate_memory_is_initialized
	adrp	x20, :got:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE]
	mov	w8, #1
.LBB82_112:                             // %atomicrmw.start106
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x20]
	stlxr	w10, w8, [x20]
	orr	w9, w10, w9
	cbnz	w9, .LBB82_112
// %bb.113:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy4096EED2Ev.exit
	ldr	x22, [sp, #32]          // 8-byte Folded Reload
	add	x1, sp, #40             // =40
	mov	x0, x22
	bl	halide_print
	add	x1, sp, #40             // =40
	mov	x0, x22
	mov	x2, x21
	stlr	wzr, [x20]
	bl	halide_msan_annotate_memory_is_initialized
	b	.LBB82_136
.LBB82_114:                             // %if.then.i410
	mov	w2, w28
	mov	w3, #1
	mov	x1, xzr
	bl	halide_uint64_to_string
	adrp	x2, .L.str.3.215
	add	x2, x2, :lo12:.L.str.3.215
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, xzr
	bl	halide_error
	mov	x0, xzr
	mov	x1, xzr
.LBB82_115:                             // %if.end
	bl	halide_free
.LBB82_116:                             // %if.end
	stp	w28, w19, [x20]
	ldr	w8, [x21, #32]
	str	w8, [x20, #8]
	ldur	q0, [x21, #36]
	stur	q0, [x20, #12]
	ldr	x1, [x21, #16]
	cbz	x1, .LBB82_118
// %bb.117:                             // %if.then28
	ldr	w8, [sp, #4]            // 4-byte Folded Reload
	add	x0, x20, #28            // =28
	mov	w2, w8
	bl	memcpy
.LBB82_118:                             // %if.end33
	ldr	x1, [x21, #8]
	cbz	x1, .LBB82_120
// %bb.119:                             // %if.then35
	ldrsw	x8, [x20, #24]
	mov	x2, x22
	add	x8, x20, x8, lsl #2
	add	x0, x8, #28             // =28
	bl	memcpy
.LBB82_120:                             // %if.end40
	ldrb	w9, [x20, #9]
	ldrsw	x8, [x20, #24]
	ldrh	w10, [x20, #10]
	add	x22, x20, #28           // =28
	add	x9, x9, #7              // =7
	add	x8, x22, x8, lsl #2
	lsr	x9, x9, #3
	madd	x0, x9, x10, x8
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	ldr	x1, [x21]
	mov	w2, w8
	bl	memcpy
	ldrb	w9, [x20, #9]
	ldrsw	x8, [x20, #24]
	ldrh	w10, [x20, #10]
	add	x9, x9, #7              // =7
	add	x8, x22, x8, lsl #2
	lsr	x9, x9, #3
	madd	x0, x9, x10, x8
.LBB82_121:                             // %while.cond.i432
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w8, [x0], #1
	cbnz	w8, .LBB82_121
// %bb.122:                             // %_ZN21halide_trace_packet_t9trace_tagEv.exit
	ldr	x8, [x21, #24]
	adrp	x9, .L.str.165
	add	x9, x9, :lo12:.L.str.165
	cmp	x8, #0                  // =0
	csel	x1, x9, x8, eq
	ldr	w8, [sp, #24]           // 4-byte Folded Reload
	mov	w2, w8
	bl	memcpy
	adrp	x11, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	ldr	x8, [x11]
	dmb	ish
.LBB82_123:                             // %atomicrmw.start80
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x8]
	sub	w9, w9, #1              // =1
	stlxr	w10, w9, [x8]
	cbnz	w10, .LBB82_123
// %bb.124:                             // %atomicrmw.end79
	ldr	w8, [x21, #36]
	cmp	w8, #9                  // =9
	b.ne	.LBB82_136
// %bb.125:                             // %if.then57
	ldr	x20, [x11]
	mov	w8, #1073741824
	mov	w9, #-2147483648
	b	.LBB82_127
.LBB82_126:                             // %cmpxchg.nostore89
                                        //   in Loop: Header=BB82_127 Depth=1
	clrex
.LBB82_127:                             // %atomicrmw.start84
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB82_128 Depth 2
	ldaxr	w10, [x20]
	orr	w10, w10, #0x40000000
	stlxr	w11, w10, [x20]
	cbnz	w11, .LBB82_127
.LBB82_128:                             // %cmpxchg.start94
                                        //   Parent Loop BB82_127 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w10, [x20]
	cmp	w10, w8
	b.ne	.LBB82_126
// %bb.129:                             // %cmpxchg.trystore92
                                        //   in Loop: Header=BB82_128 Depth=2
	stlxr	w10, w9, [x20]
	cbnz	w10, .LBB82_128
// %bb.130:                             // %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i
	ldr	w8, [x20, #4]
	cbz	w8, .LBB82_135
// %bb.131:                             // %if.then.i437
	ldr	w9, [x20, #8]
	ldr	w0, [sp, #28]           // 4-byte Folded Reload
	add	x1, x20, #12            // =12
	sub	w21, w8, w9
	mov	x2, x21
	str	w21, [x20, #4]
	bl	write
	stp	wzr, wzr, [x20, #4]
.LBB82_132:                             // %atomicrmw.start98
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w8, [x20]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x20]
	cbnz	w9, .LBB82_132
// %bb.133:                             // %atomicrmw.end97
	cmp	w21, w0
	b.eq	.LBB82_136
// %bb.134:                             // %if.then10.i
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.32
	add	x1, x1, :lo12:.L.str.32
	bl	halide_print
	bl	abort
	b	.LBB82_136
.LBB82_135:                             // %atomicrmw.start102
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w8, [x20]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x20]
	cbnz	w9, .LBB82_135
.LBB82_136:                             // %if.end274
	mov	w0, w19
	add	sp, sp, #1, lsl #12     // =4096
	add	sp, sp, #48             // =48
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end82:
	.size	halide_default_trace, .Lfunc_end82-halide_default_trace
                                        // -- End function
	.section	.text.halide_get_trace_file,"ax",@progbits
	.weak	halide_get_trace_file   // -- Begin function halide_get_trace_file
	.p2align	2
	.type	halide_get_trace_file,@function
halide_get_trace_file:                  // @halide_get_trace_file
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x21, :got:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE]
	mov	x19, x0
	mov	w8, #1
	add	x29, sp, #32            // =32
.LBB83_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x21]
	stlxr	w10, w8, [x21]
	orr	w9, w10, w9
	cbnz	w9, .LBB83_1
// %bb.2:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	adrp	x22, :got:_ZN6Halide7Runtime8Internal17halide_trace_fileE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal17halide_trace_fileE]
	ldr	w8, [x22]
	tbnz	w8, #31, .LBB83_4
.LBB83_3:                               // %if.end11
	ldr	w0, [x22]
	stlr	wzr, [x21]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB83_4:                               // %if.then
	adrp	x0, .L.str.28
	add	x0, x0, :lo12:.L.str.28
	bl	getenv
	cbz	x0, .LBB83_9
// %bb.5:                               // %if.then1
	adrp	x1, .L.str.29
	add	x1, x1, :lo12:.L.str.29
	bl	fopen
	mov	x20, x0
	cbnz	x0, .LBB83_7
// %bb.6:                               // %if.then4
	adrp	x1, .L.str.30
	add	x1, x1, :lo12:.L.str.30
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB83_7:                               // %if.end
	mov	x0, x20
	bl	fileno
	bl	halide_set_trace_file
	adrp	x19, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	ldr	x8, [x19]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE]
	str	x20, [x9]
	cbnz	x8, .LBB83_3
// %bb.8:                               // %if.then7
	mov	w0, #12
	movk	w0, #16, lsl #16
	bl	malloc
	str	x0, [x19]
	stp	wzr, wzr, [x0, #4]
	str	wzr, [x0]
	b	.LBB83_3
.LBB83_9:                               // %if.else
	bl	halide_set_trace_file
	b	.LBB83_3
.Lfunc_end83:
	.size	halide_get_trace_file, .Lfunc_end83-halide_get_trace_file
                                        // -- End function
	.section	.text.halide_set_trace_file,"ax",@progbits
	.weak	halide_set_trace_file   // -- Begin function halide_set_trace_file
	.p2align	2
	.type	halide_set_trace_file,@function
halide_set_trace_file:                  // @halide_set_trace_file
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_trace_fileE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_trace_fileE]
	str	w0, [x8]
	ret
.Lfunc_end84:
	.size	halide_set_trace_file, .Lfunc_end84-halide_set_trace_file
                                        // -- End function
	.section	.text.halide_trace_cleanup,"ax",@progbits
	.weak	halide_trace_cleanup    // -- Begin function halide_trace_cleanup
	.p2align	2
	.type	halide_trace_cleanup,@function
halide_trace_cleanup:                   // @halide_trace_cleanup
// %bb.0:                               // %entry
	b	halide_shutdown_trace
.Lfunc_end85:
	.size	halide_trace_cleanup, .Lfunc_end85-halide_trace_cleanup
                                        // -- End function
	.section	.text.halide_shutdown_trace,"ax",@progbits
	.weak	halide_shutdown_trace   // -- Begin function halide_shutdown_trace
	.p2align	2
	.type	halide_shutdown_trace,@function
halide_shutdown_trace:                  // @halide_shutdown_trace
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE]
	add	x29, sp, #16            // =16
	ldr	x0, [x20]
	cbz	x0, .LBB86_4
// %bb.1:                               // %if.then
	bl	fclose
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_trace_fileE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_trace_fileE]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	mov	w19, w0
	str	wzr, [x8]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
	ldr	x0, [x9]
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE]
	str	xzr, [x20]
	strb	wzr, [x8]
	cbz	x0, .LBB86_3
// %bb.2:                               // %if.then2
	bl	free
.LBB86_3:                               // %return
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB86_4:
	mov	w19, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end86:
	.size	halide_shutdown_trace, .Lfunc_end86-halide_shutdown_trace
                                        // -- End function
	.section	.text.halide_set_custom_trace,"ax",@progbits
	.weak	halide_set_custom_trace // -- Begin function halide_set_custom_trace
	.p2align	2
	.type	halide_set_custom_trace,@function
halide_set_custom_trace:                // @halide_set_custom_trace
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19halide_custom_traceE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19halide_custom_traceE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end87:
	.size	halide_set_custom_trace, .Lfunc_end87-halide_set_custom_trace
                                        // -- End function
	.section	.text.halide_trace,"ax",@progbits
	.weak	halide_trace            // -- Begin function halide_trace
	.p2align	2
	.type	halide_trace,@function
halide_trace:                           // @halide_trace
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal19halide_custom_traceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal19halide_custom_traceE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end88:
	.size	halide_trace, .Lfunc_end88-halide_trace
                                        // -- End function
	.section	.text.halide_trace_helper,"ax",@progbits
	.weak	halide_trace_helper     // -- Begin function halide_trace_helper
	.p2align	2
	.type	halide_trace_helper,@function
halide_trace_helper:                    // @halide_trace_helper
// %bb.0:                               // %entry
	sub	sp, sp, #128            // =128
	stp	x29, x30, [sp, #112]    // 16-byte Folded Spill
	add	x29, sp, #112           // =112
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	ldrsw	x24, [x29, #32]
	ldr	w8, [x29, #24]
	ldr	w9, [x29, #16]
	ldr	x10, [x29, #40]
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	mov	x22, x2
	stp	x1, x2, [sp, #8]
	add	x1, sp, #8              // =8
	mov	w2, #56
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	w19, w6
	mov	w20, w5
	mov	x21, x3
	mov	x23, x0
	strb	w4, [sp, #40]
	strb	w5, [sp, #41]
	strh	w6, [sp, #42]
	stp	x3, x10, [sp, #24]
	stp	w7, w9, [sp, #44]
	stp	w8, w24, [sp, #52]
	bl	halide_msan_annotate_memory_is_initialized
	add	w8, w20, #7             // =7
	add	w9, w20, #14            // =14
	cmp	w8, #0                  // =0
	csel	w8, w9, w8, lt
	asr	w8, w8, #3
	mul	w8, w8, w19
	sxtw	x2, w8
	mov	x0, x23
	mov	x1, x22
	bl	halide_msan_annotate_memory_is_initialized
	lsl	x2, x24, #2
	mov	x0, x23
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	add	x1, sp, #8              // =8
	mov	x0, x23
	bl	halide_trace
	ldp	x29, x30, [sp, #112]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.Lfunc_end89:
	.size	halide_trace_helper, .Lfunc_end89-halide_trace_helper
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal9ends_withEPKcS3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_ // -- Begin function _ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_,@function
_ZN6Halide7Runtime8Internal9ends_withEPKcS3_: // @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
// %bb.0:                               // %entry
	mov	w10, #1
	mov	x8, x0
.LBB90_1:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	mov	x12, x8
	ldrb	w11, [x8], #1
	mov	x9, x10
	sub	x10, x10, #1            // =1
	cbnz	w11, .LBB90_1
// %bb.2:                               // %while.cond1.preheader
	mov	w13, #1
	mov	x10, x1
.LBB90_3:                               // %while.cond1
                                        // =>This Inner Loop Header: Depth=1
	mov	x14, x10
	ldrb	w15, [x10], #1
	mov	x11, x13
	sub	x13, x13, #1            // =1
	cbnz	w15, .LBB90_3
// %bb.4:                               // %while.cond6.preheader
	cmp	x12, x0
	mov	w13, #1
	b.eq	.LBB90_10
// %bb.5:                               // %while.cond6.preheader
	cmp	x14, x1
	mov	w14, #1
	b.eq	.LBB90_9
// %bb.6:                               // %if.end.preheader
	mov	x12, #-2
.LBB90_7:                               // %if.end
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w15, [x8, x12]
	ldrb	w16, [x10, x12]
	cmp	x11, #0                 // =0
	cset	w13, eq
	cmp	x9, #0                  // =0
	cset	w14, eq
	cmp	w15, w16
	orr	w14, w13, w14
	cset	w13, eq
	tbnz	w14, #0, .LBB90_9
// %bb.8:                               // %if.end
                                        //   in Loop: Header=BB90_7 Depth=1
	sub	x12, x12, #1            // =1
	add	x11, x11, #1            // =1
	cmp	w15, w16
	add	x9, x9, #1              // =1
	b.eq	.LBB90_7
.LBB90_9:                               // %cleanup
	and	w0, w13, w14
	ret
.LBB90_10:
	mov	w14, #1
	and	w0, w13, w14
	ret
.Lfunc_end90:
	.size	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_, .Lfunc_end90-_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               // -- Begin function halide_debug_to_file
.LCPI91_0:
	.word	0                       // 0x0
	.word	1                       // 0x1
.LCPI91_1:
	.word	6                       // 0x6
	.word	8                       // 0x8
.LCPI91_2:
	.word	1                       // 0x1
	.word	5                       // 0x5
.LCPI91_3:
	.word	1                       // 0x1
	.word	194                     // 0xc2
.LCPI91_4:
	.word	1                       // 0x1
	.word	202                     // 0xca
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI91_5:
	.word	0                       // 0x0
	.word	1                       // 0x1
	.word	1                       // 0x1
	.word	1                       // 0x1
	.section	.text.halide_debug_to_file,"ax",@progbits
	.weak	halide_debug_to_file
	.p2align	2
	.type	halide_debug_to_file,@function
halide_debug_to_file:                   // @halide_debug_to_file
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	sub	sp, sp, #1, lsl #12     // =4096
	sub	sp, sp, #368            // =368
	ldr	x8, [x3, #16]
	mov	x21, x3
	mov	w23, w2
	mov	x24, x1
	mov	x25, x0
	cbnz	x8, .LBB91_2
// %bb.1:                               // %_ZNK15halide_buffer_t15is_bounds_queryEv.exit
	ldr	x8, [x21]
	cbz	x8, .LBB91_11
.LBB91_2:                               // %if.end
	ldr	w8, [x21, #36]
	cmp	w8, #5                  // =5
	b.lt	.LBB91_4
// %bb.3:                               // %if.then1
	adrp	x1, .L.str.1.36
	add	x1, x1, :lo12:.L.str.1.36
	b	.LBB91_12
.LBB91_4:                               // %if.end2
	mov	x0, x25
	mov	x1, x21
	bl	halide_copy_to_host
	adrp	x1, .L.str.2.37
	add	x1, x1, :lo12:.L.str.2.37
	mov	x0, x24
	bl	fopen
	mov	x28, x0
	cbz	x0, .LBB91_10
// %bb.5:                               // %if.end6
	movi	v0.2d, #0000000000000000
	stp	q0, q0, [x29, #-128]
	stp	q0, q0, [x29, #-160]
	ldrsw	x8, [x21, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB91_13
// %bb.6:                               // %for.body.lr.ph
	ldr	x9, [x21, #40]
	sub	x10, x29, #160          // =160
	orr	x10, x10, #0x4
	mov	w11, #1
	mov	w19, #1
.LBB91_7:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	q0, [x9]
	cmp	x11, #3                 // =3
	stur	q0, [x10, #-4]
	ldrsw	x12, [x10]
	mul	x19, x19, x12
	b.hi	.LBB91_9
// %bb.8:                               // %for.body
                                        //   in Loop: Header=BB91_7 Depth=1
	cmp	x11, x8
	add	x11, x11, #1            // =1
	add	x10, x10, #16           // =16
	add	x9, x9, #16             // =16
	b.lt	.LBB91_7
.LBB91_9:                               // %for.cond16.preheader
	cmp	w8, #3                  // =3
	b.le	.LBB91_14
	b	.LBB91_21
.LBB91_10:
	mov	w24, #-2
	b	.LBB91_133
.LBB91_11:                              // %if.then
	adrp	x1, .L.str.35
	add	x1, x1, :lo12:.L.str.35
.LBB91_12:                              // %return
	mov	x0, x25
	bl	halide_error
	mov	w24, #-1
	b	.LBB91_134
.LBB91_13:                              // %if.end6.for.body19.preheader_crit_edge
	mov	w19, #1
.LBB91_14:                              // %for.body19.preheader
	mov	w9, #4
	sub	x10, x9, x8
	cmp	x10, #1                 // =1
	adrp	x9, .LCPI91_0
	b.hi	.LBB91_16
// %bb.15:
	mov	x11, x8
	b	.LBB91_19
.LBB91_16:                              // %vector.ph
	ldr	d0, [x9, :lo12:.LCPI91_0]
	and	x12, x10, #0xfffffffffffffffe
	sub	x13, x29, #160          // =160
	add	x11, x8, x12
	add	x8, x13, x8, lsl #4
	add	x8, x8, #16             // =16
	mov	x13, x12
.LBB91_17:                              // %vector.body
                                        // =>This Inner Loop Header: Depth=1
	stur	d0, [x8, #-16]
	str	d0, [x8]
	stur	wzr, [x8, #-8]
	str	wzr, [x8, #8]
	subs	x13, x13, #2            // =2
	add	x8, x8, #32             // =32
	b.ne	.LBB91_17
// %bb.18:                              // %middle.block
	cmp	x10, x12
	b.eq	.LBB91_21
.LBB91_19:                              // %for.body19.preheader2
	ldr	d0, [x9, :lo12:.LCPI91_0]
	sub	x9, x29, #160           // =160
	add	x9, x9, x11, lsl #4
	sub	x8, x11, #4             // =4
	orr	x9, x9, #0x8
.LBB91_20:                              // %for.body19
                                        // =>This Inner Loop Header: Depth=1
	stur	d0, [x9, #-8]
	str	wzr, [x9], #16
	adds	x8, x8, #1              // =1
	b.lo	.LBB91_20
.LBB91_21:                              // %for.cond.cleanup18
	ldrb	w8, [x21, #33]
	adrp	x1, .L.str.3.38
	add	x1, x1, :lo12:.L.str.3.38
	mov	x0, x24
	add	x20, x8, #7             // =7
	lsr	x22, x20, #3
	bl	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	tbnz	w0, #0, .LBB91_23
// %bb.22:                              // %lor.lhs.false
	adrp	x1, .L.str.4.39
	add	x1, x1, :lo12:.L.str.4.39
	mov	x0, x24
	bl	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	cbz	w0, .LBB91_32
.LBB91_23:                              // %if.then33
	ldur	w10, [x29, #-108]
	ldur	w11, [x29, #-124]
	mov	w15, #4
	strh	w15, [sp, #92]
	cmp	w10, #2                 // =2
	cset	w9, lo
	cmp	w11, #5                 // =5
	cset	w14, lt
	tst	w9, w14
	mov	w14, #15
	movk	w14, #256, lsl #16
	str	w14, [sp, #88]
	mov	x14, #257
	movk	x14, #4, lsl #16
	movk	x14, #1, lsl #32
	and	w15, w20, #0x1f8
	stur	x14, [sp, #102]
	mov	x14, #258
	movk	x14, #3, lsl #16
	strh	w15, [sp, #122]
	mov	x15, #262
	movk	x14, #1, lsl #32
	movk	x15, #3, lsl #16
	stur	x14, [sp, #114]
	mov	x14, #259
	movk	x15, #1, lsl #32
	movk	x14, #3, lsl #16
	stur	x15, [sp, #138]
	mov	x15, #210
	movk	x14, #1, lsl #32
	movk	x15, #277, lsl #32
	stur	x14, [sp, #126]
	mov	w14, #273
	movk	x15, #3, lsl #48
	movk	w14, #4, lsl #16
	stur	x15, [sp, #158]
	mov	w15, #279
	stur	w14, [sp, #150]
	mov	x14, #278
	movk	w15, #4, lsl #16
	movk	x14, #4, lsl #16
	stur	w15, [sp, #186]
	adrp	x15, .LCPI91_3
	mov	x9, #18761
	movk	x14, #1, lsl #32
	ldr	d0, [x15, :lo12:.LCPI91_3]
	movk	x9, #42, lsl #16
	stur	x14, [sp, #174]
	mov	w14, #282
	movk	x9, #8, lsl #32
	mul	w16, w22, w19
	movk	w14, #5, lsl #16
	csel	w19, w11, w10, ne
	str	x9, [sp, #80]
	mov	w9, #1
	stur	w14, [sp, #198]
	adrp	x14, .LCPI91_4
	csinc	w20, w11, wzr, eq
	cmp	w19, #2                 // =2
	stur	d0, [sp, #202]
	ldr	d0, [x14, :lo12:.LCPI91_4]
	adrp	x14, :got:_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	cinc	w10, w9, gt
	ldur	w12, [x29, #-140]
	ldur	w13, [x29, #-156]
	ldr	x14, [x14, :got_lo12:_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE]
	strh	w10, [sp, #146]
	lsl	w10, w19, #2
	add	w10, w10, #210          // =210
	cmp	w19, #1                 // =1
	csel	w10, w16, w10, eq
	add	x8, sp, #80             // =80
	stur	w10, [sp, #194]
	adrp	x10, .LCPI91_5
	ldrh	w14, [x14, w23, sxtw #1]
	stur	w13, [sp, #98]
	stur	w12, [sp, #110]
	stur	w12, [sp, #182]
	stur	w9, [sp, #94]
	strh	w9, [sp, #134]
	stur	w9, [sp, #166]
	stur	w19, [sp, #154]
	strh	w19, [sp, #170]
	stur	w19, [sp, #190]
	stur	d0, [x8, #134]
	ldr	q0, [x10, :lo12:.LCPI91_5]
	mov	x17, #284
	mov	x11, #296
	mov	x10, #339
	mov	x12, #32997
	mov	w15, #283
	movk	x17, #3, lsl #16
	movk	x11, #3, lsl #16
	movk	x10, #3, lsl #16
	movk	x12, #4, lsl #16
	movk	w15, #5, lsl #16
	movk	x17, #1, lsl #32
	mov	w13, #2
	movk	x11, #1, lsl #32
	movk	x10, #1, lsl #32
	movk	x12, #1, lsl #32
	add	x0, sp, #80             // =80
	mov	w1, #210
	mov	w2, #1
	mov	x3, x28
	stur	w15, [x8, #130]
	stur	x17, [x8, #142]
	strh	w13, [sp, #230]
	stur	x11, [x8, #154]
	strh	w9, [sp, #242]
	stur	x10, [x8, #166]
	strh	w14, [sp, #254]
	stur	x12, [x8, #178]
	stur	w20, [x8, #186]
	stur	q0, [x8, #190]
	stur	w9, [x8, #206]
	bl	fwrite
	cbz	x0, .LBB91_31
// %bb.24:                              // %if.end100
	cmp	w19, #2                 // =2
	b.lt	.LBB91_49
// %bb.25:                              // %for.body112.lr.ph
	ldur	w10, [x29, #-156]
	lsl	w8, w19, #3
	ldur	w9, [x29, #-140]
	add	w8, w8, #210            // =210
	str	w8, [sp, #4240]
	mul	w8, w20, w22
	mul	w8, w8, w10
	mul	w20, w8, w9
	mov	w23, w19
.LBB91_26:                              // %for.body112
                                        // =>This Inner Loop Header: Depth=1
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #144            // =144
	mov	w1, #4
	mov	w2, #1
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_84
// %bb.27:                              // %if.end115
                                        //   in Loop: Header=BB91_26 Depth=1
	ldr	w8, [sp, #4240]
	subs	w23, w23, #1            // =1
	add	w8, w20, w8
	str	w8, [sp, #4240]
	b.ne	.LBB91_26
// %bb.28:                              // %for.end126
	cmp	w19, #1                 // =1
	str	w20, [sp, #4208]
	b.lt	.LBB91_49
.LBB91_29:                              // %for.body138
                                        // =>This Inner Loop Header: Depth=1
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #112            // =112
	mov	w1, #4
	mov	w2, #1
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_126
// %bb.30:                              // %for.cond135
                                        //   in Loop: Header=BB91_29 Depth=1
	subs	w19, w19, #1            // =1
	b.ne	.LBB91_29
	b	.LBB91_49
.LBB91_31:
	mov	w24, #-3
	b	.LBB91_133
.LBB91_32:                              // %if.else161
	adrp	x1, .L.str.5.40
	add	x1, x1, :lo12:.L.str.5.40
	mov	x0, x24
	bl	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	cbz	w0, .LBB91_48
// %bb.33:                              // %for.cond164.preheader
	add	x20, sp, #1, lsl #12    // =4096
	mov	x8, xzr
	add	x20, x20, #112          // =112
.LBB91_34:                              // %for.cond164
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x24, x8]
	add	x8, x8, #1              // =1
	cbnz	w9, .LBB91_34
.LBB91_35:                              // %for.inc173
                                        // =>This Inner Loop Header: Depth=1
	add	x9, x24, x8
	ldurb	w9, [x9, #-2]
	sub	x8, x8, #1              // =1
	cmp	w9, #46                 // =46
	b.ne	.LBB91_35
// %bb.36:                              // %for.cond176.preheader
	mov	w9, #1
	mov	x12, xzr
	mov	x10, xzr
	sub	x9, x9, x8
.LBB91_37:                              // %for.cond176
                                        // =>This Inner Loop Header: Depth=1
	mov	x11, x10
	mov	x27, x12
	cbz	x9, .LBB91_39
// %bb.38:                              // %land.rhs178
                                        //   in Loop: Header=BB91_37 Depth=1
	add	x10, x24, x27
	add	x10, x10, x8
	ldurb	w13, [x10, #-2]
	add	x10, x11, #1            // =1
	sub	x12, x27, #1            // =1
	add	x9, x9, #1              // =1
	cmp	w13, #47                // =47
	b.ne	.LBB91_37
.LBB91_39:                              // %for.end186
	neg	x26, x27
	add	x9, sp, #80             // =80
	cbz	x27, .LBB91_87
// %bb.40:                              // %while.body.preheader
	sub	x10, x27, #1            // =1
	cmn	x10, #32                // =32
	add	x0, sp, #80             // =80
	b.hs	.LBB91_46
// %bb.41:                              // %vector.memcheck
	add	x12, x24, x8
	sub	x13, x12, #1            // =1
	cmp	x0, x13
	b.hs	.LBB91_43
// %bb.42:                              // %vector.memcheck
	add	x12, x12, x27
	sub	x13, x0, x27
	sub	x12, x12, #1            // =1
	cmp	x12, x13
	b.lo	.LBB91_46
.LBB91_43:                              // %vector.ph50
	add	x10, x24, x8
	neg	x12, x27
	ubfx	x13, x11, #5, #58
	add	x15, sp, #80            // =80
	ubfx	x14, x26, #5, #58
	add	x10, x10, x27
	and	x11, x12, #0x7fffffffffffffe0
	add	x16, x27, x13, lsl #5
	lsl	x13, x14, #5
	add	x14, x10, #15           // =15
	add	x0, x15, x11
	sub	x10, x16, #1            // =1
	add	x15, x15, #16           // =16
.LBB91_44:                              // %vector.body42
                                        // =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-16]
	subs	x13, x13, #32           // =32
	add	x14, x14, #32           // =32
	stp	q0, q1, [x15, #-16]
	add	x15, x15, #32           // =32
	b.ne	.LBB91_44
// %bb.45:                              // %middle.block43
	cmp	x12, x11
	b.eq	.LBB91_47
.LBB91_46:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	add	x11, x24, x10
	ldrb	w11, [x11, x8]
	add	x10, x10, #1            // =1
	cmn	x10, #1                 // =1
	strb	w11, [x0], #1
	b.ne	.LBB91_46
.LBB91_47:                              // %while.cond191.preheader
	add	x8, sp, #80             // =80
	add	x8, x8, #256            // =256
	cmp	x0, x8
	b.lo	.LBB91_88
	b	.LBB91_89
.LBB91_48:                              // %if.else285
	ldur	w8, [x29, #-156]
	ldur	w9, [x29, #-140]
	ldur	w10, [x29, #-108]
	ldur	w11, [x29, #-124]
	add	x0, sp, #80             // =80
	mov	w1, #20
	mov	w2, #1
	mov	x3, x28
	stp	w8, w9, [sp, #80]
	stp	w10, w23, [sp, #92]
	str	w11, [sp, #88]
	bl	fwrite
	cbz	x0, .LBB91_92
.LBB91_49:
	mov	w26, wzr
.LBB91_50:                              // %if.end308
	ldur	w8, [x29, #-108]
	cmp	w8, #1                  // =1
	b.lt	.LBB91_80
// %bb.51:                              // %for.body319.lr.ph
	ldur	w10, [x29, #-108]
	ldp	w14, w13, [x29, #-144]
	ldp	w16, w15, [x29, #-160]
	ldp	w12, w11, [x29, #-128]
	str	w10, [sp, #20]          // 4-byte Folded Spill
	ldur	w10, [x29, #-112]
	add	x17, sp, #1, lsl #12    // =4096
	mov	w9, #4096
	add	x17, x17, #144          // =144
	udiv	w27, w9, w22
	add	x9, x17, #16            // =16
	mov	w23, wzr
	stp	x9, x28, [sp, #64]      // 16-byte Folded Spill
	mul	w24, w27, w22
	add	w28, w16, w15
	add	w9, w13, w14
	mov	w20, w10
	str	x26, [sp, #8]           // 8-byte Folded Spill
	stp	w14, w16, [sp, #48]     // 8-byte Folded Spill
	stp	w9, w15, [sp, #56]      // 8-byte Folded Spill
	str	x25, [sp, #24]          // 8-byte Folded Spill
	str	w10, [sp, #16]          // 4-byte Folded Spill
	stp	w12, w11, [sp, #40]     // 8-byte Folded Spill
	str	w13, [sp, #36]          // 4-byte Folded Spill
.LBB91_52:                              // %for.body319
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB91_54 Depth 2
                                        //       Child Loop BB91_62 Depth 3
                                        //         Child Loop BB91_69 Depth 4
                                        //         Child Loop BB91_72 Depth 4
	cmp	w11, #1                 // =1
	b.lt	.LBB91_77
// %bb.53:                              // %for.body330.preheader
                                        //   in Loop: Header=BB91_52 Depth=1
	mov	w26, w12
.LBB91_54:                              // %for.body330
                                        //   Parent Loop BB91_52 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB91_62 Depth 3
                                        //         Child Loop BB91_69 Depth 4
                                        //         Child Loop BB91_72 Depth 4
	cmp	w13, #1                 // =1
	b.lt	.LBB91_75
// %bb.55:                              // %for.body341.preheader
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w19, [sp, #48]          // 4-byte Folded Reload
	mov	w8, w23
	ldr	w9, [sp, #60]           // 4-byte Folded Reload
	cmp	w9, #1                  // =1
	b.ge	.LBB91_59
.LBB91_56:                              //   in Loop: Header=BB91_54 Depth=2
	mov	w23, w8
.LBB91_57:                              // %for.inc386
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w8, [sp, #56]           // 4-byte Folded Reload
	add	w19, w19, #1            // =1
	cmp	w19, w8
	mov	w8, w23
	b.ge	.LBB91_75
// %bb.58:                              // %for.body341
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w9, [sp, #60]           // 4-byte Folded Reload
	cmp	w9, #1                  // =1
	b.lt	.LBB91_56
.LBB91_59:                              // %for.body352.preheader
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w25, [sp, #52]          // 4-byte Folded Reload
	b	.LBB91_62
.LBB91_60:                              //   in Loop: Header=BB91_62 Depth=3
	mov	w23, wzr
.LBB91_61:                              // %for.inc381
                                        //   in Loop: Header=BB91_62 Depth=3
	add	w25, w25, #1            // =1
	cmp	w25, w28
	mov	w8, w23
	b.ge	.LBB91_57
.LBB91_62:                              // %for.body352
                                        //   Parent Loop BB91_52 Depth=1
                                        //     Parent Loop BB91_54 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB91_69 Depth 4
                                        //         Child Loop BB91_72 Depth 4
	str	w19, [sp, #4244]
	str	w25, [sp, #4240]
	str	w20, [sp, #4252]
	str	w26, [sp, #4248]
	ldrsw	x9, [x21, #36]
	add	w23, w8, #1             // =1
	cmp	w9, #1                  // =1
	b.lt	.LBB91_67
// %bb.63:                              // %for.body.lr.ph.i
                                        //   in Loop: Header=BB91_62 Depth=3
	ldr	x10, [x21, #40]
	sxtw	x13, w25
	cmp	w9, #1                  // =1
	ldrsw	x11, [x10]
	ldrsw	x12, [x10, #8]
	sub	x11, x13, x11
	mul	x11, x11, x12
	b.eq	.LBB91_73
// %bb.64:                              // %for.body.i.for.body.i_crit_edge.preheader
                                        //   in Loop: Header=BB91_62 Depth=3
	ldrsw	x12, [x10, #16]
	ldrsw	x13, [x10, #24]
	sxtw	x14, w19
	cmp	w9, #2                  // =2
	sub	x12, x14, x12
	madd	x11, x12, x13, x11
	b.eq	.LBB91_73
// %bb.65:                              // %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph
                                        //   in Loop: Header=BB91_62 Depth=3
	sub	x12, x9, #2             // =2
	cmp	x12, #5                 // =5
	b.hs	.LBB91_68
// %bb.66:                              //   in Loop: Header=BB91_62 Depth=3
	mov	w12, #2
	b	.LBB91_71
.LBB91_67:                              //   in Loop: Header=BB91_62 Depth=3
	mov	x11, xzr
	b	.LBB91_73
.LBB91_68:                              // %vector.ph109
                                        //   in Loop: Header=BB91_62 Depth=3
	and	x13, x12, #0x3
	tst	x12, #0x3
	mov	w14, #4
	csel	x13, x14, x13, eq
	ldr	x14, [sp, #64]          // 8-byte Folded Reload
	movi	v1.2d, #0000000000000000
	mov	v1.d[0], x11
	sub	x11, x12, x13
	sub	x13, x9, x13
	movi	v0.2d, #0000000000000000
	add	x12, x11, #2            // =2
	sub	x11, x13, #2            // =2
	add	x13, x10, #64           // =64
.LBB91_69:                              // %vector.body105
                                        //   Parent Loop BB91_52 Depth=1
                                        //     Parent Loop BB91_54 Depth=2
                                        //       Parent Loop BB91_62 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	sub	x15, x13, #32           // =32
	ldp	d2, d3, [x14, #-8]
	ld4	{ v4.2s, v5.2s, v6.2s, v7.2s }, [x13]
	ld4	{ v16.2s, v17.2s, v18.2s, v19.2s }, [x15]
	subs	x11, x11, #4            // =4
	add	x13, x13, #64           // =64
	sub	v3.2s, v3.2s, v4.2s
	sub	v2.2s, v2.2s, v16.2s
	mul	v3.2s, v3.2s, v6.2s
	mul	v2.2s, v2.2s, v18.2s
	saddw	v0.2d, v0.2d, v3.2s
	saddw	v1.2d, v1.2d, v2.2s
	add	x14, x14, #16           // =16
	b.ne	.LBB91_69
// %bb.70:                              // %middle.block106
                                        //   in Loop: Header=BB91_62 Depth=3
	add	v0.2d, v0.2d, v1.2d
	addp	d0, v0.2d
	fmov	x11, d0
.LBB91_71:                              // %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader
                                        //   in Loop: Header=BB91_62 Depth=3
	add	x13, sp, #1, lsl #12    // =4096
	add	x10, x10, x12, lsl #4
	add	x13, x13, #144          // =144
	sub	x9, x9, x12
	add	x10, x10, #8            // =8
	add	x12, x13, x12, lsl #2
.LBB91_72:                              // %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge
                                        //   Parent Loop BB91_52 Depth=1
                                        //     Parent Loop BB91_54 Depth=2
                                        //       Parent Loop BB91_62 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldrsw	x13, [x12], #4
	ldursw	x14, [x10, #-8]
	ldrsw	x15, [x10]
	subs	x9, x9, #1              // =1
	add	x10, x10, #16           // =16
	sub	x13, x13, x14
	madd	x11, x13, x15, x11
	b.ne	.LBB91_72
.LBB91_73:                              // %_ZNK15halide_buffer_t10address_ofEPKi.exit
                                        //   in Loop: Header=BB91_62 Depth=3
	ldrb	w9, [x21, #33]
	ldr	x10, [x21, #16]
	mul	w8, w8, w22
	mov	x2, x22
	add	x9, x9, #7              // =7
	lsr	x9, x9, #3
	madd	x1, x9, x11, x10
	add	x9, sp, #80             // =80
	add	x0, x9, w8, sxtw
	bl	memcpy
	cmp	w23, w27
	b.ne	.LBB91_61
// %bb.74:                              // %if.then368
                                        //   in Loop: Header=BB91_62 Depth=3
	ldr	x3, [sp, #72]           // 8-byte Folded Reload
	add	x0, sp, #80             // =80
	mov	w2, #1
	mov	x1, x24
	bl	fwrite
	cbnz	x0, .LBB91_60
	b	.LBB91_83
.LBB91_75:                              // %for.inc391
                                        //   in Loop: Header=BB91_54 Depth=2
	ldp	w12, w11, [sp, #40]     // 8-byte Folded Reload
	ldr	w13, [sp, #36]          // 4-byte Folded Reload
	add	w26, w26, #1            // =1
	add	w8, w11, w12
	cmp	w26, w8
	b.lt	.LBB91_54
// %bb.76:                              //   in Loop: Header=BB91_52 Depth=1
	ldp	w10, w8, [sp, #16]      // 8-byte Folded Reload
	ldr	x25, [sp, #24]          // 8-byte Folded Reload
.LBB91_77:                              // %for.inc396
                                        //   in Loop: Header=BB91_52 Depth=1
	add	w20, w20, #1            // =1
	add	w9, w8, w10
	cmp	w20, w9
	b.lt	.LBB91_52
// %bb.78:                              // %for.end400
	ldr	x28, [sp, #72]          // 8-byte Folded Reload
	ldr	x26, [sp, #8]           // 8-byte Folded Reload
	cmp	w23, #1                 // =1
	b.lt	.LBB91_80
// %bb.79:                              // %if.then402
	mul	w8, w23, w22
	sxtw	x1, w8
	add	x0, sp, #80             // =80
	mov	w2, #1
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_132
.LBB91_80:                              // %if.end409
	str	xzr, [sp, #4240]
	cbz	w26, .LBB91_86
// %bb.81:                              // %if.then411
	cmp	w26, #9                 // =9
	b.lo	.LBB91_85
// %bb.82:                              // %if.then414
	adrp	x1, .L.str.7.42
	add	x1, x1, :lo12:.L.str.7.42
	mov	x0, x25
	bl	halide_error
	mov	w24, #-15
	b	.LBB91_133
.LBB91_83:                              // %cleanup398
	ldr	x28, [sp, #72]          // 8-byte Folded Reload
	mov	w24, #-13
	b	.LBB91_133
.LBB91_84:
	mov	w24, #-4
	b	.LBB91_133
.LBB91_85:                              // %if.end415
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #144            // =144
	mov	w2, #1
	mov	x1, x26
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_128
.LBB91_86:                              // %if.end420
	mov	w24, wzr
	b	.LBB91_133
.LBB91_87:
	add	x0, sp, #80             // =80
.LBB91_88:                              // %while.body194.preheader
	sub	x8, x9, x0
	add	x2, x8, #256            // =256
	mov	w1, wzr
	bl	memset
.LBB91_89:                              // %while.end196
	adrp	x8, .L__const.halide_debug_to_file.header
	add	x8, x8, :lo12:.L__const.halide_debug_to_file.header
	ldp	q0, q1, [x8, #64]
	ldp	q2, q3, [x8, #96]
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #144            // =144
	str	q0, [sp, #4304]
	ldp	q0, q5, [x8, #32]
	str	q1, [sp, #4320]
	ldp	q4, q1, [x8]
	mov	w1, #128
	mov	w2, #1
	mov	x3, x28
	str	q3, [sp, #4352]
	str	q2, [sp, #4336]
	str	q4, [sp, #4240]
	str	q5, [sp, #4288]
	str	q1, [sp, #4256]
	strb	wzr, [x20, #160]
	str	q0, [sp, #4272]
	bl	fwrite
	ldrsw	x8, [x21, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB91_93
// %bb.90:                              // %for.body.lr.ph.i.i
	ldr	x9, [x21, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB91_94
// %bb.91:
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB91_101
.LBB91_92:
	mov	w24, #-12
	b	.LBB91_133
.LBB91_93:                              // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w11, [x21, #33]
	mov	x13, xzr
	mov	w9, #1
	b	.LBB91_119
.LBB91_94:                              // %vector.ph69
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB91_97
	b	.LBB91_98
.LBB91_95:                              // %pred.load.continue80
                                        //   in Loop: Header=BB91_98 Depth=1
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB91_100
// %bb.96:                              // %vector.body65
                                        //   in Loop: Header=BB91_98 Depth=1
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB91_98
.LBB91_97:                              // %pred.load.if
	ldur	w17, [x13, #-20]
.LBB91_98:                              // %pred.load.continue
                                        // =>This Inner Loop Header: Depth=1
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB91_95
// %bb.99:                              // %pred.load.if79
                                        //   in Loop: Header=BB91_98 Depth=1
	ldur	w18, [x13, #-4]
	b	.LBB91_95
.LBB91_100:                             // %middle.block66
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB91_105
.LBB91_101:                             // %for.body.i.i.preheader
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB91_104
.LBB91_102:                             // %for.inc.i.i
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB91_105
.LBB91_103:                             // %for.body.i.i
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB91_102
.LBB91_104:                             // %if.then.i.i
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB91_103
.LBB91_105:                             // %for.body.lr.ph.i5.i
	ldrb	w11, [x21, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB91_107
// %bb.106:
	mov	x12, xzr
	mov	x13, xzr
	b	.LBB91_114
.LBB91_107:                             // %vector.ph86
	and	x12, x8, #0xfffffffffffffffe
	mov	x13, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x12
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbz	w17, #31, .LBB91_110
	b	.LBB91_111
.LBB91_108:                             // %pred.load.continue100
	sub	w0, w0, #1              // =1
	sub	w1, w1, #1              // =1
	mul	w0, w0, w17
	mul	w1, w1, w18
	and	w17, w0, w17, asr #31
	and	w18, w1, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x13, x13, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB91_113
// %bb.109:                             // %vector.body82
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbnz	w17, #31, .LBB91_111
.LBB91_110:                             // %pred.load.continue98
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB91_108
	b	.LBB91_112
.LBB91_111:                             // %pred.load.if97
	ldur	w0, [x15, #-20]
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB91_108
.LBB91_112:                             // %pred.load.if99
	ldur	w1, [x15, #-4]
	b	.LBB91_108
.LBB91_113:                             // %middle.block83
	cmp	x12, x8
	add	x13, x14, x13
	b.eq	.LBB91_118
.LBB91_114:                             // %for.body.i16.i.preheader
	add	x9, x9, x12, lsl #4
	sub	x14, x8, x12
	add	x9, x9, #8              // =8
	ldrsw	x12, [x9]
	tbnz	w12, #31, .LBB91_117
.LBB91_115:                             // %for.inc.i26.i
	subs	x14, x14, #1            // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB91_118
.LBB91_116:                             // %for.body.i16.i
	ldrsw	x12, [x9]
	tbz	w12, #31, .LBB91_115
.LBB91_117:                             // %if.then.i22.i
	ldursw	x15, [x9, #-4]
	sub	x15, x15, #1            // =1
	madd	x13, x15, x12, x13
	subs	x14, x14, #1            // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB91_116
.LBB91_118:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x9, x10, #1             // =1
.LBB91_119:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x10, x11, #7            // =7
	lsr	x10, x10, #3
	sub	x9, x9, x13
	mul	x19, x9, x10
	lsr	x9, x19, #32
	cbz	x9, .LBB91_121
// %bb.120:                             // %cleanup275.thread
	adrp	x1, .L.str.6.41
	add	x1, x1, :lo12:.L.str.6.41
	mov	x0, x25
	bl	halide_error
	mov	w24, #-6
	b	.LBB91_133
.LBB91_121:                             // %if.end204
	adrp	x12, .LCPI91_1
	ldr	d0, [x12, :lo12:.LCPI91_1]
	adrp	x12, :got:_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
	cmp	w8, #2                  // =2
	mov	w10, #2
	ldr	x12, [x12, :got_lo12:_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE]
	mov	w9, #7
	csel	w8, w8, w10, gt
	sub	w9, w9, w27
	lsl	w8, w8, #2
	sxtw	x23, w23
	adrp	x10, .LCPI91_2
	and	w24, w9, #0xfffffff8
	add	w9, w8, #4              // =4
	ldrb	w12, [x12, x23]
	str	d0, [sp, #4216]
	ldr	d0, [x10, :lo12:.LCPI91_2]
	and	w27, w9, #0xfffffff8
	add	w9, w24, w27
	add	w9, w9, w19
	add	x0, sp, #1, lsl #12     // =4096
	mov	w11, #14
	add	w9, w9, #40             // =40
	add	x0, x0, #112            // =112
	mov	w1, #32
	mov	w2, #1
	mov	x3, x28
	str	w12, [sp, #4224]
	str	w9, [sp, #4212]
	str	w11, [sp, #4208]
	stur	d0, [x20, #20]
	str	w8, [sp, #4236]
	mov	w20, #1
	bl	fwrite
	cbz	x0, .LBB91_127
// %bb.122:                             // %if.end228
	ldur	w8, [x29, #-124]
	ldur	w9, [x29, #-156]
	ldur	w10, [x29, #-140]
	ldur	w11, [x29, #-108]
	add	x0, sp, #1, lsl #12     // =4096
	sxtw	x1, w27
	add	x0, x0, #96             // =96
	mov	w2, #1
	mov	x3, x28
	str	w8, [sp, #4200]
	str	w9, [sp, #4192]
	str	w10, [sp, #4196]
	str	w11, [sp, #4204]
	mov	w20, #1
	bl	fwrite
	cbz	x0, .LBB91_129
// %bb.123:                             // %if.end245
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #88             // =88
	mov	w1, #8
	mov	w2, #1
	mov	x3, x28
	str	w26, [sp, #4188]
	str	w20, [sp, #4184]
	bl	fwrite
	cbz	x0, .LBB91_130
// %bb.124:                             // %if.end250
	mov	w1, w24
	add	x0, sp, #80             // =80
	mov	w2, #1
	mov	x3, x28
	mov	w20, #1
	bl	fwrite
	cbz	x0, .LBB91_131
// %bb.125:                             // %if.end255
	adrp	x9, :got:_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE]
	sub	w8, w19, #1             // =1
	add	x0, sp, #1, lsl #12     // =4096
	mvn	w8, w8
	ldrb	w9, [x9, x23]
	add	x0, x0, #80             // =80
	mov	w1, #8
	mov	w2, #1
	mov	x3, x28
	and	w26, w8, #0x7
	str	w19, [sp, #4180]
	str	w9, [sp, #4176]
	bl	fwrite
	cmp	x0, #0                  // =0
	cset	w20, eq
	mov	w24, #-11
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_126:                             // %cleanup148
	mov	w24, #-5
	b	.LBB91_133
.LBB91_127:
	mov	w26, wzr
	mov	w24, #-7
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_128:
	mov	w24, #-16
	b	.LBB91_133
.LBB91_129:
	mov	w26, wzr
	mov	w24, #-8
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_130:
	mov	w26, wzr
	mov	w24, #-9
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_131:
	mov	w26, wzr
	mov	w24, #-10
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_132:
	mov	w24, #-14
.LBB91_133:                             // %cleanup430
	mov	x0, x28
	bl	fclose
.LBB91_134:                             // %return
	mov	w0, w24
	add	sp, sp, #1, lsl #12     // =4096
	add	sp, sp, #368            // =368
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end91:
	.size	halide_debug_to_file, .Lfunc_end91-halide_debug_to_file
                                        // -- End function
	.section	.text.halide_cache_cleanup,"ax",@progbits
	.weak	halide_cache_cleanup    // -- Begin function halide_cache_cleanup
	.p2align	2
	.type	halide_cache_cleanup,@function
halide_cache_cleanup:                   // @halide_cache_cleanup
// %bb.0:                               // %entry
	b	halide_memoization_cache_cleanup
.Lfunc_end92:
	.size	halide_cache_cleanup, .Lfunc_end92-halide_cache_cleanup
                                        // -- End function
	.section	.text.halide_memoization_cache_cleanup,"ax",@progbits
	.weak	halide_memoization_cache_cleanup // -- Begin function halide_memoization_cache_cleanup
	.p2align	2
	.type	halide_memoization_cache_cleanup,@function
halide_memoization_cache_cleanup:       // @halide_memoization_cache_cleanup
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x21, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	mov	x20, xzr
	add	x29, sp, #32            // =32
	lsl	x8, x20, #3
	ldr	x19, [x21, x8]
	str	xzr, [x21, x8]
	cbnz	x19, .LBB93_3
.LBB93_1:                               // %while.end
                                        // =>This Inner Loop Header: Depth=1
	add	x20, x20, #1            // =1
	cmp	x20, #256               // =256
	b.eq	.LBB93_4
// %bb.2:                               // %for.body
                                        //   in Loop: Header=BB93_1 Depth=1
	lsl	x8, x20, #3
	ldr	x19, [x21, x8]
	str	xzr, [x21, x8]
	cbz	x19, .LBB93_1
.LBB93_3:                               // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x22, [x19]
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	mov	x0, xzr
	mov	x1, x19
	bl	halide_free
	mov	x19, x22
	cbnz	x22, .LBB93_3
	b	.LBB93_1
.LBB93_4:                               // %for.cond.cleanup
	adrp	x8, :got:_ZN6Halide7Runtime8Internal18current_cache_sizeE
	adrp	x9, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	adrp	x10, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal18current_cache_sizeE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	str	xzr, [x8]
	str	xzr, [x9]
	str	xzr, [x10]
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end93:
	.size	halide_memoization_cache_cleanup, .Lfunc_end93-halide_memoization_cache_cleanup
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv // -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,@function
_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv: // @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	ldr	w8, [x0, #56]
	mov	x19, x0
	add	x29, sp, #32            // =32
	cbz	w8, .LBB94_3
// %bb.1:                               // %for.body.lr.ph
	mov	x20, xzr
	mov	w21, #16
.LBB94_2:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #72]
	mov	x0, xzr
	add	x8, x8, x21
	sub	x1, x8, #16             // =16
	bl	halide_device_free
	ldr	x8, [x19, #72]
	ldr	x0, [x8, x21]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	mov	x1, x0
	mov	x0, xzr
	bl	halide_free
	ldr	w8, [x19, #56]
	add	x20, x20, #1            // =1
	add	x21, x21, #56           // =56
	cmp	x20, x8
	b.lo	.LBB94_2
.LBB94_3:                               // %for.cond.cleanup
	ldr	x1, [x19, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x0, xzr
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	b	halide_free
.Lfunc_end94:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv, .Lfunc_end94-_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh // -- Begin function _ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,@function
_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh: // @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
// %bb.0:                               // %entry
	sub	x0, x0, #128            // =128
	ret
.Lfunc_end95:
	.size	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh, .Lfunc_end95-_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx // -- Begin function _ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,@function
_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx: // @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
// %bb.0:                               // %entry
	stp	x26, x25, [sp, #-80]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x3
	mov	x20, x2
	mov	x21, x0
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
                                        // kill: def $w1 killed $w1 def $x1
	tbnz	w1, #31, .LBB96_5
// %bb.1:                               // %land.rhs.preheader
	sxtw	x1, w1
	add	x8, x21, #24            // =24
.LBB96_2:                               // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	ldr	x9, [x8, x1, lsl #3]
	cmp	x9, #1                  // =1
	b.ne	.LBB96_5
// %bb.3:                               // %while.body
                                        //   in Loop: Header=BB96_2 Depth=1
	sub	x9, x1, #1              // =1
	cmp	x1, #0                  // =0
	mov	x1, x9
	b.gt	.LBB96_2
// %bb.4:                               // %while.end.loopexit
	mov	w1, w9
.LBB96_5:                               // %while.end
	cmn	w1, #1                  // =1
	b.eq	.LBB96_10
// %bb.6:                               // %for.cond.preheader
	add	x23, x21, w1, sxtw #3
	ldr	x8, [x23, #24]!
	cbz	x8, .LBB96_9
// %bb.7:                               // %for.body.lr.ph
	sxtw	x8, w1
	add	x8, x21, x8, lsl #3
	mov	x24, xzr
	sub	w22, w1, #1             // =1
	add	x25, x8, #152           // =152
	add	x26, x8, #280           // =280
.LBB96_8:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	mov	x0, x21
	mov	w1, w22
	mov	x2, x20
	mov	x3, x19
	bl	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	ldr	x8, [x25]
	ldr	x9, [x23]
	ldr	x10, [x26]
	add	x24, x24, #1            // =1
	add	x20, x8, x20
	cmp	x24, x9
	add	x19, x10, x19
	b.lo	.LBB96_8
.LBB96_9:                               // %if.end
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	ret
.LBB96_10:                              // %if.then
	ldp	x8, x9, [x21]
	ldr	x2, [x21, #408]
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	add	x1, x8, x20
	add	x0, x9, x19
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	b	memcpy
.Lfunc_end96:
	.size	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx, .Lfunc_end96-_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv // -- Begin function _ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,@function
_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv: // @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
// %bb.0:                               // %entry
	ldp	x8, x9, [x0]
	cmp	x8, x9
	b.ne	.LBB97_2
// %bb.1:                               // %if.end
	ret
.LBB97_2:                               // %if.then
	ldr	x2, [x0, #16]
	mov	w1, #15
	mov	x3, xzr
	b	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
.Lfunc_end97:
	.size	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv, .Lfunc_end97-_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b // -- Begin function _ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,@function
_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b: // @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
// %bb.0:                               // %entry
	sub	sp, sp, #448            // =448
	cmp	w1, #0                  // =0
	mov	w10, #16
	stp	x28, x19, [sp, #416]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #432]    // 16-byte Folded Spill
	csel	x9, x10, xzr, ne
	ldr	x11, [x0, x9]
	cmp	w3, #0                  // =0
	csel	x10, x10, xzr, ne
	mov	x9, sp
	str	x11, [sp]
	ldr	x11, [x2, x10]
	mov	w12, #1
	movi	v0.2d, #0000000000000000
	add	x10, x9, #280           // =280
	str	x11, [sp, #8]
	ldrb	w11, [x0, #33]
	add	x13, x9, #152           // =152
	dup	v1.2d, x12
	stur	q1, [sp, #24]
	add	x11, x11, #7            // =7
	lsr	x11, x11, #3
	str	x11, [sp, #408]
	stur	q0, [x9, #152]
	stp	q0, q0, [x10]
	stur	q1, [sp, #40]
	stur	q0, [x9, #168]
	str	x12, [sp, #56]
	stur	q0, [x9, #184]
	stp	q0, q0, [x10, #32]
	stp	q1, q1, [sp, #64]
	stur	q0, [x9, #200]
	str	xzr, [x10, #64]
	str	x12, [sp, #96]
	stur	q0, [x9, #216]
	stp	q0, q0, [sp, #352]
	stur	q1, [sp, #104]
	stur	q0, [x9, #232]
	stur	q1, [sp, #120]
	stur	q0, [x9, #248]
	stp	x12, x12, [sp, #136]
	str	q0, [x13, #112]
	str	q0, [sp, #384]
	str	xzr, [sp, #400]
	str	xzr, [sp, #16]
	ldrsw	x13, [x0, #36]
	add	x29, sp, #432           // =432
	cmp	w13, #1                 // =1
	and	x12, x13, #0xffffffff
	b.lt	.LBB98_3
// %bb.1:                               // %for.body19.lr.ph
	ldr	x15, [x0, #40]
	ldr	x14, [x2, #40]
	cmp	w13, #4                 // =4
	b.hi	.LBB98_4
// %bb.2:
	mov	x16, xzr
	mov	x17, xzr
	b	.LBB98_7
.LBB98_3:
	mov	x17, xzr
	b	.LBB98_10
.LBB98_4:                               // %vector.ph
	and	x16, x13, #0x3
	tst	x13, #0x3
	mov	w1, #4
	csel	x16, x1, x16, eq
	sub	x16, x13, x16
	add	x17, x14, #32           // =32
	add	x18, x15, #32           // =32
	movi	v0.2d, #0000000000000000
	mov	x1, x16
	movi	v1.2d, #0000000000000000
.LBB98_5:                               // %vector.body
                                        // =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x18, #-32]
	ldp	q4, q5, [x18], #64
	ldp	q6, q7, [x17, #-32]
	ldp	q16, q17, [x17], #64
	zip2	v18.4s, v2.4s, v3.4s
	zip2	v19.4s, v4.4s, v5.4s
	sub	v3.4s, v7.4s, v3.4s
	sub	v2.4s, v6.4s, v2.4s
	sub	v5.4s, v17.4s, v5.4s
	sub	v4.4s, v16.4s, v4.4s
	zip1	v2.4s, v2.4s, v3.4s
	zip1	v3.4s, v4.4s, v5.4s
	mul	v2.2s, v2.2s, v18.2s
	mul	v3.2s, v3.2s, v19.2s
	subs	x1, x1, #4              // =4
	saddw	v0.2d, v0.2d, v2.2s
	saddw	v1.2d, v1.2d, v3.2s
	b.ne	.LBB98_5
// %bb.6:                               // %middle.block
	add	v0.2d, v1.2d, v0.2d
	addp	d0, v0.2d
	fmov	x17, d0
.LBB98_7:                               // %for.body19.preheader
	sub	x18, x13, x16
	lsl	x16, x16, #4
	add	x15, x15, x16
	add	x15, x15, #8            // =8
	add	x14, x14, x16
.LBB98_8:                               // %for.body19
                                        // =>This Inner Loop Header: Depth=1
	ldrsw	x16, [x15]
	ldrsw	x1, [x14], #16
	ldursw	x3, [x15, #-8]
	subs	x18, x18, #1            // =1
	add	x15, x15, #16           // =16
	sub	x1, x1, x3
	madd	x17, x1, x16, x17
	b.ne	.LBB98_8
// %bb.9:                               // %for.cond16.for.cond.cleanup18_crit_edge
	str	x17, [sp, #16]
.LBB98_10:                              // %for.cond.cleanup18
	ldr	x14, [sp, #408]
	mul	x15, x14, x17
	str	x15, [sp, #16]
	ldr	w15, [x2, #36]
	cmp	w12, w15
	b.ne	.LBB98_27
// %bb.11:                              // %lor.lhs.false
	cmp	w12, #16                // =16
	b.gt	.LBB98_27
// %bb.12:                              // %lor.lhs.false
	ldrb	w15, [x2, #33]
	add	w15, w15, #7            // =7
	lsr	w15, w15, #3
	cmp	w11, w15
	b.ne	.LBB98_27
// %bb.13:                              // %if.end
	cbz	x14, .LBB98_27
// %bb.14:                              // %for.cond53.preheader
	cmp	w13, #1                 // =1
	b.lt	.LBB98_32
// %bb.15:                              // %for.body57.lr.ph
	ldr	x14, [x2, #40]
	ldr	x15, [x0, #40]
	mov	x16, sp
	mov	x13, xzr
	add	x17, x16, #280          // =280
	add	x18, x16, #144          // =144
	b	.LBB98_17
.LBB98_16:                              // %for.cond.cleanup91
                                        //   in Loop: Header=BB98_17 Depth=1
	add	x3, x14, x13, lsl #4
	ldrsw	x3, [x3, #4]
	add	x13, x13, #1            // =1
	add	x2, x16, x2, lsl #3
	cmp	x13, x12
	add	x18, x18, #8            // =8
	str	x0, [x2, #280]
	str	x1, [x2, #152]
	str	x3, [x2, #24]
	b.eq	.LBB98_28
.LBB98_17:                              // %for.body57
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB98_20 Depth 2
                                        //     Child Loop BB98_25 Depth 2
	lsl	x0, x13, #4
	add	x1, x14, x0
	ldrsw	x2, [x1, #8]
	add	x0, x15, x0
	ldrsw	x1, [x0, #8]
	mul	x0, x2, x11
	cbz	x13, .LBB98_22
// %bb.18:                              // %for.body78.lr.ph
                                        //   in Loop: Header=BB98_17 Depth=1
	cbz	w0, .LBB98_26
// %bb.19:                              // %for.body78.us.preheader
                                        //   in Loop: Header=BB98_17 Depth=1
	mov	x2, xzr
.LBB98_20:                              // %for.body78.us
                                        //   Parent Loop BB98_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x3, [x17, x2, lsl #3]
	cmp	x3, x0
	b.hi	.LBB98_23
// %bb.21:                              // %for.inc86.us
                                        //   in Loop: Header=BB98_20 Depth=2
	add	x2, x2, #1              // =1
	cmp	x13, x2
	b.ne	.LBB98_20
	b	.LBB98_23
.LBB98_22:                              //   in Loop: Header=BB98_17 Depth=1
	mov	w2, wzr
.LBB98_23:                              // %for.end88
                                        //   in Loop: Header=BB98_17 Depth=1
	mov	w2, w2
	cmp	x13, x2
	mul	x1, x1, x11
	b.ls	.LBB98_16
.LBB98_24:                              // %for.body92.preheader
                                        //   in Loop: Header=BB98_17 Depth=1
	sxtw	x3, w2
	mov	x4, x18
	mov	x5, x13
.LBB98_25:                              // %for.body92
                                        //   Parent Loop BB98_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	x6, [x4, #-128]
	ldr	x7, [x4, #128]
	ldr	x19, [x4]
	sub	x5, x5, #1              // =1
	cmp	x5, x3
	stur	x6, [x4, #-120]
	str	x7, [x4, #136]
	str	x19, [x4, #8]
	sub	x4, x4, #8              // =8
	b.gt	.LBB98_25
	b	.LBB98_16
.LBB98_26:                              // %for.body78.preheader
                                        //   in Loop: Header=BB98_17 Depth=1
	mov	w2, w13
	mov	w2, w2
	cmp	x13, x2
	mul	x1, x1, x11
	b.ls	.LBB98_16
	b	.LBB98_24
.LBB98_27:                              // %if.then
	movi	v0.2d, #0000000000000000
	stp	q0, q0, [x8, #384]
	stp	q0, q0, [x8, #352]
	stp	q0, q0, [x8, #320]
	stp	q0, q0, [x8, #288]
	stp	q0, q0, [x8, #256]
	stp	q0, q0, [x8, #224]
	stp	q0, q0, [x8, #192]
	stp	q0, q0, [x8, #160]
	stp	q0, q0, [x8, #128]
	stp	q0, q0, [x8, #96]
	stp	q0, q0, [x8, #64]
	stp	q0, q0, [x8, #32]
	stp	q0, q0, [x8]
	ldp	x29, x30, [sp, #432]    // 16-byte Folded Reload
	ldp	x28, x19, [sp, #416]    // 16-byte Folded Reload
	add	sp, sp, #448            // =448
	ret
.LBB98_28:                              // %while.cond.preheader
	ldr	x12, [sp, #408]
	ldr	x11, [sp, #152]
	cmp	x12, x11
	b.ne	.LBB98_32
// %bb.29:                              // %land.rhs.lr.ph
	ldr	x13, [sp, #280]
	mov	w11, #1
.LBB98_30:                              // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	cmp	x12, x13
	b.ne	.LBB98_32
// %bb.31:                              // %while.body
                                        //   in Loop: Header=BB98_30 Depth=1
	ldr	x12, [sp, #24]
	ldp	q0, q2, [sp, #32]
	ldp	q1, q3, [sp, #160]
	mul	x12, x12, x13
	stur	q0, [sp, #24]
	str	x12, [sp, #408]
	stur	q1, [x9, #152]
	stur	q2, [sp, #40]
	stur	q3, [x9, #168]
	ldp	q0, q2, [sp, #288]
	stp	q0, q2, [x10]
	ldr	x13, [sp, #64]
	ldr	x14, [sp, #320]
	ldr	x15, [sp, #192]
	ldur	q2, [sp, #72]
	str	x13, [sp, #56]
	str	x14, [sp, #312]
	str	x15, [sp, #184]
	str	q2, [sp, #64]
	ldur	q2, [x9, #200]
	ldur	q3, [sp, #88]
	ldr	x13, [sp, #232]
	ldr	x14, [sp, #360]
	str	q2, [sp, #192]
	ldr	q2, [x10, #48]
	str	q3, [sp, #80]
	ldur	q3, [sp, #104]
	str	q2, [sp, #320]
	ldur	q2, [x9, #216]
	str	q2, [sp, #208]
	ldr	q2, [x10, #64]
	str	q3, [sp, #96]
	ldr	q3, [sp, #240]
	str	x13, [sp, #224]
	str	x14, [sp, #352]
	str	q2, [sp, #336]
	stur	q3, [x9, #232]
	ldr	q2, [sp, #368]
	fmov	x13, d1
	cmp	x12, x13
	str	q2, [x10, #80]
	ldur	q2, [sp, #120]
	ldr	q3, [sp, #256]
	str	q2, [sp, #112]
	stur	q3, [x9, #248]
	ldr	q2, [sp, #384]
	str	q2, [x10, #96]
	ldr	x13, [sp, #400]
	ldur	q1, [x9, #136]
	ldr	x14, [sp, #272]
	str	x11, [sp, #144]
	stp	x13, xzr, [sp, #392]
	fmov	x13, d0
	stp	x14, xzr, [sp, #264]
	str	q1, [sp, #128]
	b.eq	.LBB98_30
.LBB98_32:                              // %while.end
	mov	x1, sp
	mov	w2, #416
	mov	x0, x8
	bl	memcpy
	ldp	x29, x30, [sp, #432]    // 16-byte Folded Reload
	ldp	x28, x19, [sp, #416]    // 16-byte Folded Reload
	add	sp, sp, #448            // =448
	ret
.Lfunc_end98:
	.size	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b, .Lfunc_end98-_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t: // @_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t
// %bb.0:                               // %entry
	mov	w1, #1
	mov	x2, x0
	mov	w3, wzr
	b	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
.Lfunc_end99:
	.size	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t, .Lfunc_end99-_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t: // @_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t
// %bb.0:                               // %entry
	mov	w3, #1
	mov	w1, wzr
	mov	x2, x0
	b	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
.Lfunc_end100:
	.size	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t, .Lfunc_end100-_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m // -- Begin function _ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,@function
_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m: // @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	bl	memcmp
	cmp	w0, #0                  // =0
	cset	w0, eq
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end101:
	.size	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m, .Lfunc_end101-_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t // -- Begin function _ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,@function
_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t: // @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
// %bb.0:                               // %entry
	ldrsw	x8, [x0, #36]
	cmp	w8, #1                  // =1
	b.lt	.LBB102_7
// %bb.1:                               // %for.body.lr.ph
	ldr	x10, [x0, #40]
	add	x9, x1, #8              // =8
	add	x10, x10, #8            // =8
.LBB102_2:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldur	w11, [x10, #-8]
	ldur	w12, [x9, #-8]
	cmp	w11, w12
	b.ne	.LBB102_8
// %bb.3:                               // %land.lhs.true.i.i
                                        //   in Loop: Header=BB102_2 Depth=1
	ldur	w11, [x10, #-4]
	ldur	w12, [x9, #-4]
	cmp	w11, w12
	b.ne	.LBB102_8
// %bb.4:                               // %land.lhs.true5.i.i
                                        //   in Loop: Header=BB102_2 Depth=1
	ldr	w11, [x10]
	ldr	w12, [x9]
	cmp	w11, w12
	b.ne	.LBB102_8
// %bb.5:                               // %_ZNK18halide_dimension_tneERKS_.exit
                                        //   in Loop: Header=BB102_2 Depth=1
	ldr	w11, [x10, #4]
	ldr	w12, [x9, #4]
	cmp	w11, w12
	b.ne	.LBB102_8
// %bb.6:                               // %for.cond
                                        //   in Loop: Header=BB102_2 Depth=1
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	add	x10, x10, #16           // =16
	b.ne	.LBB102_2
.LBB102_7:
	mov	w0, #1
	ret
.LBB102_8:
	mov	w0, wzr
	ret
.Lfunc_end102:
	.size	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t, .Lfunc_end102-_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_ // -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_,@function
_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_: // @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	stp	xzr, xzr, [x0]
	str	xzr, [x0, #16]
	str	x2, [x0, #32]
	stp	w3, wzr, [x0, #48]
	str	w5, [x0, #56]
	ldrsw	x8, [x4, #36]
	add	w9, w5, #1              // =1
	mov	w25, #56
	mov	x22, x1
	str	w8, [x0, #60]
	mul	x8, x9, x8
	lsl	x8, x8, #4
	umaddl	x24, w5, w25, x8
	mov	x20, x0
	add	x1, x24, x2
	mov	x0, xzr
	add	x29, sp, #64            // =64
	mov	x19, x6
	mov	w23, w5
	mov	x21, x4
	bl	halide_malloc
	str	x0, [x20, #24]
	cbz	x0, .LBB103_16
// %bb.1:                               // %if.end
	ldr	x9, [x20, #32]
	umull	x8, w23, w25
	add	x8, x0, x8
	stp	x8, x0, [x20, #64]
	add	x8, x0, x24
	str	x8, [x20, #40]
	cbz	x9, .LBB103_5
// %bb.2:                               // %for.body.preheader
	ldrb	w9, [x22]
	strb	w9, [x8]
	ldr	x8, [x20, #32]
	cmp	x8, #2                  // =2
	b.lo	.LBB103_5
// %bb.3:                               // %for.body.for.body_crit_edge.preheader
	mov	w8, #1
.LBB103_4:                              // %for.body.for.body_crit_edge
                                        // =>This Inner Loop Header: Depth=1
	ldr	x9, [x20, #40]
	ldrb	w10, [x22, x8]
	strb	w10, [x9, x8]
	ldr	x9, [x20, #32]
	add	x8, x8, #1              // =1
	cmp	x8, x9
	b.lo	.LBB103_4
.LBB103_5:                              // %for.cond23.preheader
	ldr	w8, [x20, #60]
	cmp	w8, #1                  // =1
	b.lt	.LBB103_8
// %bb.6:                               // %for.body27.lr.ph
	mov	x8, xzr
	mov	x9, xzr
.LBB103_7:                              // %for.body27
                                        // =>This Inner Loop Header: Depth=1
	ldr	x10, [x21, #40]
	ldr	x11, [x20, #64]
	add	x9, x9, #1              // =1
	ldr	q0, [x10, x8]
	str	q0, [x11, x8]
	ldrsw	x10, [x20, #60]
	add	x8, x8, #16             // =16
	cmp	x9, x10
	b.lt	.LBB103_7
.LBB103_8:                              // %for.cond36.preheader
	ldr	w8, [x20, #56]
	cbz	w8, .LBB103_15
// %bb.9:                               // %for.body40.preheader
	mov	x9, xzr
	mov	w8, #56
	b	.LBB103_11
.LBB103_10:                             // %for.cond36.loopexit
                                        //   in Loop: Header=BB103_11 Depth=1
	ldr	w9, [x20, #56]
	cmp	x10, x9
	mov	x9, x10
	b.hs	.LBB103_15
.LBB103_11:                             // %for.body40
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB103_14 Depth 2
	ldr	x11, [x19, x9, lsl #3]
	ldr	x10, [x20, #72]
	mul	x12, x9, x8
	ldr	x13, [x11, #48]
	ldp	q2, q0, [x11, #16]
	ldr	q1, [x11]
	add	x10, x10, x12
	str	x13, [x10, #48]
	stp	q2, q0, [x10, #16]
	str	q1, [x10]
	ldp	x14, x11, [x20, #64]
	ldr	w13, [x20, #60]
	add	x10, x9, #1             // =1
	add	x12, x11, x12
	mul	w11, w13, w10
	add	x11, x14, w11, uxtw #4
	cmp	w13, #1                 // =1
	str	x11, [x12, #40]
	b.lt	.LBB103_10
// %bb.12:                              // %for.body59.preheader
                                        //   in Loop: Header=BB103_11 Depth=1
	ldr	x12, [x19, x9, lsl #3]
	ldr	x12, [x12, #40]
	ldr	q0, [x12]
	str	q0, [x11]
	ldr	w11, [x20, #60]
	cmp	w11, #2                 // =2
	b.lt	.LBB103_10
// %bb.13:                              // %for.body59.for.body59_crit_edge.preheader
                                        //   in Loop: Header=BB103_11 Depth=1
	mov	w11, #16
	mov	w12, #1
.LBB103_14:                             // %for.body59.for.body59_crit_edge
                                        //   Parent Loop BB103_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x13, [x19, x9, lsl #3]
	ldr	x14, [x20, #72]
	add	x12, x12, #1            // =1
	ldr	x13, [x13, #40]
	madd	x14, x9, x8, x14
	ldr	x14, [x14, #40]
	ldr	q0, [x13, x11]
	str	q0, [x14, x11]
	ldrsw	x13, [x20, #60]
	add	x11, x11, #16           // =16
	cmp	x12, x13
	b.lt	.LBB103_14
	b	.LBB103_10
.LBB103_15:
	mov	w0, #1
.LBB103_16:                             // %cleanup
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	ret
.Lfunc_end103:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_, .Lfunc_end103-_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal8djb_hashEPKhm,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal8djb_hashEPKhm // -- Begin function _ZN6Halide7Runtime8Internal8djb_hashEPKhm
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal8djb_hashEPKhm,@function
_ZN6Halide7Runtime8Internal8djb_hashEPKhm: // @_ZN6Halide7Runtime8Internal8djb_hashEPKhm
// %bb.0:                               // %entry
	mov	w8, #5381
	cbz	x1, .LBB104_2
.LBB104_1:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x0], #1
	add	w8, w8, w8, lsl #5
	subs	x1, x1, #1              // =1
	add	w8, w8, w9
	b.ne	.LBB104_1
.LBB104_2:                              // %for.cond.cleanup
	mov	w0, w8
	ret
.Lfunc_end104:
	.size	_ZN6Halide7Runtime8Internal8djb_hashEPKhm, .Lfunc_end104-_ZN6Halide7Runtime8Internal8djb_hashEPKhm
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal11prune_cacheEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11prune_cacheEv // -- Begin function _ZN6Halide7Runtime8Internal11prune_cacheEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal11prune_cacheEv,@function
_ZN6Halide7Runtime8Internal11prune_cacheEv: // @_ZN6Halide7Runtime8Internal11prune_cacheEv
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	adrp	x21, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	add	x29, sp, #80            // =80
	ldr	x19, [x21]
	cbz	x19, .LBB105_53
// %bb.1:                               // %entry
	adrp	x22, :got:_ZN6Halide7Runtime8Internal18current_cache_sizeE
	adrp	x23, :got:_ZN6Halide7Runtime8Internal14max_cache_sizeE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal18current_cache_sizeE]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal14max_cache_sizeE]
	ldr	x8, [x22]
	ldr	x9, [x23]
	cmp	x8, x9
	b.le	.LBB105_53
// %bb.2:                               // %while.body.preheader
	adrp	x24, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	adrp	x25, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	ldr	x24, [x24, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x25, [x25, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	adrp	x20, .L.str.4.44
	mov	w26, #56
	add	x20, x20, :lo12:.L.str.4.44
.LBB105_3:                              // %while.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB105_5 Depth 2
                                        //     Child Loop BB105_28 Depth 2
	ldr	w10, [x19, #52]
	ldr	x27, [x19, #8]
	cbnz	w10, .LBB105_50
// %bb.4:                               // %if.then
                                        //   in Loop: Header=BB105_3 Depth=1
	ldrb	w9, [x19, #48]
	ldr	x8, [x24, x9, lsl #3]
	cmp	x8, x19
	b.eq	.LBB105_7
.LBB105_5:                              // %while.cond9
                                        //   Parent Loop BB105_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x28, x8
	cbz	x8, .LBB105_8
// %bb.6:                               // %land.rhs11
                                        //   in Loop: Header=BB105_5 Depth=2
	ldr	x8, [x28]
	cmp	x8, x19
	b.ne	.LBB105_5
	b	.LBB105_9
.LBB105_7:                              // %if.then6
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	x8, [x19]
	str	x8, [x24, x9, lsl #3]
	ldr	x8, [x21]
	cmp	x8, x19
	b.ne	.LBB105_11
	b	.LBB105_10
.LBB105_8:                              // %if.then18
                                        //   in Loop: Header=BB105_3 Depth=1
	mov	x0, xzr
	mov	x1, x20
	bl	halide_print
	bl	abort
.LBB105_9:                              // %if.end
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	x8, [x19]
	str	x8, [x28]
	ldr	x8, [x21]
	cmp	x8, x19
	b.ne	.LBB105_11
.LBB105_10:                             // %if.then23
                                        //   in Loop: Header=BB105_3 Depth=1
	str	x27, [x21]
.LBB105_11:                             // %if.end24
                                        //   in Loop: Header=BB105_3 Depth=1
	cbz	x27, .LBB105_13
// %bb.12:                              // %if.then26
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	x8, [x19, #16]
	str	x8, [x27, #16]
.LBB105_13:                             // %if.end28
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	x8, [x25]
	cmp	x8, x19
	b.eq	.LBB105_52
// %bb.14:                              // %if.end28.if.end32_crit_edge
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	x8, [x19, #16]
	cbz	x8, .LBB105_16
.LBB105_15:                             // %if.then35
                                        //   in Loop: Header=BB105_3 Depth=1
	str	x27, [x19, #16]
.LBB105_16:                             // %if.end37
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	w8, [x19, #56]
	cbz	w8, .LBB105_49
// %bb.17:                              // %for.body.lr.ph
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	x10, [x19, #72]
	ldr	x9, [x22]
	mov	x11, xzr
	madd	x12, x11, x26, x10
	ldrsw	x12, [x12, #36]
	cmp	w12, #0                 // =0
	b.gt	.LBB105_21
	b	.LBB105_23
.LBB105_18:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        //   in Loop: Header=BB105_3 Depth=1
	add	x12, x14, #1            // =1
.LBB105_19:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        //   in Loop: Header=BB105_3 Depth=1
	add	x13, x15, #7            // =7
	sub	x12, x12, x17
	add	x11, x11, #1            // =1
	lsr	x13, x13, #3
	cmp	x11, x8
	msub	x9, x12, x13, x9
	b.eq	.LBB105_48
// %bb.20:                              // %for.body
                                        //   in Loop: Header=BB105_3 Depth=1
	madd	x12, x11, x26, x10
	ldrsw	x12, [x12, #36]
	cmp	w12, #0                 // =0
	b.le	.LBB105_23
.LBB105_21:                             // %for.body.lr.ph.i.i
                                        //   in Loop: Header=BB105_3 Depth=1
	madd	x13, x11, x26, x10
	ldr	x13, [x13, #40]
	cmp	w12, #3                 // =3
	b.hs	.LBB105_24
// %bb.22:                              //   in Loop: Header=BB105_3 Depth=1
	mov	x15, xzr
	mov	x14, xzr
	b	.LBB105_31
.LBB105_23:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        //   in Loop: Header=BB105_3 Depth=1
	madd	x12, x11, x26, x10
	ldrb	w15, [x12, #33]
	mov	x17, xzr
	mov	w12, #1
	b	.LBB105_19
.LBB105_24:                             // %vector.ph30
                                        //   in Loop: Header=BB105_3 Depth=1
	and	x15, x12, #0xfffffffffffffffe
	mov	x14, xzr
	mov	x16, xzr
	add	x17, x13, #24           // =24
	mov	x18, x15
	ldur	w1, [x17, #-16]
	ldr	w0, [x17]
                                        // implicit-def: $w2
	cmp	w1, #1                  // =1
	b.ge	.LBB105_27
	b	.LBB105_28
.LBB105_25:                             // %pred.load.continue44
                                        //   in Loop: Header=BB105_28 Depth=2
	sub	w2, w2, #1              // =1
	sub	w3, w3, #1              // =1
	cmp	w1, #0                  // =0
	mul	w1, w2, w1
	mul	w2, w3, w0
	csel	w1, w1, wzr, gt
	cmp	w0, #0                  // =0
	csel	w0, w2, wzr, gt
	add	x14, x14, w1, sxtw
	subs	x18, x18, #2            // =2
	add	x16, x16, w0, sxtw
	add	x17, x17, #32           // =32
	b.eq	.LBB105_30
// %bb.26:                              // %vector.body26
                                        //   in Loop: Header=BB105_28 Depth=2
	ldur	w1, [x17, #-16]
	ldr	w0, [x17]
                                        // implicit-def: $w2
	cmp	w1, #1                  // =1
	b.lt	.LBB105_28
.LBB105_27:                             // %pred.load.if41
                                        //   in Loop: Header=BB105_3 Depth=1
	ldur	w2, [x17, #-20]
.LBB105_28:                             // %pred.load.continue42
                                        //   Parent Loop BB105_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cmp	w0, #1                  // =1
                                        // implicit-def: $w3
	b.lt	.LBB105_25
// %bb.29:                              // %pred.load.if43
                                        //   in Loop: Header=BB105_28 Depth=2
	ldur	w3, [x17, #-4]
	b	.LBB105_25
.LBB105_30:                             // %middle.block27
                                        //   in Loop: Header=BB105_3 Depth=1
	cmp	x15, x12
	add	x14, x16, x14
	b.eq	.LBB105_35
.LBB105_31:                             // %for.body.i.i.preheader
                                        //   in Loop: Header=BB105_3 Depth=1
	sub	x16, x12, x15
	add	x15, x13, x15, lsl #4
	add	x15, x15, #8            // =8
	ldrsw	x17, [x15]
	cmp	w17, #1                 // =1
	b.ge	.LBB105_34
.LBB105_32:                             // %for.inc.i.i
                                        //   in Loop: Header=BB105_3 Depth=1
	subs	x16, x16, #1            // =1
	add	x15, x15, #16           // =16
	b.eq	.LBB105_35
.LBB105_33:                             // %for.body.i.i
                                        //   in Loop: Header=BB105_3 Depth=1
	ldrsw	x17, [x15]
	cmp	w17, #1                 // =1
	b.lt	.LBB105_32
.LBB105_34:                             // %if.then.i.i
                                        //   in Loop: Header=BB105_3 Depth=1
	ldursw	x18, [x15, #-4]
	sub	x18, x18, #1            // =1
	madd	x14, x18, x17, x14
	subs	x16, x16, #1            // =1
	add	x15, x15, #16           // =16
	b.ne	.LBB105_33
.LBB105_35:                             // %for.body.lr.ph.i5.i
                                        //   in Loop: Header=BB105_3 Depth=1
	madd	x15, x11, x26, x10
	ldrb	w15, [x15, #33]
	cmp	w12, #3                 // =3
	b.hs	.LBB105_37
// %bb.36:                              //   in Loop: Header=BB105_3 Depth=1
	mov	x16, xzr
	mov	x17, xzr
	b	.LBB105_44
.LBB105_37:                             // %vector.ph
                                        //   in Loop: Header=BB105_3 Depth=1
	and	x16, x12, #0xfffffffffffffffe
	mov	x17, xzr
	mov	x18, xzr
	add	x0, x13, #24            // =24
	mov	x1, x16
	ldur	w2, [x0, #-16]
	ldr	w3, [x0]
                                        // implicit-def: $w4
	tbz	w2, #31, .LBB105_40
	b	.LBB105_41
.LBB105_38:                             // %pred.load.continue24
                                        //   in Loop: Header=BB105_3 Depth=1
	sub	w4, w4, #1              // =1
	sub	w5, w5, #1              // =1
	mul	w4, w4, w2
	mul	w5, w5, w3
	and	w2, w4, w2, asr #31
	and	w3, w5, w3, asr #31
	subs	x1, x1, #2              // =2
	add	x17, x17, w2, sxtw
	add	x18, x18, w3, sxtw
	add	x0, x0, #32             // =32
	b.eq	.LBB105_43
// %bb.39:                              // %vector.body
                                        //   in Loop: Header=BB105_3 Depth=1
	ldur	w2, [x0, #-16]
	ldr	w3, [x0]
                                        // implicit-def: $w4
	tbnz	w2, #31, .LBB105_41
.LBB105_40:                             // %pred.load.continue
                                        //   in Loop: Header=BB105_3 Depth=1
                                        // implicit-def: $w5
	tbz	w3, #31, .LBB105_38
	b	.LBB105_42
.LBB105_41:                             // %pred.load.if
                                        //   in Loop: Header=BB105_3 Depth=1
	ldur	w4, [x0, #-20]
                                        // implicit-def: $w5
	tbz	w3, #31, .LBB105_38
.LBB105_42:                             // %pred.load.if23
                                        //   in Loop: Header=BB105_3 Depth=1
	ldur	w5, [x0, #-4]
	b	.LBB105_38
.LBB105_43:                             // %middle.block
                                        //   in Loop: Header=BB105_3 Depth=1
	cmp	x16, x12
	add	x17, x18, x17
	b.eq	.LBB105_18
.LBB105_44:                             // %for.body.i16.i.preheader
                                        //   in Loop: Header=BB105_3 Depth=1
	add	x13, x13, x16, lsl #4
	sub	x12, x12, x16
	add	x13, x13, #8            // =8
	ldrsw	x16, [x13]
	tbnz	w16, #31, .LBB105_47
.LBB105_45:                             // %for.inc.i26.i
                                        //   in Loop: Header=BB105_3 Depth=1
	subs	x12, x12, #1            // =1
	add	x13, x13, #16           // =16
	b.eq	.LBB105_18
.LBB105_46:                             // %for.body.i16.i
                                        //   in Loop: Header=BB105_3 Depth=1
	ldrsw	x16, [x13]
	tbz	w16, #31, .LBB105_45
.LBB105_47:                             // %if.then.i22.i
                                        //   in Loop: Header=BB105_3 Depth=1
	ldursw	x18, [x13, #-4]
	sub	x18, x18, #1            // =1
	madd	x17, x18, x16, x17
	subs	x12, x12, #1            // =1
	add	x13, x13, #16           // =16
	b.ne	.LBB105_46
	b	.LBB105_18
.LBB105_48:                             // %for.cond.for.cond.cleanup_crit_edge
                                        //   in Loop: Header=BB105_3 Depth=1
	str	x9, [x22]
.LBB105_49:                             // %for.cond.cleanup
                                        //   in Loop: Header=BB105_3 Depth=1
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	mov	x0, xzr
	mov	x1, x19
	bl	halide_free
	ldr	x8, [x22]
	ldr	x9, [x23]
.LBB105_50:                             // %if.end41
                                        //   in Loop: Header=BB105_3 Depth=1
	cbz	x27, .LBB105_53
// %bb.51:                              // %if.end41
                                        //   in Loop: Header=BB105_3 Depth=1
	cmp	x8, x9
	mov	x19, x27
	b.gt	.LBB105_3
	b	.LBB105_53
.LBB105_52:                             // %if.then30
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	x8, [x19, #16]
	str	x8, [x25]
	cbnz	x8, .LBB105_15
	b	.LBB105_16
.LBB105_53:                             // %while.end42
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end105:
	.size	_ZN6Halide7Runtime8Internal11prune_cacheEv, .Lfunc_end105-_ZN6Halide7Runtime8Internal11prune_cacheEv
                                        // -- End function
	.section	.text.halide_memoization_cache_set_size,"ax",@progbits
	.weak	halide_memoization_cache_set_size // -- Begin function halide_memoization_cache_set_size
	.p2align	2
	.type	halide_memoization_cache_set_size,@function
halide_memoization_cache_set_size:      // @halide_memoization_cache_set_size
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	cmp	x0, #0                  // =0
	mov	w8, #1048576
	csel	x20, x8, x0, eq
	mov	x0, x19
	add	x29, sp, #16            // =16
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal14max_cache_sizeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal14max_cache_sizeE]
	str	x20, [x8]
	bl	_ZN6Halide7Runtime8Internal11prune_cacheEv
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end106:
	.size	halide_memoization_cache_set_size, .Lfunc_end106-halide_memoization_cache_set_size
                                        // -- End function
	.section	.text.halide_memoization_cache_lookup,"ax",@progbits
	.weak	halide_memoization_cache_lookup // -- Begin function halide_memoization_cache_lookup
	.p2align	2
	.type	halide_memoization_cache_lookup,@function
halide_memoization_cache_lookup:        // @halide_memoization_cache_lookup
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
                                        // kill: def $w2 killed $w2 def $x2
	sxtw	x25, w2
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x24, x1
	mov	x20, x0
	mov	x0, x1
	mov	x1, x25
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	mov	x19, x5
	mov	w28, w4
	mov	x23, x3
	bl	_ZN6Halide7Runtime8Internal8djb_hashEPKhm
	mov	w21, w0
	and	w22, w0, #0xff
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x26, [x8, w22, uxtw #3]
	cbz	x26, .LBB107_32
// %bb.1:                               // %while.body.lr.ph
	cmp	w28, #0                 // =0
	b.le	.LBB107_14
// %bb.2:                               // %while.body.us.preheader
	sxtw	x27, w28
	ldr	w8, [x26, #48]
	cmp	w8, w21
	b.eq	.LBB107_5
.LBB107_3:                              // %if.end67.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x26, [x26]
	cbz	x26, .LBB107_32
// %bb.4:                               // %while.body.us
                                        //   in Loop: Header=BB107_3 Depth=1
	ldr	w8, [x26, #48]
	cmp	w8, w21
	b.ne	.LBB107_3
.LBB107_5:                              // %land.lhs.true.us
	ldr	x8, [x26, #32]
	cmp	x8, x25
	b.ne	.LBB107_3
// %bb.6:                               // %land.lhs.true7.us
	ldr	x0, [x26, #40]
	mov	x1, x24
	mov	x2, x25
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB107_3
// %bb.7:                               // %land.lhs.true10.us
	ldr	x1, [x26, #64]
	mov	x0, x23
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB107_3
// %bb.8:                               // %land.lhs.true13.us
	ldr	w8, [x26, #56]
	cmp	w8, w28
	b.ne	.LBB107_3
// %bb.9:                               // %for.body.lr.ph.us
	str	x28, [sp, #8]           // 8-byte Folded Spill
	mov	x28, xzr
	mov	w22, #40
.LBB107_10:                             // %for.body.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x26, #72]
	ldr	x0, [x19, x28, lsl #3]
	ldr	x1, [x8, x22]
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	add	x28, x28, #1            // =1
	cmp	x28, x27
	b.ge	.LBB107_12
// %bb.11:                              // %for.body.us
                                        //   in Loop: Header=BB107_10 Depth=1
	add	x22, x22, #56           // =56
	tbnz	w0, #0, .LBB107_10
.LBB107_12:                             // %for.cond.for.cond.cleanup_crit_edge.us
	ldr	x28, [sp, #8]           // 8-byte Folded Reload
	tbz	w0, #0, .LBB107_3
	b	.LBB107_19
.LBB107_13:                             // %if.end67
                                        //   in Loop: Header=BB107_14 Depth=1
	ldr	x26, [x26]
	cbz	x26, .LBB107_32
.LBB107_14:                             // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x26, #48]
	cmp	w8, w21
	b.ne	.LBB107_13
// %bb.15:                              // %land.lhs.true
                                        //   in Loop: Header=BB107_14 Depth=1
	ldr	x8, [x26, #32]
	cmp	x8, x25
	b.ne	.LBB107_13
// %bb.16:                              // %land.lhs.true7
                                        //   in Loop: Header=BB107_14 Depth=1
	ldr	x0, [x26, #40]
	mov	x1, x24
	mov	x2, x25
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB107_13
// %bb.17:                              // %land.lhs.true10
                                        //   in Loop: Header=BB107_14 Depth=1
	ldr	x1, [x26, #64]
	mov	x0, x23
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB107_13
// %bb.18:                              // %land.lhs.true13
                                        //   in Loop: Header=BB107_14 Depth=1
	ldr	w8, [x26, #56]
	cmp	w8, w28
	b.ne	.LBB107_13
.LBB107_19:                             // %if.then23
	adrp	x21, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	ldr	x8, [x21]
	cmp	x26, x8
	b.eq	.LBB107_28
// %bb.20:                              // %if.then25
	ldr	x8, [x26, #8]
	cbnz	x8, .LBB107_22
// %bb.21:                              // %if.then27
	adrp	x1, .L.str.5.45
	add	x1, x1, :lo12:.L.str.5.45
	mov	x0, x20
	bl	halide_print
	bl	abort
.LBB107_22:                             // %if.end
	ldr	x8, [x26, #16]
	cbz	x8, .LBB107_71
// %bb.23:                              // %if.then29
	ldr	x9, [x26, #8]
	str	x9, [x8, #8]
	ldr	x8, [x26, #8]
	cbnz	x8, .LBB107_25
.LBB107_24:                             // %if.then40
	adrp	x1, .L.str.7.47
	add	x1, x1, :lo12:.L.str.7.47
	mov	x0, x20
	bl	halide_print
	bl	abort
	ldr	x8, [x26, #8]
.LBB107_25:                             // %if.end41
	ldr	x9, [x26, #16]
	str	x9, [x8, #16]
	ldr	x8, [x21]
	stp	xzr, x8, [x26, #8]
	cbz	x8, .LBB107_27
// %bb.26:                              // %if.then48
	str	x26, [x8, #8]
.LBB107_27:                             // %if.end50
	str	x26, [x21]
.LBB107_28:                             // %if.end51
	cmp	w28, #1                 // =1
	b.lt	.LBB107_31
// %bb.29:                              // %for.body56.lr.ph
	mov	x8, xzr
	mov	w9, w28
.LBB107_30:                             // %for.body56
                                        // =>This Inner Loop Header: Depth=1
	ldr	x10, [x19], #8
	ldr	x11, [x26, #72]
	subs	x9, x9, #1              // =1
	add	x11, x11, x8
	ldr	x12, [x11, #48]
	ldp	q2, q0, [x11, #16]
	ldr	q1, [x11]
	add	x8, x8, #56             // =56
	str	x12, [x10, #48]
	stp	q2, q0, [x10, #16]
	str	q1, [x10]
	b.ne	.LBB107_30
.LBB107_31:                             // %for.cond.cleanup55
	ldr	w8, [x26, #52]
	mov	w19, wzr
	add	w8, w8, w28
	str	w8, [x26, #52]
	b	.LBB107_70
.LBB107_32:                             // %for.cond69.preheader
	cmp	w28, #1                 // =1
	b.lt	.LBB107_65
// %bb.33:                              // %for.body72.preheader
	mov	x23, xzr
	mov	w22, w28
	orr	x24, xzr, #0x80
.LBB107_34:                             // %for.body72
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB107_42 Depth 2
	ldr	x25, [x19, x23, lsl #3]
	ldrsw	x8, [x25, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB107_37
// %bb.35:                              // %for.body.lr.ph.i.i
                                        //   in Loop: Header=BB107_34 Depth=1
	ldr	x9, [x25, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB107_38
// %bb.36:                              //   in Loop: Header=BB107_34 Depth=1
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB107_45
.LBB107_37:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        //   in Loop: Header=BB107_34 Depth=1
	ldrb	w11, [x25, #33]
	mov	x13, xzr
	mov	w8, #1
	b	.LBB107_63
.LBB107_38:                             // %vector.ph40
                                        //   in Loop: Header=BB107_34 Depth=1
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB107_41
	b	.LBB107_42
.LBB107_39:                             // %pred.load.continue54
                                        //   in Loop: Header=BB107_42 Depth=2
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB107_44
// %bb.40:                              // %vector.body36
                                        //   in Loop: Header=BB107_42 Depth=2
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB107_42
.LBB107_41:                             // %pred.load.if51
                                        //   in Loop: Header=BB107_34 Depth=1
	ldur	w17, [x13, #-20]
.LBB107_42:                             // %pred.load.continue52
                                        //   Parent Loop BB107_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB107_39
// %bb.43:                              // %pred.load.if53
                                        //   in Loop: Header=BB107_42 Depth=2
	ldur	w18, [x13, #-4]
	b	.LBB107_39
.LBB107_44:                             // %middle.block37
                                        //   in Loop: Header=BB107_34 Depth=1
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB107_49
.LBB107_45:                             // %for.body.i.i.preheader
                                        //   in Loop: Header=BB107_34 Depth=1
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB107_48
.LBB107_46:                             // %for.inc.i.i
                                        //   in Loop: Header=BB107_34 Depth=1
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB107_49
.LBB107_47:                             // %for.body.i.i
                                        //   in Loop: Header=BB107_34 Depth=1
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB107_46
.LBB107_48:                             // %if.then.i.i
                                        //   in Loop: Header=BB107_34 Depth=1
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB107_47
.LBB107_49:                             // %for.body.lr.ph.i5.i
                                        //   in Loop: Header=BB107_34 Depth=1
	ldrb	w11, [x25, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB107_51
// %bb.50:                              //   in Loop: Header=BB107_34 Depth=1
	mov	x12, xzr
	mov	x13, xzr
	b	.LBB107_58
.LBB107_51:                             // %vector.ph
                                        //   in Loop: Header=BB107_34 Depth=1
	and	x12, x8, #0xfffffffffffffffe
	mov	x13, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x12
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbz	w17, #31, .LBB107_55
.LBB107_52:                             // %pred.load.if
                                        //   in Loop: Header=BB107_34 Depth=1
	ldur	w0, [x15, #-20]
                                        // implicit-def: $w1
	tbnz	w18, #31, .LBB107_56
.LBB107_53:                             // %pred.load.continue34
                                        //   in Loop: Header=BB107_34 Depth=1
	sub	w0, w0, #1              // =1
	sub	w1, w1, #1              // =1
	mul	w0, w0, w17
	mul	w1, w1, w18
	and	w17, w0, w17, asr #31
	and	w18, w1, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x13, x13, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB107_57
// %bb.54:                              // %vector.body
                                        //   in Loop: Header=BB107_34 Depth=1
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbnz	w17, #31, .LBB107_52
.LBB107_55:                             // %pred.load.continue
                                        //   in Loop: Header=BB107_34 Depth=1
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB107_53
.LBB107_56:                             // %pred.load.if33
                                        //   in Loop: Header=BB107_34 Depth=1
	ldur	w1, [x15, #-4]
	b	.LBB107_53
.LBB107_57:                             // %middle.block
                                        //   in Loop: Header=BB107_34 Depth=1
	cmp	x12, x8
	add	x13, x14, x13
	b.eq	.LBB107_62
.LBB107_58:                             // %for.body.i16.i.preheader
                                        //   in Loop: Header=BB107_34 Depth=1
	add	x9, x9, x12, lsl #4
	sub	x8, x8, x12
	add	x9, x9, #8              // =8
	ldrsw	x12, [x9]
	tbnz	w12, #31, .LBB107_61
.LBB107_59:                             // %for.inc.i26.i
                                        //   in Loop: Header=BB107_34 Depth=1
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB107_62
.LBB107_60:                             // %for.body.i16.i
                                        //   in Loop: Header=BB107_34 Depth=1
	ldrsw	x12, [x9]
	tbz	w12, #31, .LBB107_59
.LBB107_61:                             // %if.then.i22.i
                                        //   in Loop: Header=BB107_34 Depth=1
	ldursw	x14, [x9, #-4]
	sub	x14, x14, #1            // =1
	madd	x13, x14, x12, x13
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB107_60
.LBB107_62:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        //   in Loop: Header=BB107_34 Depth=1
	add	x8, x10, #1             // =1
.LBB107_63:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        //   in Loop: Header=BB107_34 Depth=1
	add	x9, x11, #7             // =7
	lsr	x9, x9, #3
	sub	x8, x8, x13
	madd	x1, x8, x9, x24
	mov	x0, x20
	bl	halide_malloc
	str	x0, [x25, #16]
	cbz	x0, .LBB107_66
// %bb.64:                              // %for.inc108
                                        //   in Loop: Header=BB107_34 Depth=1
	add	x0, x0, #128            // =128
	str	x0, [x25, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	add	x23, x23, #1            // =1
	cmp	x23, x22
	str	w21, [x0, #8]
	str	xzr, [x0]
	b.ne	.LBB107_34
.LBB107_65:
	mov	w19, #1
	b	.LBB107_70
.LBB107_66:                             // %for.cond83.preheader
	cbz	w23, .LBB107_69
// %bb.67:                              // %for.body86.preheader
	and	x8, x23, #0xffffffff
	sub	x19, x19, #8            // =8
.LBB107_68:                             // %for.body86
                                        // =>This Inner Loop Header: Depth=1
	lsl	x21, x8, #3
	ldr	x9, [x19, x21]
	sub	x22, x8, #1             // =1
	ldr	x0, [x9, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	mov	x1, x0
	mov	x0, x20
	bl	halide_free
	ldr	x8, [x19, x21]
	cmp	x22, #0                 // =0
	str	xzr, [x8, #16]
	mov	x8, x22
	b.gt	.LBB107_68
.LBB107_69:
	mov	w19, #-1
.LBB107_70:                             // %cleanup113
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB107_71:                             // %if.else
	adrp	x22, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	ldr	x8, [x22]
	cmp	x8, x26
	b.eq	.LBB107_73
// %bb.72:                              // %if.then34
	adrp	x1, .L.str.6.46
	add	x1, x1, :lo12:.L.str.6.46
	mov	x0, x20
	bl	halide_print
	bl	abort
.LBB107_73:                             // %if.end35
	ldr	x8, [x26, #8]
	str	x8, [x22]
	cbnz	x8, .LBB107_25
	b	.LBB107_24
.Lfunc_end107:
	.size	halide_memoization_cache_lookup, .Lfunc_end107-halide_memoization_cache_lookup
                                        // -- End function
	.section	.text.halide_memoization_cache_store,"ax",@progbits
	.weak	halide_memoization_cache_store // -- Begin function halide_memoization_cache_store
	.p2align	2
	.type	halide_memoization_cache_store,@function
halide_memoization_cache_store:         // @halide_memoization_cache_store
// %bb.0:                               // %entry
	sub	sp, sp, #144            // =144
	stp	x28, x27, [sp, #48]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #64]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #128]    // 16-byte Folded Spill
	stp	x2, x1, [sp, #32]       // 16-byte Folded Spill
	ldr	x8, [x5]
	mov	x22, x0
	add	x29, sp, #128           // =128
	mov	x19, x5
	ldr	x8, [x8, #16]
	mov	w20, w4
	mov	x27, x3
	mov	x0, x8
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	ldr	w25, [x0, #8]
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	and	x23, x25, #0xff
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x21, [x8, x23, lsl #3]
	cbz	x21, .LBB108_19
// %bb.1:                               // %while.body.lr.ph
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	cmp	w20, #0                 // =0
	sxtw	x26, w8
	b.le	.LBB108_4
// %bb.2:                               // %while.body.us.preheader
	sxtw	x24, w20
	ldr	w8, [x21, #48]
	cmp	w8, w25
	b.ne	.LBB108_10
	b	.LBB108_12
.LBB108_3:                              // %if.end53
                                        //   in Loop: Header=BB108_4 Depth=1
	ldr	x21, [x21]
	cbz	x21, .LBB108_19
.LBB108_4:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x21, #48]
	cmp	w8, w25
	b.ne	.LBB108_3
// %bb.5:                               // %land.lhs.true
                                        //   in Loop: Header=BB108_4 Depth=1
	ldr	x8, [x21, #32]
	cmp	x8, x26
	b.ne	.LBB108_3
// %bb.6:                               // %land.lhs.true8
                                        //   in Loop: Header=BB108_4 Depth=1
	ldr	x0, [x21, #40]
	ldr	x1, [sp, #40]           // 8-byte Folded Reload
	mov	x2, x26
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB108_3
// %bb.7:                               // %land.lhs.true11
                                        //   in Loop: Header=BB108_4 Depth=1
	ldr	x1, [x21, #64]
	mov	x0, x27
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB108_3
// %bb.8:                               // %land.lhs.true14
                                        //   in Loop: Header=BB108_4 Depth=1
	ldr	w8, [x21, #56]
	cmp	w8, w20
	b.ne	.LBB108_3
	b	.LBB108_69
.LBB108_9:                              // %for.cond.for.cond.cleanup_crit_edge.us
	ldp	x23, x22, [sp, #16]     // 16-byte Folded Reload
	ldr	x27, [sp, #8]           // 8-byte Folded Reload
	tbnz	w0, #0, .LBB108_67
.LBB108_10:                             // %if.end53.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x21, [x21]
	cbz	x21, .LBB108_19
// %bb.11:                              // %while.body.us
                                        //   in Loop: Header=BB108_10 Depth=1
	ldr	w8, [x21, #48]
	cmp	w8, w25
	b.ne	.LBB108_10
.LBB108_12:                             // %land.lhs.true.us
	ldr	x8, [x21, #32]
	cmp	x8, x26
	b.ne	.LBB108_10
// %bb.13:                              // %land.lhs.true8.us
	ldr	x0, [x21, #40]
	ldr	x1, [sp, #40]           // 8-byte Folded Reload
	mov	x2, x26
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB108_10
// %bb.14:                              // %land.lhs.true11.us
	ldr	x1, [x21, #64]
	mov	x0, x27
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB108_10
// %bb.15:                              // %land.lhs.true14.us
	ldr	w8, [x21, #56]
	cmp	w8, w20
	b.ne	.LBB108_10
// %bb.16:                              // %for.body.lr.ph.us
	stp	x27, x23, [sp, #8]      // 16-byte Folded Spill
	ldr	x8, [x21, #72]
	str	x22, [sp, #24]          // 8-byte Folded Spill
	mov	x22, xzr
	mov	x23, xzr
	mov	w28, #1
.LBB108_17:                             // %for.body.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x27, [x19, x23, lsl #3]
	add	x8, x8, x22
	ldr	x1, [x8, #40]
	mov	x0, x27
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	ldr	x8, [x21, #72]
	ldr	x9, [x27, #16]
	add	x23, x23, #1            // =1
	add	x10, x8, x22
	ldr	x10, [x10, #16]
	cmp	x10, x9
	csel	w28, wzr, w28, eq
	cmp	x23, x24
	b.ge	.LBB108_9
// %bb.18:                              // %for.body.us
                                        //   in Loop: Header=BB108_17 Depth=1
	add	x22, x22, #56           // =56
	tbnz	w0, #0, .LBB108_17
	b	.LBB108_9
.LBB108_19:                             // %for.cond55.preheader
	mov	x24, x27
	cmp	w20, #1                 // =1
	b.lt	.LBB108_51
// %bb.20:                              // %for.body58.preheader
	mov	x8, xzr
	mov	x27, xzr
	mov	w9, w20
	ldr	x13, [x19, x8, lsl #3]
	ldrsw	x10, [x13, #36]
	cmp	w10, #0                 // =0
	b.gt	.LBB108_24
	b	.LBB108_26
.LBB108_21:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x10, x12, #1            // =1
.LBB108_22:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x11, x13, #7            // =7
	sub	x10, x10, x15
	add	x8, x8, #1              // =1
	lsr	x11, x11, #3
	cmp	x8, x9
	madd	x27, x10, x11, x27
	b.eq	.LBB108_52
// %bb.23:                              // %for.body58
	ldr	x13, [x19, x8, lsl #3]
	ldrsw	x10, [x13, #36]
	cmp	w10, #0                 // =0
	b.le	.LBB108_26
.LBB108_24:                             // %for.body.lr.ph.i.i
	ldr	x11, [x13, #40]
	cmp	w10, #3                 // =3
	b.hs	.LBB108_27
// %bb.25:
	mov	x14, xzr
	mov	x12, xzr
	b	.LBB108_34
.LBB108_26:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w13, [x13, #33]
	mov	x15, xzr
	mov	w10, #1
	b	.LBB108_22
.LBB108_27:                             // %vector.ph22
	and	x14, x10, #0xfffffffffffffffe
	mov	x12, xzr
	mov	x15, xzr
	add	x16, x11, #24           // =24
	mov	x17, x14
	ldur	w0, [x16, #-16]
	ldr	w18, [x16]
                                        // implicit-def: $w1
	cmp	w0, #1                  // =1
	b.ge	.LBB108_30
	b	.LBB108_31
.LBB108_28:                             // %pred.load.continue36
                                        //   in Loop: Header=BB108_31 Depth=1
	sub	w1, w1, #1              // =1
	sub	w2, w2, #1              // =1
	cmp	w0, #0                  // =0
	mul	w0, w1, w0
	mul	w1, w2, w18
	csel	w0, w0, wzr, gt
	cmp	w18, #0                 // =0
	csel	w18, w1, wzr, gt
	add	x12, x12, w0, sxtw
	subs	x17, x17, #2            // =2
	add	x15, x15, w18, sxtw
	add	x16, x16, #32           // =32
	b.eq	.LBB108_33
// %bb.29:                              // %vector.body18
                                        //   in Loop: Header=BB108_31 Depth=1
	ldur	w0, [x16, #-16]
	ldr	w18, [x16]
                                        // implicit-def: $w1
	cmp	w0, #1                  // =1
	b.lt	.LBB108_31
.LBB108_30:                             // %pred.load.if33
	ldur	w1, [x16, #-20]
.LBB108_31:                             // %pred.load.continue34
                                        // =>This Inner Loop Header: Depth=1
	cmp	w18, #1                 // =1
                                        // implicit-def: $w2
	b.lt	.LBB108_28
// %bb.32:                              // %pred.load.if35
                                        //   in Loop: Header=BB108_31 Depth=1
	ldur	w2, [x16, #-4]
	b	.LBB108_28
.LBB108_33:                             // %middle.block19
	cmp	x14, x10
	add	x12, x15, x12
	b.eq	.LBB108_38
.LBB108_34:                             // %for.body.i.i.preheader
	sub	x15, x10, x14
	add	x14, x11, x14, lsl #4
	add	x14, x14, #8            // =8
	ldrsw	x16, [x14]
	cmp	w16, #1                 // =1
	b.ge	.LBB108_37
.LBB108_35:                             // %for.inc.i.i
	subs	x15, x15, #1            // =1
	add	x14, x14, #16           // =16
	b.eq	.LBB108_38
.LBB108_36:                             // %for.body.i.i
	ldrsw	x16, [x14]
	cmp	w16, #1                 // =1
	b.lt	.LBB108_35
.LBB108_37:                             // %if.then.i.i
	ldursw	x17, [x14, #-4]
	sub	x17, x17, #1            // =1
	madd	x12, x17, x16, x12
	subs	x15, x15, #1            // =1
	add	x14, x14, #16           // =16
	b.ne	.LBB108_36
.LBB108_38:                             // %for.body.lr.ph.i5.i
	ldrb	w13, [x13, #33]
	cmp	w10, #3                 // =3
	b.hs	.LBB108_40
// %bb.39:
	mov	x14, xzr
	mov	x15, xzr
	b	.LBB108_47
.LBB108_40:                             // %vector.ph
	and	x14, x10, #0xfffffffffffffffe
	mov	x15, xzr
	mov	x16, xzr
	add	x17, x11, #24           // =24
	mov	x18, x14
	ldur	w0, [x17, #-16]
	ldr	w1, [x17]
                                        // implicit-def: $w2
	tbz	w0, #31, .LBB108_43
	b	.LBB108_44
.LBB108_41:                             // %pred.load.continue16
	sub	w2, w2, #1              // =1
	sub	w3, w3, #1              // =1
	mul	w2, w2, w0
	mul	w3, w3, w1
	and	w0, w2, w0, asr #31
	and	w1, w3, w1, asr #31
	subs	x18, x18, #2            // =2
	add	x15, x15, w0, sxtw
	add	x16, x16, w1, sxtw
	add	x17, x17, #32           // =32
	b.eq	.LBB108_46
// %bb.42:                              // %vector.body
	ldur	w0, [x17, #-16]
	ldr	w1, [x17]
                                        // implicit-def: $w2
	tbnz	w0, #31, .LBB108_44
.LBB108_43:                             // %pred.load.continue
                                        // implicit-def: $w3
	tbz	w1, #31, .LBB108_41
	b	.LBB108_45
.LBB108_44:                             // %pred.load.if
	ldur	w2, [x17, #-20]
                                        // implicit-def: $w3
	tbz	w1, #31, .LBB108_41
.LBB108_45:                             // %pred.load.if15
	ldur	w3, [x17, #-4]
	b	.LBB108_41
.LBB108_46:                             // %middle.block
	cmp	x14, x10
	add	x15, x16, x15
	b.eq	.LBB108_21
.LBB108_47:                             // %for.body.i16.i.preheader
	add	x11, x11, x14, lsl #4
	sub	x10, x10, x14
	add	x11, x11, #8            // =8
	ldrsw	x14, [x11]
	tbnz	w14, #31, .LBB108_50
.LBB108_48:                             // %for.inc.i26.i
	subs	x10, x10, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB108_21
.LBB108_49:                             // %for.body.i16.i
	ldrsw	x14, [x11]
	tbz	w14, #31, .LBB108_48
.LBB108_50:                             // %if.then.i22.i
	ldursw	x16, [x11, #-4]
	sub	x16, x16, #1            // =1
	madd	x15, x16, x14, x15
	subs	x10, x10, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB108_49
	b	.LBB108_21
.LBB108_51:
	mov	x27, xzr
.LBB108_52:                             // %for.cond.cleanup57
	adrp	x21, :got:_ZN6Halide7Runtime8Internal18current_cache_sizeE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal18current_cache_sizeE]
	ldr	x8, [x21]
	add	x8, x8, x27
	str	x8, [x21]
	bl	_ZN6Halide7Runtime8Internal11prune_cacheEv
	mov	w1, #80
	mov	x0, xzr
	bl	halide_malloc
	mov	x26, x0
	cbz	x0, .LBB108_61
// %bb.53:                              // %if.then70
	ldp	x8, x1, [sp, #32]       // 16-byte Folded Reload
	mov	x0, x26
	mov	w3, w25
	mov	x4, x24
	sxtw	x2, w8
	mov	w5, w20
	mov	x6, x19
	bl	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
	tbz	w0, #0, .LBB108_61
// %bb.54:                              // %if.end94
	adrp	x11, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x8, [x11, x23, lsl #3]
	str	x8, [x26]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	ldr	x9, [x8]
	str	x9, [x26, #16]
	cbz	x9, .LBB108_56
// %bb.55:                              // %if.then99
	str	x26, [x9, #8]
.LBB108_56:                             // %if.end100
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	str	x26, [x8]
	ldr	x10, [x9]
	cbnz	x10, .LBB108_58
// %bb.57:                              // %if.then102
	str	x26, [x9]
.LBB108_58:                             // %if.end103
	cmp	w20, #1                 // =1
	str	x26, [x11, x23, lsl #3]
	str	w20, [x26, #52]
	b.lt	.LBB108_66
// %bb.59:                              // %for.body110.preheader
	mov	w20, w20
.LBB108_60:                             // %for.body110
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19], #8
	ldr	x0, [x8, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	subs	x20, x20, #1            // =1
	str	x26, [x0]
	b.ne	.LBB108_60
	b	.LBB108_66
.LBB108_61:                             // %if.then76
	ldr	x8, [x21]
	cmp	w20, #1                 // =1
	sub	x8, x8, x27
	str	x8, [x21]
	b.lt	.LBB108_64
// %bb.62:                              // %for.body81.preheader
	mov	w20, w20
.LBB108_63:                             // %for.body81
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19], #8
	ldr	x0, [x8, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	subs	x20, x20, #1            // =1
	str	xzr, [x0]
	b.ne	.LBB108_63
.LBB108_64:                             // %for.cond.cleanup80
	cbz	x26, .LBB108_66
// %bb.65:                              // %if.then92
	mov	x0, x22
	mov	x1, x26
	bl	halide_free
.LBB108_66:                             // %cleanup125
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #128]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]     // 16-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #144            // =144
	ret
.LBB108_67:                             // %if.then34
	tbnz	w28, #0, .LBB108_69
// %bb.68:                              // %if.then36
	adrp	x1, .L.str.9.48
	add	x1, x1, :lo12:.L.str.9.48
	mov	x0, x22
	bl	halide_print
	bl	abort
.LBB108_69:                             // %if.end37
	cmp	w20, #1                 // =1
	b.lt	.LBB108_66
// %bb.70:                              // %for.body42.preheader
	mov	w20, w20
.LBB108_71:                             // %for.body42
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19], #8
	ldr	x0, [x8, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	subs	x20, x20, #1            // =1
	str	xzr, [x0]
	b.ne	.LBB108_71
	b	.LBB108_66
.Lfunc_end108:
	.size	halide_memoization_cache_store, .Lfunc_end108-halide_memoization_cache_store
                                        // -- End function
	.section	.text.halide_memoization_cache_release,"ax",@progbits
	.weak	halide_memoization_cache_release // -- Begin function halide_memoization_cache_release
	.p2align	2
	.type	halide_memoization_cache_release,@function
halide_memoization_cache_release:       // @halide_memoization_cache_release
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x0
	mov	x0, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	ldr	x20, [x0]
	cbz	x20, .LBB109_4
// %bb.1:                               // %if.else
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_lock
	ldr	w8, [x20, #52]
	cbnz	w8, .LBB109_3
// %bb.2:                               // %if.then4
	adrp	x1, .L.str.12.49
	add	x1, x1, :lo12:.L.str.12.49
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #52]
.LBB109_3:                              // %if.end
	sub	w8, w8, #1              // =1
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	str	w8, [x20, #52]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.LBB109_4:                              // %if.then
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x1, x0
	mov	x0, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_free
.Lfunc_end109:
	.size	halide_memoization_cache_release, .Lfunc_end109-halide_memoization_cache_release
                                        // -- End function
	.section	.text.halide_string_to_string,"ax",@progbits
	.weak	halide_string_to_string // -- Begin function halide_string_to_string
	.p2align	2
	.type	halide_string_to_string,@function
halide_string_to_string:                // @halide_string_to_string
// %bb.0:                               // %entry
	cmp	x0, x1
	b.hs	.LBB110_4
.LBB110_1:                              // %if.end3
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w8, [x2]
	strb	w8, [x0]
	cbz	w8, .LBB110_4
// %bb.2:                               // %if.end6
                                        //   in Loop: Header=BB110_1 Depth=1
	add	x0, x0, #1              // =1
	cmp	x1, x0
	add	x2, x2, #1              // =1
	b.ne	.LBB110_1
// %bb.3:                               // %if.then2
	sturb	wzr, [x0, #-1]
	mov	x0, x1
.LBB110_4:
	ret
.Lfunc_end110:
	.size	halide_string_to_string, .Lfunc_end110-halide_string_to_string
                                        // -- End function
	.section	.text.halide_uint64_to_string,"ax",@progbits
	.weak	halide_uint64_to_string // -- Begin function halide_uint64_to_string
	.p2align	2
	.type	halide_uint64_to_string,@function
halide_uint64_to_string:                // @halide_uint64_to_string
// %bb.0:                               // %entry
	sub	sp, sp, #48             // =48
	mov	x8, sp
	add	x8, x8, #30             // =30
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	strb	wzr, [sp, #31]
	cbnz	x2, .LBB111_2
// %bb.1:                               // %entry
	cmp	w3, #1                  // =1
	b.lt	.LBB111_5
.LBB111_2:                              // %for.body.preheader
	mov	x9, #-3689348814741910324
	mov	w11, #1
	movk	x9, #52429
	mov	w10, #-10
.LBB111_3:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	mov	w12, w11
	umulh	x11, x2, x9
	mov	x13, x2
	cmp	x2, #9                  // =9
	lsr	x2, x11, #3
	madd	w11, w2, w10, w13
	add	w11, w11, #48           // =48
	strb	w11, [x8], #-1
	add	w11, w12, #1            // =1
	b.hi	.LBB111_3
// %bb.4:                               // %for.body
                                        //   in Loop: Header=BB111_3 Depth=1
	cmp	w12, w3
	b.lt	.LBB111_3
.LBB111_5:                              // %for.cond.cleanup
	add	x2, x8, #1              // =1
	bl	halide_string_to_string
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.Lfunc_end111:
	.size	halide_uint64_to_string, .Lfunc_end111-halide_uint64_to_string
                                        // -- End function
	.section	.text.halide_int64_to_string,"ax",@progbits
	.weak	halide_int64_to_string  // -- Begin function halide_int64_to_string
	.p2align	2
	.type	halide_int64_to_string,@function
halide_int64_to_string:                 // @halide_int64_to_string
// %bb.0:                               // %entry
	cmp	x0, x1
	b.hs	.LBB112_3
// %bb.1:                               // %entry
	tbz	x2, #63, .LBB112_3
// %bb.2:                               // %if.then
	mov	w8, #45
	strb	w8, [x0], #1
	neg	x2, x2
.LBB112_3:                              // %if.end
	b	halide_uint64_to_string
.Lfunc_end112:
	.size	halide_int64_to_string, .Lfunc_end112-halide_int64_to_string
                                        // -- End function
	.section	.text.halide_double_to_string,"ax",@progbits
	.weak	halide_double_to_string // -- Begin function halide_double_to_string
	.p2align	2
	.type	halide_double_to_string,@function
halide_double_to_string:                // @halide_double_to_string
// %bb.0:                               // %entry
	str	d8, [sp, #-80]!         // 8-byte Folded Spill
	str	x28, [sp, #8]           // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	sub	sp, sp, #528            // =528
	mov	w21, w2
	mov	x19, x1
	mov	x20, x0
	sub	x0, x29, #80            // =80
	sub	x1, x29, #72            // =72
	mov	w2, #8
	mov	v8.16b, v0.16b
	stur	d0, [x29, #-72]
	stur	xzr, [x29, #-80]
	bl	memcpy
	ldur	x8, [x29, #-80]
	ubfx	x22, x8, #52, #11
	and	x24, x8, #0xfffffffffffff
	cmp	w22, #2047              // =2047
	lsr	x8, x8, #63
	b.ne	.LBB113_4
// %bb.1:                               // %if.then
	cbz	x24, .LBB113_20
// %bb.2:                               // %if.then4
	cbz	w8, .LBB113_22
// %bb.3:                               // %if.then6
	adrp	x2, .L.str.58
	add	x2, x2, :lo12:.L.str.58
	b	.LBB113_33
.LBB113_4:                              // %if.else15
	cbnz	x24, .LBB113_9
// %bb.5:                               // %if.else15
	cbnz	w22, .LBB113_9
// %bb.6:                               // %if.then18
	cbz	w21, .LBB113_23
// %bb.7:                               // %if.then20
	cbz	w8, .LBB113_29
// %bb.8:                               // %if.then22
	adrp	x2, .L.str.4.62
	add	x2, x2, :lo12:.L.str.4.62
	b	.LBB113_33
.LBB113_9:                              // %if.end32
	cbz	w8, .LBB113_11
// %bb.10:                              // %if.then34
	adrp	x2, .L.str.8.66
	add	x2, x2, :lo12:.L.str.8.66
	mov	x0, x20
	mov	x1, x19
	bl	halide_string_to_string
	mov	x20, x0
	fneg	d8, d8
	stur	d8, [x29, #-72]
.LBB113_11:                             // %if.end37
	cbz	w21, .LBB113_25
// %bb.12:                              // %while.condthread-pre-split
	fmov	d1, #1.00000000
	fcmp	d8, d1
	fmov	d0, #10.00000000
	mov	w22, wzr
	b.pl	.LBB113_15
.LBB113_13:                             // %while.body
                                        // =>This Inner Loop Header: Depth=1
	fmul	d8, d8, d0
	fcmp	d8, d1
	sub	w22, w22, #1            // =1
	b.mi	.LBB113_13
// %bb.14:                              // %while.cond.while.cond41thread-pre-split_crit_edge
	stur	d8, [x29, #-72]
.LBB113_15:                             // %while.cond41thread-pre-split
	fcmp	d8, d0
	b.lt	.LBB113_18
.LBB113_16:                             // %while.body43
                                        // =>This Inner Loop Header: Depth=1
	fdiv	d8, d8, d0
	fcmp	d8, d0
	add	w22, w22, #1            // =1
	b.ge	.LBB113_16
// %bb.17:                              // %while.cond41.while.end44_crit_edge
	stur	d8, [x29, #-72]
.LBB113_18:                             // %while.end44
	mov	x8, #145685290680320
	movk	x8, #16686, lsl #48
	mov	x9, #13531
	fmov	d0, #0.50000000
	movk	x9, #55222, lsl #16
	fmov	d1, x8
	movk	x9, #56962, lsl #32
	fmadd	d0, d8, d1, d0
	movk	x9, #17179, lsl #48
	fcvtzu	x8, d0
	umulh	x9, x8, x9
	lsr	x2, x9, #18
	mov	x9, #-16960
	movk	x9, #65520, lsl #16
	mov	w3, #1
	mov	x0, x20
	mov	x1, x19
	madd	x21, x2, x9, x8
	bl	halide_int64_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x19
	bl	halide_string_to_string
	mov	w3, #6
	mov	x1, x19
	mov	x2, x21
	bl	halide_int64_to_string
	tbnz	w22, #31, .LBB113_30
// %bb.19:                              // %if.then54
	adrp	x2, .L.str.10.68
	add	x2, x2, :lo12:.L.str.10.68
	mov	x1, x19
	bl	halide_string_to_string
	b	.LBB113_31
.LBB113_20:                             // %if.else9
	cbz	w8, .LBB113_28
// %bb.21:                              // %if.then11
	adrp	x2, .L.str.2.60
	add	x2, x2, :lo12:.L.str.2.60
	b	.LBB113_33
.LBB113_22:                             // %if.else
	adrp	x2, .L.str.1.59
	add	x2, x2, :lo12:.L.str.1.59
	b	.LBB113_33
.LBB113_23:                             // %if.else26
	cbz	w8, .LBB113_32
// %bb.24:                              // %if.then28
	adrp	x2, .L.str.6.64
	add	x2, x2, :lo12:.L.str.6.64
	b	.LBB113_33
.LBB113_25:                             // %if.else62
	cbz	w22, .LBB113_34
// %bb.26:                              // %if.end66
	subs	w23, w22, #1075         // =1075
	orr	x2, x24, #0x10000000000000
	b.mi	.LBB113_35
// %bb.27:
	mov	x21, xzr
	b	.LBB113_39
.LBB113_28:                             // %if.else13
	adrp	x2, .L.str.3.61
	add	x2, x2, :lo12:.L.str.3.61
	b	.LBB113_33
.LBB113_29:                             // %if.else24
	adrp	x2, .L.str.5.63
	add	x2, x2, :lo12:.L.str.5.63
	b	.LBB113_33
.LBB113_30:                             // %if.else56
	adrp	x2, .L.str.11.69
	add	x2, x2, :lo12:.L.str.11.69
	mov	x1, x19
	bl	halide_string_to_string
	neg	w22, w22
.LBB113_31:                             // %if.end59
	sxtw	x2, w22
	mov	w3, #2
	mov	x1, x19
	b	.LBB113_50
.LBB113_32:                             // %if.else30
	adrp	x2, .L.str.7.65
	add	x2, x2, :lo12:.L.str.7.65
.LBB113_33:                             // %cleanup148
	mov	x0, x20
	mov	x1, x19
	bl	halide_string_to_string
	b	.LBB113_51
.LBB113_34:                             // %if.then64
	fmov	d0, xzr
	mov	x0, x20
	mov	x1, x19
	mov	w2, wzr
	bl	halide_double_to_string
	b	.LBB113_51
.LBB113_35:                             // %if.then72
	cmn	w23, #52                // =52
	b.ge	.LBB113_37
// %bb.36:
	mov	x8, xzr
	b	.LBB113_38
.LBB113_37:                             // %if.else76
	mov	w8, #1075
	sub	w9, w8, w22
	lsr	x8, x2, x9
	lsl	x9, x8, x9
	sub	x2, x2, x9
.LBB113_38:                             // %if.end84
	mov	x9, #145685290680320
	movk	x9, #16686, lsl #48
	add	x9, x9, x23, lsl #52
	ucvtf	d0, x2
	fmov	d1, #0.50000000
	fmov	d2, x9
	fmadd	d0, d2, d0, d1
	fcvtzu	x9, d0
	ucvtf	d1, x9
	fcmp	d0, d1
	cset	w10, eq
	and	w10, w9, w10
	sub	x9, x9, x10
	mov	w10, #16960
	movk	w10, #15, lsl #16
	cmp	x9, x10
	cinc	x2, x8, eq
	csel	x21, xzr, x9, eq
	mov	w23, wzr
.LBB113_39:                             // %if.end105
	mov	x8, sp
	add	x22, x8, #480           // =480
	add	x1, x8, #512            // =512
	mov	w3, #1
	mov	x0, x22
	bl	halide_int64_to_string
	cmp	w23, #1                 // =1
	b.lt	.LBB113_48
// %bb.40:                              // %for.cond112.preheader.preheader
	mov	w8, wzr
	mov	w9, #49
	cmp	x0, x22
	mov	x2, x0
	b.ne	.LBB113_44
	b	.LBB113_42
.LBB113_41:                             // %if.end138
	mov	x2, x22
.LBB113_42:                             // %if.end138
                                        // =>This Inner Loop Header: Depth=1
	add	w8, w8, #1              // =1
	cmp	w8, w23
	mov	x22, x2
	b.eq	.LBB113_49
// %bb.43:                              // %for.cond112.preheader
                                        //   in Loop: Header=BB113_42 Depth=1
	cmp	x0, x22
	mov	x2, x0
	b.eq	.LBB113_42
.LBB113_44:                             // %for.body116.preheader
	mov	w11, wzr
	mov	x10, x0
.LBB113_45:                             // %for.body116
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w12, [x10, #-1]!
	sub	w12, w12, #48           // =48
	sxtb	w12, w12
	orr	w13, w11, w12, lsl #1
	sxtb	w12, w13
	sub	w14, w13, #10           // =10
	cmp	w12, #9                 // =9
	csel	w13, w14, w13, gt
	cset	w11, gt
	add	w13, w13, #48           // =48
	cmp	x22, x10
	strb	w13, [x10]
	b.ne	.LBB113_45
// %bb.46:                              // %for.cond.cleanup115
	cmp	w12, #9                 // =9
	b.le	.LBB113_41
// %bb.47:                              // %if.then136
	strb	w9, [x22, #-1]!
	b	.LBB113_41
.LBB113_48:
	mov	x2, x22
.LBB113_49:                             // %for.cond.cleanup
	mov	x0, x20
	mov	x1, x19
	bl	halide_string_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x19
	bl	halide_string_to_string
	mov	w3, #6
	mov	x1, x19
	mov	x2, x21
.LBB113_50:                             // %cleanup148
	bl	halide_int64_to_string
.LBB113_51:                             // %cleanup148
	add	sp, sp, #528            // =528
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x28, [sp, #8]           // 8-byte Folded Reload
	ldr	d8, [sp], #80           // 8-byte Folded Reload
	ret
.Lfunc_end113:
	.size	halide_double_to_string, .Lfunc_end113-halide_double_to_string
                                        // -- End function
	.section	.text.halide_pointer_to_string,"ax",@progbits
	.weak	halide_pointer_to_string // -- Begin function halide_pointer_to_string
	.p2align	2
	.type	halide_pointer_to_string,@function
halide_pointer_to_string:               // @halide_pointer_to_string
// %bb.0:                               // %entry
	sub	sp, sp, #48             // =48
	add	x8, sp, #8              // =8
	adrp	x10, .L.str.12.72
	mov	w9, #1
	add	x8, x8, #17             // =17
	add	x10, x10, :lo12:.L.str.12.72
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	xzr, xzr, [sp, #8]
	str	wzr, [sp, #24]
.LBB114_1:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	and	x11, x2, #0xf
	ldrb	w11, [x10, x11]
	cmp	w9, #15                 // =15
	strb	w11, [x8, #1]
	sub	x8, x8, #1              // =1
	b.hi	.LBB114_3
// %bb.2:                               // %for.body
                                        //   in Loop: Header=BB114_1 Depth=1
	lsr	x2, x2, #4
	add	w9, w9, #1              // =1
	cbnz	x2, .LBB114_1
.LBB114_3:                              // %cleanup
	mov	w9, #30768
	mov	x2, x8
	strh	w9, [x8]
	bl	halide_string_to_string
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.Lfunc_end114:
	.size	halide_pointer_to_string, .Lfunc_end114-halide_pointer_to_string
                                        // -- End function
	.section	.text.halide_type_to_string,"ax",@progbits
	.weak	halide_type_to_string   // -- Begin function halide_type_to_string
	.p2align	2
	.type	halide_type_to_string,@function
halide_type_to_string:                  // @halide_type_to_string
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldrsb	x8, [x2]
	mov	x20, x2
	mov	x19, x1
	add	x29, sp, #16            // =16
	cmp	x8, #3                  // =3
	b.hi	.LBB115_2
// %bb.1:                               // %switch.lookup
	adrp	x9, .Lswitch.table.halide_type_to_string
	add	x9, x9, :lo12:.Lswitch.table.halide_type_to_string
	ldr	x2, [x9, x8, lsl #3]
	b	.LBB115_3
.LBB115_2:
	adrp	x2, .L.str.17.73
	add	x2, x2, :lo12:.L.str.17.73
.LBB115_3:                              // %sw.epilog
	mov	x1, x19
	bl	halide_string_to_string
	ldrb	w2, [x20, #1]
	mov	w3, #1
	mov	x1, x19
	bl	halide_uint64_to_string
	ldrh	w8, [x20, #2]
	cmp	w8, #1                  // =1
	b.ne	.LBB115_5
// %bb.4:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB115_5:                              // %if.then
	adrp	x2, .L.str.18.78
	add	x2, x2, :lo12:.L.str.18.78
	mov	x1, x19
	bl	halide_string_to_string
	ldrh	w2, [x20, #2]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w3, #1
	mov	x1, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_uint64_to_string
.Lfunc_end115:
	.size	halide_type_to_string, .Lfunc_end115-halide_type_to_string
                                        // -- End function
	.section	.text.halide_buffer_to_string,"ax",@progbits
	.weak	halide_buffer_to_string // -- Begin function halide_buffer_to_string
	.p2align	2
	.type	halide_buffer_to_string,@function
halide_buffer_to_string:                // @halide_buffer_to_string
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x1
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	cbz	x2, .LBB116_5
// %bb.1:                               // %if.end
	mov	x20, x2
	adrp	x2, .L.str.20.80
	add	x2, x2, :lo12:.L.str.20.80
	mov	x1, x19
	bl	halide_string_to_string
	ldr	x2, [x20]
	mov	w3, #1
	mov	x1, x19
	bl	halide_uint64_to_string
	adrp	x21, .L.str.55
	add	x21, x21, :lo12:.L.str.55
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x2, [x20, #8]
	mov	x1, x19
	bl	halide_pointer_to_string
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x2, [x20, #16]
	mov	x1, x19
	bl	halide_pointer_to_string
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x2, [x20, #24]
	mov	w3, #1
	mov	x1, x19
	bl	halide_uint64_to_string
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	add	x2, x20, #32            // =32
	mov	x1, x19
	bl	halide_type_to_string
	ldr	w8, [x20, #36]
	cmp	w8, #1                  // =1
	b.lt	.LBB116_4
// %bb.2:                               // %for.body.lr.ph
	adrp	x21, .L.str.22.83
	adrp	x22, .L.str.55
	adrp	x23, .L.str.23.84
	mov	x24, xzr
	mov	x25, xzr
	add	x21, x21, :lo12:.L.str.22.83
	add	x22, x22, :lo12:.L.str.55
	add	x23, x23, :lo12:.L.str.23.84
.LBB116_3:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x8, [x20, #40]
	mov	w3, #1
	mov	x1, x19
	ldrsw	x2, [x8, x24]
	bl	halide_int64_to_string
	mov	x1, x19
	mov	x2, x22
	bl	halide_string_to_string
	ldr	x8, [x20, #40]
	mov	w3, #1
	mov	x1, x19
	add	x8, x8, x24
	ldrsw	x2, [x8, #4]
	bl	halide_int64_to_string
	mov	x1, x19
	mov	x2, x22
	bl	halide_string_to_string
	ldr	x8, [x20, #40]
	mov	w3, #1
	mov	x1, x19
	add	x8, x8, x24
	ldrsw	x2, [x8, #8]
	bl	halide_int64_to_string
	mov	x1, x19
	mov	x2, x23
	bl	halide_string_to_string
	ldrsw	x8, [x20, #36]
	add	x25, x25, #1            // =1
	add	x24, x24, #16           // =16
	cmp	x25, x8
	b.lt	.LBB116_3
.LBB116_4:                              // %for.cond.cleanup
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	b	.LBB116_6
.LBB116_5:                              // %if.then
	adrp	x2, .L.str.19.79
	add	x2, x2, :lo12:.L.str.19.79
.LBB116_6:                              // %if.then
	mov	x1, x19
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	b	halide_string_to_string
.Lfunc_end116:
	.size	halide_buffer_to_string, .Lfunc_end116-halide_buffer_to_string
                                        // -- End function
	.section	.text.halide_reuse_device_allocations,"ax",@progbits
	.weak	halide_reuse_device_allocations // -- Begin function halide_reuse_device_allocations
	.p2align	2
	.type	halide_reuse_device_allocations,@function
halide_reuse_device_allocations:        // @halide_reuse_device_allocations
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x8, :got:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE]
	add	x29, sp, #32            // =32
	strb	w1, [x8]
	tbz	w1, #0, .LBB117_2
// %bb.1:
	mov	w20, wzr
	b	.LBB117_7
.LBB117_2:                              // %if.then
	mov	x19, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal21allocation_pools_lockE]
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal23device_allocation_poolsE]
	ldr	x21, [x8]
	cbz	x21, .LBB117_5
// %bb.3:                               // %for.body.preheader
	mov	w20, wzr
.LBB117_4:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x21]
	mov	x0, x19
	blr	x8
	ldr	x21, [x21, #8]
	cmp	w0, #0                  // =0
	csel	w20, w20, w0, eq
	cbnz	x21, .LBB117_4
	b	.LBB117_6
.LBB117_5:
	mov	w20, wzr
.LBB117_6:                              // %for.cond.cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal21allocation_pools_lockE]
	bl	halide_mutex_unlock
.LBB117_7:                              // %if.end5
	mov	w0, w20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end117:
	.size	halide_reuse_device_allocations, .Lfunc_end117-halide_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_can_reuse_device_allocations,"ax",@progbits
	.weak	halide_can_reuse_device_allocations // -- Begin function halide_can_reuse_device_allocations
	.p2align	2
	.type	halide_can_reuse_device_allocations,@function
halide_can_reuse_device_allocations:    // @halide_can_reuse_device_allocations
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE]
	ldrb	w0, [x8]
	ret
.Lfunc_end118:
	.size	halide_can_reuse_device_allocations, .Lfunc_end118-halide_can_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_register_device_allocation_pool,"ax",@progbits
	.weak	halide_register_device_allocation_pool // -- Begin function halide_register_device_allocation_pool
	.p2align	2
	.type	halide_register_device_allocation_pool,@function
halide_register_device_allocation_pool: // @halide_register_device_allocation_pool
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal21allocation_pools_lockE]
	mov	x19, x0
	add	x29, sp, #16            // =16
	mov	x0, x20
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal23device_allocation_poolsE]
	mov	x0, x20
	ldr	x9, [x8]
	str	x9, [x19, #8]
	str	x19, [x8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end119:
	.size	halide_register_device_allocation_pool, .Lfunc_end119-halide_register_device_allocation_pool
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t: // @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1, #24]
	add	x29, sp, #16            // =16
	tbnz	w8, #1, .LBB120_2
// %bb.1:                               // %return
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB120_2:                              // %if.end
	tbnz	w8, #0, .LBB120_5
// %bb.3:                               // %if.end9
	ldr	x8, [x1, #8]
	mov	x19, x1
	cbz	x8, .LBB120_6
// %bb.4:                               // %if.end15
	ldr	x8, [x8, #120]
	mov	x1, x19
	mov	x20, x0
	ldr	x8, [x8, #48]
	blr	x8
	cbz	w0, .LBB120_7
.LBB120_5:
	mov	w0, #-14
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB120_6:
	mov	w0, #-19
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB120_7:                              // %if.end23
	ldr	x8, [x19, #24]
	mov	x0, x20
	mov	x1, x19
	and	x8, x8, #0xfffffffffffffffd
	str	x8, [x19, #24]
	bl	halide_msan_annotate_buffer_is_initialized
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end120:
	.size	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t, .Lfunc_end120-_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
                                        // -- End function
	.section	.text.halide_device_release,"ax",@progbits
	.weak	halide_device_release   // -- Begin function halide_device_release
	.p2align	2
	.type	halide_device_release,@function
halide_device_release:                  // @halide_device_release
// %bb.0:                               // %entry
	ldr	x8, [x1, #120]
	ldr	x1, [x8, #40]
	br	x1
.Lfunc_end121:
	.size	halide_device_release, .Lfunc_end121-halide_device_release
                                        // -- End function
	.section	.text.halide_copy_to_host,"ax",@progbits
	.weak	halide_copy_to_host     // -- Begin function halide_copy_to_host
	.p2align	2
	.type	halide_copy_to_host,@function
halide_copy_to_host:                    // @halide_copy_to_host
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	x20, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #32            // =32
	mov	x19, x1
	bl	halide_mutex_lock
	cbz	x19, .LBB122_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB122_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB122_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	mov	w21, w0
	cbnz	w0, .LBB122_11
	b	.LBB122_10
.LBB122_4:                              // %if.then.i
	adrp	x1, .L.str.9.89
	add	x1, x1, :lo12:.L.str.9.89
	mov	x0, x20
	bl	halide_error_buffer_is_null
	mov	w21, w0
	cbnz	w0, .LBB122_11
	b	.LBB122_10
.LBB122_5:                              // %if.end10.i
	cbnz	x9, .LBB122_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB122_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	mov	w21, w0
	cbnz	w0, .LBB122_11
	b	.LBB122_10
.LBB122_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB122_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	mov	w21, w0
	cbnz	w0, .LBB122_11
.LBB122_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	mov	x0, x20
	mov	x1, x19
	bl	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	mov	w21, w0
.LBB122_11:                             // %cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end122:
	.size	halide_copy_to_host, .Lfunc_end122-halide_copy_to_host
                                        // -- End function
	.section	.text.copy_to_device_already_locked,"ax",@progbits
	.weak	copy_to_device_already_locked // -- Begin function copy_to_device_already_locked
	.p2align	2
	.type	copy_to_device_already_locked,@function
copy_to_device_already_locked:          // @copy_to_device_already_locked
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x2
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB123_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB123_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB123_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbnz	w0, .LBB123_16
	b	.LBB123_10
.LBB123_4:                              // %if.then.i
	adrp	x1, .L.str.10.90
	add	x1, x1, :lo12:.L.str.10.90
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB123_16
	b	.LBB123_10
.LBB123_5:                              // %if.end10.i
	cbnz	x9, .LBB123_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB123_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB123_16
	b	.LBB123_10
.LBB123_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB123_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB123_16
.LBB123_10:                             // %if.end
	cbnz	x21, .LBB123_12
// %bb.11:                              // %if.then2
	ldr	x21, [x19, #8]
	cbz	x21, .LBB123_22
.LBB123_12:                             // %if.end11
	ldr	x8, [x19]
	cbz	x8, .LBB123_15
// %bb.13:                              // %land.lhs.true
	ldr	x8, [x19, #8]
	cmp	x8, x21
	b.eq	.LBB123_17
// %bb.14:                              // %if.then14
	adrp	x1, .L.str.12.91
	add	x1, x1, :lo12:.L.str.12.91
	mov	x0, x20
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB123_15:                             // %if.then18
	mov	x0, x20
	mov	x1, x19
	mov	x2, x21
	bl	halide_device_malloc
	cbz	w0, .LBB123_17
.LBB123_16:                             // %cleanup
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB123_17:                             // %if.end27
	ldr	x8, [x19, #24]
	tbnz	w8, #0, .LBB123_19
// %bb.18:
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB123_19:                             // %if.then29
	tbnz	w8, #1, .LBB123_21
// %bb.20:                              // %if.else
	ldr	x8, [x21, #120]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x8, #56]
	blr	x8
	cbz	w0, .LBB123_23
.LBB123_21:
	mov	w0, #-15
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB123_22:                             // %if.then7
	mov	x0, x20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	b	halide_error_no_device_interface
.LBB123_23:                             // %if.then42
	ldr	x8, [x19, #24]
	and	x8, x8, #0xfffffffffffffffe
	str	x8, [x19, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end123:
	.size	copy_to_device_already_locked, .Lfunc_end123-copy_to_device_already_locked
                                        // -- End function
	.section	.text.halide_device_malloc,"ax",@progbits
	.weak	halide_device_malloc    // -- Begin function halide_device_malloc
	.p2align	2
	.type	halide_device_malloc,@function
halide_device_malloc:                   // @halide_device_malloc
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x2
	mov	x21, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB124_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x21]
	cbnz	x8, .LBB124_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB124_6
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbz	w0, .LBB124_11
.LBB124_4:                              // %cleanup12
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB124_5:                              // %if.then.i
	adrp	x1, .L.str.18.92
	add	x1, x1, :lo12:.L.str.18.92
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB124_4
	b	.LBB124_11
.LBB124_6:                              // %if.end10.i
	cbnz	x9, .LBB124_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB124_9
// %bb.8:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB124_4
	b	.LBB124_11
.LBB124_9:                              // %if.end16.i
	ldr	w9, [x21, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB124_12
// %bb.10:                              // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB124_4
.LBB124_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x21, #8]
.LBB124_12:                             // %if.end
	cbz	x8, .LBB124_15
// %bb.13:                              // %if.end
	cmp	x8, x19
	b.eq	.LBB124_15
// %bb.14:                              // %if.then6
	adrp	x1, .L.str.20.93
	add	x1, x1, :lo12:.L.str.20.93
	mov	x0, x20
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB124_15:                             // %if.end7
	ldr	x8, [x19, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x19, #120]
	mov	x0, x20
	mov	x1, x21
	ldr	x8, [x8, #16]
	blr	x8
	ldr	x8, [x19, #120]
	mov	w19, w0
	ldr	x8, [x8, #8]
	blr	x8
	cmp	w19, #0                 // =0
	mov	w8, #-16
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end124:
	.size	halide_device_malloc, .Lfunc_end124-halide_device_malloc
                                        // -- End function
	.section	.text.halide_copy_to_device,"ax",@progbits
	.weak	halide_copy_to_device   // -- Begin function halide_copy_to_device
	.p2align	2
	.type	halide_copy_to_device,@function
halide_copy_to_device:                  // @halide_copy_to_device
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x22, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	mov	x21, x0
	add	x29, sp, #32            // =32
	mov	x19, x2
	mov	x0, x22
	mov	x20, x1
	bl	halide_mutex_lock
	mov	x0, x21
	mov	x1, x20
	mov	x2, x19
	bl	copy_to_device_already_locked
	mov	w19, w0
	mov	x0, x22
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end125:
	.size	halide_copy_to_device, .Lfunc_end125-halide_copy_to_device
                                        // -- End function
	.section	.text.halide_device_sync,"ax",@progbits
	.weak	halide_device_sync      // -- Begin function halide_device_sync
	.p2align	2
	.type	halide_device_sync,@function
halide_device_sync:                     // @halide_device_sync
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB126_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB126_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB126_6
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbz	w0, .LBB126_11
.LBB126_4:                              // %cleanup8
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB126_5:                              // %if.then.i
	adrp	x1, .L.str.17.94
	add	x1, x1, :lo12:.L.str.17.94
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB126_4
	b	.LBB126_11
.LBB126_6:                              // %if.end10.i
	cbnz	x9, .LBB126_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB126_9
// %bb.8:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB126_4
	b	.LBB126_11
.LBB126_9:                              // %if.end16.i
	ldr	w9, [x19, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB126_12
// %bb.10:                              // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB126_4
.LBB126_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x19, #8]
.LBB126_12:                             // %if.end
	cbz	x8, .LBB126_14
// %bb.13:                              // %if.end5
	ldr	x8, [x8, #120]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x8, #32]
	blr	x8
	cmp	w0, #0                  // =0
	mov	w8, #-17
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB126_14:                             // %if.then3
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x20
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_error_no_device_interface
.Lfunc_end126:
	.size	halide_device_sync, .Lfunc_end126-halide_device_sync
                                        // -- End function
	.section	.text.halide_device_free,"ax",@progbits
	.weak	halide_device_free      // -- Begin function halide_device_free
	.p2align	2
	.type	halide_device_free,@function
halide_device_free:                     // @halide_device_free
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x1
	mov	x19, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB127_5
// %bb.1:                               // %if.end.i
	ldp	x8, x21, [x20]
	cbnz	x21, .LBB127_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB127_6
// %bb.3:                               // %if.then8.i
	mov	x0, x19
	bl	halide_error_no_device_interface
	cbz	w0, .LBB127_11
.LBB127_4:                              // %cleanup12
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB127_5:                              // %if.then.i
	adrp	x1, .L.str.21.97
	add	x1, x1, :lo12:.L.str.21.97
	mov	x0, x19
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB127_4
	b	.LBB127_11
.LBB127_6:                              // %if.end10.i
	cbnz	x8, .LBB127_9
// %bb.7:                               // %if.end10.i
	cbz	x21, .LBB127_9
// %bb.8:                               // %if.then14.i
	mov	x0, x19
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB127_4
	b	.LBB127_11
.LBB127_9:                              // %if.end16.i
	ldr	w8, [x20, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB127_12
// %bb.10:                              // %if.then24.i
	mov	x0, x19
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB127_4
.LBB127_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x21, [x20, #8]
.LBB127_12:                             // %if.end
	cbz	x21, .LBB127_16
// %bb.13:                              // %if.then3
	ldr	x8, [x21, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #120]
	mov	x0, x19
	mov	x1, x20
	ldr	x8, [x8, #24]
	blr	x8
	ldr	x8, [x21, #120]
	mov	w21, w0
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x8, [x20]
	cbz	x8, .LBB127_15
// %bb.14:                              // %if.then8
	adrp	x1, .L.str.22.98
	add	x1, x1, :lo12:.L.str.22.98
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB127_15:                             // %if.end9
	cmp	w21, #0                 // =0
	mov	w8, #-18
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB127_16:                             // %if.end11
	ldr	x8, [x20, #24]
	mov	w0, wzr
	and	x8, x8, #0xfffffffffffffffd
	str	x8, [x20, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end127:
	.size	halide_device_free, .Lfunc_end127-halide_device_free
                                        // -- End function
	.section	.text.halide_device_free_as_destructor,"ax",@progbits
	.weak	halide_device_free_as_destructor // -- Begin function halide_device_free_as_destructor
	.p2align	2
	.type	halide_device_free_as_destructor,@function
halide_device_free_as_destructor:       // @halide_device_free_as_destructor
// %bb.0:                               // %entry
	b	halide_device_free
.Lfunc_end128:
	.size	halide_device_free_as_destructor, .Lfunc_end128-halide_device_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_and_host_malloc,"ax",@progbits
	.weak	halide_device_and_host_malloc // -- Begin function halide_device_and_host_malloc
	.p2align	2
	.type	halide_device_and_host_malloc,@function
halide_device_and_host_malloc:          // @halide_device_and_host_malloc
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x2
	mov	x21, x1
	mov	x19, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB129_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x21]
	cbnz	x8, .LBB129_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB129_6
// %bb.3:                               // %if.then8.i
	mov	x0, x19
	bl	halide_error_no_device_interface
	cbz	w0, .LBB129_11
.LBB129_4:                              // %cleanup14
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB129_5:                              // %if.then.i
	adrp	x1, .L.str.23.99
	add	x1, x1, :lo12:.L.str.23.99
	mov	x0, x19
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB129_4
	b	.LBB129_11
.LBB129_6:                              // %if.end10.i
	cbnz	x9, .LBB129_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB129_9
// %bb.8:                               // %if.then14.i
	mov	x0, x19
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB129_4
	b	.LBB129_11
.LBB129_9:                              // %if.end16.i
	ldr	w9, [x21, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB129_12
// %bb.10:                              // %if.then24.i
	mov	x0, x19
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB129_4
.LBB129_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x21, #8]
.LBB129_12:                             // %if.end
	cbz	x8, .LBB129_15
// %bb.13:                              // %if.end
	cmp	x8, x20
	b.eq	.LBB129_15
// %bb.14:                              // %if.then6
	adrp	x1, .L.str.25.100
	add	x1, x1, :lo12:.L.str.25.100
	mov	x0, x19
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB129_15:                             // %if.end7
	ldr	x8, [x20, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x20, #120]
	mov	x0, x19
	mov	x1, x21
	ldr	x8, [x8, #64]
	blr	x8
	ldr	x8, [x20, #120]
	mov	w20, w0
	ldr	x8, [x8, #8]
	blr	x8
	cbz	w20, .LBB129_17
// %bb.16:                              // %if.then12
	adrp	x1, .L.str.26.101
	add	x1, x1, :lo12:.L.str.26.101
	mov	x0, x19
	bl	halide_error
	mov	w0, #-16
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB129_17:
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end129:
	.size	halide_device_and_host_malloc, .Lfunc_end129-halide_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_device_and_host_free,"ax",@progbits
	.weak	halide_device_and_host_free // -- Begin function halide_device_and_host_free
	.p2align	2
	.type	halide_device_and_host_free,@function
halide_device_and_host_free:            // @halide_device_and_host_free
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB130_5
// %bb.1:                               // %if.end.i
	ldp	x8, x21, [x19]
	cbnz	x21, .LBB130_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB130_6
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbz	w0, .LBB130_11
.LBB130_4:                              // %cleanup18
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB130_5:                              // %if.then.i
	adrp	x1, .L.str.27.102
	add	x1, x1, :lo12:.L.str.27.102
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB130_4
	b	.LBB130_11
.LBB130_6:                              // %if.end10.i
	cbnz	x8, .LBB130_9
// %bb.7:                               // %if.end10.i
	cbz	x21, .LBB130_9
// %bb.8:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB130_4
	b	.LBB130_11
.LBB130_9:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB130_12
// %bb.10:                              // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB130_4
.LBB130_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x21, [x19, #8]
.LBB130_12:                             // %if.end
	cbz	x21, .LBB130_16
// %bb.13:                              // %if.then3
	ldr	x8, [x21, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #120]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x8, #72]
	blr	x8
	ldr	x8, [x21, #120]
	mov	w21, w0
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x8, [x19]
	cbz	x8, .LBB130_15
// %bb.14:                              // %if.then8
	adrp	x1, .L.str.28.103
	add	x1, x1, :lo12:.L.str.28.103
	mov	x0, x20
	bl	halide_print
	bl	abort
.LBB130_15:                             // %if.end9
	cmp	w21, #0                 // =0
	mov	w8, #-18
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB130_16:                             // %if.else11
	ldr	x1, [x19, #16]
	cbz	x1, .LBB130_18
// %bb.17:                              // %if.then13
	mov	x0, x20
	bl	halide_free
	str	xzr, [x19, #16]
.LBB130_18:                             // %if.end17
	ldr	x8, [x19, #24]
	mov	w0, wzr
	and	x8, x8, #0xfffffffffffffffd
	str	x8, [x19, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end130:
	.size	halide_device_and_host_free, .Lfunc_end130-halide_device_and_host_free
                                        // -- End function
	.section	.text.halide_default_device_and_host_malloc,"ax",@progbits
	.weak	halide_default_device_and_host_malloc // -- Begin function halide_default_device_and_host_malloc
	.p2align	2
	.type	halide_default_device_and_host_malloc,@function
halide_default_device_and_host_malloc:  // @halide_default_device_and_host_malloc
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x2
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB131_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB131_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB131_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	mov	w22, w0
	cbnz	w0, .LBB131_43
	b	.LBB131_10
.LBB131_4:                              // %if.then.i
	adrp	x1, .L.str.29.104
	add	x1, x1, :lo12:.L.str.29.104
	mov	x0, x20
	bl	halide_error_buffer_is_null
	mov	w22, w0
	cbnz	w0, .LBB131_43
	b	.LBB131_10
.LBB131_5:                              // %if.end10.i
	cbnz	x9, .LBB131_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB131_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	mov	w22, w0
	cbnz	w0, .LBB131_43
	b	.LBB131_10
.LBB131_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB131_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	mov	w22, w0
	cbnz	w0, .LBB131_43
.LBB131_10:                             // %if.end
	ldrsw	x8, [x19, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB131_13
// %bb.11:                              // %for.body.lr.ph.i.i
	ldr	x9, [x19, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB131_14
// %bb.12:
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB131_21
.LBB131_13:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w11, [x19, #33]
	mov	x13, xzr
	mov	w8, #1
	b	.LBB131_39
.LBB131_14:                             // %vector.ph
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB131_17
	b	.LBB131_18
.LBB131_15:                             // %pred.load.continue7
                                        //   in Loop: Header=BB131_18 Depth=1
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB131_20
// %bb.16:                              // %vector.body
                                        //   in Loop: Header=BB131_18 Depth=1
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB131_18
.LBB131_17:                             // %pred.load.if
	ldur	w17, [x13, #-20]
.LBB131_18:                             // %pred.load.continue
                                        // =>This Inner Loop Header: Depth=1
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB131_15
// %bb.19:                              // %pred.load.if6
                                        //   in Loop: Header=BB131_18 Depth=1
	ldur	w18, [x13, #-4]
	b	.LBB131_15
.LBB131_20:                             // %middle.block
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB131_25
.LBB131_21:                             // %for.body.i.i.preheader
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB131_24
.LBB131_22:                             // %for.inc.i.i
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB131_25
.LBB131_23:                             // %for.body.i.i
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB131_22
.LBB131_24:                             // %if.then.i.i
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB131_23
.LBB131_25:                             // %for.body.lr.ph.i5.i
	ldrb	w11, [x19, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB131_27
// %bb.26:
	mov	x12, xzr
	mov	x13, xzr
	b	.LBB131_34
.LBB131_27:                             // %vector.ph13
	and	x12, x8, #0xfffffffffffffffe
	mov	x13, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x12
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbz	w17, #31, .LBB131_30
	b	.LBB131_31
.LBB131_28:                             // %pred.load.continue27
	sub	w0, w0, #1              // =1
	sub	w1, w1, #1              // =1
	mul	w0, w0, w17
	mul	w1, w1, w18
	and	w17, w0, w17, asr #31
	and	w18, w1, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x13, x13, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB131_33
// %bb.29:                              // %vector.body9
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbnz	w17, #31, .LBB131_31
.LBB131_30:                             // %pred.load.continue25
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB131_28
	b	.LBB131_32
.LBB131_31:                             // %pred.load.if24
	ldur	w0, [x15, #-20]
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB131_28
.LBB131_32:                             // %pred.load.if26
	ldur	w1, [x15, #-4]
	b	.LBB131_28
.LBB131_33:                             // %middle.block10
	cmp	x12, x8
	add	x13, x14, x13
	b.eq	.LBB131_38
.LBB131_34:                             // %for.body.i16.i.preheader
	add	x9, x9, x12, lsl #4
	sub	x8, x8, x12
	add	x9, x9, #8              // =8
	ldrsw	x12, [x9]
	tbnz	w12, #31, .LBB131_37
.LBB131_35:                             // %for.inc.i26.i
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB131_38
.LBB131_36:                             // %for.body.i16.i
	ldrsw	x12, [x9]
	tbz	w12, #31, .LBB131_35
.LBB131_37:                             // %if.then.i22.i
	ldursw	x14, [x9, #-4]
	sub	x14, x14, #1            // =1
	madd	x13, x14, x12, x13
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB131_36
.LBB131_38:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x8, x10, #1             // =1
.LBB131_39:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x9, x11, #7             // =7
	lsr	x9, x9, #3
	sub	x8, x8, x13
	mul	x1, x8, x9
	mov	x0, x20
	bl	halide_malloc
	str	x0, [x19, #16]
	cbz	x0, .LBB131_42
// %bb.40:                              // %if.end6
	mov	x0, x20
	mov	x1, x19
	mov	x2, x21
	bl	halide_device_malloc
	mov	w22, w0
	cbz	w0, .LBB131_43
// %bb.41:                              // %if.then9
	ldr	x1, [x19, #16]
	mov	x0, x20
	bl	halide_free
	str	xzr, [x19, #16]
	b	.LBB131_43
.LBB131_42:
	mov	w22, #-1
.LBB131_43:                             // %cleanup13
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w22
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end131:
	.size	halide_default_device_and_host_malloc, .Lfunc_end131-halide_default_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_default_device_and_host_free,"ax",@progbits
	.weak	halide_default_device_and_host_free // -- Begin function halide_default_device_and_host_free
	.p2align	2
	.type	halide_default_device_and_host_free,@function
halide_default_device_and_host_free:    // @halide_default_device_and_host_free
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB132_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB132_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB132_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	mov	w21, w0
	cbnz	w0, .LBB132_13
	b	.LBB132_10
.LBB132_4:                              // %if.then.i
	adrp	x1, .L.str.30.105
	add	x1, x1, :lo12:.L.str.30.105
	mov	x0, x20
	bl	halide_error_buffer_is_null
	mov	w21, w0
	cbnz	w0, .LBB132_13
	b	.LBB132_10
.LBB132_5:                              // %if.end10.i
	cbnz	x9, .LBB132_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB132_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	mov	w21, w0
	cbnz	w0, .LBB132_13
	b	.LBB132_10
.LBB132_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB132_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	mov	w21, w0
	cbnz	w0, .LBB132_13
.LBB132_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	mov	x0, x20
	mov	x1, x19
	bl	halide_device_free
	ldr	x1, [x19, #16]
	mov	w21, w0
	cbz	x1, .LBB132_12
// %bb.11:                              // %if.then2
	mov	x0, x20
	bl	halide_free
	str	xzr, [x19, #16]
.LBB132_12:                             // %if.end5
	ldr	x8, [x19, #24]
	and	x8, x8, #0xfffffffffffffffc
	str	x8, [x19, #24]
.LBB132_13:                             // %cleanup
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end132:
	.size	halide_default_device_and_host_free, .Lfunc_end132-halide_default_device_and_host_free
                                        // -- End function
	.section	.text.halide_device_wrap_native,"ax",@progbits
	.weak	halide_device_wrap_native // -- Begin function halide_device_wrap_native
	.p2align	2
	.type	halide_device_wrap_native,@function
halide_device_wrap_native:              // @halide_device_wrap_native
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x3
	mov	x20, x2
	mov	x22, x1
	mov	x21, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB133_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x22]
	cbnz	x8, .LBB133_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB133_6
// %bb.3:                               // %if.then8.i
	mov	x0, x21
	bl	halide_error_no_device_interface
	cbz	w0, .LBB133_11
.LBB133_4:                              // %cleanup12
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB133_5:                              // %if.then.i
	adrp	x1, .L.str.31.106
	add	x1, x1, :lo12:.L.str.31.106
	mov	x0, x21
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB133_4
	b	.LBB133_11
.LBB133_6:                              // %if.end10.i
	cbnz	x9, .LBB133_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB133_9
// %bb.8:                               // %if.then14.i
	mov	x0, x21
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB133_4
	b	.LBB133_11
.LBB133_9:                              // %if.end16.i
	ldr	w9, [x22, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB133_12
// %bb.10:                              // %if.then24.i
	mov	x0, x21
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB133_4
.LBB133_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x22, #8]
.LBB133_12:                             // %if.end
	cbz	x8, .LBB133_15
// %bb.13:                              // %if.end
	cmp	x8, x19
	b.eq	.LBB133_15
// %bb.14:                              // %if.then4
	adrp	x1, .L.str.32.107
	add	x1, x1, :lo12:.L.str.32.107
	mov	x0, x21
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB133_15:                             // %if.end5
	ldr	x8, [x19, #120]
	ldr	x8, [x8]
	blr	x8
	str	x19, [x22, #8]
	ldr	x8, [x19, #120]
	mov	x0, x21
	mov	x1, x22
	mov	x2, x20
	ldr	x8, [x8, #112]
	blr	x8
	ldr	x8, [x19, #120]
	mov	w19, w0
	ldr	x8, [x8, #8]
	blr	x8
	cmp	w19, #0                 // =0
	mov	w8, #-16
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end133:
	.size	halide_device_wrap_native, .Lfunc_end133-halide_device_wrap_native
                                        // -- End function
	.section	.text.halide_device_detach_native,"ax",@progbits
	.weak	halide_device_detach_native // -- Begin function halide_device_detach_native
	.p2align	2
	.type	halide_device_detach_native,@function
halide_device_detach_native:            // @halide_device_detach_native
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x1
	mov	x19, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB134_5
// %bb.1:                               // %if.end.i
	ldp	x8, x21, [x20]
	cbnz	x21, .LBB134_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB134_6
// %bb.3:                               // %if.then8.i
	mov	x0, x19
	bl	halide_error_no_device_interface
	cbz	w0, .LBB134_11
.LBB134_4:                              // %cleanup
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB134_5:                              // %if.then.i
	adrp	x1, .L.str.33.108
	add	x1, x1, :lo12:.L.str.33.108
	mov	x0, x19
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB134_4
	b	.LBB134_11
.LBB134_6:                              // %if.end10.i
	cbnz	x8, .LBB134_9
// %bb.7:                               // %if.end10.i
	cbz	x21, .LBB134_9
// %bb.8:                               // %if.then14.i
	mov	x0, x19
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB134_4
	b	.LBB134_11
.LBB134_9:                              // %if.end16.i
	ldr	w8, [x20, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB134_12
// %bb.10:                              // %if.then24.i
	mov	x0, x19
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB134_4
.LBB134_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x21, [x20, #8]
.LBB134_12:                             // %if.end
	cbz	x21, .LBB134_16
// %bb.13:                              // %if.then3
	ldr	x8, [x21, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #120]
	mov	x0, x19
	mov	x1, x20
	ldr	x8, [x8, #120]
	blr	x8
	ldr	x8, [x21, #120]
	mov	w21, w0
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x8, [x20]
	cbz	x8, .LBB134_15
// %bb.14:                              // %if.then8
	adrp	x1, .L.str.34.109
	add	x1, x1, :lo12:.L.str.34.109
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB134_15:                             // %if.end9
	cmp	w21, #0                 // =0
	mov	w8, #-33
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB134_16:
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end134:
	.size	halide_device_detach_native, .Lfunc_end134-halide_device_detach_native
                                        // -- End function
	.section	.text.halide_default_device_wrap_native,"ax",@progbits
	.weak	halide_default_device_wrap_native // -- Begin function halide_default_device_wrap_native
	.p2align	2
	.type	halide_default_device_wrap_native,@function
halide_default_device_wrap_native:      // @halide_default_device_wrap_native
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x2
	mov	x20, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB135_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x20]
	cbnz	x8, .LBB135_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB135_6
// %bb.3:                               // %if.then8.i
	bl	halide_error_no_device_interface
	cbz	w0, .LBB135_11
.LBB135_4:                              // %cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB135_5:                              // %if.then.i
	adrp	x1, .L.str.35.110
	add	x1, x1, :lo12:.L.str.35.110
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB135_4
	b	.LBB135_11
.LBB135_6:                              // %if.end10.i
	cbnz	x9, .LBB135_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB135_9
// %bb.8:                               // %if.then14.i
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB135_4
	b	.LBB135_11
.LBB135_9:                              // %if.end16.i
	ldr	w9, [x20, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB135_12
// %bb.10:                              // %if.then24.i
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB135_4
.LBB135_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x20, #8]
.LBB135_12:                             // %if.end
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	mov	w0, wzr
	str	x19, [x20]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end135:
	.size	halide_default_device_wrap_native, .Lfunc_end135-halide_default_device_wrap_native
                                        // -- End function
	.section	.text.halide_default_device_detach_native,"ax",@progbits
	.weak	halide_default_device_detach_native // -- Begin function halide_default_device_detach_native
	.p2align	2
	.type	halide_default_device_detach_native,@function
halide_default_device_detach_native:    // @halide_default_device_detach_native
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	mov	x19, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB136_5
// %bb.1:                               // %if.end.i
	ldp	x8, x9, [x19]
	cbnz	x9, .LBB136_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB136_6
// %bb.3:                               // %if.then8.i
	bl	halide_error_no_device_interface
	cbz	w0, .LBB136_11
.LBB136_4:                              // %cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB136_5:                              // %if.then.i
	adrp	x1, .L.str.36
	add	x1, x1, :lo12:.L.str.36
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB136_4
	b	.LBB136_11
.LBB136_6:                              // %if.end10.i
	cbnz	x8, .LBB136_9
// %bb.7:                               // %if.end10.i
	cbz	x9, .LBB136_9
// %bb.8:                               // %if.then14.i
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB136_4
	b	.LBB136_11
.LBB136_9:                              // %if.end16.i
	ldr	w9, [x19, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB136_12
// %bb.10:                              // %if.then24.i
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB136_4
.LBB136_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x19]
.LBB136_12:                             // %if.end
	cbz	x8, .LBB136_14
// %bb.13:                              // %if.end3
	ldr	x8, [x19, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #8]
	blr	x8
	mov	w0, wzr
	stp	xzr, xzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB136_14:
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end136:
	.size	halide_default_device_detach_native, .Lfunc_end136-halide_default_device_detach_native
                                        // -- End function
	.section	.text.halide_device_and_host_free_as_destructor,"ax",@progbits
	.weak	halide_device_and_host_free_as_destructor // -- Begin function halide_device_and_host_free_as_destructor
	.p2align	2
	.type	halide_device_and_host_free_as_destructor,@function
halide_device_and_host_free_as_destructor: // @halide_device_and_host_free_as_destructor
// %bb.0:                               // %entry
	b	halide_device_and_host_free
.Lfunc_end137:
	.size	halide_device_and_host_free_as_destructor, .Lfunc_end137-halide_device_and_host_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_host_nop_free,"ax",@progbits
	.weak	halide_device_host_nop_free // -- Begin function halide_device_host_nop_free
	.p2align	2
	.type	halide_device_host_nop_free,@function
halide_device_host_nop_free:            // @halide_device_host_nop_free
// %bb.0:                               // %entry
	ret
.Lfunc_end138:
	.size	halide_device_host_nop_free, .Lfunc_end138-halide_device_host_nop_free
                                        // -- End function
	.section	.text.halide_default_buffer_copy,"ax",@progbits
	.weak	halide_default_buffer_copy // -- Begin function halide_default_buffer_copy
	.p2align	2
	.type	halide_default_buffer_copy,@function
halide_default_buffer_copy:             // @halide_default_buffer_copy
// %bb.0:                               // %entry
	mov	w0, #-39
	ret
.Lfunc_end139:
	.size	halide_default_buffer_copy, .Lfunc_end139-halide_default_buffer_copy
                                        // -- End function
	.section	.text.halide_buffer_copy_already_locked,"ax",@progbits
	.weak	halide_buffer_copy_already_locked // -- Begin function halide_buffer_copy_already_locked
	.p2align	2
	.type	halide_buffer_copy_already_locked,@function
halide_buffer_copy_already_locked:      // @halide_buffer_copy_already_locked
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	sub	sp, sp, #432            // =432
	mov	x19, x3
	mov	x20, x2
	mov	x21, x1
	mov	x22, x0
	cbz	x2, .LBB140_5
// %bb.1:                               // %land.lhs.true
	ldr	x8, [x19, #8]
	cbz	x8, .LBB140_4
// %bb.2:                               // %land.lhs.true
	cmp	x8, x20
	b.eq	.LBB140_4
// %bb.3:                               // %if.then
	adrp	x1, .L.str.42
	add	x1, x1, :lo12:.L.str.42
	mov	x0, x22
	bl	halide_error
	mov	w0, #-42
	b	.LBB140_39
.LBB140_4:                              // %land.lhs.true5
	ldr	x8, [x19]
	cbz	x8, .LBB140_23
.LBB140_5:                              // %if.end13
	ldr	x9, [x21]
	ldr	x8, [x21, #16]
	cbz	x9, .LBB140_9
// %bb.6:                               // %land.rhs
	cbz	x8, .LBB140_14
// %bb.7:                               // %land.end.thread
	ldr	x8, [x21, #24]
	cmp	x20, #0                 // =0
	cset	w24, eq
	and	w23, w8, #0x1
	tbnz	w8, #1, .LBB140_11
.LBB140_8:
	mov	w26, wzr
	mov	w25, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbz	x27, .LBB140_12
	b	.LBB140_15
.LBB140_9:                              // %land.end
	cmp	x20, #0                 // =0
	cset	w24, eq
	cbz	x8, .LBB140_25
// %bb.10:                              // %land.end.land.rhs26_crit_edge
	ldr	x8, [x21, #24]
	mov	w23, #1
	tbz	w8, #1, .LBB140_8
.LBB140_11:                             // %lor.rhs28
	ldr	x8, [x21, #8]
	cmp	x8, #0                  // =0
	cset	w26, ne
	mov	w25, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbnz	x27, .LBB140_15
.LBB140_12:                             // %land.end32
	cbnz	w28, .LBB140_15
// %bb.13:
	mov	w0, #-34
	b	.LBB140_39
.LBB140_14:                             // %land.end.thread259
	cmp	x20, #0                 // =0
	mov	w25, wzr
	mov	w23, wzr
	cset	w24, eq
	mov	w26, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbz	x27, .LBB140_12
.LBB140_15:                             // %if.end41
	cmp	x20, #0                 // =0
	cset	w8, eq
	orr	w8, w23, w8
	tbnz	w8, #0, .LBB140_17
// %bb.16:                              // %if.end49
	ldr	x8, [x20, #120]
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	ldr	x8, [x8, #80]
	mov	x3, x19
	blr	x8
	cmn	w0, #42                 // =42
	b.ne	.LBB140_32
.LBB140_17:                             // %if.then51
	cmp	x27, #0                 // =0
	cset	w8, eq
	bic	w8, w8, w25
	tbnz	w8, #0, .LBB140_24
// %bb.18:                              // %if.end58
	orr	w8, w26, w28
	tbz	w8, #0, .LBB140_26
// %bb.19:                              // %if.else
	cbz	w24, .LBB140_27
// %bb.20:                              // %if.then64
	ldr	x8, [x21, #8]
	mov	x0, x22
	mov	x1, x21
	mov	x2, xzr
	ldr	x8, [x8, #120]
	mov	x3, x19
	ldr	x8, [x8, #80]
	blr	x8
	cmn	w0, #42                 // =42
	b.ne	.LBB140_32
// %bb.21:                              // %if.then72
	mov	x0, x22
	mov	x1, x21
	bl	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	cbnz	w0, .LBB140_39
// %bb.22:                              // %if.then75
	mov	x0, x22
	mov	x1, x21
	mov	x2, xzr
	mov	x3, x19
	bl	halide_buffer_copy_already_locked
	cbnz	w0, .LBB140_39
	b	.LBB140_33
.LBB140_23:                             // %if.then7
	mov	x0, x22
	mov	x1, x19
	mov	x2, x20
	bl	halide_device_malloc
	cbnz	w0, .LBB140_39
	b	.LBB140_5
.LBB140_24:
	mov	w0, #-42
	b	.LBB140_39
.LBB140_25:
	mov	w25, wzr
	mov	w23, #1
	mov	w26, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbz	x27, .LBB140_12
	b	.LBB140_15
.LBB140_26:                             // %if.end109.thread249
	add	x8, sp, #8              // =8
	mov	w1, #1
	mov	w3, #1
	mov	x0, x21
	mov	x2, x19
	bl	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	add	x0, sp, #8              // =8
	mov	x1, x22
	bl	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	cmp	x19, x21
	b.ne	.LBB140_34
	b	.LBB140_36
.LBB140_27:                             // %if.else79
	cmp	x27, #0                 // =0
	cset	w8, eq
	orr	w8, w23, w8
	tbz	w8, #0, .LBB140_30
// %bb.28:                              // %if.else96
	mov	x0, x22
	mov	x1, x21
	bl	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	cbnz	w0, .LBB140_39
// %bb.29:                              // %if.then101
	ldr	x8, [x20, #120]
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	ldr	x8, [x8, #80]
	mov	x3, x19
	blr	x8
	cbnz	w0, .LBB140_39
	b	.LBB140_33
.LBB140_30:                             // %if.then83
	ldr	x8, [x21, #8]
	mov	x0, x22
	mov	x1, x21
	mov	x2, xzr
	ldr	x8, [x8, #120]
	mov	x3, x19
	ldr	x8, [x8, #80]
	blr	x8
	cbnz	w0, .LBB140_39
// %bb.31:                              // %if.then93
	ldr	x8, [x19, #24]
	mov	x0, x22
	mov	x1, x19
	mov	x2, x20
	orr	x8, x8, #0x1
	str	x8, [x19, #24]
	bl	copy_to_device_already_locked
.LBB140_32:                             // %if.end109
	cbnz	w0, .LBB140_39
.LBB140_33:                             // %land.lhs.true118
	cmp	x19, x21
	b.eq	.LBB140_36
.LBB140_34:                             // %if.then120
	ldr	x8, [x19, #24]
	mov	w0, wzr
	and	x8, x8, #0xfffffffffffffffc
	cbz	x20, .LBB140_37
// %bb.35:                              // %if.then122
	orr	x8, x8, #0x2
	b	.LBB140_38
.LBB140_36:
	mov	w0, wzr
	b	.LBB140_39
.LBB140_37:                             // %if.else125
	orr	x8, x8, #0x1
.LBB140_38:                             // %cleanup135
	str	x8, [x19, #24]
.LBB140_39:                             // %cleanup135
	add	sp, sp, #432            // =432
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end140:
	.size	halide_buffer_copy_already_locked, .Lfunc_end140-halide_buffer_copy_already_locked
                                        // -- End function
	.section	.text.halide_buffer_copy,"ax",@progbits
	.weak	halide_buffer_copy      // -- Begin function halide_buffer_copy
	.p2align	2
	.type	halide_buffer_copy,@function
halide_buffer_copy:                     // @halide_buffer_copy
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	x22, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #32            // =32
	mov	x21, x3
	mov	x20, x2
	mov	x19, x1
	bl	halide_mutex_lock
	cbz	x20, .LBB141_2
// %bb.1:                               // %if.then
	ldr	x8, [x20, #120]
	ldr	x8, [x8]
	blr	x8
.LBB141_2:                              // %if.end
	ldr	x8, [x19, #8]
	cbz	x8, .LBB141_4
// %bb.3:                               // %if.then12
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
.LBB141_4:                              // %if.end16
	mov	x0, x22
	mov	x1, x19
	mov	x2, x20
	mov	x3, x21
	bl	halide_buffer_copy_already_locked
	mov	w21, w0
	cbz	x20, .LBB141_6
// %bb.5:                               // %if.then18
	ldr	x8, [x20, #120]
	ldr	x8, [x8, #8]
	blr	x8
.LBB141_6:                              // %if.end20
	ldr	x8, [x19, #8]
	cbz	x8, .LBB141_8
// %bb.7:                               // %if.then23
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #8]
	blr	x8
.LBB141_8:                              // %if.end27
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end141:
	.size	halide_buffer_copy, .Lfunc_end141-halide_buffer_copy
                                        // -- End function
	.section	.text.halide_default_device_crop,"ax",@progbits
	.weak	halide_default_device_crop // -- Begin function halide_default_device_crop
	.p2align	2
	.type	halide_default_device_crop,@function
halide_default_device_crop:             // @halide_default_device_crop
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x1, .L.str.58.111
	add	x1, x1, :lo12:.L.str.58.111
	mov	x29, sp
	bl	halide_error
	mov	w0, #-40
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end142:
	.size	halide_default_device_crop, .Lfunc_end142-halide_default_device_crop
                                        // -- End function
	.section	.text.halide_default_device_slice,"ax",@progbits
	.weak	halide_default_device_slice // -- Begin function halide_default_device_slice
	.p2align	2
	.type	halide_default_device_slice,@function
halide_default_device_slice:            // @halide_default_device_slice
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x1, .L.str.59
	add	x1, x1, :lo12:.L.str.59
	mov	x29, sp
	bl	halide_error
	mov	w0, #-40
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end143:
	.size	halide_default_device_slice, .Lfunc_end143-halide_default_device_slice
                                        // -- End function
	.section	.text.halide_device_crop,"ax",@progbits
	.weak	halide_device_crop      // -- Begin function halide_device_crop
	.p2align	2
	.type	halide_device_crop,@function
halide_device_crop:                     // @halide_device_crop
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #32            // =32
	mov	x20, x2
	mov	x21, x1
	bl	halide_mutex_lock
	ldr	x8, [x21]
	cbz	x8, .LBB144_3
// %bb.1:                               // %if.end
	ldr	x8, [x20]
	cbz	x8, .LBB144_4
// %bb.2:                               // %if.then3
	adrp	x1, .L.str.60
	add	x1, x1, :lo12:.L.str.60
	b	.LBB144_7
.LBB144_3:
	mov	w19, wzr
	b	.LBB144_8
.LBB144_4:                              // %if.end4
	ldr	w8, [x21, #36]
	ldr	w9, [x20, #36]
	cmp	w8, w9
	b.ne	.LBB144_6
// %bb.5:                               // %if.end7
	ldr	x8, [x21, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #8]
	mov	x0, x19
	mov	x1, x21
	mov	x2, x20
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #88]
	blr	x8
	mov	w19, w0
	b	.LBB144_8
.LBB144_6:                              // %if.then6
	adrp	x1, .L.str.61
	add	x1, x1, :lo12:.L.str.61
.LBB144_7:                              // %cleanup
	mov	x0, x19
	bl	halide_error
	mov	w19, #-41
.LBB144_8:                              // %cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end144:
	.size	halide_device_crop, .Lfunc_end144-halide_device_crop
                                        // -- End function
	.section	.text.halide_device_slice,"ax",@progbits
	.weak	halide_device_slice     // -- Begin function halide_device_slice
	.p2align	2
	.type	halide_device_slice,@function
halide_device_slice:                    // @halide_device_slice
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	mov	x20, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #48            // =48
	mov	x19, x4
	mov	w21, w3
	mov	w22, w2
	mov	x23, x1
	bl	halide_mutex_lock
	ldr	x8, [x23]
	cbz	x8, .LBB145_3
// %bb.1:                               // %if.end
	ldr	x8, [x19]
	cbz	x8, .LBB145_4
// %bb.2:                               // %if.then3
	adrp	x1, .L.str.60
	add	x1, x1, :lo12:.L.str.60
	b	.LBB145_7
.LBB145_3:
	mov	w19, wzr
	b	.LBB145_8
.LBB145_4:                              // %if.end4
	ldr	w8, [x19, #36]
	ldr	w9, [x23, #36]
	add	w8, w8, #1              // =1
	cmp	w9, w8
	b.ne	.LBB145_6
// %bb.5:                               // %if.end7
	ldr	x8, [x23, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x23, #8]
	mov	x0, x20
	mov	x1, x23
	mov	w2, w22
	ldr	x8, [x8, #120]
	mov	w3, w21
	mov	x4, x19
	ldr	x8, [x8, #96]
	blr	x8
	mov	w19, w0
	b	.LBB145_8
.LBB145_6:                              // %if.then6
	adrp	x1, .L.str.64
	add	x1, x1, :lo12:.L.str.64
.LBB145_7:                              // %cleanup
	mov	x0, x20
	bl	halide_error
	mov	w19, #-41
.LBB145_8:                              // %cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end145:
	.size	halide_device_slice, .Lfunc_end145-halide_device_slice
                                        // -- End function
	.section	.text.halide_default_device_release_crop,"ax",@progbits
	.weak	halide_default_device_release_crop // -- Begin function halide_default_device_release_crop
	.p2align	2
	.type	halide_default_device_release_crop,@function
halide_default_device_release_crop:     // @halide_default_device_release_crop
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x8, [x1]
	mov	x29, sp
	cbz	x8, .LBB146_2
// %bb.1:                               // %if.end
	adrp	x1, .L.str.58.111
	add	x1, x1, :lo12:.L.str.58.111
	bl	halide_error
	mov	w0, #-40
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB146_2:
	mov	w0, wzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end146:
	.size	halide_default_device_release_crop, .Lfunc_end146-halide_default_device_release_crop
                                        // -- End function
	.section	.text.halide_device_release_crop,"ax",@progbits
	.weak	halide_device_release_crop // -- Begin function halide_device_release_crop
	.p2align	2
	.type	halide_device_release_crop,@function
halide_device_release_crop:             // @halide_device_release_crop
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #32            // =32
	cbz	x8, .LBB147_2
// %bb.1:                               // %if.then
	adrp	x21, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x21
	bl	halide_mutex_lock
	ldr	x22, [x19, #8]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x22, #120]
	ldr	x8, [x8, #104]
	blr	x8
	str	xzr, [x19]
	ldr	x8, [x22, #120]
	mov	w20, w0
	ldr	x8, [x8, #8]
	blr	x8
	mov	x0, x21
	str	xzr, [x19, #8]
	bl	halide_mutex_unlock
	mov	w0, w20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB147_2:                              // %return
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end147:
	.size	halide_device_release_crop, .Lfunc_end147-halide_device_release_crop
                                        // -- End function
	.section	.text.halide_float16_bits_to_float,"ax",@progbits
	.weak	halide_float16_bits_to_float // -- Begin function halide_float16_bits_to_float
	.p2align	2
	.type	halide_float16_bits_to_float,@function
halide_float16_bits_to_float:           // @halide_float16_bits_to_float
// %bb.0:                               // %entry
	lsl	w8, w0, #16
	ands	w9, w0, #0x3ff
	and	w8, w8, #0x80000000
	ubfx	w10, w0, #10, #5
	b.eq	.LBB148_3
// %bb.1:                               // %entry
	cbnz	w10, .LBB148_3
// %bb.2:                               // %if.then
	clz	w10, w9
	mov	w11, #1
	eor	w14, w10, #0x1f
	mov	w12, #23
	lsl	w10, w11, w14
	mov	w13, #864026624
	sub	w11, w12, w14
	bic	w9, w9, w10
	lsl	w10, w9, w11
	add	w9, w13, w14, lsl #23
	orr	w8, w9, w8
	orr	w8, w8, w10
	fmov	s0, w8
	ret
.LBB148_3:                              // %if.else
	lsl	w9, w9, #13
	cbz	w10, .LBB148_6
// %bb.4:                               // %if.else18
	cmp	w10, #31                // =31
	b.ne	.LBB148_7
// %bb.5:
	mov	w10, #2139095040
.LBB148_6:                              // %if.end28
	orr	w8, w9, w8
	orr	w8, w8, w10
	fmov	s0, w8
	ret
.LBB148_7:                              // %if.else21
	mov	w11, #939524096
	add	w10, w11, w10, lsl #23
	orr	w8, w9, w8
	orr	w8, w8, w10
	fmov	s0, w8
	ret
.Lfunc_end148:
	.size	halide_float16_bits_to_float, .Lfunc_end148-halide_float16_bits_to_float
                                        // -- End function
	.section	.text.halide_float16_bits_to_double,"ax",@progbits
	.weak	halide_float16_bits_to_double // -- Begin function halide_float16_bits_to_double
	.p2align	2
	.type	halide_float16_bits_to_double,@function
halide_float16_bits_to_double:          // @halide_float16_bits_to_double
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	bl	halide_float16_bits_to_float
	fcvt	d0, s0
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end149:
	.size	halide_float16_bits_to_double, .Lfunc_end149-halide_float16_bits_to_double
                                        // -- End function
	.section	.text.halide_error_bounds_inference_call_failed,"ax",@progbits
	.weak	halide_error_bounds_inference_call_failed // -- Begin function halide_error_bounds_inference_call_failed
	.p2align	2
	.type	halide_error_bounds_inference_call_failed,@function
halide_error_bounds_inference_call_failed: // @halide_error_bounds_inference_call_failed
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w19, w2
	mov	x20, x0
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB150_3
// %bb.1:                               // %if.then.i
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.114
	add	x2, x2, :lo12:.L.str.114
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB150_4
.LBB150_2:                              // %if.else.i13
	mov	x1, x22
	mov	x2, x23
	b	.LBB150_5
.LBB150_3:                              // %entry.split
	adrp	x2, .L.str.114
	add	x2, x2, :lo12:.L.str.114
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB150_2
.LBB150_4:                              // %if.then.i11
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB150_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.1.115
	add	x2, x2, :lo12:.L.str.1.115
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w19
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x21, .LBB150_7
// %bb.6:                               // %if.else.i25
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB150_8
.LBB150_7:                              // %if.then.i24
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB150_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	mov	w0, w19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end150:
	.size	halide_error_bounds_inference_call_failed, .Lfunc_end150-halide_error_bounds_inference_call_failed
                                        // -- End function
	.section	.text.halide_error_extern_stage_failed,"ax",@progbits
	.weak	halide_error_extern_stage_failed // -- Begin function halide_error_extern_stage_failed
	.p2align	2
	.type	halide_error_extern_stage_failed,@function
halide_error_extern_stage_failed:       // @halide_error_extern_stage_failed
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w19, w2
	mov	x20, x0
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB151_3
// %bb.1:                               // %if.then.i
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.2.116
	add	x2, x2, :lo12:.L.str.2.116
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB151_4
.LBB151_2:                              // %if.else.i13
	mov	x1, x22
	mov	x2, x23
	b	.LBB151_5
.LBB151_3:                              // %entry.split
	adrp	x2, .L.str.2.116
	add	x2, x2, :lo12:.L.str.2.116
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB151_2
.LBB151_4:                              // %if.then.i11
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB151_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.1.115
	add	x2, x2, :lo12:.L.str.1.115
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w19
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x21, .LBB151_7
// %bb.6:                               // %if.else.i25
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB151_8
.LBB151_7:                              // %if.then.i24
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB151_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	mov	w0, w19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end151:
	.size	halide_error_extern_stage_failed, .Lfunc_end151-halide_error_extern_stage_failed
                                        // -- End function
	.section	.text.halide_error_explicit_bounds_too_small,"ax",@progbits
	.weak	halide_error_explicit_bounds_too_small // -- Begin function halide_error_explicit_bounds_too_small
	.p2align	2
	.type	halide_error_explicit_bounds_too_small,@function
halide_error_explicit_bounds_too_small: // @halide_error_explicit_bounds_too_small
// %bb.0:                               // %entry
	str	x27, [sp, #-96]!        // 8-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x26, x1
	mov	w1, #1024
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	mov	w21, w6
	mov	w22, w5
	mov	w24, w4
	mov	w25, w3
	mov	x27, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB152_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.3.117
	add	x2, x2, :lo12:.L.str.3.117
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x27, .LBB152_4
.LBB152_2:                              // %if.else.i21
	mov	x1, x23
	mov	x2, x27
	b	.LBB152_5
.LBB152_3:                              // %entry.split
	adrp	x2, .L.str.3.117
	add	x2, x2, :lo12:.L.str.3.117
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x27, .LBB152_2
.LBB152_4:                              // %if.then.i19
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB152_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.4.118
	add	x2, x2, :lo12:.L.str.4.118
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x26, .LBB152_7
// %bb.6:                               // %if.else.i33
	mov	x1, x23
	mov	x2, x26
	b	.LBB152_8
.LBB152_7:                              // %if.then.i31
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB152_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35
	bl	halide_string_to_string
	adrp	x2, .L.str.5.119
	add	x2, x2, :lo12:.L.str.5.119
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w25
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x25, .L.str.6.120
	add	x25, x25, :lo12:.L.str.6.120
	mov	x1, x23
	mov	x2, x25
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.7.121
	add	x2, x2, :lo12:.L.str.7.121
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	mov	x1, x23
	mov	x2, x25
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x20, .LBB152_10
// %bb.9:                               // %if.else.i79
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB152_11
.LBB152_10:                             // %if.then.i78
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB152_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-2
	ldr	x27, [sp], #96          // 8-byte Folded Reload
	ret
.Lfunc_end152:
	.size	halide_error_explicit_bounds_too_small, .Lfunc_end152-halide_error_explicit_bounds_too_small
                                        // -- End function
	.section	.text.halide_error_bad_type,"ax",@progbits
	.weak	halide_error_bad_type   // -- Begin function halide_error_bad_type
	.p2align	2
	.type	halide_error_bad_type,@function
halide_error_bad_type:                  // @halide_error_bad_type
// %bb.0:                               // %entry
	sub	sp, sp, #80             // =80
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x22, x1
	mov	x19, x0
	stp	w3, w2, [sp, #24]
	add	x0, sp, #16             // =16
	add	x1, sp, #24             // =24
	mov	w2, #4
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	str	wzr, [sp, #16]
	str	wzr, [sp, #8]
	bl	memcpy
	add	x0, sp, #8              // =8
	add	x1, sp, #28             // =28
	mov	w2, #4
	bl	memcpy
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB153_3
// %bb.1:                               // %if.then.i13
	add	x21, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x22, .LBB153_4
.LBB153_2:                              // %if.else.i20
	mov	x0, x20
	mov	x1, x21
	mov	x2, x22
	b	.LBB153_5
.LBB153_3:
	mov	x21, xzr
	cbnz	x22, .LBB153_2
.LBB153_4:                              // %if.then.i19
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x0, x20
	mov	x1, x21
.LBB153_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.9.123
	add	x2, x2, :lo12:.L.str.9.123
	mov	x1, x21
	bl	halide_string_to_string
	add	x2, sp, #16             // =16
	mov	x1, x21
	bl	halide_type_to_string
	adrp	x2, .L.str.10.124
	add	x2, x2, :lo12:.L.str.10.124
	mov	x1, x21
	bl	halide_string_to_string
	add	x2, sp, #8              // =8
	mov	x1, x21
	bl	halide_type_to_string
	cbz	x20, .LBB153_7
// %bb.6:                               // %if.else.i
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB153_8
.LBB153_7:                              // %if.then.i
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB153_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	mov	w0, #-3
	add	sp, sp, #80             // =80
	ret
.Lfunc_end153:
	.size	halide_error_bad_type, .Lfunc_end153-halide_error_bad_type
                                        // -- End function
	.section	.text.halide_error_bad_dimensions,"ax",@progbits
	.weak	halide_error_bad_dimensions // -- Begin function halide_error_bad_dimensions
	.p2align	2
	.type	halide_error_bad_dimensions,@function
halide_error_bad_dimensions:            // @halide_error_bad_dimensions
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w23, w3
	mov	w21, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB154_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x24, .LBB154_4
.LBB154_2:                              // %if.else.i10
	mov	x0, x20
	mov	x1, x22
	mov	x2, x24
	b	.LBB154_5
.LBB154_3:
	mov	x22, xzr
	cbnz	x24, .LBB154_2
.LBB154_4:                              // %if.then.i9
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x0, x20
	mov	x1, x22
.LBB154_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.11.125
	add	x2, x2, :lo12:.L.str.11.125
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.12.126
	add	x2, x2, :lo12:.L.str.12.126
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.13.127
	add	x2, x2, :lo12:.L.str.13.127
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB154_7
// %bb.6:                               // %if.else.i36
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB154_8
.LBB154_7:                              // %if.then.i35
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB154_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-43
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end154:
	.size	halide_error_bad_dimensions, .Lfunc_end154-halide_error_bad_dimensions
                                        // -- End function
	.section	.text.halide_error_access_out_of_bounds,"ax",@progbits
	.weak	halide_error_access_out_of_bounds // -- Begin function halide_error_access_out_of_bounds
	.p2align	2
	.type	halide_error_access_out_of_bounds,@function
halide_error_access_out_of_bounds:      // @halide_error_access_out_of_bounds
// %bb.0:                               // %entry
	stp	x26, x25, [sp, #-80]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	w21, w2
	mov	x25, x1
	cmp	w3, w5
	mov	x19, x0
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	b.ge	.LBB155_4
// %bb.1:                               // %if.then
	mov	w1, #1024
	mov	x0, x19
	mov	w23, w5
	mov	w26, w3
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB155_8
// %bb.2:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x25, .LBB155_9
.LBB155_3:                              // %if.else.i29
	mov	x0, x20
	mov	x1, x22
	mov	x2, x25
	b	.LBB155_10
.LBB155_4:                              // %if.else
	mov	w22, w6
	mov	w24, w4
	cmp	w4, w6
	b.le	.LBB155_17
// %bb.5:                               // %if.then8
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB155_12
// %bb.6:                               // %if.then.i69
	add	x23, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x25, .LBB155_13
.LBB155_7:                              // %if.else.i80
	mov	x0, x20
	mov	x1, x23
	mov	x2, x25
	b	.LBB155_14
.LBB155_8:
	mov	x22, xzr
	cbnz	x25, .LBB155_3
.LBB155_9:                              // %if.then.i28
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x0, x20
	mov	x1, x22
.LBB155_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.14.128
	add	x2, x2, :lo12:.L.str.14.128
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w26
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.15.129
	add	x2, x2, :lo12:.L.str.15.129
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.16.130
	add	x2, x2, :lo12:.L.str.16.130
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x20, .LBB155_15
.LBB155_11:                             // %if.else.i123
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	b	.LBB155_16
.LBB155_12:
	mov	x23, xzr
	cbnz	x25, .LBB155_7
.LBB155_13:                             // %if.then.i78
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x0, x20
	mov	x1, x23
.LBB155_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit83
	bl	halide_string_to_string
	adrp	x2, .L.str.14.128
	add	x2, x2, :lo12:.L.str.14.128
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.17.131
	add	x2, x2, :lo12:.L.str.17.131
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.16.130
	add	x2, x2, :lo12:.L.str.16.130
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	cbnz	x20, .LBB155_11
.LBB155_15:                             // %if.then.i58
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
.LBB155_16:                             // %if.end17.sink.split
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
.LBB155_17:                             // %if.end17
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-4
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end155:
	.size	halide_error_access_out_of_bounds, .Lfunc_end155-halide_error_access_out_of_bounds
                                        // -- End function
	.section	.text.halide_error_buffer_allocation_too_large,"ax",@progbits
	.weak	halide_error_buffer_allocation_too_large // -- Begin function halide_error_buffer_allocation_too_large
	.p2align	2
	.type	halide_error_buffer_allocation_too_large,@function
halide_error_buffer_allocation_too_large: // @halide_error_buffer_allocation_too_large
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB156_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.18.132
	add	x2, x2, :lo12:.L.str.18.132
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB156_4
.LBB156_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB156_5
.LBB156_3:                              // %entry.split
	adrp	x2, .L.str.18.132
	add	x2, x2, :lo12:.L.str.18.132
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB156_2
.LBB156_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB156_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_uint64_to_string
	adrp	x2, .L.str.20.134
	add	x2, x2, :lo12:.L.str.20.134
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_uint64_to_string
	cbz	x20, .LBB156_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB156_8
.LBB156_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB156_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-5
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end156:
	.size	halide_error_buffer_allocation_too_large, .Lfunc_end156-halide_error_buffer_allocation_too_large
                                        // -- End function
	.section	.text.halide_error_buffer_extents_negative,"ax",@progbits
	.weak	halide_error_buffer_extents_negative // -- Begin function halide_error_buffer_extents_negative
	.p2align	2
	.type	halide_error_buffer_extents_negative,@function
halide_error_buffer_extents_negative:   // @halide_error_buffer_extents_negative
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w21, w3
	mov	w23, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB157_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.21.135
	add	x2, x2, :lo12:.L.str.21.135
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB157_4
.LBB157_2:                              // %if.else.i15
	mov	x1, x22
	mov	x2, x24
	b	.LBB157_5
.LBB157_3:                              // %entry.split
	adrp	x2, .L.str.21.135
	add	x2, x2, :lo12:.L.str.21.135
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x24, .LBB157_2
.LBB157_4:                              // %if.then.i13
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB157_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.22.136
	add	x2, x2, :lo12:.L.str.22.136
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.23.137
	add	x2, x2, :lo12:.L.str.23.137
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB157_7
// %bb.6:                               // %if.else.i41
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB157_8
.LBB157_7:                              // %if.then.i40
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB157_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-28
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end157:
	.size	halide_error_buffer_extents_negative, .Lfunc_end157-halide_error_buffer_extents_negative
                                        // -- End function
	.section	.text.halide_error_buffer_extents_too_large,"ax",@progbits
	.weak	halide_error_buffer_extents_too_large // -- Begin function halide_error_buffer_extents_too_large
	.p2align	2
	.type	halide_error_buffer_extents_too_large,@function
halide_error_buffer_extents_too_large:  // @halide_error_buffer_extents_too_large
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB158_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.24.138
	add	x2, x2, :lo12:.L.str.24.138
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB158_4
.LBB158_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB158_5
.LBB158_3:                              // %entry.split
	adrp	x2, .L.str.24.138
	add	x2, x2, :lo12:.L.str.24.138
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB158_2
.LBB158_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB158_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.20.134
	add	x2, x2, :lo12:.L.str.20.134
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_int64_to_string
	cbz	x20, .LBB158_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB158_8
.LBB158_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB158_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-6
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end158:
	.size	halide_error_buffer_extents_too_large, .Lfunc_end158-halide_error_buffer_extents_too_large
                                        // -- End function
	.section	.text.halide_error_constraints_make_required_region_smaller,"ax",@progbits
	.weak	halide_error_constraints_make_required_region_smaller // -- Begin function halide_error_constraints_make_required_region_smaller
	.p2align	2
	.type	halide_error_constraints_make_required_region_smaller,@function
halide_error_constraints_make_required_region_smaller: // @halide_error_constraints_make_required_region_smaller
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x25, x1
	mov	w1, #1024
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	mov	w23, w5
	mov	w21, w3
	mov	w24, w2
	mov	x19, x0
	add	w26, w5, w6
	add	w28, w3, w4
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB159_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.25.139
	add	x2, x2, :lo12:.L.str.25.139
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	sub	w27, w26, #1            // =1
	sub	w26, w28, #1            // =1
	cbz	x25, .LBB159_4
.LBB159_2:                              // %if.else.i29
	mov	x1, x22
	mov	x2, x25
	b	.LBB159_5
.LBB159_3:                              // %entry.split
	adrp	x2, .L.str.25.139
	add	x2, x2, :lo12:.L.str.25.139
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	sub	w27, w26, #1            // =1
	sub	w26, w28, #1            // =1
	cbnz	x25, .LBB159_2
.LBB159_4:                              // %if.then.i27
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB159_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.26.140
	add	x2, x2, :lo12:.L.str.26.140
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x24, .L.str.27.141
	add	x24, x24, :lo12:.L.str.27.141
	mov	x1, x22
	mov	x2, x24
	bl	halide_string_to_string
	adrp	x2, .L.str.28.142
	add	x2, x2, :lo12:.L.str.28.142
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x23, .L.str.6.120
	add	x23, x23, :lo12:.L.str.6.120
	mov	x1, x22
	mov	x2, x23
	bl	halide_string_to_string
	sxtw	x2, w27
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	mov	x1, x22
	mov	x2, x24
	bl	halide_string_to_string
	adrp	x2, .L.str.29.143
	add	x2, x2, :lo12:.L.str.29.143
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	mov	x1, x22
	mov	x2, x23
	bl	halide_string_to_string
	sxtw	x2, w26
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB159_7
// %bb.6:                               // %if.else.i92
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB159_8
.LBB159_7:                              // %if.then.i91
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB159_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-7
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end159:
	.size	halide_error_constraints_make_required_region_smaller, .Lfunc_end159-halide_error_constraints_make_required_region_smaller
                                        // -- End function
	.section	.text.halide_error_constraint_violated,"ax",@progbits
	.weak	halide_error_constraint_violated // -- Begin function halide_error_constraint_violated
	.p2align	2
	.type	halide_error_constraint_violated,@function
halide_error_constraint_violated:       // @halide_error_constraint_violated
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	mov	x25, x1
	mov	w1, #1024
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	mov	w21, w4
	mov	x23, x3
	mov	w24, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB160_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.31.145
	add	x2, x2, :lo12:.L.str.31.145
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x25, .LBB160_4
.LBB160_2:                              // %if.else.i17
	mov	x1, x22
	mov	x2, x25
	b	.LBB160_5
.LBB160_3:                              // %entry.split
	adrp	x2, .L.str.31.145
	add	x2, x2, :lo12:.L.str.31.145
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x25, .LBB160_2
.LBB160_4:                              // %if.then.i15
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB160_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.32.146
	add	x2, x2, :lo12:.L.str.32.146
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.33.147
	add	x2, x2, :lo12:.L.str.33.147
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB160_7
// %bb.6:                               // %if.else.i37
	mov	x1, x22
	mov	x2, x23
	b	.LBB160_8
.LBB160_7:                              // %if.then.i35
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB160_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit39
	bl	halide_string_to_string
	adrp	x2, .L.str.32.146
	add	x2, x2, :lo12:.L.str.32.146
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB160_10
// %bb.9:                               // %if.else.i57
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB160_11
.LBB160_10:                             // %if.then.i56
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB160_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-8
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	ret
.Lfunc_end160:
	.size	halide_error_constraint_violated, .Lfunc_end160-halide_error_constraint_violated
                                        // -- End function
	.section	.text.halide_error_param_too_small_i64,"ax",@progbits
	.weak	halide_error_param_too_small_i64 // -- Begin function halide_error_param_too_small_i64
	.p2align	2
	.type	halide_error_param_too_small_i64,@function
halide_error_param_too_small_i64:       // @halide_error_param_too_small_i64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB161_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB161_4
.LBB161_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB161_5
.LBB161_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB161_2
.LBB161_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB161_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.35.149
	add	x2, x2, :lo12:.L.str.35.149
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_int64_to_string
	cbz	x20, .LBB161_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB161_8
.LBB161_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB161_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-9
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end161:
	.size	halide_error_param_too_small_i64, .Lfunc_end161-halide_error_param_too_small_i64
                                        // -- End function
	.section	.text.halide_error_param_too_small_u64,"ax",@progbits
	.weak	halide_error_param_too_small_u64 // -- Begin function halide_error_param_too_small_u64
	.p2align	2
	.type	halide_error_param_too_small_u64,@function
halide_error_param_too_small_u64:       // @halide_error_param_too_small_u64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB162_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB162_4
.LBB162_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB162_5
.LBB162_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB162_2
.LBB162_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB162_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_uint64_to_string
	adrp	x2, .L.str.35.149
	add	x2, x2, :lo12:.L.str.35.149
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_uint64_to_string
	cbz	x20, .LBB162_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB162_8
.LBB162_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB162_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-9
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end162:
	.size	halide_error_param_too_small_u64, .Lfunc_end162-halide_error_param_too_small_u64
                                        // -- End function
	.section	.text.halide_error_param_too_small_f64,"ax",@progbits
	.weak	halide_error_param_too_small_f64 // -- Begin function halide_error_param_too_small_f64
	.p2align	2
	.type	halide_error_param_too_small_f64,@function
halide_error_param_too_small_f64:       // @halide_error_param_too_small_f64
// %bb.0:                               // %entry
	stp	d9, d8, [sp, #-64]!     // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x22, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	v8.16b, v1.16b
	mov	v9.16b, v0.16b
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB163_3
// %bb.1:                               // %if.then.i
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x22, .LBB163_4
.LBB163_2:                              // %if.else.i14
	mov	x1, x21
	mov	x2, x22
	b	.LBB163_5
.LBB163_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x21, xzr
	cbnz	x22, .LBB163_2
.LBB163_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x21
.LBB163_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v9.16b
	bl	halide_double_to_string
	adrp	x2, .L.str.35.149
	add	x2, x2, :lo12:.L.str.35.149
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v8.16b
	bl	halide_double_to_string
	cbz	x20, .LBB163_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB163_8
.LBB163_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB163_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-9
	ldp	d9, d8, [sp], #64       // 16-byte Folded Reload
	ret
.Lfunc_end163:
	.size	halide_error_param_too_small_f64, .Lfunc_end163-halide_error_param_too_small_f64
                                        // -- End function
	.section	.text.halide_error_param_too_large_i64,"ax",@progbits
	.weak	halide_error_param_too_large_i64 // -- Begin function halide_error_param_too_large_i64
	.p2align	2
	.type	halide_error_param_too_large_i64,@function
halide_error_param_too_large_i64:       // @halide_error_param_too_large_i64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB164_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB164_4
.LBB164_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB164_5
.LBB164_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB164_2
.LBB164_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB164_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.36.150
	add	x2, x2, :lo12:.L.str.36.150
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_int64_to_string
	cbz	x20, .LBB164_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB164_8
.LBB164_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB164_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-10
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end164:
	.size	halide_error_param_too_large_i64, .Lfunc_end164-halide_error_param_too_large_i64
                                        // -- End function
	.section	.text.halide_error_param_too_large_u64,"ax",@progbits
	.weak	halide_error_param_too_large_u64 // -- Begin function halide_error_param_too_large_u64
	.p2align	2
	.type	halide_error_param_too_large_u64,@function
halide_error_param_too_large_u64:       // @halide_error_param_too_large_u64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB165_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB165_4
.LBB165_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB165_5
.LBB165_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB165_2
.LBB165_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB165_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_uint64_to_string
	adrp	x2, .L.str.36.150
	add	x2, x2, :lo12:.L.str.36.150
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_uint64_to_string
	cbz	x20, .LBB165_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB165_8
.LBB165_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB165_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-10
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end165:
	.size	halide_error_param_too_large_u64, .Lfunc_end165-halide_error_param_too_large_u64
                                        // -- End function
	.section	.text.halide_error_param_too_large_f64,"ax",@progbits
	.weak	halide_error_param_too_large_f64 // -- Begin function halide_error_param_too_large_f64
	.p2align	2
	.type	halide_error_param_too_large_f64,@function
halide_error_param_too_large_f64:       // @halide_error_param_too_large_f64
// %bb.0:                               // %entry
	stp	d9, d8, [sp, #-64]!     // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x22, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	v8.16b, v1.16b
	mov	v9.16b, v0.16b
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB166_3
// %bb.1:                               // %if.then.i
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x22, .LBB166_4
.LBB166_2:                              // %if.else.i14
	mov	x1, x21
	mov	x2, x22
	b	.LBB166_5
.LBB166_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x21, xzr
	cbnz	x22, .LBB166_2
.LBB166_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x21
.LBB166_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v9.16b
	bl	halide_double_to_string
	adrp	x2, .L.str.36.150
	add	x2, x2, :lo12:.L.str.36.150
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v8.16b
	bl	halide_double_to_string
	cbz	x20, .LBB166_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB166_8
.LBB166_7:                              // %if.then.i33
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB166_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-10
	ldp	d9, d8, [sp], #64       // 16-byte Folded Reload
	ret
.Lfunc_end166:
	.size	halide_error_param_too_large_f64, .Lfunc_end166-halide_error_param_too_large_f64
                                        // -- End function
	.section	.text.halide_error_out_of_memory,"ax",@progbits
	.weak	halide_error_out_of_memory // -- Begin function halide_error_out_of_memory
	.p2align	2
	.type	halide_error_out_of_memory,@function
halide_error_out_of_memory:             // @halide_error_out_of_memory
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x1, .L.str.37
	add	x1, x1, :lo12:.L.str.37
	mov	x29, sp
	bl	halide_error
	mov	w0, #-11
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end167:
	.size	halide_error_out_of_memory, .Lfunc_end167-halide_error_out_of_memory
                                        // -- End function
	.section	.text.halide_error_buffer_argument_is_null,"ax",@progbits
	.weak	halide_error_buffer_argument_is_null // -- Begin function halide_error_buffer_argument_is_null
	.p2align	2
	.type	halide_error_buffer_argument_is_null,@function
halide_error_buffer_argument_is_null:   // @halide_error_buffer_argument_is_null
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB168_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.38
	add	x2, x2, :lo12:.L.str.38
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB168_4
.LBB168_2:                              // %if.else.i11
	mov	x1, x22
	mov	x2, x21
	b	.LBB168_5
.LBB168_3:                              // %entry.split
	adrp	x2, .L.str.38
	add	x2, x2, :lo12:.L.str.38
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB168_2
.LBB168_4:                              // %if.then.i9
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB168_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.39
	add	x2, x2, :lo12:.L.str.39
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB168_7
// %bb.6:                               // %if.else.i20
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB168_8
.LBB168_7:                              // %if.then.i19
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB168_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-12
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end168:
	.size	halide_error_buffer_argument_is_null, .Lfunc_end168-halide_error_buffer_argument_is_null
                                        // -- End function
	.section	.text.halide_error_debug_to_file_failed,"ax",@progbits
	.weak	halide_error_debug_to_file_failed // -- Begin function halide_error_debug_to_file_failed
	.p2align	2
	.type	halide_error_debug_to_file_failed,@function
halide_error_debug_to_file_failed:      // @halide_error_debug_to_file_failed
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w21, w3
	mov	x23, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB169_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.40
	add	x2, x2, :lo12:.L.str.40
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB169_4
.LBB169_2:                              // %if.else.i14
	mov	x1, x22
	mov	x2, x24
	b	.LBB169_5
.LBB169_3:                              // %entry.split
	adrp	x2, .L.str.40
	add	x2, x2, :lo12:.L.str.40
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x24, .LBB169_2
.LBB169_4:                              // %if.then.i12
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB169_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.41
	add	x2, x2, :lo12:.L.str.41
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB169_7
// %bb.6:                               // %if.else.i26
	mov	x1, x22
	mov	x2, x23
	b	.LBB169_8
.LBB169_7:                              // %if.then.i24
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB169_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
	bl	halide_string_to_string
	adrp	x2, .L.str.42.151
	add	x2, x2, :lo12:.L.str.42.151
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x20, .LBB169_10
// %bb.9:                               // %if.else.i40
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB169_11
.LBB169_10:                             // %if.then.i39
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB169_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-13
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end169:
	.size	halide_error_debug_to_file_failed, .Lfunc_end169-halide_error_debug_to_file_failed
                                        // -- End function
	.section	.text.halide_error_failed_to_upgrade_buffer_t,"ax",@progbits
	.weak	halide_error_failed_to_upgrade_buffer_t // -- Begin function halide_error_failed_to_upgrade_buffer_t
	.p2align	2
	.type	halide_error_failed_to_upgrade_buffer_t,@function
halide_error_failed_to_upgrade_buffer_t: // @halide_error_failed_to_upgrade_buffer_t
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB170_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.43
	add	x2, x2, :lo12:.L.str.43
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB170_4
.LBB170_2:                              // %if.else.i12
	mov	x1, x22
	mov	x2, x23
	b	.LBB170_5
.LBB170_3:                              // %entry.split
	adrp	x2, .L.str.43
	add	x2, x2, :lo12:.L.str.43
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB170_2
.LBB170_4:                              // %if.then.i10
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB170_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.188
	add	x2, x2, :lo12:.L.str.19.188
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB170_8
// %bb.6:                               // %if.else.i24
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB170_9
.LBB170_7:                              // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB170_10
.LBB170_8:                              // %if.then.i22
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB170_7
.LBB170_9:                              // %if.then.i29
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB170_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-29
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end170:
	.size	halide_error_failed_to_upgrade_buffer_t, .Lfunc_end170-halide_error_failed_to_upgrade_buffer_t
                                        // -- End function
	.section	.text.halide_error_failed_to_downgrade_buffer_t,"ax",@progbits
	.weak	halide_error_failed_to_downgrade_buffer_t // -- Begin function halide_error_failed_to_downgrade_buffer_t
	.p2align	2
	.type	halide_error_failed_to_downgrade_buffer_t,@function
halide_error_failed_to_downgrade_buffer_t: // @halide_error_failed_to_downgrade_buffer_t
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB171_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.45
	add	x2, x2, :lo12:.L.str.45
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB171_4
.LBB171_2:                              // %if.else.i12
	mov	x1, x22
	mov	x2, x23
	b	.LBB171_5
.LBB171_3:                              // %entry.split
	adrp	x2, .L.str.45
	add	x2, x2, :lo12:.L.str.45
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB171_2
.LBB171_4:                              // %if.then.i10
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB171_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.188
	add	x2, x2, :lo12:.L.str.19.188
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB171_8
// %bb.6:                               // %if.else.i24
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB171_9
.LBB171_7:                              // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB171_10
.LBB171_8:                              // %if.then.i22
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB171_7
.LBB171_9:                              // %if.then.i29
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB171_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-30
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end171:
	.size	halide_error_failed_to_downgrade_buffer_t, .Lfunc_end171-halide_error_failed_to_downgrade_buffer_t
                                        // -- End function
	.section	.text.halide_error_unaligned_host_ptr,"ax",@progbits
	.weak	halide_error_unaligned_host_ptr // -- Begin function halide_error_unaligned_host_ptr
	.p2align	2
	.type	halide_error_unaligned_host_ptr,@function
halide_error_unaligned_host_ptr:        // @halide_error_unaligned_host_ptr
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w21, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB172_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB172_4
.LBB172_2:                              // %if.else.i13
	mov	x1, x22
	mov	x2, x23
	b	.LBB172_5
.LBB172_3:                              // %entry.split
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB172_2
.LBB172_4:                              // %if.then.i11
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB172_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.47
	add	x2, x2, :lo12:.L.str.47
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.48
	add	x2, x2, :lo12:.L.str.48
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB172_7
// %bb.6:                               // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB172_8
.LBB172_7:                              // %if.then.i29
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB172_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-24
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end172:
	.size	halide_error_unaligned_host_ptr, .Lfunc_end172-halide_error_unaligned_host_ptr
                                        // -- End function
	.section	.text.halide_error_host_is_null,"ax",@progbits
	.weak	halide_error_host_is_null // -- Begin function halide_error_host_is_null
	.p2align	2
	.type	halide_error_host_is_null,@function
halide_error_host_is_null:              // @halide_error_host_is_null
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB173_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB173_4
.LBB173_2:                              // %if.else.i11
	mov	x1, x22
	mov	x2, x21
	b	.LBB173_5
.LBB173_3:                              // %entry.split
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB173_2
.LBB173_4:                              // %if.then.i9
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB173_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.49
	add	x2, x2, :lo12:.L.str.49
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB173_7
// %bb.6:                               // %if.else.i20
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB173_8
.LBB173_7:                              // %if.then.i19
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB173_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-34
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end173:
	.size	halide_error_host_is_null, .Lfunc_end173-halide_error_host_is_null
                                        // -- End function
	.section	.text.halide_error_bad_fold,"ax",@progbits
	.weak	halide_error_bad_fold   // -- Begin function halide_error_bad_fold
	.p2align	2
	.type	halide_error_bad_fold,@function
halide_error_bad_fold:                  // @halide_error_bad_fold
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x24, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB174_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.50
	add	x2, x2, :lo12:.L.str.50
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB174_4
.LBB174_2:                              // %if.else.i15
	mov	x1, x22
	mov	x2, x24
	b	.LBB174_5
.LBB174_3:                              // %entry.split
	adrp	x2, .L.str.50
	add	x2, x2, :lo12:.L.str.50
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x24, .LBB174_2
.LBB174_4:                              // %if.then.i13
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB174_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB174_7
// %bb.6:                               // %if.else.i27
	mov	x1, x22
	mov	x2, x23
	b	.LBB174_8
.LBB174_7:                              // %if.then.i25
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB174_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit29
	bl	halide_string_to_string
	adrp	x2, .L.str.52
	add	x2, x2, :lo12:.L.str.52
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB174_10
// %bb.9:                               // %if.else.i41
	mov	x1, x22
	mov	x2, x21
	b	.LBB174_11
.LBB174_10:                             // %if.then.i39
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB174_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit43
	bl	halide_string_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB174_13
// %bb.12:                              // %if.else.i52
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB174_14
.LBB174_13:                             // %if.then.i51
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB174_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-25
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end174:
	.size	halide_error_bad_fold, .Lfunc_end174-halide_error_bad_fold
                                        // -- End function
	.section	.text.halide_error_bad_extern_fold,"ax",@progbits
	.weak	halide_error_bad_extern_fold // -- Begin function halide_error_bad_extern_fold
	.p2align	2
	.type	halide_error_bad_extern_fold,@function
halide_error_bad_extern_fold:           // @halide_error_bad_extern_fold
// %bb.0:                               // %entry
	str	x27, [sp, #-96]!        // 8-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	w21, w6
	mov	w23, w5
	mov	w26, w4
	mov	w22, w3
	mov	w27, w2
	mov	x24, x1
	cmp	w3, w5
	mov	x19, x0
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	b.lt	.LBB175_2
// %bb.1:                               // %lor.lhs.false
	add	w25, w26, w22
	add	w8, w21, w23
	cmp	w25, w8
	b.le	.LBB175_10
.LBB175_2:                              // %if.then
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB175_4
// %bb.3:                               // %if.then.i
	add	x25, x20, #1023         // =1023
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x0, x20
	mov	x1, x25
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB175_5
.LBB175_4:                              // %if.then.split
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x25, xzr
.LBB175_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	sxtw	x2, w27
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x25
	bl	halide_string_to_string
	cbz	x24, .LBB175_7
// %bb.6:                               // %if.else.i65
	mov	x1, x25
	mov	x2, x24
	b	.LBB175_8
.LBB175_7:                              // %if.then.i63
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x25
.LBB175_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.54
	add	x2, x2, :lo12:.L.str.54
	mov	x1, x25
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x24, .L.str.55
	add	x24, x24, :lo12:.L.str.55
	mov	x1, x25
	mov	x2, x24
	bl	halide_string_to_string
	add	w8, w26, w22
	sub	w8, w8, #1              // =1
	sxtw	x2, w8
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x2, .L.str.56
	add	x2, x2, :lo12:.L.str.56
	mov	x1, x25
	bl	halide_string_to_string
	adrp	x2, .L.str.57
	add	x2, x2, :lo12:.L.str.57
	mov	x1, x25
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	mov	x1, x25
	mov	x2, x24
	bl	halide_string_to_string
	add	w8, w21, w23
	sub	w8, w8, #1              // =1
	sxtw	x2, w8
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x2, .L.str.58.152
	add	x2, x2, :lo12:.L.str.58.152
	mov	x1, x25
	bl	halide_string_to_string
	cbz	x20, .LBB175_17
.LBB175_9:                              // %if.else.i213
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	b	.LBB175_18
.LBB175_10:                             // %if.else
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB175_12
// %bb.11:                              // %if.then.i125
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB175_13
.LBB175_12:                             // %if.else.split
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
.LBB175_13:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit129
	sxtw	x2, w27
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x24, .LBB175_15
// %bb.14:                              // %if.else.i152
	mov	x1, x23
	mov	x2, x24
	b	.LBB175_16
.LBB175_15:                             // %if.then.i150
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x23
.LBB175_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit155
	bl	halide_string_to_string
	adrp	x2, .L.str.54
	add	x2, x2, :lo12:.L.str.54
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.55
	add	x2, x2, :lo12:.L.str.55
	mov	x1, x23
	bl	halide_string_to_string
	sub	w8, w25, #1             // =1
	sxtw	x2, w8
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.56
	add	x2, x2, :lo12:.L.str.56
	mov	x1, x23
	bl	halide_string_to_string
	adrp	x2, .L.str.59.153
	add	x2, x2, :lo12:.L.str.59.153
	mov	x1, x23
	bl	halide_string_to_string
	adrp	x2, .L.str.60.154
	add	x2, x2, :lo12:.L.str.60.154
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x23
	bl	halide_string_to_string
	cbnz	x20, .LBB175_9
.LBB175_17:                             // %if.then.i114
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
.LBB175_18:                             // %if.end
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-35
	ldr	x27, [sp], #96          // 8-byte Folded Reload
	ret
.Lfunc_end175:
	.size	halide_error_bad_extern_fold, .Lfunc_end175-halide_error_bad_extern_fold
                                        // -- End function
	.section	.text.halide_error_fold_factor_too_small,"ax",@progbits
	.weak	halide_error_fold_factor_too_small // -- Begin function halide_error_fold_factor_too_small
	.p2align	2
	.type	halide_error_fold_factor_too_small,@function
halide_error_fold_factor_too_small:     // @halide_error_fold_factor_too_small
// %bb.0:                               // %entry
	stp	x26, x25, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	mov	w21, w5
	mov	x23, x4
	mov	w26, w3
	mov	x25, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB176_2
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.61.155
	add	x2, x2, :lo12:.L.str.61.155
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB176_3
.LBB176_2:                              // %entry.split
	adrp	x2, .L.str.61.155
	add	x2, x2, :lo12:.L.str.61.155
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB176_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	sxtw	x2, w26
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.62
	add	x2, x2, :lo12:.L.str.62
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x25, .LBB176_5
// %bb.4:                               // %if.else.i26
	mov	x1, x22
	mov	x2, x25
	b	.LBB176_6
.LBB176_5:                              // %if.then.i24
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB176_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x24, .LBB176_8
// %bb.7:                               // %if.else.i38
	mov	x1, x22
	mov	x2, x24
	b	.LBB176_9
.LBB176_8:                              // %if.then.i36
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB176_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40
	bl	halide_string_to_string
	adrp	x2, .L.str.63
	add	x2, x2, :lo12:.L.str.63
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB176_11
// %bb.10:                              // %if.else.i52
	mov	x1, x22
	mov	x2, x23
	b	.LBB176_12
.LBB176_11:                             // %if.then.i50
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB176_12:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit54
	bl	halide_string_to_string
	adrp	x2, .L.str.32.146
	add	x2, x2, :lo12:.L.str.32.146
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.64.156
	add	x2, x2, :lo12:.L.str.64.156
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB176_14
// %bb.13:                              // %if.else.i72
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB176_15
.LBB176_14:                             // %if.then.i71
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB176_15:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-26
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end176:
	.size	halide_error_fold_factor_too_small, .Lfunc_end176-halide_error_fold_factor_too_small
                                        // -- End function
	.section	.text.halide_error_requirement_failed,"ax",@progbits
	.weak	halide_error_requirement_failed // -- Begin function halide_error_requirement_failed
	.p2align	2
	.type	halide_error_requirement_failed,@function
halide_error_requirement_failed:        // @halide_error_requirement_failed
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB177_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.65
	add	x2, x2, :lo12:.L.str.65
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB177_4
.LBB177_2:                              // %if.else.i12
	mov	x1, x22
	mov	x2, x23
	b	.LBB177_5
.LBB177_3:                              // %entry.split
	adrp	x2, .L.str.65
	add	x2, x2, :lo12:.L.str.65
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB177_2
.LBB177_4:                              // %if.then.i10
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB177_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.3.168
	add	x2, x2, :lo12:.L.str.3.168
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB177_8
// %bb.6:                               // %if.else.i24
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB177_9
.LBB177_7:                              // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB177_10
.LBB177_8:                              // %if.then.i22
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB177_7
.LBB177_9:                              // %if.then.i29
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB177_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-27
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end177:
	.size	halide_error_requirement_failed, .Lfunc_end177-halide_error_requirement_failed
                                        // -- End function
	.section	.text.halide_error_specialize_fail,"ax",@progbits
	.weak	halide_error_specialize_fail // -- Begin function halide_error_specialize_fail
	.p2align	2
	.type	halide_error_specialize_fail,@function
halide_error_specialize_fail:           // @halide_error_specialize_fail
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB178_4
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.67
	add	x2, x2, :lo12:.L.str.67
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB178_5
.LBB178_2:                              // %if.else.i10
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB178_6
.LBB178_3:                              // %if.else.i14
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB178_7
.LBB178_4:                              // %entry.split
	adrp	x2, .L.str.67
	add	x2, x2, :lo12:.L.str.67
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB178_2
.LBB178_5:                              // %if.then.i8
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB178_3
.LBB178_6:                              // %if.then.i13
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB178_7:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-31
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end178:
	.size	halide_error_specialize_fail, .Lfunc_end178-halide_error_specialize_fail
                                        // -- End function
	.section	.text.halide_error_no_device_interface,"ax",@progbits
	.weak	halide_error_no_device_interface // -- Begin function halide_error_no_device_interface
	.p2align	2
	.type	halide_error_no_device_interface,@function
halide_error_no_device_interface:       // @halide_error_no_device_interface
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB179_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.68
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.68
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB179_3
.LBB179_2:                              // %if.then.i6
	adrp	x2, .L.str.68
	add	x2, x2, :lo12:.L.str.68
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB179_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end179:
	.size	halide_error_no_device_interface, .Lfunc_end179-halide_error_no_device_interface
                                        // -- End function
	.section	.text.halide_error_device_interface_no_device,"ax",@progbits
	.weak	halide_error_device_interface_no_device // -- Begin function halide_error_device_interface_no_device
	.p2align	2
	.type	halide_error_device_interface_no_device,@function
halide_error_device_interface_no_device: // @halide_error_device_interface_no_device
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB180_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.69
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.69
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB180_3
.LBB180_2:                              // %if.then.i6
	adrp	x2, .L.str.69
	add	x2, x2, :lo12:.L.str.69
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB180_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-36
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end180:
	.size	halide_error_device_interface_no_device, .Lfunc_end180-halide_error_device_interface_no_device
                                        // -- End function
	.section	.text.halide_error_host_and_device_dirty,"ax",@progbits
	.weak	halide_error_host_and_device_dirty // -- Begin function halide_error_host_and_device_dirty
	.p2align	2
	.type	halide_error_host_and_device_dirty,@function
halide_error_host_and_device_dirty:     // @halide_error_host_and_device_dirty
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB181_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.70
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.70
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB181_3
.LBB181_2:                              // %if.then.i6
	adrp	x2, .L.str.70
	add	x2, x2, :lo12:.L.str.70
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB181_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-37
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end181:
	.size	halide_error_host_and_device_dirty, .Lfunc_end181-halide_error_host_and_device_dirty
                                        // -- End function
	.section	.text.halide_error_buffer_is_null,"ax",@progbits
	.weak	halide_error_buffer_is_null // -- Begin function halide_error_buffer_is_null
	.p2align	2
	.type	halide_error_buffer_is_null,@function
halide_error_buffer_is_null:            // @halide_error_buffer_is_null
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB182_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.71
	add	x2, x2, :lo12:.L.str.71
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB182_4
.LBB182_2:                              // %if.else.i11
	mov	x1, x22
	mov	x2, x21
	b	.LBB182_5
.LBB182_3:                              // %entry.split
	adrp	x2, .L.str.71
	add	x2, x2, :lo12:.L.str.71
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB182_2
.LBB182_4:                              // %if.then.i9
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x22
.LBB182_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.72
	add	x2, x2, :lo12:.L.str.72
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB182_7
// %bb.6:                               // %if.else.i20
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB182_8
.LBB182_7:                              // %if.then.i19
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB182_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-38
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end182:
	.size	halide_error_buffer_is_null, .Lfunc_end182-halide_error_buffer_is_null
                                        // -- End function
	.section	.text.halide_error_integer_division_by_zero,"ax",@progbits
	.weak	halide_error_integer_division_by_zero // -- Begin function halide_error_integer_division_by_zero
	.p2align	2
	.type	halide_error_integer_division_by_zero,@function
halide_error_integer_division_by_zero:  // @halide_error_integer_division_by_zero
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB183_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.73
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.73
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB183_3
.LBB183_2:                              // %if.then.i6
	adrp	x2, .L.str.73
	add	x2, x2, :lo12:.L.str.73
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB183_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-44
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end183:
	.size	halide_error_integer_division_by_zero, .Lfunc_end183-halide_error_integer_division_by_zero
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t: // @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
// %bb.0:                               // %entry
	mov	w8, #4
	str	w8, [x2, #36]
	ldr	w8, [x1, #16]
	cbz	w8, .LBB184_9
// %bb.1:                               // %for.inc
	ldr	w8, [x1, #20]
	cbz	w8, .LBB184_8
// %bb.2:                               // %for.inc.1
	ldr	w8, [x1, #24]
	cbz	w8, .LBB184_16
// %bb.3:                               // %for.inc.2
	ldr	w8, [x1, #28]
	cbz	w8, .LBB184_17
// %bb.4:                               // %cleanup
	ldr	w8, [x1, #64]
	cmp	w8, #3                  // =3
	b.gt	.LBB184_10
.LBB184_5:                              // %cleanup
	cmp	w8, #1                  // =1
	b.eq	.LBB184_13
// %bb.6:                               // %cleanup
	cmp	w8, #2                  // =2
	b.ne	.LBB184_15
// %bb.7:                               // %sw.bb3
	mov	w8, #2049
	movk	w8, #1, lsl #16
	add	w8, w8, #2048           // =2048
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.LBB184_8:
	mov	w8, #1
.LBB184_9:                              // %if.then
	str	w8, [x2, #36]
	ldr	w8, [x1, #64]
	cmp	w8, #3                  // =3
	b.le	.LBB184_5
.LBB184_10:                             // %cleanup
	cmp	w8, #4                  // =4
	b.eq	.LBB184_14
// %bb.11:                              // %cleanup
	cmp	w8, #8                  // =8
	b.ne	.LBB184_15
// %bb.12:                              // %sw.bb9
	mov	w8, #8193
	movk	w8, #1, lsl #16
	add	w8, w8, #2, lsl #12     // =8192
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.LBB184_13:                             // %sw.bb
	mov	w8, #2049
	movk	w8, #1, lsl #16
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.LBB184_14:                             // %sw.bb6
	mov	w8, #8193
	movk	w8, #1, lsl #16
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.LBB184_15:                             // %sw.default
	adrp	x1, .L.str.165
	adrp	x2, .L.str.1.166
	add	x1, x1, :lo12:.L.str.165
	add	x2, x2, :lo12:.L.str.1.166
	b	halide_error_failed_to_upgrade_buffer_t
.LBB184_16:
	mov	w8, #2
	str	w8, [x2, #36]
	ldr	w8, [x1, #64]
	cmp	w8, #3                  // =3
	b.le	.LBB184_5
	b	.LBB184_10
.LBB184_17:
	mov	w8, #3
	str	w8, [x2, #36]
	ldr	w8, [x1, #64]
	cmp	w8, #3                  // =3
	b.le	.LBB184_5
	b	.LBB184_10
.Lfunc_end184:
	.size	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t, .Lfunc_end184-_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
                                        // -- End function
	.section	.text.halide_upgrade_buffer_t,"ax",@progbits
	.weak	halide_upgrade_buffer_t // -- Begin function halide_upgrade_buffer_t
	.p2align	2
	.type	halide_upgrade_buffer_t,@function
halide_upgrade_buffer_t:                // @halide_upgrade_buffer_t
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x2, #8]
	mov	x21, x2
	mov	x20, x1
	mov	x19, x0
	add	x29, sp, #48            // =48
	cbnz	x8, .LBB185_2
// %bb.1:                               // %lor.lhs.false
	ldr	x9, [x21]
	cbz	x9, .LBB185_15
.LBB185_2:                              // %if.then
	ldrb	w9, [x3, #33]
	ldr	w10, [x21, #64]
	add	w9, w9, #7              // =7
	cmp	w10, w9, lsr #3
	b.ne	.LBB185_6
// %bb.3:                               // %if.end
	cbz	w4, .LBB185_8
// %bb.4:                               // %if.then14
	ldr	x9, [x3, #16]
	cmp	x9, x8
	b.eq	.LBB185_20
// %bb.5:                               // %if.then18
	mov	x0, x19
	mov	x1, x20
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	adrp	x2, .L.str.6.172
	add	x2, x2, :lo12:.L.str.6.172
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	b	halide_error_failed_to_upgrade_buffer_t
.LBB185_6:                              // %if.then2
	mov	w1, #1024
	mov	x0, x19
	add	x23, x3, #32            // =32
	bl	halide_malloc
	mov	x22, x0
	cbz	x0, .LBB185_10
// %bb.7:                               // %if.then.i97
	add	x24, x22, #1023         // =1023
	adrp	x2, .L.str.2.167
	add	x2, x2, :lo12:.L.str.2.167
	mov	x0, x22
	mov	x1, x24
	strb	wzr, [x22, #1023]
	bl	halide_string_to_string
	b	.LBB185_11
.LBB185_8:                              // %if.end22
	ldr	x9, [x21]
	str	x8, [x3, #16]
	cbz	x9, .LBB185_16
// %bb.9:                               // %if.then27
	ldp	x9, x8, [x9]
	stp	x9, x8, [x3]
	ldrsw	x8, [x3, #36]
	cmp	w8, #1                  // =1
	b.ge	.LBB185_17
	b	.LBB185_19
.LBB185_10:                             // %if.then2.split
	adrp	x2, .L.str.2.167
	add	x2, x2, :lo12:.L.str.2.167
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x24, xzr
.LBB185_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
	ldrsw	x2, [x21, #64]
	mov	w3, #1
	mov	x1, x24
	bl	halide_int64_to_string
	adrp	x2, .L.str.3.168
	add	x2, x2, :lo12:.L.str.3.168
	mov	x1, x24
	bl	halide_string_to_string
	adrp	x2, .L.str.4.169
	add	x2, x2, :lo12:.L.str.4.169
	mov	x1, x24
	bl	halide_string_to_string
	mov	x1, x24
	mov	x2, x23
	bl	halide_type_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x24
	bl	halide_string_to_string
	cbz	x22, .LBB185_13
// %bb.12:                              // %if.else.i
	sub	x8, x0, x22
	add	x21, x8, #1             // =1
	mov	x0, x19
	mov	x1, x22
	mov	x2, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	bl	halide_error_failed_to_upgrade_buffer_t
	mov	w20, w0
	mov	x0, x19
	mov	x1, x22
	mov	x2, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x22
	b	.LBB185_14
.LBB185_13:                             // %if.then.i
	adrp	x21, .L.str.111
	add	x21, x21, :lo12:.L.str.111
	mov	x0, x19
	mov	x1, x20
	mov	x2, x21
	bl	halide_error_failed_to_upgrade_buffer_t
	mov	w20, w0
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB185_14:                             // %if.then.i
	bl	halide_free
	mov	w0, w20
	b	.LBB185_21
.LBB185_15:                             // %if.end22.thread
	str	x8, [x3, #16]
.LBB185_16:                             // %if.else
	mov	x9, xzr
	stp	x9, xzr, [x3]
	ldrsw	x8, [x3, #36]
	cmp	w8, #1                  // =1
	b.lt	.LBB185_19
.LBB185_17:                             // %for.body.lr.ph
	ldr	x9, [x3, #40]
	add	x10, x21, #32           // =32
	add	x9, x9, #4              // =4
.LBB185_18:                             // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w11, [x10, #16]
	subs	x8, x8, #1              // =1
	stur	w11, [x9, #-4]
	ldur	w11, [x10, #-16]
	str	w11, [x9]
	ldr	w11, [x10], #4
	str	w11, [x9, #4]
	add	x9, x9, #16             // =16
	b.ne	.LBB185_18
.LBB185_19:                             // %for.cond.cleanup
	ldrb	w8, [x21, #68]
	ldrb	w9, [x21, #69]
	orr	x10, x8, #0x2
	cmp	w9, #0                  // =0
	csel	x8, x8, x10, eq
	str	x8, [x3, #24]
.LBB185_20:                             // %return
	mov	w0, wzr
.LBB185_21:                             // %return
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end185:
	.size	halide_upgrade_buffer_t, .Lfunc_end185-halide_upgrade_buffer_t
                                        // -- End function
	.section	.text.halide_downgrade_buffer_t,"ax",@progbits
	.weak	halide_downgrade_buffer_t // -- Begin function halide_downgrade_buffer_t
	.p2align	2
	.type	halide_downgrade_buffer_t,@function
halide_downgrade_buffer_t:              // @halide_downgrade_buffer_t
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x2
	mov	x20, x1
	mov	x22, x0
	mov	w2, #72
	mov	x0, x3
	mov	w1, wzr
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x3
	bl	memset
	ldr	w8, [x21, #36]
	cmp	w8, #5                  // =5
	b.lt	.LBB186_2
// %bb.1:                               // %if.then
	mov	x1, x20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	adrp	x2, .L.str.7.173
	add	x2, x2, :lo12:.L.str.7.173
	mov	x0, x22
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	b	halide_error_failed_to_downgrade_buffer_t
.LBB186_2:                              // %if.end
	ldr	x9, [x21, #16]
	cmp	w8, #1                  // =1
	str	x9, [x19, #8]
	b.lt	.LBB186_5
// %bb.3:                               // %for.body.lr.ph
	ldr	x10, [x21, #40]
	mov	x8, xzr
	add	x9, x19, #48            // =48
	add	x10, x10, #4            // =4
.LBB186_4:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldur	w11, [x10, #-4]
	add	x8, x8, #1              // =1
	str	w11, [x9]
	ldr	w11, [x10]
	stur	w11, [x9, #-32]
	ldr	w11, [x10, #4]
	add	x10, x10, #16           // =16
	stur	w11, [x9, #-16]
	ldrsw	x11, [x21, #36]
	add	x9, x9, #4              // =4
	cmp	x8, x11
	b.lt	.LBB186_4
.LBB186_5:                              // %for.cond.cleanup
	ldrb	w8, [x21, #33]
	mov	x1, x20
	mov	x3, x19
	mov	x0, x22
	add	w8, w8, #7              // =7
	lsr	w8, w8, #3
	str	w8, [x19, #64]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x2, x21
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	b	halide_downgrade_buffer_t_device_fields
.Lfunc_end186:
	.size	halide_downgrade_buffer_t, .Lfunc_end186-halide_downgrade_buffer_t
                                        // -- End function
	.section	.text.halide_downgrade_buffer_t_device_fields,"ax",@progbits
	.weak	halide_downgrade_buffer_t_device_fields // -- Begin function halide_downgrade_buffer_t_device_fields
	.p2align	2
	.type	halide_downgrade_buffer_t_device_fields,@function
halide_downgrade_buffer_t_device_fields: // @halide_downgrade_buffer_t_device_fields
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldrb	w8, [x2, #24]
	ldr	x0, [x3]
	mov	x19, x3
	add	x29, sp, #16            // =16
	and	w9, w8, #0x1
	ubfx	w8, w8, #1, #1
	strb	w9, [x3, #68]
	strb	w8, [x3, #69]
	ldr	x8, [x2]
	cbz	x8, .LBB187_3
// %bb.1:                               // %if.then
	mov	x20, x2
	cbz	x0, .LBB187_6
// %bb.2:                               // %if.then4
	str	x8, [x0]
	ldr	x8, [x20, #8]
	str	x8, [x0, #8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB187_3:                              // %if.else15
	cbz	x0, .LBB187_5
// %bb.4:                               // %if.then18
	bl	free
	str	xzr, [x19]
.LBB187_5:                              // %if.end22
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB187_6:                              // %if.else
	mov	w0, #16
	bl	malloc
	ldr	q0, [x20]
	str	q0, [x0]
	str	x0, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end187:
	.size	halide_downgrade_buffer_t_device_fields, .Lfunc_end187-halide_downgrade_buffer_t_device_fields
                                        // -- End function
	.section	.text.halide_copy_to_host_legacy,"ax",@progbits
	.weak	halide_copy_to_host_legacy // -- Begin function halide_copy_to_host_legacy
	.p2align	2
	.type	halide_copy_to_host_legacy,@function
halide_copy_to_host_legacy:             // @halide_copy_to_host_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB188_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB188_3
// %bb.2:                               // %lor.rhs4
	add	x1, sp, #64             // =64
	mov	x0, x20
	bl	halide_copy_to_host
	cbz	w0, .LBB188_4
.LBB188_3:
	mov	w0, #1
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB188_4:                              // %lor.rhs10
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end188:
	.size	halide_copy_to_host_legacy, .Lfunc_end188-halide_copy_to_host_legacy
                                        // -- End function
	.section	.text.halide_copy_to_device_legacy,"ax",@progbits
	.weak	halide_copy_to_device_legacy // -- Begin function halide_copy_to_device_legacy
	.p2align	2
	.type	halide_copy_to_device_legacy,@function
halide_copy_to_device_legacy:           // @halide_copy_to_device_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #176            // =176
	str	x21, [sp, #128]         // 8-byte Folded Spill
	mov	x21, x2
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB189_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB189_3
// %bb.2:                               // %lor.rhs5
	add	x1, sp, #64             // =64
	mov	x0, x20
	mov	x2, x21
	bl	halide_copy_to_device
	cbz	w0, .LBB189_5
.LBB189_3:
	mov	w0, #1
.LBB189_4:                              // %lor.end14
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldr	x21, [sp, #128]         // 8-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB189_5:                              // %lor.rhs11
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	b	.LBB189_4
.Lfunc_end189:
	.size	halide_copy_to_device_legacy, .Lfunc_end189-halide_copy_to_device_legacy
                                        // -- End function
	.section	.text.halide_device_sync_legacy,"ax",@progbits
	.weak	halide_device_sync_legacy // -- Begin function halide_device_sync_legacy
	.p2align	2
	.type	halide_device_sync_legacy,@function
halide_device_sync_legacy:              // @halide_device_sync_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB190_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB190_3
// %bb.2:                               // %lor.rhs4
	add	x1, sp, #64             // =64
	mov	x0, x20
	bl	halide_device_sync
	cbz	w0, .LBB190_4
.LBB190_3:
	mov	w0, #1
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB190_4:                              // %lor.rhs10
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end190:
	.size	halide_device_sync_legacy, .Lfunc_end190-halide_device_sync_legacy
                                        // -- End function
	.section	.text.halide_device_malloc_legacy,"ax",@progbits
	.weak	halide_device_malloc_legacy // -- Begin function halide_device_malloc_legacy
	.p2align	2
	.type	halide_device_malloc_legacy,@function
halide_device_malloc_legacy:            // @halide_device_malloc_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #176            // =176
	str	x21, [sp, #128]         // 8-byte Folded Spill
	mov	x21, x2
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB191_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB191_3
// %bb.2:                               // %lor.rhs5
	add	x1, sp, #64             // =64
	mov	x0, x20
	mov	x2, x21
	bl	halide_device_malloc
	cbz	w0, .LBB191_5
.LBB191_3:
	mov	w0, #1
.LBB191_4:                              // %lor.end14
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldr	x21, [sp, #128]         // 8-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB191_5:                              // %lor.rhs11
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	b	.LBB191_4
.Lfunc_end191:
	.size	halide_device_malloc_legacy, .Lfunc_end191-halide_device_malloc_legacy
                                        // -- End function
	.section	.text.halide_device_free_legacy,"ax",@progbits
	.weak	halide_device_free_legacy // -- Begin function halide_device_free_legacy
	.p2align	2
	.type	halide_device_free_legacy,@function
halide_device_free_legacy:              // @halide_device_free_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB192_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB192_3
// %bb.2:                               // %lor.rhs4
	add	x1, sp, #64             // =64
	mov	x0, x20
	bl	halide_device_free
	cbz	w0, .LBB192_4
.LBB192_3:
	mov	w0, #1
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB192_4:                              // %lor.rhs10
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end192:
	.size	halide_device_free_legacy, .Lfunc_end192-halide_device_free_legacy
                                        // -- End function
	.section	.text.halide_profiler_shutdown,"ax",@progbits
	.weak	halide_profiler_shutdown // -- Begin function halide_profiler_shutdown
	.p2align	2
	.type	halide_profiler_shutdown,@function
halide_profiler_shutdown:               // @halide_profiler_shutdown
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	halide_profiler_get_state
	mov	x19, x0
	ldr	x0, [x0, #40]
	cbz	x0, .LBB193_2
// %bb.1:                               // %if.end
	mov	w8, #-2
	str	w8, [x19, #16]
	bl	halide_join_thread
	mov	w8, #-1
	mov	x0, xzr
	mov	x1, x19
	str	xzr, [x19, #40]
	str	w8, [x19, #16]
	bl	halide_profiler_report_unlocked
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	b	halide_profiler_reset_unlocked
.LBB193_2:                              // %cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end193:
	.size	halide_profiler_shutdown, .Lfunc_end193-halide_profiler_shutdown
                                        // -- End function
	.section	.text.halide_profiler_get_state,"ax",@progbits
	.weak	halide_profiler_get_state // -- Begin function halide_profiler_get_state
	.p2align	2
	.type	halide_profiler_get_state,@function
halide_profiler_get_state:              // @halide_profiler_get_state
// %bb.0:                               // %entry
	adrp	x0, _ZZ25halide_profiler_get_stateE1s
	add	x0, x0, :lo12:_ZZ25halide_profiler_get_stateE1s
	ret
.Lfunc_end194:
	.size	halide_profiler_get_state, .Lfunc_end194-halide_profiler_get_state
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               // -- Begin function halide_profiler_report_unlocked
.LCPI195_0:
	.xword	4457293557087583675     // double 1.0E-10
	.section	.text.halide_profiler_report_unlocked,"ax",@progbits
	.weak	halide_profiler_report_unlocked
	.p2align	2
	.type	halide_profiler_report_unlocked,@function
halide_profiler_report_unlocked:        // @halide_profiler_report_unlocked
// %bb.0:                               // %entry
	stp	d9, d8, [sp, #-112]!    // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	sub	sp, sp, #1072           // =1072
	strb	wzr, [sp, #1063]
	ldr	x27, [x1, #24]
	add	x23, sp, #40            // =40
	mov	w8, #1
	sub	x8, x8, x23
	stp	x8, x0, [sp, #24]       // 16-byte Folded Spill
	cbz	x27, .LBB195_50
// %bb.1:                               // %for.body.preheader
	adrp	x8, .LCPI195_0
	ldr	d8, [x8, :lo12:.LCPI195_0]
	adrp	x22, .L.str.3.215
	adrp	x28, .L.str.20.189
	add	x20, x23, #1023         // =1023
	add	x22, x22, :lo12:.L.str.3.215
	mov	w25, #72
	add	x28, x28, :lo12:.L.str.20.189
	add	x21, sp, #40            // =40
	ldr	w8, [x27, #80]
	cbnz	w8, .LBB195_4
.LBB195_2:                              // %cleanup191
                                        // =>This Inner Loop Header: Depth=1
	ldr	x27, [x27, #64]
	cbz	x27, .LBB195_51
// %bb.3:                               // %for.body
                                        //   in Loop: Header=BB195_2 Depth=1
	ldr	w8, [x27, #80]
	cbz	w8, .LBB195_2
.LBB195_4:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit
	ldr	x8, [x27]
	strb	wzr, [sp, #40]
	ldp	x21, x2, [x27, #40]
	ldr	x19, [x27, #32]
	ucvtf	s0, x8
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s9, s0, s1
	add	x0, sp, #40             // =40
	mov	x1, x20
	cbnz	x2, .LBB195_6
// %bb.5:                               // %if.then.i290
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
.LBB195_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	mov	x1, x20
	mov	x2, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.8.177
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.8.177
	bl	halide_string_to_string
	fcvt	d0, s9
	mov	x1, x20
	mov	w2, wzr
	bl	halide_double_to_string
	adrp	x2, .L.str.9.178
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.9.178
	bl	halide_string_to_string
	adrp	x2, .L.str.10.179
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.10.179
	bl	halide_string_to_string
	ldrsw	x2, [x27, #84]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.11.180
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.11.180
	bl	halide_string_to_string
	ldrsw	x2, [x27, #80]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.12.181
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.12.181
	bl	halide_string_to_string
	ldr	s0, [x27, #80]
	mov	x1, x20
	mov	w2, wzr
	scvtf	s0, s0
	fdiv	s0, s9, s0
	fcvt	d0, s0
	bl	halide_double_to_string
	adrp	x2, .L.str.13.182
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.13.182
	bl	halide_string_to_string
	cmp	x19, x21
	stp	x19, x21, [sp, #8]      // 16-byte Folded Spill
	b.eq	.LBB195_8
// %bb.7:                               // %if.then31
	ucvtf	d1, x21
	ucvtf	d0, x19
	fadd	d1, d1, d8
	adrp	x2, .L.str.14.183
	fdiv	d0, d0, d1
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.14.183
	fcvt	s9, d0
	bl	halide_string_to_string
	fcvt	d0, s9
	mov	x1, x20
	mov	w2, wzr
	bl	halide_double_to_string
	mov	x1, x20
	mov	x2, x22
	bl	halide_string_to_string
.LBB195_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit401
	adrp	x2, .L.str.15.184
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.15.184
	bl	halide_string_to_string
	ldrsw	x2, [x27, #88]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.16.185
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.16.185
	bl	halide_string_to_string
	ldr	x2, [x27, #16]
	mov	w3, #1
	mov	x1, x20
	bl	halide_uint64_to_string
	adrp	x2, .L.str.17.186
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.17.186
	bl	halide_string_to_string
	ldp	x8, x19, [sp, #24]      // 16-byte Folded Reload
	mov	x21, x0
	add	x1, sp, #40             // =40
	add	x2, x8, x0
	mov	x0, x19
	bl	halide_msan_annotate_memory_is_initialized
	add	x1, sp, #40             // =40
	mov	x0, x19
	bl	halide_print
	ldr	x8, [x27]
	cbnz	x8, .LBB195_10
// %bb.9:                               // %lor.end
	ldr	x8, [x27, #24]
	cbz	x8, .LBB195_46
.LBB195_10:                             // %for.cond62.preheader
	ldr	w8, [x27, #72]
	cmp	w8, #1                  // =1
	b.lt	.LBB195_2
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit407.lr.ph
	mov	x26, xzr
	strb	wzr, [sp, #40]
	ldr	x21, [x27, #56]
	madd	x24, x26, x25, x21
	cbnz	x26, .LBB195_15
	b	.LBB195_14
.LBB195_12:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit
	mov	x1, x20
	mov	x2, x22
	bl	halide_string_to_string
	ldp	x8, x19, [sp, #24]      // 16-byte Folded Reload
	mov	x21, x0
	add	x1, sp, #40             // =40
	add	x2, x8, x0
	mov	x0, x19
	bl	halide_msan_annotate_memory_is_initialized
	add	x1, sp, #40             // =40
	mov	x0, x19
	bl	halide_print
	ldr	w8, [x27, #72]
	add	x26, x26, #1            // =1
	cmp	x26, w8, sxtw
	b.ge	.LBB195_2
.LBB195_13:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit407
	strb	wzr, [sp, #40]
	ldr	x21, [x27, #56]
	madd	x24, x26, x25, x21
	cbnz	x26, .LBB195_15
.LBB195_14:                             // %land.lhs.true
	ldr	x9, [x24]
	cbz	x9, .LBB195_45
.LBB195_15:                             // %if.end75
	adrp	x2, .L.str.18.187
	add	x0, sp, #40             // =40
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.18.187
	bl	halide_string_to_string
	madd	x8, x26, x25, x21
	ldr	x2, [x8, #56]
	cbz	x2, .LBB195_17
// %bb.16:                              // %if.else.i420
	mov	x1, x20
	b	.LBB195_18
.LBB195_17:                             // %if.then.i418
	adrp	x2, .L.str.112
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.112
.LBB195_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EElsEPKc.exit423
	bl	halide_string_to_string
	adrp	x2, .L.str.19.188
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.19.188
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #24                 // =24
	b.hi	.LBB195_20
.LBB195_19:                             // %while.body
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #25                 // =25
	b.lo	.LBB195_19
.LBB195_20:                             // %while.end
	ldr	x8, [x24]
	ldr	s0, [x27, #80]
	mov	x1, x20
	mov	w2, wzr
	ucvtf	s1, x8
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	scvtf	s0, s0
	fmov	s2, w8
	fmul	s0, s0, s2
	fdiv	s0, s1, s0
	fcvt	d0, s0
	bl	halide_double_to_string
	cbz	x0, .LBB195_22
// %bb.21:                              // %if.then.i446
	sub	x8, x0, #3              // =3
	cmp	x8, x23
	csel	x0, x23, x8, lo
	strb	wzr, [x0]
.LBB195_22:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5eraseEi.exit
	adrp	x2, .L.str.21.190
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.21.190
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #34                 // =34
	b.hi	.LBB195_24
.LBB195_23:                             // %while.body95
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #35                 // =35
	b.lo	.LBB195_23
.LBB195_24:                             // %while.end97
	ldr	x8, [x27]
	cbz	x8, .LBB195_26
// %bb.25:                              // %if.then100
	ldr	x9, [x24]
	mov	w10, #100
	mul	x9, x9, x10
	udiv	x19, x9, x8
	b	.LBB195_27
.LBB195_26:
	mov	x19, xzr
.LBB195_27:                             // %if.end106
	adrp	x2, .L.str.22.191
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.22.191
	bl	halide_string_to_string
	sxtw	x2, w19
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.23.192
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.23.192
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #42                 // =42
	b.hi	.LBB195_29
.LBB195_28:                             // %while.body114
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #43                 // =43
	b.lo	.LBB195_28
.LBB195_29:                             // %while.end116.loopexit
	ldp	x8, x9, [sp, #8]        // 16-byte Folded Reload
	cmp	x8, x9
	b.ne	.LBB195_37
// %bb.30:
	mov	w22, #58
	madd	x19, x26, x25, x21
	ldrsw	x8, [x19, #64]!
	cbz	w8, .LBB195_42
.LBB195_31:                             // %if.then140
	madd	x9, x26, x25, x21
	ldr	x9, [x9, #24]
	udiv	x24, x9, x8
	mov	w8, #72
	madd	x25, x26, x8, x21
	ldr	x8, [x25, #16]!
	cbz	x8, .LBB195_43
.LBB195_32:                             // %if.then149
	adrp	x2, .L.str.25.194
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.25.194
	bl	halide_string_to_string
	ldr	x2, [x25]
	mov	w3, #1
	mov	x1, x20
	bl	halide_uint64_to_string
	sub	x8, x0, x23
	mov	w25, #72
	mov	x1, x20
	cmp	x8, x22
	b.hs	.LBB195_34
.LBB195_33:                             // %while.body157
                                        // =>This Inner Loop Header: Depth=1
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	mov	x1, x20
	cmp	x8, x22
	b.lo	.LBB195_33
.LBB195_34:                             // %while.end159
	adrp	x2, .L.str.26.195
	add	x2, x2, :lo12:.L.str.26.195
	bl	halide_string_to_string
	ldrsw	x2, [x19]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	add	x19, x22, #15           // =15
	adrp	x22, .L.str.3.215
	sub	x8, x0, x23
	add	x22, x22, :lo12:.L.str.3.215
	mov	x1, x20
	cmp	x8, x19
	b.hs	.LBB195_36
.LBB195_35:                             // %while.body167
                                        // =>This Inner Loop Header: Depth=1
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	mov	x1, x20
	cmp	x8, x19
	b.lo	.LBB195_35
.LBB195_36:                             // %while.end169
	adrp	x2, .L.str.27.196
	add	x2, x2, :lo12:.L.str.27.196
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	madd	x19, x26, x25, x21
	ldr	x8, [x19, #32]!
	cbnz	x8, .LBB195_44
	b	.LBB195_12
.LBB195_37:                             // %if.then118
	madd	x8, x26, x25, x21
	ldp	d0, d1, [x8, #40]
	adrp	x2, .L.str.24.193
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.24.193
	ucvtf	d1, d1
	ucvtf	d0, d0
	fadd	d1, d1, d8
	fdiv	d0, d0, d1
	fcvt	s9, d0
	bl	halide_string_to_string
	fcvt	d0, s9
	mov	x1, x20
	mov	w2, wzr
	bl	halide_double_to_string
	cbz	x0, .LBB195_39
// %bb.38:                              // %if.then.i510
	sub	x8, x0, #3              // =3
	cmp	x8, x23
	csel	x0, x23, x8, lo
	strb	wzr, [x0]
.LBB195_39:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5eraseEi.exit511
	sub	x8, x0, x23
	cmp	x8, #57                 // =57
	b.hi	.LBB195_41
.LBB195_40:                             // %while.body133
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #58                 // =58
	b.lo	.LBB195_40
.LBB195_41:                             // %if.end136.loopexit
	mov	w22, #73
	madd	x19, x26, x25, x21
	ldrsw	x8, [x19, #64]!
	cbnz	w8, .LBB195_31
.LBB195_42:
	mov	x24, xzr
	mov	w8, #72
	madd	x25, x26, x8, x21
	ldr	x8, [x25, #16]!
	cbnz	x8, .LBB195_32
.LBB195_43:
	adrp	x22, .L.str.3.215
	add	x22, x22, :lo12:.L.str.3.215
	mov	w25, #72
	madd	x19, x26, x25, x21
	ldr	x8, [x19, #32]!
	cbz	x8, .LBB195_12
.LBB195_44:                             // %if.then175
	adrp	x2, .L.str.28.197
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.28.197
	bl	halide_string_to_string
	ldr	x2, [x19]
	mov	w3, #1
	mov	x1, x20
	bl	halide_uint64_to_string
	b	.LBB195_12
.LBB195_45:
	add	x21, sp, #40            // =40
	add	x26, x26, #1            // =1
	cmp	x26, w8, sxtw
	b.lt	.LBB195_13
	b	.LBB195_2
.LBB195_46:                             // %for.cond50.preheader
	ldrsw	x8, [x27, #72]
	cmp	w8, #1                  // =1
	b.lt	.LBB195_2
// %bb.47:                              // %for.body53.lr.ph
	ldr	x9, [x27, #56]
	add	x9, x9, #32             // =32
.LBB195_48:                             // %for.body53
                                        // =>This Inner Loop Header: Depth=1
	ldr	x10, [x9]
	cbnz	x10, .LBB195_10
// %bb.49:                              // %for.cond50
                                        //   in Loop: Header=BB195_48 Depth=1
	subs	x8, x8, #1              // =1
	add	x9, x9, #72             // =72
	b.ne	.LBB195_48
	b	.LBB195_2
.LBB195_50:
	add	x21, sp, #40            // =40
.LBB195_51:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EED2Ev.exit
	ldp	x8, x0, [sp, #24]       // 16-byte Folded Reload
	add	x1, sp, #40             // =40
	add	x2, x21, x8
	bl	halide_msan_annotate_memory_is_initialized
	add	sp, sp, #1072           // =1072
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	d9, d8, [sp], #112      // 16-byte Folded Reload
	ret
.Lfunc_end195:
	.size	halide_profiler_report_unlocked, .Lfunc_end195-halide_profiler_report_unlocked
                                        // -- End function
	.section	.text.halide_profiler_reset_unlocked,"ax",@progbits
	.weak	halide_profiler_reset_unlocked // -- Begin function halide_profiler_reset_unlocked
	.p2align	2
	.type	halide_profiler_reset_unlocked,@function
halide_profiler_reset_unlocked:         // @halide_profiler_reset_unlocked
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x20, [x0, #24]
	mov	x19, x0
	add	x29, sp, #16            // =16
	cbz	x20, .LBB196_2
.LBB196_1:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x20, #64]
	str	x8, [x19, #24]
	ldr	x0, [x20, #56]
	bl	free
	mov	x0, x20
	bl	free
	ldr	x20, [x19, #24]
	cbnz	x20, .LBB196_1
.LBB196_2:                              // %while.end
	str	wzr, [x19, #12]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end196:
	.size	halide_profiler_reset_unlocked, .Lfunc_end196-halide_profiler_reset_unlocked
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy // -- Begin function _ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,@function
_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy: // @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	w20, w1
	mov	x23, x0
	bl	halide_profiler_get_state
	ldr	x19, [x0, #24]
	mov	x22, x0
	cbnz	x19, .LBB197_8
.LBB197_1:                              // %for.end.critedge
	mov	w0, #96
	bl	malloc
	mov	x19, x0
	cbz	x0, .LBB197_11
// %bb.2:                               // %if.end7
	ldr	x8, [x22, #24]
	str	x23, [x19, #48]
	mov	w9, #72
	movi	v0.2d, #0000000000000000
	str	x8, [x19, #64]
	ldr	w8, [x22, #12]
	smull	x0, w20, w9
	str	xzr, [x19, #80]
	str	wzr, [x19, #88]
	stp	q0, q0, [x19]
	stp	w20, w8, [x19, #72]
	str	q0, [x19, #32]
	bl	malloc
	str	x0, [x19, #56]
	cbz	x0, .LBB197_10
// %bb.3:                               // %for.cond17.preheader
	cmp	w20, #1                 // =1
	b.lt	.LBB197_6
// %bb.4:                               // %for.body20.lr.ph
	mov	w8, w20
	add	x9, x0, #64             // =64
	movi	v0.2d, #0000000000000000
.LBB197_5:                              // %for.body20
                                        // =>This Inner Loop Header: Depth=1
	stur	xzr, [x9, #-64]
	ldr	x10, [x21], #8
	subs	x8, x8, #1              // =1
	str	wzr, [x9]
	stur	q0, [x9, #-56]
	stur	q0, [x9, #-40]
	stur	q0, [x9, #-24]
	stur	x10, [x9, #-8]
	add	x9, x9, #72             // =72
	b.ne	.LBB197_5
.LBB197_6:                              // %for.cond.cleanup19
	ldr	w8, [x22, #12]
	str	x19, [x22, #24]
	add	w8, w8, w20
	str	w8, [x22, #12]
	b	.LBB197_11
.LBB197_7:                              // %for.inc
                                        //   in Loop: Header=BB197_8 Depth=1
	ldr	x19, [x19, #64]
	cbz	x19, .LBB197_1
.LBB197_8:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #48]
	cmp	x8, x23
	b.ne	.LBB197_7
// %bb.9:                               // %land.lhs.true
                                        //   in Loop: Header=BB197_8 Depth=1
	ldr	w8, [x19, #72]
	cmp	w8, w20
	b.ne	.LBB197_7
	b	.LBB197_11
.LBB197_10:                             // %if.then15
	mov	x0, x19
	bl	free
	mov	x19, xzr
.LBB197_11:                             // %cleanup62
	mov	x0, x19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end197:
	.size	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy, .Lfunc_end197-_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi // -- Begin function _ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,@function
_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi: // @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
// %bb.0:                               // %entry
	ldr	x9, [x0, #24]
                                        // kill: def $w3 killed $w3 def $x3
	cbz	x9, .LBB198_8
// %bb.1:                               // %for.body.preheader
	mov	x10, xzr
	mov	x11, x9
	mov	x8, x11
	ldrsw	x11, [x11, #76]
	cmp	w11, w1
	b.le	.LBB198_4
.LBB198_2:                              // %if.end23
                                        // =>This Inner Loop Header: Depth=1
	ldr	x11, [x8, #64]
	mov	x10, x8
	cbz	x11, .LBB198_8
// %bb.3:                               // %for.body
                                        //   in Loop: Header=BB198_2 Depth=1
	mov	x8, x11
	ldrsw	x11, [x11, #76]
	cmp	w11, w1
	b.gt	.LBB198_2
.LBB198_4:                              // %land.lhs.true
	ldr	w12, [x8, #72]
	add	w12, w12, w11
	cmp	w12, w1
	b.le	.LBB198_2
// %bb.5:                               // %if.then
	cbz	x10, .LBB198_7
// %bb.6:                               // %if.then4
	ldr	x12, [x8, #64]
	str	x12, [x10, #64]
	str	x9, [x8, #64]
	str	x8, [x0, #24]
.LBB198_7:                              // %if.end
	ldr	x9, [x8, #56]
	mov	w10, #72
	mneg	x11, x11, x10
	sxtw	x13, w3
	smaddl	x9, w1, w10, x9
	add	x9, x9, x11
	ldr	x10, [x9]
	ldp	x11, x12, [x9, #40]
	add	x10, x10, x2
	add	x11, x11, x13
	add	x12, x12, #1            // =1
	str	x10, [x9]
	stp	x11, x12, [x9, #40]
	ldr	x9, [x8]
	ldr	w10, [x8, #84]
	ldp	x11, x12, [x8, #32]
	add	x9, x9, x2
	add	w10, w10, #1            // =1
	add	x11, x11, x13
	add	x12, x12, #1            // =1
	str	x9, [x8]
	str	w10, [x8, #84]
	stp	x11, x12, [x8, #32]
.LBB198_8:                              // %cleanup25
	ret
.Lfunc_end198:
	.size	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi, .Lfunc_end198-_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv // -- Begin function _ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,@function
_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv: // @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
.LBB199_1:                              // %entry
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x19, #16]
	cmn	w8, #2                  // =2
	b.eq	.LBB199_9
// %bb.2:                               // %while.body
                                        //   in Loop: Header=BB199_1 Depth=1
	mov	x0, xzr
	bl	halide_current_time_ns
	mov	x20, x0
	ldr	x8, [x19, #32]
	cbnz	x8, .LBB199_4
	b	.LBB199_5
.LBB199_3:                              // %if.end14
                                        //   in Loop: Header=BB199_1 Depth=1
	ldr	w20, [x19, #8]
	mov	x0, x19
	bl	halide_mutex_unlock
	mov	x0, xzr
	mov	w1, w20
	bl	halide_sleep_ms
	mov	x0, x19
	bl	halide_mutex_lock
	mov	x20, x21
	ldr	x8, [x19, #32]
	cbz	x8, .LBB199_5
.LBB199_4:                              // %if.then
                                        //   in Loop: Header=BB199_1 Depth=1
	add	x0, sp, #12             // =12
	add	x1, sp, #8              // =8
	blr	x8
	b	.LBB199_6
.LBB199_5:                              // %if.else
                                        //   in Loop: Header=BB199_1 Depth=1
	ldr	w8, [x19, #16]
	str	w8, [sp, #12]
	ldr	w8, [x19, #20]
	str	w8, [sp, #8]
.LBB199_6:                              // %if.end
                                        //   in Loop: Header=BB199_1 Depth=1
	mov	x0, xzr
	bl	halide_current_time_ns
	ldr	w1, [sp, #12]
	cmn	w1, #2                  // =2
	b.eq	.LBB199_1
// %bb.7:                               // %if.else10
                                        //   in Loop: Header=BB199_1 Depth=1
	mov	x21, x0
	tbnz	w1, #31, .LBB199_3
// %bb.8:                               // %if.then12
                                        //   in Loop: Header=BB199_1 Depth=1
	ldr	w3, [sp, #8]
	sub	x2, x21, x20
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	b	.LBB199_3
.LBB199_9:                              // %while.end19
	mov	x0, x19
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end199:
	.size	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, .Lfunc_end199-_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
                                        // -- End function
	.section	.text.halide_profiler_get_pipeline_state,"ax",@progbits
	.weak	halide_profiler_get_pipeline_state // -- Begin function halide_profiler_get_pipeline_state
	.p2align	2
	.type	halide_profiler_get_pipeline_state,@function
halide_profiler_get_pipeline_state:     // @halide_profiler_get_pipeline_state
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x21, x0
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
	ldr	x20, [x19, #24]
	cbz	x20, .LBB200_3
.LBB200_1:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x20, #48]
	cmp	x8, x21
	b.eq	.LBB200_3
// %bb.2:                               // %for.inc
                                        //   in Loop: Header=BB200_1 Depth=1
	ldr	x20, [x20, #64]
	cbnz	x20, .LBB200_1
.LBB200_3:                              // %cleanup
	mov	x0, x19
	bl	halide_mutex_unlock
	mov	x0, x20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end200:
	.size	halide_profiler_get_pipeline_state, .Lfunc_end200-halide_profiler_get_pipeline_state
                                        // -- End function
	.section	.text.halide_profiler_pipeline_start,"ax",@progbits
	.weak	halide_profiler_pipeline_start // -- Begin function halide_profiler_pipeline_start
	.p2align	2
	.type	halide_profiler_pipeline_start,@function
halide_profiler_pipeline_start:         // @halide_profiler_pipeline_start
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	w22, w2
	mov	x23, x1
	mov	x20, x0
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
	ldr	x8, [x19, #40]
	cbnz	x8, .LBB201_2
// %bb.1:                               // %if.then
	mov	x0, x20
	bl	halide_start_clock
	adrp	x0, :got:_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv]
	mov	x1, xzr
	bl	halide_spawn_thread
	str	x0, [x19, #40]
.LBB201_2:                              // %if.end
	mov	x0, x23
	mov	w1, w22
	mov	x2, x21
	bl	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
	cbz	x0, .LBB201_4
// %bb.3:                               // %if.end9
	ldp	w20, w8, [x0, #76]
	add	w8, w8, #1              // =1
	str	w8, [x0, #80]
	b	.LBB201_5
.LBB201_4:                              // %if.then7
	mov	x0, x20
	bl	halide_error_out_of_memory
	mov	w20, w0
.LBB201_5:                              // %cleanup
	mov	x0, x19
	bl	halide_mutex_unlock
	mov	w0, w20
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end201:
	.size	halide_profiler_pipeline_start, .Lfunc_end201-halide_profiler_pipeline_start
                                        // -- End function
	.section	.text.halide_profiler_stack_peak_update,"ax",@progbits
	.weak	halide_profiler_stack_peak_update // -- Begin function halide_profiler_stack_peak_update
	.p2align	2
	.type	halide_profiler_stack_peak_update,@function
halide_profiler_stack_peak_update:      // @halide_profiler_stack_peak_update
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x2
	mov	x20, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB202_12
// %bb.1:                               // %if.end
	ldr	w11, [x20, #72]
	cmp	w11, #1                 // =1
	b.lt	.LBB202_13
.LBB202_2:                              // %for.body.lr.ph
	mov	x8, xzr
	mov	w9, #72
	ldr	x10, [x19, x8, lsl #3]
	cbnz	x10, .LBB202_6
	b	.LBB202_4
.LBB202_3:                              // %for.inc.loopexit
	ldr	w11, [x20, #72]
.LBB202_4:                              // %for.inc
                                        // =>This Inner Loop Header: Depth=1
	add	x8, x8, #1              // =1
	cmp	x8, w11, sxtw
	b.ge	.LBB202_13
// %bb.5:                               // %for.body
                                        //   in Loop: Header=BB202_4 Depth=1
	ldr	x10, [x19, x8, lsl #3]
	cbz	x10, .LBB202_4
.LBB202_6:                              // %if.then3
	ldr	x11, [x20, #56]
	madd	x11, x8, x9, x11
	ldr	x12, [x11, #32]!
	cmp	x12, x10
	b.lo	.LBB202_10
	b	.LBB202_3
.LBB202_7:                              // %cmpxchg.nostore
                                        //   in Loop: Header=BB202_10 Depth=1
	clrex
.LBB202_8:                              // %cmpxchg.end
                                        //   in Loop: Header=BB202_10 Depth=1
	cmp	x12, x13
	mov	x12, x13
	b.eq	.LBB202_3
// %bb.9:                               // %while.cond.i
                                        //   in Loop: Header=BB202_10 Depth=1
	cmp	x12, x10
	b.hs	.LBB202_3
.LBB202_10:                             // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x13, [x11]
	cmp	x13, x12
	b.ne	.LBB202_7
// %bb.11:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB202_10 Depth=1
	stlxr	w14, x10, [x11]
	cbnz	w14, .LBB202_10
	b	.LBB202_8
.LBB202_12:                             // %if.then
	adrp	x1, .L.str.198
	add	x1, x1, :lo12:.L.str.198
	bl	halide_print
	bl	abort
	ldr	w11, [x20, #72]
	cmp	w11, #1                 // =1
	b.ge	.LBB202_2
.LBB202_13:                             // %for.cond.cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end202:
	.size	halide_profiler_stack_peak_update, .Lfunc_end202-halide_profiler_stack_peak_update
                                        // -- End function
	.section	.text.halide_profiler_memory_allocate,"ax",@progbits
	.weak	halide_profiler_memory_allocate // -- Begin function halide_profiler_memory_allocate
	.p2align	2
	.type	halide_profiler_memory_allocate,@function
halide_profiler_memory_allocate:        // @halide_profiler_memory_allocate
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x3, .LBB203_29
// %bb.1:                               // %if.end
	mov	x19, x3
	mov	w21, w2
	mov	x20, x1
	mov	x22, x0
	cbz	x1, .LBB203_30
// %bb.2:                               // %if.end3
	tbnz	w21, #31, .LBB203_31
.LBB203_3:                              // %if.end6
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.gt	.LBB203_5
.LBB203_4:                              // %if.then8
	adrp	x1, .L.str.3.201
	add	x1, x1, :lo12:.L.str.3.201
	mov	x0, x22
	bl	halide_print
	bl	abort
.LBB203_5:                              // %if.end9
	ldr	x8, [x20, #56]
	sxtw	x9, w21
	add	x10, x20, #88           // =88
.LBB203_6:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w11, [x10]
	add	w11, w11, #1            // =1
	stlxr	w12, w11, [x10]
	cbnz	w12, .LBB203_6
// %bb.7:                               // %atomicrmw.end
	add	x10, x20, #24           // =24
.LBB203_8:                              // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x10]
	add	x11, x11, x19
	stlxr	w12, x11, [x10]
	cbnz	w12, .LBB203_8
// %bb.9:                               // %atomicrmw.end1
	add	x11, x20, #8            // =8
.LBB203_10:                             // %atomicrmw.start6
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x10, [x11]
	add	x10, x10, x19
	stlxr	w12, x10, [x11]
	cbnz	w12, .LBB203_10
// %bb.11:                              // %atomicrmw.end5
	ldr	x11, [x20, #16]!
	cmp	x11, x10
	b.lo	.LBB203_15
	b	.LBB203_17
.LBB203_12:                             // %cmpxchg.nostore
                                        //   in Loop: Header=BB203_15 Depth=1
	clrex
.LBB203_13:                             // %cmpxchg.end
                                        //   in Loop: Header=BB203_15 Depth=1
	cmp	x11, x12
	mov	x11, x12
	b.eq	.LBB203_17
// %bb.14:                              // %while.cond.i
                                        //   in Loop: Header=BB203_15 Depth=1
	cmp	x11, x10
	b.hs	.LBB203_17
.LBB203_15:                             // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x12, [x20]
	cmp	x12, x11
	b.ne	.LBB203_12
// %bb.16:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB203_15 Depth=1
	stlxr	w13, x10, [x20]
	cbnz	w13, .LBB203_15
	b	.LBB203_13
.LBB203_17:                             // %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit
	mov	w10, #72
	madd	x10, x9, x10, x8
	add	x10, x10, #64           // =64
.LBB203_18:                             // %atomicrmw.start10
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w11, [x10]
	add	w11, w11, #1            // =1
	stlxr	w12, w11, [x10]
	cbnz	w12, .LBB203_18
// %bb.19:                              // %atomicrmw.end9
	mov	w10, #72
	madd	x10, x9, x10, x8
	add	x10, x10, #24           // =24
.LBB203_20:                             // %atomicrmw.start14
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x10]
	add	x11, x11, x19
	stlxr	w12, x11, [x10]
	cbnz	w12, .LBB203_20
// %bb.21:                              // %atomicrmw.end13
	mov	w10, #72
	madd	x10, x9, x10, x8
	add	x11, x10, #8            // =8
.LBB203_22:                             // %atomicrmw.start18
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x10, [x11]
	add	x10, x10, x19
	stlxr	w12, x10, [x11]
	cbnz	w12, .LBB203_22
// %bb.23:                              // %atomicrmw.end17
	mov	w11, #72
	madd	x8, x9, x11, x8
	ldr	x9, [x8, #16]!
	cmp	x9, x10
	b.lo	.LBB203_27
	b	.LBB203_29
.LBB203_24:                             // %cmpxchg.nostore23
                                        //   in Loop: Header=BB203_27 Depth=1
	clrex
.LBB203_25:                             // %cmpxchg.end21
                                        //   in Loop: Header=BB203_27 Depth=1
	cmp	x9, x11
	mov	x9, x11
	b.eq	.LBB203_29
// %bb.26:                              // %while.cond.i37
                                        //   in Loop: Header=BB203_27 Depth=1
	cmp	x9, x10
	b.hs	.LBB203_29
.LBB203_27:                             // %cmpxchg.start28
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x8]
	cmp	x11, x9
	b.ne	.LBB203_24
// %bb.28:                              // %cmpxchg.trystore26
                                        //   in Loop: Header=BB203_27 Depth=1
	stlxr	w12, x10, [x8]
	cbnz	w12, .LBB203_27
	b	.LBB203_25
.LBB203_29:                             // %return
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB203_30:                             // %if.then2
	adrp	x1, .L.str.1.199
	add	x1, x1, :lo12:.L.str.1.199
	mov	x0, x22
	bl	halide_print
	bl	abort
	tbz	w21, #31, .LBB203_3
.LBB203_31:                             // %if.then5
	adrp	x1, .L.str.2.200
	add	x1, x1, :lo12:.L.str.2.200
	mov	x0, x22
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.le	.LBB203_4
	b	.LBB203_5
.Lfunc_end203:
	.size	halide_profiler_memory_allocate, .Lfunc_end203-halide_profiler_memory_allocate
                                        // -- End function
	.section	.text.halide_profiler_memory_free,"ax",@progbits
	.weak	halide_profiler_memory_free // -- Begin function halide_profiler_memory_free
	.p2align	2
	.type	halide_profiler_memory_free,@function
halide_profiler_memory_free:            // @halide_profiler_memory_free
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x3, .LBB204_9
// %bb.1:                               // %if.end
	mov	x19, x3
	mov	w21, w2
	mov	x20, x1
	mov	x22, x0
	cbz	x1, .LBB204_10
// %bb.2:                               // %if.end3
	tbnz	w21, #31, .LBB204_11
.LBB204_3:                              // %if.end6
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.gt	.LBB204_5
.LBB204_4:                              // %if.then8
	adrp	x1, .L.str.6.204
	add	x1, x1, :lo12:.L.str.6.204
	mov	x0, x22
	bl	halide_print
	bl	abort
.LBB204_5:                              // %if.end9
	ldr	x8, [x20, #56]
	sxtw	x9, w21
	add	x10, x20, #8            // =8
.LBB204_6:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x10]
	sub	x11, x11, x19
	stlxr	w12, x11, [x10]
	cbnz	w12, .LBB204_6
// %bb.7:                               // %atomicrmw.end
	mov	w10, #72
	madd	x8, x9, x10, x8
	add	x8, x8, #8              // =8
.LBB204_8:                              // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x9, [x8]
	sub	x9, x9, x19
	stlxr	w10, x9, [x8]
	cbnz	w10, .LBB204_8
.LBB204_9:                              // %return
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB204_10:                             // %if.then2
	adrp	x1, .L.str.4.202
	add	x1, x1, :lo12:.L.str.4.202
	mov	x0, x22
	bl	halide_print
	bl	abort
	tbz	w21, #31, .LBB204_3
.LBB204_11:                             // %if.then5
	adrp	x1, .L.str.5.203
	add	x1, x1, :lo12:.L.str.5.203
	mov	x0, x22
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.le	.LBB204_4
	b	.LBB204_5
.Lfunc_end204:
	.size	halide_profiler_memory_free, .Lfunc_end204-halide_profiler_memory_free
                                        // -- End function
	.section	.text.halide_profiler_report,"ax",@progbits
	.weak	halide_profiler_report  // -- Begin function halide_profiler_report
	.p2align	2
	.type	halide_profiler_report,@function
halide_profiler_report:                 // @halide_profiler_report
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_profiler_get_state
	mov	x20, x0
	bl	halide_mutex_lock
	mov	x0, x19
	mov	x1, x20
	bl	halide_profiler_report_unlocked
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x20
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end205:
	.size	halide_profiler_report, .Lfunc_end205-halide_profiler_report
                                        // -- End function
	.section	.text.halide_profiler_reset,"ax",@progbits
	.weak	halide_profiler_reset   // -- Begin function halide_profiler_reset
	.p2align	2
	.type	halide_profiler_reset,@function
halide_profiler_reset:                  // @halide_profiler_reset
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
	mov	x0, x19
	bl	halide_profiler_reset_unlocked
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end206:
	.size	halide_profiler_reset, .Lfunc_end206-halide_profiler_reset
                                        // -- End function
	.section	.text.halide_profiler_pipeline_end,"ax",@progbits
	.weak	halide_profiler_pipeline_end // -- Begin function halide_profiler_pipeline_end
	.p2align	2
	.type	halide_profiler_pipeline_end,@function
halide_profiler_pipeline_end:           // @halide_profiler_pipeline_end
// %bb.0:                               // %entry
	mov	w8, #-1
	str	w8, [x1, #16]
	ret
.Lfunc_end207:
	.size	halide_profiler_pipeline_end, .Lfunc_end207-halide_profiler_pipeline_end
                                        // -- End function
	.section	.text.halide_msan_annotate_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_memory_is_initialized // -- Begin function halide_msan_annotate_memory_is_initialized
	.p2align	2
	.type	halide_msan_annotate_memory_is_initialized,@function
halide_msan_annotate_memory_is_initialized: // @halide_msan_annotate_memory_is_initialized
// %bb.0:                               // %entry
	mov	w0, wzr
	ret
.Lfunc_end208:
	.size	halide_msan_annotate_memory_is_initialized, .Lfunc_end208-halide_msan_annotate_memory_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized // -- Begin function halide_msan_annotate_buffer_is_initialized
	.p2align	2
	.type	halide_msan_annotate_buffer_is_initialized,@function
halide_msan_annotate_buffer_is_initialized: // @halide_msan_annotate_buffer_is_initialized
// %bb.0:                               // %entry
	mov	w0, wzr
	ret
.Lfunc_end209:
	.size	halide_msan_annotate_buffer_is_initialized, .Lfunc_end209-halide_msan_annotate_buffer_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized_as_destructor,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized_as_destructor // -- Begin function halide_msan_annotate_buffer_is_initialized_as_destructor
	.p2align	2
	.type	halide_msan_annotate_buffer_is_initialized_as_destructor,@function
halide_msan_annotate_buffer_is_initialized_as_destructor: // @halide_msan_annotate_buffer_is_initialized_as_destructor
// %bb.0:                               // %entry
	ret
.Lfunc_end210:
	.size	halide_msan_annotate_buffer_is_initialized_as_destructor, .Lfunc_end210-halide_msan_annotate_buffer_is_initialized_as_destructor
                                        // -- End function
	.section	.text.halide_default_can_use_target_features,"ax",@progbits
	.weak	halide_default_can_use_target_features // -- Begin function halide_default_can_use_target_features
	.p2align	2
	.type	halide_default_can_use_target_features,@function
halide_default_can_use_target_features: // @halide_default_can_use_target_features
// %bb.0:                               // %entry
	sub	sp, sp, #80             // =80
	str	x21, [sp, #32]          // 8-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	mov	w20, w0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE]
	add	x29, sp, #64            // =64
	mov	x19, x1
	bl	halide_mutex_lock
	adrp	x21, :got:_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE]
	ldrb	w8, [x21]
	cbnz	w8, .LBB211_2
// %bb.1:                               // %if.then
	mov	x8, sp
	bl	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	adrp	x0, :got:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE]
	mov	x1, sp
	mov	w2, #32
	bl	memcpy
	mov	w8, #1
	strb	w8, [x21]
.LBB211_2:                              // %if.end
	adrp	x0, :got:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE]
	bl	halide_mutex_unlock
	cmp	w20, #2                 // =2
	b.eq	.LBB211_4
// %bb.3:                               // %if.then1
	adrp	x1, .L.str.209
	add	x1, x1, :lo12:.L.str.209
	mov	x0, xzr
	bl	halide_error
.LBB211_4:                              // %if.end2
	adrp	x8, :got:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	ldr	x9, [x19]
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE]
	ldr	x10, [x8]
	ands	x9, x10, x9
	b.eq	.LBB211_6
// %bb.5:                               // %if.then7
	ldr	x10, [x8, #16]
	bics	xzr, x9, x10
	b.ne	.LBB211_9
.LBB211_6:                              // %for.inc
	ldr	x9, [x19, #8]
	ldr	x10, [x8, #8]
	ands	x9, x10, x9
	b.eq	.LBB211_8
// %bb.7:                               // %if.then7.1
	ldr	x8, [x8, #24]
	bics	xzr, x9, x8
	b.ne	.LBB211_9
.LBB211_8:                              // %for.inc.1
	mov	w0, #1
	b	.LBB211_10
.LBB211_9:
	mov	w0, wzr
.LBB211_10:                             // %cleanup15
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x21, [sp, #32]          // 8-byte Folded Reload
	add	sp, sp, #80             // =80
	ret
.Lfunc_end211:
	.size	halide_default_can_use_target_features, .Lfunc_end211-halide_default_can_use_target_features
                                        // -- End function
	.section	.text.halide_set_custom_can_use_target_features,"ax",@progbits
	.weak	halide_set_custom_can_use_target_features // -- Begin function halide_set_custom_can_use_target_features
	.p2align	2
	.type	halide_set_custom_can_use_target_features,@function
halide_set_custom_can_use_target_features: // @halide_set_custom_can_use_target_features
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end212:
	.size	halide_set_custom_can_use_target_features, .Lfunc_end212-halide_set_custom_can_use_target_features
                                        // -- End function
	.section	.text.halide_can_use_target_features,"ax",@progbits
	.weak	halide_can_use_target_features // -- Begin function halide_can_use_target_features
	.p2align	2
	.type	halide_can_use_target_features,@function
halide_can_use_target_features:         // @halide_can_use_target_features
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end213:
	.size	halide_can_use_target_features, .Lfunc_end213-halide_can_use_target_features
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv // -- Begin function _ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,@function
_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv: // @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
// %bb.0:                               // %entry
	movi	v0.2d, #0000000000000000
	stp	q0, q0, [x8]
	ret
.Lfunc_end214:
	.size	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv, .Lfunc_end214-_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv // -- Begin function _ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv,@function
_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv: // @_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
// %bb.0:                               // %entry
	ret
.Lfunc_end215:
	.size	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv, .Lfunc_end215-_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv // -- Begin function _ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv,@function
_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv: // @_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
// %bb.0:                               // %entry
	ret
.Lfunc_end216:
	.size	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv, .Lfunc_end216-_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
                                        // -- End function
	.section	.text.halide_hexagon_device_malloc,"ax",@progbits
	.weak	halide_hexagon_device_malloc // -- Begin function halide_hexagon_device_malloc
	.p2align	2
	.type	halide_hexagon_device_malloc,@function
halide_hexagon_device_malloc:           // @halide_hexagon_device_malloc
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x20, x1
	mov	x19, x0
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w22, w0
	cbnz	w0, .LBB217_3
// %bb.1:                               // %if.end
	ldr	x8, [x20]
	cbz	x8, .LBB217_4
.LBB217_2:
	mov	w22, wzr
.LBB217_3:                              // %cleanup69
	mov	w0, w22
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.LBB217_4:                              // %if.end6
	ldr	w8, [x20, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB217_7
// %bb.5:                               // %for.body.lr.ph.i.i
	ldr	x9, [x20, #40]
	cmp	w8, #3                  // =3
	sxtw	x10, w8
	b.hs	.LBB217_8
// %bb.6:
	mov	x12, xzr
	mov	x11, xzr
	b	.LBB217_15
.LBB217_7:                              // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w12, [x20, #33]
	mov	x14, xzr
	mov	w9, #1
	b	.LBB217_33
.LBB217_8:                              // %vector.ph
	and	x12, x10, #0xfffffffffffffffe
	mov	x11, xzr
	mov	x13, xzr
	add	x14, x9, #24            // =24
	mov	x15, x12
	ldur	w17, [x14, #-16]
	ldr	w16, [x14]
                                        // implicit-def: $w18
	cmp	w17, #1                 // =1
	b.ge	.LBB217_11
	b	.LBB217_12
.LBB217_9:                              // %pred.load.continue9
                                        //   in Loop: Header=BB217_12 Depth=1
	sub	w18, w18, #1            // =1
	sub	w0, w0, #1              // =1
	cmp	w17, #0                 // =0
	mul	w17, w18, w17
	mul	w18, w0, w16
	csel	w17, w17, wzr, gt
	cmp	w16, #0                 // =0
	csel	w16, w18, wzr, gt
	add	x11, x11, w17, sxtw
	subs	x15, x15, #2            // =2
	add	x13, x13, w16, sxtw
	add	x14, x14, #32           // =32
	b.eq	.LBB217_14
// %bb.10:                              // %vector.body
                                        //   in Loop: Header=BB217_12 Depth=1
	ldur	w17, [x14, #-16]
	ldr	w16, [x14]
                                        // implicit-def: $w18
	cmp	w17, #1                 // =1
	b.lt	.LBB217_12
.LBB217_11:                             // %pred.load.if
	ldur	w18, [x14, #-20]
.LBB217_12:                             // %pred.load.continue
                                        // =>This Inner Loop Header: Depth=1
	cmp	w16, #1                 // =1
                                        // implicit-def: $w0
	b.lt	.LBB217_9
// %bb.13:                              // %pred.load.if8
                                        //   in Loop: Header=BB217_12 Depth=1
	ldur	w0, [x14, #-4]
	b	.LBB217_9
.LBB217_14:                             // %middle.block
	cmp	x12, x10
	add	x11, x13, x11
	b.eq	.LBB217_19
.LBB217_15:                             // %for.body.i.i.preheader
	sub	x13, x10, x12
	add	x12, x9, x12, lsl #4
	add	x12, x12, #8            // =8
	ldrsw	x14, [x12]
	cmp	w14, #1                 // =1
	b.ge	.LBB217_18
.LBB217_16:                             // %for.inc.i.i
	subs	x13, x13, #1            // =1
	add	x12, x12, #16           // =16
	b.eq	.LBB217_19
.LBB217_17:                             // %for.body.i.i
	ldrsw	x14, [x12]
	cmp	w14, #1                 // =1
	b.lt	.LBB217_16
.LBB217_18:                             // %if.then.i.i
	ldursw	x15, [x12, #-4]
	sub	x15, x15, #1            // =1
	madd	x11, x15, x14, x11
	subs	x13, x13, #1            // =1
	add	x12, x12, #16           // =16
	b.ne	.LBB217_17
.LBB217_19:                             // %for.body.lr.ph.i5.i
	ldrb	w12, [x20, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB217_21
// %bb.20:
	mov	x13, xzr
	mov	x14, xzr
	b	.LBB217_28
.LBB217_21:                             // %vector.ph15
	and	x13, x10, #0xfffffffffffffffe
	mov	x14, xzr
	mov	x15, xzr
	add	x16, x9, #24            // =24
	mov	x17, x13
	ldur	w18, [x16, #-16]
	ldr	w0, [x16]
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB217_25
.LBB217_22:                             // %pred.load.if26
	ldur	w1, [x16, #-20]
                                        // implicit-def: $w2
	tbnz	w0, #31, .LBB217_26
.LBB217_23:                             // %pred.load.continue29
	sub	w1, w1, #1              // =1
	sub	w2, w2, #1              // =1
	mul	w1, w1, w18
	mul	w2, w2, w0
	and	w18, w1, w18, asr #31
	and	w0, w2, w0, asr #31
	subs	x17, x17, #2            // =2
	add	x14, x14, w18, sxtw
	add	x15, x15, w0, sxtw
	add	x16, x16, #32           // =32
	b.eq	.LBB217_27
// %bb.24:                              // %vector.body11
	ldur	w18, [x16, #-16]
	ldr	w0, [x16]
                                        // implicit-def: $w1
	tbnz	w18, #31, .LBB217_22
.LBB217_25:                             // %pred.load.continue27
                                        // implicit-def: $w2
	tbz	w0, #31, .LBB217_23
.LBB217_26:                             // %pred.load.if28
	ldur	w2, [x16, #-4]
	b	.LBB217_23
.LBB217_27:                             // %middle.block12
	cmp	x13, x10
	add	x14, x15, x14
	b.eq	.LBB217_32
.LBB217_28:                             // %for.body.i16.i.preheader
	add	x9, x9, x13, lsl #4
	sub	x10, x10, x13
	add	x9, x9, #8              // =8
	ldrsw	x13, [x9]
	tbnz	w13, #31, .LBB217_31
.LBB217_29:                             // %for.inc.i26.i
	subs	x10, x10, #1            // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB217_32
.LBB217_30:                             // %for.body.i16.i
	ldrsw	x13, [x9]
	tbz	w13, #31, .LBB217_29
.LBB217_31:                             // %if.then.i22.i
	ldursw	x15, [x9, #-4]
	sub	x15, x15, #1            // =1
	madd	x14, x15, x13, x14
	subs	x10, x10, #1            // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB217_30
.LBB217_32:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x9, x11, #1             // =1
.LBB217_33:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x10, x12, #7            // =7
	lsr	x10, x10, #3
	sub	x9, x9, x14
	mul	x21, x9, x10
	cbnz	x21, .LBB217_35
// %bb.34:                              // %if.then9
	adrp	x1, .L.str.65.216
	add	x1, x1, :lo12:.L.str.65.216
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #36]
.LBB217_35:                             // %if.end10
	cmp	w8, #1                  // =1
	add	x21, x21, #128          // =128
	b.lt	.LBB217_40
// %bb.36:                              // %for.body.lr.ph
	adrp	x22, .L.str.66.217
	mov	x23, xzr
	mov	w24, #8
	add	x22, x22, :lo12:.L.str.66.217
	ldr	x9, [x20, #40]
	ldr	w9, [x9, x24]
	tbnz	w9, #31, .LBB217_39
.LBB217_37:                             // %for.inc
	add	x23, x23, #1            // =1
	cmp	x23, w8, sxtw
	add	x24, x24, #16           // =16
	b.ge	.LBB217_40
.LBB217_38:                             // %for.body
	ldr	x9, [x20, #40]
	ldr	w9, [x9, x24]
	tbz	w9, #31, .LBB217_37
.LBB217_39:                             // %if.then13
	mov	x0, x19
	mov	x1, x22
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #36]
	add	x23, x23, #1            // =1
	cmp	x23, w8, sxtw
	add	x24, x24, #16           // =16
	b.lt	.LBB217_38
.LBB217_40:                             // %for.cond.cleanup
	cmp	x21, #4095              // =4095
	b.ls	.LBB217_44
// %bb.41:                              // %if.then20
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE]
	mov	x0, x21
	ldr	x8, [x8]
	blr	x8
	mov	x23, x0
	cbnz	x0, .LBB217_45
// %bb.42:                              // %if.then31
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB217_54
// %bb.43:                              // %if.else.i138
	adrp	x2, .L.str.70.218
	mov	x20, x0
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.70.218
	strb	wzr, [x0, #1023]
	b	.LBB217_53
.LBB217_44:                             // %if.else
	mov	x0, x19
	mov	x1, x21
	bl	halide_malloc
	mov	x23, x0
	cbz	x0, .LBB217_51
.LBB217_45:                             // %if.end49
	mov	x0, x19
	mov	x1, x20
	mov	x2, x23
	mov	x3, x21
	bl	halide_hexagon_wrap_device_handle
	cbz	w0, .LBB217_48
// %bb.46:                              // %if.then52
	mov	w22, w0
	cmp	x21, #1, lsl #12        // =4096
	b.lo	.LBB217_50
// %bb.47:                              // %if.then54
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon9host_freeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon9host_freeE]
	mov	x0, x23
	ldr	x8, [x8]
	blr	x8
	b	.LBB217_3
.LBB217_48:                             // %if.end57
	ldr	x8, [x20, #16]
	cbnz	x8, .LBB217_2
// %bb.49:                              // %if.then59
	mov	w22, wzr
	str	x23, [x20, #16]
	b	.LBB217_3
.LBB217_50:                             // %if.else55
	mov	x0, x19
	mov	x1, x23
	bl	halide_free
	b	.LBB217_3
.LBB217_51:                             // %if.then45
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB217_55
// %bb.52:                              // %if.else.i
	adrp	x2, .L.str.72.219
	mov	x20, x0
	add	x1, x0, #1023           // =1023
	strb	wzr, [x0, #1023]
	add	x2, x2, :lo12:.L.str.72.219
.LBB217_53:                             // %cleanup69
	mov	x0, x20
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB217_57
.LBB217_54:                             // %if.then.i132
	adrp	x2, .L.str.70.218
	add	x2, x2, :lo12:.L.str.70.218
	b	.LBB217_56
.LBB217_55:                             // %if.then.i
	adrp	x2, .L.str.72.219
	add	x2, x2, :lo12:.L.str.72.219
.LBB217_56:                             // %cleanup69
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB217_57:                             // %cleanup69
	bl	halide_free
	mov	w22, #-1
	b	.LBB217_3
.Lfunc_end217:
	.size	halide_hexagon_device_malloc, .Lfunc_end217-halide_hexagon_device_malloc
                                        // -- End function
	.section	.text.halide_hexagon_device_free,"ax",@progbits
	.weak	halide_hexagon_device_free // -- Begin function halide_hexagon_device_free
	.p2align	2
	.type	halide_hexagon_device_free,@function
halide_hexagon_device_free:             // @halide_hexagon_device_free
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x1
	mov	x21, x0
	bl	halide_hexagon_get_device_size
	mov	x22, x0
	mov	x0, x21
	mov	x1, x19
	bl	halide_hexagon_get_device_handle
	mov	x20, x0
	mov	x0, x21
	mov	x1, x19
	bl	halide_hexagon_detach_device_handle
	cmp	x22, #1, lsl #12        // =4096
	b.lo	.LBB218_2
// %bb.1:                               // %if.then
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon9host_freeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon9host_freeE]
	mov	x0, x20
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x19, #16]
	cmp	x8, x20
	b.ne	.LBB218_4
	b	.LBB218_3
.LBB218_2:                              // %if.else
	mov	x0, x21
	mov	x1, x20
	bl	halide_free
	ldr	x8, [x19, #16]
	cmp	x8, x20
	b.ne	.LBB218_4
.LBB218_3:                              // %if.then16
	str	xzr, [x19, #16]
.LBB218_4:                              // %if.end20
	ldr	x8, [x19, #24]
	mov	w0, wzr
	and	x8, x8, #0xfffffffffffffffd
	str	x8, [x19, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end218:
	.size	halide_hexagon_device_free, .Lfunc_end218-halide_hexagon_device_free
                                        // -- End function
	.section	.text.halide_hexagon_device_sync,"ax",@progbits
	.weak	halide_hexagon_device_sync // -- Begin function halide_hexagon_device_sync
	.p2align	2
	.type	halide_hexagon_device_sync,@function
halide_hexagon_device_sync:             // @halide_hexagon_device_sync
// %bb.0:                               // %entry
	mov	w0, wzr
	ret
.Lfunc_end219:
	.size	halide_hexagon_device_sync, .Lfunc_end219-halide_hexagon_device_sync
                                        // -- End function
	.section	.text.halide_hexagon_device_release,"ax",@progbits
	.weak	halide_hexagon_device_release // -- Begin function halide_hexagon_device_release
	.p2align	2
	.type	halide_hexagon_device_release,@function
halide_hexagon_device_release:          // @halide_hexagon_device_release
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE]
	add	x29, sp, #32            // =32
	bl	halide_mutex_lock
	adrp	x21, :got:_ZN6Halide7Runtime8Internal7Hexagon10state_listE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon10state_listE]
	adrp	x20, :got:_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE
	ldr	x22, [x21]
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE]
	cbnz	x22, .LBB220_2
	b	.LBB220_4
.LBB220_1:                              // %if.end
                                        //   in Loop: Header=BB220_2 Depth=1
	ldr	x22, [x22, #8]
	cbz	x22, .LBB220_4
.LBB220_2:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w0, [x22]
	cbz	w0, .LBB220_1
// %bb.3:                               // %if.then
                                        //   in Loop: Header=BB220_2 Depth=1
	ldr	x8, [x20]
	blr	x8
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	str	wzr, [x22]
	b	.LBB220_1
.LBB220_4:                              // %while.end
	adrp	x22, :got:_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE]
	str	xzr, [x21]
	ldr	w0, [x22]
	cbz	w0, .LBB220_6
// %bb.5:                               // %if.then18
	ldr	x8, [x20]
	blr	x8
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	str	wzr, [x22]
.LBB220_6:                              // %if.end31
	adrp	x0, :got:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE]
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end220:
	.size	halide_hexagon_device_release, .Lfunc_end220-halide_hexagon_device_release
                                        // -- End function
	.section	.text.halide_hexagon_copy_to_host,"ax",@progbits
	.weak	halide_hexagon_copy_to_host // -- Begin function halide_hexagon_copy_to_host
	.p2align	2
	.type	halide_hexagon_copy_to_host,@function
halide_hexagon_copy_to_host:            // @halide_hexagon_copy_to_host
// %bb.0:                               // %entry
	sub	sp, sp, #480            // =480
	stp	x20, x19, [sp, #448]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #464]    // 16-byte Folded Spill
	ldr	x8, [x1, #16]
	mov	x20, x1
	mov	x19, x0
	str	x28, [sp, #432]         // 8-byte Folded Spill
	add	x29, sp, #464           // =464
	cbz	x8, .LBB221_2
// %bb.1:                               // %land.lhs.true
	ldr	x8, [x20]
	cbnz	x8, .LBB221_3
.LBB221_2:                              // %if.then
	adrp	x1, .L.str.81
	add	x1, x1, :lo12:.L.str.81
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB221_3:                              // %if.end
	add	x8, sp, #16             // =16
	mov	x0, x20
	bl	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t
	mov	x0, x19
	mov	x1, x20
	bl	halide_hexagon_get_device_handle
	str	x0, [sp, #8]
	sub	x0, x29, #24            // =24
	add	x1, sp, #8              // =8
	mov	w2, #8
	bl	memcpy
	ldur	x8, [x29, #-24]
	add	x0, sp, #16             // =16
	mov	x1, x19
	str	x8, [sp, #16]
	bl	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	ldp	x29, x30, [sp, #464]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #448]    // 16-byte Folded Reload
	ldr	x28, [sp, #432]         // 8-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #480            // =480
	ret
.Lfunc_end221:
	.size	halide_hexagon_copy_to_host, .Lfunc_end221-halide_hexagon_copy_to_host
                                        // -- End function
	.section	.text.halide_hexagon_copy_to_device,"ax",@progbits
	.weak	halide_hexagon_copy_to_device // -- Begin function halide_hexagon_copy_to_device
	.p2align	2
	.type	halide_hexagon_copy_to_device,@function
halide_hexagon_copy_to_device:          // @halide_hexagon_copy_to_device
// %bb.0:                               // %entry
	sub	sp, sp, #480            // =480
	stp	x28, x21, [sp, #432]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #448]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #464]    // 16-byte Folded Spill
	add	x29, sp, #464           // =464
	mov	x21, x1
	mov	x19, x0
	bl	halide_hexagon_device_malloc
	mov	w20, w0
	cbnz	w0, .LBB222_5
// %bb.1:                               // %if.end
	ldr	x8, [x21, #16]
	cbz	x8, .LBB222_3
// %bb.2:                               // %land.lhs.true
	ldr	x8, [x21]
	cbnz	x8, .LBB222_4
.LBB222_3:                              // %if.then7
	adrp	x1, .L.str.79
	add	x1, x1, :lo12:.L.str.79
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB222_4:                              // %if.end8
	add	x8, sp, #8              // =8
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t
	mov	x0, x19
	mov	x1, x21
	bl	halide_hexagon_get_device_handle
	str	x0, [sp]
	sub	x0, x29, #40            // =40
	mov	x1, sp
	mov	w2, #8
	bl	memcpy
	ldur	x8, [x29, #-40]
	add	x0, sp, #8              // =8
	mov	x1, x19
	str	x8, [sp, #16]
	bl	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
.LBB222_5:                              // %cleanup
	mov	w0, w20
	ldp	x29, x30, [sp, #464]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #448]    // 16-byte Folded Reload
	ldp	x28, x21, [sp, #432]    // 16-byte Folded Reload
	add	sp, sp, #480            // =480
	ret
.Lfunc_end222:
	.size	halide_hexagon_copy_to_device, .Lfunc_end222-halide_hexagon_copy_to_device
                                        // -- End function
	.section	.text.halide_hexagon_device_and_host_malloc,"ax",@progbits
	.weak	halide_hexagon_device_and_host_malloc // -- Begin function halide_hexagon_device_and_host_malloc
	.p2align	2
	.type	halide_hexagon_device_and_host_malloc,@function
halide_hexagon_device_and_host_malloc:  // @halide_hexagon_device_and_host_malloc
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x1
	mov	x21, x0
	bl	halide_hexagon_device_malloc
	mov	w20, w0
	cbnz	w0, .LBB223_2
// %bb.1:                               // %if.then
	mov	x0, x21
	mov	x1, x19
	bl	halide_hexagon_get_device_handle
	str	x0, [x19, #16]
.LBB223_2:                              // %if.end
	mov	w0, w20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end223:
	.size	halide_hexagon_device_and_host_malloc, .Lfunc_end223-halide_hexagon_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_hexagon_device_and_host_free,"ax",@progbits
	.weak	halide_hexagon_device_and_host_free // -- Begin function halide_hexagon_device_and_host_free
	.p2align	2
	.type	halide_hexagon_device_and_host_free,@function
halide_hexagon_device_and_host_free:    // @halide_hexagon_device_and_host_free
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x1
	bl	halide_hexagon_device_free
	str	xzr, [x19, #16]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end224:
	.size	halide_hexagon_device_and_host_free, .Lfunc_end224-halide_hexagon_device_and_host_free
                                        // -- End function
	.section	.text.halide_hexagon_buffer_copy,"ax",@progbits
	.weak	halide_hexagon_buffer_copy // -- Begin function halide_hexagon_buffer_copy
	.p2align	2
	.type	halide_hexagon_buffer_copy,@function
halide_hexagon_buffer_copy:             // @halide_hexagon_buffer_copy
// %bb.0:                               // %entry
	sub	sp, sp, #496            // =496
	stp	x28, x23, [sp, #432]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #448]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #464]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #480]    // 16-byte Folded Spill
	adrp	x23, :got:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE]
	mov	x20, x3
	mov	x21, x2
	mov	x22, x1
	mov	x19, x0
	add	x29, sp, #480           // =480
	cbz	x2, .LBB225_3
// %bb.1:                               // %entry
	cmp	x21, x23
	b.eq	.LBB225_3
// %bb.2:                               // %if.then
	adrp	x1, .L.str.89
	add	x1, x1, :lo12:.L.str.89
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB225_3:                              // %if.end
	ldr	x8, [x22, #24]
	tbnz	w8, #1, .LBB225_6
// %bb.4:                               // %lor.lhs.false2
	ldr	x9, [x22, #16]
	cbz	x9, .LBB225_6
// %bb.5:                               // %if.end9
	ldr	x9, [x22, #8]
	cmp	x9, x23
	b.ne	.LBB225_12
	b	.LBB225_9
.LBB225_6:                              // %land.lhs.true
	ldr	x9, [x22, #8]
	cmp	x9, x23
	b.eq	.LBB225_9
// %bb.7:                               // %if.then5
	cmp	x21, x23
	b.eq	.LBB225_15
// %bb.8:                               // %if.then7
	adrp	x1, .L.str.90
	add	x1, x1, :lo12:.L.str.90
	mov	x0, x19
	bl	halide_print
	bl	abort
	mov	w0, #-42
	b	.LBB225_22
.LBB225_9:                              // %lor.lhs.false12
	ldr	x9, [x22]
	cbz	x9, .LBB225_12
// %bb.10:                              // %lor.rhs
	tbz	w8, #0, .LBB225_16
// %bb.11:                              // %lor.end
	ldr	x8, [x22, #16]
	cbz	x8, .LBB225_16
.LBB225_12:
	mov	w23, #1
	cbz	x21, .LBB225_17
.LBB225_13:                             // %lor.lhs.false25
	ldr	x8, [x20]
	cbnz	x8, .LBB225_17
// %bb.14:                              // %if.then28
	adrp	x1, .L.str.92
	add	x1, x1, :lo12:.L.str.92
	mov	x0, x19
	bl	halide_print
	bl	abort
	b	.LBB225_17
.LBB225_15:
	mov	w0, #-42
	b	.LBB225_22
.LBB225_16:                             // %lor.lhs.false19
	mov	w23, wzr
	cbnz	x21, .LBB225_13
.LBB225_17:                             // %if.end29
	cmp	x21, #0                 // =0
	cset	w3, eq
	add	x8, sp, #8              // =8
	mov	x0, x22
	mov	w1, w23
	mov	x2, x20
	bl	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	tbnz	w23, #0, .LBB225_19
// %bb.18:                              // %if.then33
	mov	x0, x19
	mov	x1, x22
	bl	halide_hexagon_get_device_handle
	str	x0, [sp]
	sub	x0, x29, #56            // =56
	mov	x1, sp
	mov	w2, #8
	bl	memcpy
	ldur	x8, [x29, #-56]
	str	x8, [sp, #8]
.LBB225_19:                             // %if.end37
	cbz	x21, .LBB225_21
// %bb.20:                              // %if.then39
	mov	x0, x19
	mov	x1, x20
	bl	halide_hexagon_get_device_handle
	str	x0, [sp]
	sub	x0, x29, #56            // =56
	mov	x1, sp
	mov	w2, #8
	bl	memcpy
	ldur	x8, [x29, #-56]
	str	x8, [sp, #16]
.LBB225_21:                             // %if.end44
	add	x0, sp, #8              // =8
	mov	x1, x19
	bl	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	mov	w0, wzr
.LBB225_22:                             // %return
	ldp	x29, x30, [sp, #480]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #464]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #448]    // 16-byte Folded Reload
	ldp	x28, x23, [sp, #432]    // 16-byte Folded Reload
	add	sp, sp, #496            // =496
	ret
.Lfunc_end225:
	.size	halide_hexagon_buffer_copy, .Lfunc_end225-halide_hexagon_buffer_copy
                                        // -- End function
	.section	.text.halide_hexagon_device_crop,"ax",@progbits
	.weak	halide_hexagon_device_crop // -- Begin function halide_hexagon_device_crop
	.p2align	2
	.type	halide_hexagon_device_crop,@function
halide_hexagon_device_crop:             // @halide_hexagon_device_crop
// %bb.0:                               // %entry
	ldrsw	x8, [x1, #36]
	mov	x0, x1
	cmp	w8, #1                  // =1
	b.lt	.LBB226_3
// %bb.1:                               // %for.body.lr.ph.i
	ldr	x9, [x2, #40]
	ldr	x10, [x0, #40]
	cmp	w8, #5                  // =5
	b.hs	.LBB226_4
// %bb.2:
	mov	x11, xzr
	mov	x12, xzr
	b	.LBB226_7
.LBB226_3:
	mov	x12, xzr
	b	.LBB226_9
.LBB226_4:                              // %vector.ph
	and	x11, x8, #0x3
	tst	x8, #0x3
	mov	w14, #4
	csel	x11, x14, x11, eq
	sub	x11, x8, x11
	add	x12, x10, #32           // =32
	add	x13, x9, #32            // =32
	movi	v0.2d, #0000000000000000
	mov	x14, x11
	movi	v1.2d, #0000000000000000
.LBB226_5:                              // %vector.body
                                        // =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x13, #-32]
	ldp	q4, q5, [x13], #64
	ldp	q6, q7, [x12, #-32]
	ldp	q16, q17, [x12], #64
	subs	x14, x14, #4            // =4
	sub	v3.4s, v3.4s, v7.4s
	sub	v2.4s, v2.4s, v6.4s
	sub	v5.4s, v5.4s, v17.4s
	sub	v4.4s, v4.4s, v16.4s
	zip2	v18.4s, v6.4s, v7.4s
	zip2	v19.4s, v16.4s, v17.4s
	zip1	v2.4s, v2.4s, v3.4s
	zip1	v3.4s, v4.4s, v5.4s
	mul	v2.2s, v2.2s, v18.2s
	mul	v3.2s, v3.2s, v19.2s
	saddw	v0.2d, v0.2d, v2.2s
	saddw	v1.2d, v1.2d, v3.2s
	b.ne	.LBB226_5
// %bb.6:                               // %middle.block
	add	v0.2d, v1.2d, v0.2d
	addp	d0, v0.2d
	fmov	x12, d0
.LBB226_7:                              // %for.body.i.preheader
	sub	x8, x8, x11
	lsl	x11, x11, #4
	add	x10, x10, x11
	add	x10, x10, #8            // =8
	add	x9, x9, x11
.LBB226_8:                              // %for.body.i
                                        // =>This Inner Loop Header: Depth=1
	ldrsw	x11, [x9], #16
	ldursw	x13, [x10, #-8]
	ldrsw	x14, [x10]
	subs	x8, x8, #1              // =1
	add	x10, x10, #16           // =16
	sub	x11, x11, x13
	madd	x12, x11, x14, x12
	b.ne	.LBB226_8
.LBB226_9:                              // %_ZN6Halide7Runtime8Internal28calc_device_crop_byte_offsetEPK15halide_buffer_tPS2_.exit
	ldrb	w8, [x0, #33]
	add	x8, x8, #7              // =7
	lsr	x8, x8, #3
	mul	x1, x8, x12
	b	hexagon_device_crop_from_offset
.Lfunc_end226:
	.size	halide_hexagon_device_crop, .Lfunc_end226-halide_hexagon_device_crop
                                        // -- End function
	.section	.text.halide_hexagon_device_slice,"ax",@progbits
	.weak	halide_hexagon_device_slice // -- Begin function halide_hexagon_device_slice
	.p2align	2
	.type	halide_hexagon_device_slice,@function
halide_hexagon_device_slice:            // @halide_hexagon_device_slice
// %bb.0:                               // %entry
	ldr	x8, [x1, #40]
	ldrb	w10, [x1, #33]
                                        // kill: def $w3 killed $w3 def $x3
	sxtw	x11, w3
	mov	x0, x1
	add	x8, x8, w2, sxtw #4
	ldrsw	x9, [x8]
	ldrsw	x8, [x8, #8]
	add	x10, x10, #7            // =7
	mov	x2, x4
	sub	x9, x11, x9
	mul	x8, x9, x8
	lsr	x9, x10, #3
	mul	x1, x9, x8
	b	hexagon_device_crop_from_offset
.Lfunc_end227:
	.size	halide_hexagon_device_slice, .Lfunc_end227-halide_hexagon_device_slice
                                        // -- End function
	.section	.text.halide_hexagon_device_release_crop,"ax",@progbits
	.weak	halide_hexagon_device_release_crop // -- Begin function halide_hexagon_device_release_crop
	.p2align	2
	.type	halide_hexagon_device_release_crop,@function
halide_hexagon_device_release_crop:     // @halide_hexagon_device_release_crop
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x0, [x1]
	mov	x29, sp
	bl	free
	mov	w0, wzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end228:
	.size	halide_hexagon_device_release_crop, .Lfunc_end228-halide_hexagon_device_release_crop
                                        // -- End function
	.section	.text.hexagon_device_crop_from_offset,"ax",@progbits
	.weak	hexagon_device_crop_from_offset // -- Begin function hexagon_device_crop_from_offset
	.p2align	2
	.type	hexagon_device_crop_from_offset,@function
hexagon_device_crop_from_offset:        // @hexagon_device_crop_from_offset
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x22, [x0]
	mov	x20, x0
	mov	w0, #16
	add	x29, sp, #48            // =48
	mov	x19, x2
	mov	x21, x1
	bl	malloc
	str	x0, [sp]
	cbz	x0, .LBB229_2
// %bb.1:                               // %if.end
	ldr	x8, [x22]
	mov	x1, sp
	mov	w2, #8
	add	x8, x8, x21
	str	x8, [x0]
	ldr	x8, [x22, #8]
	sub	x8, x8, x21
	str	x8, [x0, #8]
	add	x0, sp, #8              // =8
	bl	memcpy
	ldr	x8, [sp, #8]
	ldr	x9, [x19, #24]
	mov	w0, wzr
	str	x8, [x19]
	ldr	x8, [x20, #8]
	and	x10, x9, #0xfffffffffffffffd
	orr	x9, x9, #0x2
	str	x8, [x19, #8]
	ldr	x8, [x20, #24]
	tst	x8, #0x2
	csel	x8, x10, x9, eq
	str	x8, [x19, #24]
	b	.LBB229_3
.LBB229_2:
	mov	w0, #-11
.LBB229_3:                              // %cleanup
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end229:
	.size	hexagon_device_crop_from_offset, .Lfunc_end229-hexagon_device_crop_from_offset
                                        // -- End function
	.section	.text.halide_hexagon_get_device_handle,"ax",@progbits
	.weak	halide_hexagon_get_device_handle // -- Begin function halide_hexagon_get_device_handle
	.p2align	2
	.type	halide_hexagon_get_device_handle,@function
halide_hexagon_get_device_handle:       // @halide_hexagon_get_device_handle
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB230_4
// %bb.1:                               // %if.end
	adrp	x9, :got:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	ldr	x8, [x1, #8]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE]
	mov	x19, x1
	cmp	x8, x9
	b.eq	.LBB230_3
// %bb.2:                               // %if.then2
	adrp	x1, .L.str.85
	add	x1, x1, :lo12:.L.str.85
	bl	halide_print
	bl	abort
.LBB230_3:                              // %if.end3
	add	x0, sp, #8              // =8
	mov	w2, #8
	mov	x1, x19
	bl	memcpy
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB230_4:
	mov	x0, xzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end230:
	.size	halide_hexagon_get_device_handle, .Lfunc_end230-halide_hexagon_get_device_handle
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv // -- Begin function _ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv,@function
_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv: // @_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
// %bb.0:                               // %entry
	str	x28, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	sub	sp, sp, #1024           // =1024
	adrp	x20, :got:_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE]
	ldr	x8, [x20]
	cbz	x8, .LBB231_12
// %bb.1:                               // %while.body.preheader
	mov	x19, x0
	mov	x0, sp
	sub	x2, x29, #36            // =36
	mov	w1, #1024
	stur	wzr, [x29, #-36]
	blr	x8
	mov	w21, w0
	cbnz	w0, .LBB231_5
	b	.LBB231_3
.LBB231_2:                              // %if.then7
                                        //   in Loop: Header=BB231_3 Depth=1
	mov	x1, sp
	mov	x0, x19
	bl	halide_print
	ldr	x8, [x20]
	mov	x0, sp
	sub	x2, x29, #36            // =36
	mov	w1, #1024
	stur	wzr, [x29, #-36]
	blr	x8
	cbnz	w0, .LBB231_4
.LBB231_3:                              // %if.end5
                                        // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-36]
	cmp	w8, #1                  // =1
	b.ge	.LBB231_2
	b	.LBB231_12
.LBB231_4:
	mov	w21, w0
.LBB231_5:                              // %if.then1
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB231_7
// %bb.6:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.4.214
	add	x2, x2, :lo12:.L.str.4.214
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB231_8
.LBB231_7:                              // %if.then1.split
	adrp	x2, .L.str.4.214
	add	x2, x2, :lo12:.L.str.4.214
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB231_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi0ELy1024EEC2EPvPc.exit
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.3.215
	add	x2, x2, :lo12:.L.str.3.215
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB231_10
// %bb.9:                               // %if.else.i27
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_print
	mov	x0, x19
	mov	x1, x20
	b	.LBB231_11
.LBB231_10:                             // %if.then.i26
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB231_11:                             // %while.end
	bl	halide_free
.LBB231_12:                             // %while.end
	add	sp, sp, #1024           // =1024
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x28, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end231:
	.size	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv, .Lfunc_end231-_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
                                        // -- End function
	.section	.text.halide_hexagon_get_device_size,"ax",@progbits
	.weak	halide_hexagon_get_device_size // -- Begin function halide_hexagon_get_device_size
	.p2align	2
	.type	halide_hexagon_get_device_size,@function
halide_hexagon_get_device_size:         // @halide_hexagon_get_device_size
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB232_4
// %bb.1:                               // %if.end
	adrp	x9, :got:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	ldr	x8, [x1, #8]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE]
	mov	x19, x1
	cmp	x8, x9
	b.eq	.LBB232_3
// %bb.2:                               // %if.then2
	adrp	x1, .L.str.86
	add	x1, x1, :lo12:.L.str.86
	bl	halide_print
	bl	abort
.LBB232_3:                              // %if.end3
	add	x0, sp, #8              // =8
	mov	w2, #8
	mov	x1, x19
	bl	memcpy
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB232_4:
	mov	x0, xzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end232:
	.size	halide_hexagon_get_device_size, .Lfunc_end232-halide_hexagon_get_device_size
                                        // -- End function
	.section	.text.halide_hexagon_detach_device_handle,"ax",@progbits
	.weak	halide_hexagon_detach_device_handle // -- Begin function halide_hexagon_detach_device_handle
	.p2align	2
	.type	halide_hexagon_detach_device_handle,@function
halide_hexagon_detach_device_handle:    // @halide_hexagon_detach_device_handle
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB233_4
// %bb.1:                               // %if.end
	adrp	x9, :got:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	ldr	x8, [x1, #8]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE]
	mov	x19, x1
	cmp	x8, x9
	b.eq	.LBB233_3
// %bb.2:                               // %if.then2
	adrp	x1, .L.str.84
	add	x1, x1, :lo12:.L.str.84
	bl	halide_print
	bl	abort
.LBB233_3:                              // %if.end3
	add	x0, sp, #8              // =8
	mov	w2, #8
	mov	x1, x19
	bl	memcpy
	ldr	x0, [sp, #8]
	bl	free
	ldr	x8, [x19, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #8]
	blr	x8
	stp	xzr, xzr, [x19]
.LBB233_4:                              // %return
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end233:
	.size	halide_hexagon_detach_device_handle, .Lfunc_end233-halide_hexagon_detach_device_handle
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv // -- Begin function _ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv,@function
_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv: // @_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	adrp	x25, :got:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	ldr	x25, [x25, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE]
	adrp	x24, :got:_ZN6Halide7Runtime8Internal7Hexagon10remote_runE
	adrp	x23, :got:_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE
	mov	x20, x0
	ldr	x8, [x25]
	ldr	x24, [x24, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon10remote_runE]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE]
	add	x29, sp, #64            // =64
	cbz	x8, .LBB234_4
// %bb.1:                               // %entry
	ldr	x8, [x24]
	cbz	x8, .LBB234_4
// %bb.2:                               // %entry
	ldr	x8, [x23]
	cbz	x8, .LBB234_4
.LBB234_3:                              // %return
	mov	w0, wzr
	b	.LBB234_77
.LBB234_4:                              // %if.end
	adrp	x0, .L.str.6.220
	add	x0, x0, :lo12:.L.str.6.220
	bl	halide_load_library
	mov	x19, x0
	cbnz	x0, .LBB234_6
// %bb.5:                               // %if.then5
	adrp	x0, .L.str.7.221
	add	x0, x0, :lo12:.L.str.7.221
	bl	halide_load_library
	mov	x19, x0
.LBB234_6:                              // %if.end7
	adrp	x1, .L.str.10.222
	add	x1, x1, :lo12:.L.str.10.222
	mov	x0, x19
	bl	halide_get_library_symbol
	str	x0, [x25]
	cbz	x0, .LBB234_15
// %bb.7:                               // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiPKciPKhiPiEEEvPvSB_S5_RT_b.exit
	cbz	x0, .LBB234_76
.LBB234_8:                              // %if.end12
	adrp	x1, .L.str.11.223
	add	x1, x1, :lo12:.L.str.11.223
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x25, :got:_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE
	ldr	x25, [x25, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE]
	str	x0, [x25]
	cbz	x0, .LBB234_17
// %bb.9:                               // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiiPKciPiEEEvPvS9_S5_RT_b.exit
	cbz	x0, .LBB234_76
.LBB234_10:                             // %if.end15
	adrp	x1, .L.str.12.224
	add	x1, x1, :lo12:.L.str.12.224
	mov	x0, x19
	bl	halide_get_library_symbol
	str	x0, [x24]
	cbz	x0, .LBB234_19
// %bb.11:                              // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiiiPKNS2_25_remote_buffer__seq_octetEiS6_iPS4_iEEEvPvSA_PKcRT_b.exit
	cbz	x0, .LBB234_76
.LBB234_12:                             // %if.end18
	adrp	x1, .L.str.13.225
	add	x1, x1, :lo12:.L.str.13.225
	mov	x0, x19
	bl	halide_get_library_symbol
	str	x0, [x23]
	cbnz	x0, .LBB234_38
// %bb.13:                              // %if.then.i115
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_33
// %bb.14:                              // %if.then.i38.i117
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_34
.LBB234_15:                             // %if.then.i
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_21
// %bb.16:                              // %if.then.i38.i
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_22
.LBB234_17:                             // %if.then.i79
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_25
// %bb.18:                              // %if.then.i38.i81
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_26
.LBB234_19:                             // %if.then.i97
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_29
// %bb.20:                              // %if.then.i38.i99
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_30
.LBB234_21:                             // %if.then.i.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_22:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i
	adrp	x2, .L.str.10.222
	add	x2, x2, :lo12:.L.str.10.222
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_24
// %bb.23:                              // %if.else.i.i
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	bl	halide_free
	ldr	x0, [x25]
	cbnz	x0, .LBB234_8
	b	.LBB234_76
.LBB234_24:                             // %if.then.i.i
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
	bl	halide_free
	ldr	x0, [x25]
	cbnz	x0, .LBB234_8
	b	.LBB234_76
.LBB234_25:                             // %if.then.i79.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_26:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i84
	adrp	x2, .L.str.11.223
	add	x2, x2, :lo12:.L.str.11.223
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_28
// %bb.27:                              // %if.else.i.i91
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	bl	halide_free
	ldr	x0, [x25]
	cbnz	x0, .LBB234_10
	b	.LBB234_76
.LBB234_28:                             // %if.then.i.i87
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
	bl	halide_free
	ldr	x0, [x25]
	cbnz	x0, .LBB234_10
	b	.LBB234_76
.LBB234_29:                             // %if.then.i97.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_30:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i102
	adrp	x2, .L.str.12.224
	add	x2, x2, :lo12:.L.str.12.224
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_32
// %bb.31:                              // %if.else.i.i109
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	bl	halide_free
	ldr	x0, [x24]
	cbnz	x0, .LBB234_12
	b	.LBB234_76
.LBB234_32:                             // %if.then.i.i105
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
	bl	halide_free
	ldr	x0, [x24]
	cbnz	x0, .LBB234_12
	b	.LBB234_76
.LBB234_33:                             // %if.then.i115.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_34:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i120
	adrp	x2, .L.str.13.225
	add	x2, x2, :lo12:.L.str.13.225
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_36
// %bb.35:                              // %if.else.i.i127
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB234_37
.LBB234_36:                             // %if.then.i.i123
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB234_37:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i128
	bl	halide_free
	ldr	x0, [x23]
.LBB234_38:                             // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiiEEEvPvS6_PKcRT_b.exit
	cbz	x0, .LBB234_76
// %bb.39:                              // %if.end21
	adrp	x1, .L.str.14.226
	add	x1, x1, :lo12:.L.str.14.226
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x23, :got:_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE]
	str	x0, [x23]
	cbnz	x0, .LBB234_47
// %bb.40:                              // %if.then.i133
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_42
// %bb.41:                              // %if.then.i38.i135
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_43
.LBB234_42:                             // %if.then.i133.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_43:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i138
	adrp	x2, .L.str.14.226
	add	x2, x2, :lo12:.L.str.14.226
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_45
// %bb.44:                              // %if.else.i.i145
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB234_46
.LBB234_45:                             // %if.then.i.i141
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB234_46:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i146
	bl	halide_free
	ldr	x0, [x23]
.LBB234_47:                             // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFvvEEEvPvS6_PKcRT_b.exit
	cbz	x0, .LBB234_76
// %bb.48:                              // %if.end24
	adrp	x1, .L.str.15.227
	add	x1, x1, :lo12:.L.str.15.227
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x24, :got:_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE
	ldr	x24, [x24, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE]
	str	x0, [x24]
	cbnz	x0, .LBB234_56
// %bb.49:                              // %if.then.i151
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_51
// %bb.50:                              // %if.then.i38.i153
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_52
.LBB234_51:                             // %if.then.i151.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_52:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i156
	adrp	x2, .L.str.15.227
	add	x2, x2, :lo12:.L.str.15.227
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_54
// %bb.53:                              // %if.else.i.i163
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB234_55
.LBB234_54:                             // %if.then.i.i159
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB234_55:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i164
	bl	halide_free
	ldr	x0, [x24]
.LBB234_56:                             // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFvvEEEvPvS6_PKcRT_b.exit165
	cbz	x0, .LBB234_76
// %bb.57:                              // %if.end27
	adrp	x1, .L.str.16.228
	add	x1, x1, :lo12:.L.str.16.228
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x24, :got:_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE
	ldr	x24, [x24, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE]
	str	x0, [x24]
	cbnz	x0, .LBB234_65
// %bb.58:                              // %if.then.i170
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_60
// %bb.59:                              // %if.then.i38.i172
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_61
.LBB234_60:                             // %if.then.i170.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_61:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i175
	adrp	x2, .L.str.16.228
	add	x2, x2, :lo12:.L.str.16.228
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_63
// %bb.62:                              // %if.else.i.i182
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB234_64
.LBB234_63:                             // %if.then.i.i178
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB234_64:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i183
	bl	halide_free
	ldr	x0, [x24]
.LBB234_65:                             // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFPvmEEEvS4_S4_PKcRT_b.exit
	cbz	x0, .LBB234_76
// %bb.66:                              // %if.end30
	adrp	x1, .L.str.17.229
	add	x1, x1, :lo12:.L.str.17.229
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x24, :got:_ZN6Halide7Runtime8Internal7Hexagon9host_freeE
	ldr	x24, [x24, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon9host_freeE]
	str	x0, [x24]
	cbnz	x0, .LBB234_74
// %bb.67:                              // %if.then.i188
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB234_69
// %bb.68:                              // %if.then.i38.i190
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB234_70
.LBB234_69:                             // %if.then.i188.split
	adrp	x2, .L.str.115
	add	x2, x2, :lo12:.L.str.115
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB234_70:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i193
	adrp	x2, .L.str.17.229
	add	x2, x2, :lo12:.L.str.17.229
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.116
	add	x2, x2, :lo12:.L.str.116
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB234_72
// %bb.71:                              // %if.else.i.i200
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB234_73
.LBB234_72:                             // %if.then.i.i196
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB234_73:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i201
	bl	halide_free
	ldr	x0, [x24]
.LBB234_74:                             // %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFvPvEEEvS4_S4_PKcRT_b.exit
	cbz	x0, .LBB234_76
// %bb.75:                              // %if.end33
	adrp	x1, .L.str.18.230
	add	x1, x1, :lo12:.L.str.18.230
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE]
	adrp	x1, .L.str.19.231
	add	x1, x1, :lo12:.L.str.19.231
	str	x0, [x8]
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE]
	adrp	x1, .L.str.20.232
	add	x1, x1, :lo12:.L.str.20.232
	str	x0, [x8]
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE]
	adrp	x1, .L.str.21.233
	add	x1, x1, :lo12:.L.str.21.233
	str	x0, [x8]
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE]
	adrp	x1, .L.str.22.234
	add	x1, x1, :lo12:.L.str.22.234
	str	x0, [x8]
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE]
	adrp	x1, .L.str.23.235
	add	x1, x1, :lo12:.L.str.23.235
	str	x0, [x8]
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE]
	adrp	x1, .L.str.24.236
	add	x1, x1, :lo12:.L.str.24.236
	str	x0, [x8]
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE]
	adrp	x1, .L.str.25.237
	add	x1, x1, :lo12:.L.str.25.237
	str	x0, [x8]
	mov	x0, x19
	bl	halide_get_library_symbol
	adrp	x9, :got:_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE
	ldr	x8, [x23]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE]
	str	x0, [x9]
	blr	x8
	b	.LBB234_3
.LBB234_76:
	mov	w0, #-1
.LBB234_77:                             // %return
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	ret
.Lfunc_end234:
	.size	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv, .Lfunc_end234-_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
                                        // -- End function
	.section	.text.halide_hexagon_wrap_device_handle,"ax",@progbits
	.weak	halide_hexagon_wrap_device_handle // -- Begin function halide_hexagon_wrap_device_handle
	.p2align	2
	.type	halide_hexagon_wrap_device_handle,@function
halide_hexagon_wrap_device_handle:      // @halide_hexagon_wrap_device_handle
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x1]
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x20, x3
	mov	x21, x2
	mov	x19, x1
	add	x29, sp, #48            // =48
	cbz	x8, .LBB235_3
// %bb.1:                               // %if.end
	adrp	x1, .L.str.83
	add	x1, x1, :lo12:.L.str.83
	bl	halide_print
	bl	abort
	ldr	x8, [x19]
	cbz	x8, .LBB235_3
// %bb.2:
	mov	w0, #-2
	b	.LBB235_6
.LBB235_3:                              // %if.end4
	mov	w0, #16
	bl	malloc
	str	x0, [sp, #8]
	cbz	x0, .LBB235_5
// %bb.4:                               // %if.end6
	stp	x21, x20, [x0]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE]
	str	x8, [x19, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	add	x0, sp, #24             // =24
	add	x1, sp, #8              // =8
	mov	w2, #8
	bl	memcpy
	ldr	x8, [sp, #24]
	mov	w0, wzr
	str	x8, [x19]
	b	.LBB235_6
.LBB235_5:
	mov	w0, #-1
.LBB235_6:                              // %return
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end235:
	.size	halide_hexagon_wrap_device_handle, .Lfunc_end235-halide_hexagon_wrap_device_handle
                                        // -- End function
	.section	.text.halide_hexagon_cleanup,"ax",@progbits
	.weak	halide_hexagon_cleanup  // -- Begin function halide_hexagon_cleanup
	.p2align	2
	.type	halide_hexagon_cleanup,@function
halide_hexagon_cleanup:                 // @halide_hexagon_cleanup
// %bb.0:                               // %entry
	mov	x0, xzr
	b	halide_hexagon_device_release
.Lfunc_end236:
	.size	halide_hexagon_cleanup, .Lfunc_end236-halide_hexagon_cleanup
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_ // -- Begin function _ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_,@function
_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_: // @_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x22, :got:_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE]
	mov	x19, x1
	mov	x20, x0
	add	x29, sp, #32            // =32
	ldr	x2, [x22]
	cbnz	x2, .LBB237_5
// %bb.1:                               // %if.then
	mov	w1, #1024
	mov	x0, xzr
	bl	halide_malloc
	cbz	x0, .LBB237_3
// %bb.2:                               // %if.else.i7
	adrp	x2, .L.str.5.239
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.5.239
	mov	x21, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, xzr
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, xzr
	mov	x1, x21
	bl	halide_error
	mov	x0, xzr
	mov	x1, x21
	b	.LBB237_4
.LBB237_3:                              // %if.then.i6
	adrp	x2, .L.str.5.239
	add	x2, x2, :lo12:.L.str.5.239
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, xzr
	bl	halide_error
	mov	x0, xzr
	mov	x1, xzr
.LBB237_4:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldr	x2, [x22]
.LBB237_5:                              // %if.end
	mov	x0, x20
	mov	x1, x19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	br	x2
.Lfunc_end237:
	.size	_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_, .Lfunc_end237-_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_
                                        // -- End function
	.section	.text.halide_is_hexagon_available,"ax",@progbits
	.weak	halide_is_hexagon_available // -- Begin function halide_is_hexagon_available
	.p2align	2
	.type	halide_is_hexagon_available,@function
halide_is_hexagon_available:            // @halide_is_hexagon_available
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	cmp	w0, #0                  // =0
	cset	w0, eq
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end238:
	.size	halide_is_hexagon_available, .Lfunc_end238-halide_is_hexagon_available
                                        // -- End function
	.section	.text.halide_hexagon_initialize_kernels,"ax",@progbits
	.weak	halide_hexagon_initialize_kernels // -- Begin function halide_hexagon_initialize_kernels
	.p2align	2
	.type	halide_hexagon_initialize_kernels,@function
halide_hexagon_initialize_kernels:      // @halide_hexagon_initialize_kernels
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	mov	x24, x5
	mov	x25, x4
	mov	x21, x3
	mov	x22, x2
	mov	x20, x1
	mov	x19, x0
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w23, w0
	cbnz	w0, .LBB239_30
// %bb.1:                               // %if.end
	cbnz	x20, .LBB239_3
// %bb.2:                               // %if.then18
	adrp	x1, .L.str.31.240
	add	x1, x1, :lo12:.L.str.31.240
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB239_3:                              // %if.end19
	adrp	x0, :got:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE]
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE]
	ldr	w8, [x8]
	cbz	w8, .LBB239_7
.LBB239_4:                              // %if.end56
	ldr	x8, [x20]
	cbz	x8, .LBB239_12
.LBB239_5:                              // %if.end66
	ldr	w8, [x8]
	cbz	w8, .LBB239_13
.LBB239_6:
	mov	w23, wzr
	b	.LBB239_29
.LBB239_7:                              // %if.then20
	adrp	x8, .L__const.halide_hexagon_initialize_kernels.soname
	add	x8, x8, :lo12:.L__const.halide_hexagon_initialize_kernels.soname
	adrp	x9, :got:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE]
	ldr	q0, [x8]
	ldur	q1, [x8, #12]
	adrp	x23, :got:_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE
	ldr	x8, [x9]
	str	q0, [sp]
	stur	q1, [sp, #12]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE]
	mov	x0, sp
	mov	w1, #28
	mov	x2, x25
	mov	w3, w24
	mov	x4, x23
	blr	x8
	mov	w24, w0
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	cbz	w24, .LBB239_10
// %bb.8:                               // %if.else
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB239_24
// %bb.9:                               // %if.else.i234
	adrp	x2, .L.str.37.242
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.37.242
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB239_25
.LBB239_10:                             // %if.then31
	ldr	w8, [x23]
	cbnz	w8, .LBB239_4
// %bb.11:                              // %if.then38
	adrp	x1, .L.str.36.241
	add	x1, x1, :lo12:.L.str.36.241
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	x8, [x20]
	cbnz	x8, .LBB239_5
.LBB239_12:                             // %if.then58
	mov	w0, #16
	bl	malloc
	str	x0, [x20]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon10state_listE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon10state_listE]
	str	wzr, [x0]
	ldr	x9, [x8]
	str	x0, [x8]
	str	x9, [x0, #8]
	ldr	x8, [x20]
	ldr	w8, [x8]
	cbnz	w8, .LBB239_6
.LBB239_13:                             // %if.then69
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x23, x0
	cbz	x0, .LBB239_15
// %bb.14:                              // %if.then.i221
	add	x24, x23, #1023         // =1023
	adrp	x2, .L.str.40.243
	add	x2, x2, :lo12:.L.str.40.243
	mov	x0, x23
	mov	x1, x24
	strb	wzr, [x23, #1023]
	bl	halide_string_to_string
	b	.LBB239_16
.LBB239_15:                             // %if.then69.split
	adrp	x2, .L.str.40.243
	add	x2, x2, :lo12:.L.str.40.243
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x24, xzr
.LBB239_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
	adrp	x8, _ZZ33halide_hexagon_initialize_kernelsE9unique_id
	ldrsw	x2, [x8, :lo12:_ZZ33halide_hexagon_initialize_kernelsE9unique_id]
	mov	w3, #1
	mov	x1, x24
	add	w9, w2, #1              // =1
	str	w9, [x8, :lo12:_ZZ33halide_hexagon_initialize_kernelsE9unique_id]
	bl	halide_int64_to_string
	adrp	x2, .L.str.41.244
	add	x2, x2, :lo12:.L.str.41.244
	mov	x1, x24
	bl	halide_string_to_string
	mov	x24, x0
	cbz	x23, .LBB239_18
// %bb.17:                              // %if.then.i188
	sub	x8, x24, x23
	add	x25, x8, #1             // =1
	mov	x0, x19
	mov	x1, x23
	mov	x2, x25
	bl	halide_msan_annotate_memory_is_initialized
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE]
	mov	x0, x19
	mov	x1, x23
	mov	x2, x25
	ldr	x26, [x8]
	str	wzr, [sp]
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x23
	b	.LBB239_19
.LBB239_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit199.thread
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE]
	adrp	x0, .L.str.111
	str	wzr, [sp]
	add	x0, x0, :lo12:.L.str.111
	ldr	x26, [x8]
.LBB239_19:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit
	sub	w8, w24, w23
	add	w1, w8, #1              // =1
	mov	x4, sp
	mov	x2, x22
	mov	w3, w21
	blr	x26
	mov	w21, w0
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	cbz	w21, .LBB239_22
// %bb.20:                              // %if.else93
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB239_26
// %bb.21:                              // %if.else.i167
	adrp	x2, .L.str.37.242
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.37.242
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
	cbnz	x23, .LBB239_27
	b	.LBB239_23
.LBB239_22:                             // %if.then86
	ldr	w8, [sp]
	ldr	x9, [x20]
	str	w8, [x9]
	cbnz	x23, .LBB239_27
.LBB239_23:                             // %if.then.i
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
	b	.LBB239_28
.LBB239_24:                             // %if.then.i228
	adrp	x2, .L.str.37.242
	add	x2, x2, :lo12:.L.str.37.242
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB239_25:                             // %if.end46
	bl	halide_free
	str	wzr, [x23]
	mov	w23, #-1
	b	.LBB239_29
.LBB239_26:                             // %if.then.i161
	adrp	x2, .L.str.37.242
	add	x2, x2, :lo12:.L.str.37.242
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
	bl	halide_free
	cbz	x23, .LBB239_23
.LBB239_27:                             // %if.else.i
	sub	x8, x24, x23
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x23
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x23
.LBB239_28:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EED2Ev.exit
	bl	halide_free
	cmp	w21, #0                 // =0
	csetm	w23, ne
.LBB239_29:                             // %cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE]
	bl	halide_mutex_unlock
.LBB239_30:                             // %cleanup111
	mov	w0, w23
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.Lfunc_end239:
	.size	halide_hexagon_initialize_kernels, .Lfunc_end239-halide_hexagon_initialize_kernels
                                        // -- End function
	.section	.text.map_arguments,"ax",@progbits
	.weak	map_arguments           // -- Begin function map_arguments
	.p2align	2
	.type	map_arguments,@function
map_arguments:                          // @map_arguments
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	cmp	w1, #1                  // =1
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	b.lt	.LBB240_12
// %bb.1:                               // %for.body.lr.ph
	mov	x19, x7
	mov	w20, w6
	mov	w21, w5
	mov	x22, x4
	mov	x23, x3
	mov	x24, x2
	mov	w8, wzr
	mov	w26, w1
	ldr	w9, [x22]
	and	w10, w9, w21
	cmp	w10, w20
	b.eq	.LBB240_5
.LBB240_2:
	mov	w25, w8
.LBB240_3:                              // %for.inc
	subs	x26, x26, #1            // =1
	add	x24, x24, #8            // =8
	add	x23, x23, #8            // =8
	add	x22, x22, #4            // =4
	mov	w8, w25
	b.eq	.LBB240_13
// %bb.4:                               // %for.body
	ldr	w9, [x22]
	and	w10, w9, w21
	cmp	w10, w20
	b.ne	.LBB240_2
.LBB240_5:                              // %if.end
	add	w25, w8, #1             // =1
	sxtw	x27, w8
	add	x28, x19, w8, sxtw #4
	cbz	w9, .LBB240_8
// %bb.6:                               // %if.then7
	ldr	x8, [x23]
	ldr	x9, [x8]
	str	x9, [sp]
	cbz	x9, .LBB240_9
// %bb.7:                               // %if.then12
	add	x0, sp, #8              // =8
	mov	x1, sp
	mov	w2, #8
	bl	memcpy
	ldr	x8, [sp, #8]
	ldr	x9, [x8], #8
	str	x9, [x28]
	ldr	x8, [x8]
	b	.LBB240_11
.LBB240_8:                              // %if.else22
	ldr	x8, [x23]
	str	x8, [x28]
	b	.LBB240_10
.LBB240_9:                              // %if.else
	ldr	x8, [x8, #8]
	str	x8, [x28]
	mov	x8, x24
.LBB240_10:                             // %for.inc
	ldr	x8, [x24]
.LBB240_11:                             // %for.inc
	add	x9, x19, x27, lsl #4
	str	w8, [x9, #8]
	b	.LBB240_3
.LBB240_12:
	mov	w25, wzr
.LBB240_13:                             // %for.cond.cleanup
	mov	w0, w25
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.Lfunc_end240:
	.size	map_arguments, .Lfunc_end240-map_arguments
                                        // -- End function
	.section	.text.halide_hexagon_run,"ax",@progbits
	.weak	halide_hexagon_run      // -- Begin function halide_hexagon_run
	.p2align	2
	.type	halide_hexagon_run,@function
halide_hexagon_run:                     // @halide_hexagon_run
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	sub	sp, sp, #16             // =16
	mov	x22, x6
	mov	x23, x5
	mov	x24, x4
	mov	x20, x3
	mov	x26, x2
	mov	x25, x1
	mov	x19, x0
	cbz	x1, .LBB241_5
// %bb.1:                               // %if.end
	cbz	x20, .LBB241_6
.LBB241_2:                              // %if.end3
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w21, w0
	cbnz	w0, .LBB241_33
.LBB241_3:                              // %if.end6
	cbz	x25, .LBB241_7
// %bb.4:                               // %cond.true
	ldr	w27, [x25]
	ldr	w8, [x20]
	cbnz	w8, .LBB241_9
	b	.LBB241_8
.LBB241_5:                              // %if.then
	adrp	x1, .L.str.44.245
	add	x1, x1, :lo12:.L.str.44.245
	mov	x0, x19
	bl	halide_print
	bl	abort
	cbnz	x20, .LBB241_2
.LBB241_6:                              // %if.then2
	adrp	x1, .L.str.45.246
	add	x1, x1, :lo12:.L.str.45.246
	mov	x0, x19
	bl	halide_print
	bl	abort
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w21, w0
	cbnz	w0, .LBB241_33
	b	.LBB241_3
.LBB241_7:
	mov	w27, wzr
	ldr	w8, [x20]
	cbnz	w8, .LBB241_9
.LBB241_8:                              // %if.then25
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE]
	mov	x0, x26
	stur	wzr, [x29, #-84]
	ldr	x21, [x8]
	bl	strlen
	add	w2, w0, #1              // =1
	sub	x3, x29, #84            // =84
	mov	w0, w27
	mov	x1, x26
	blr	x21
	ldur	w8, [x29, #-84]
	cmp	w0, #0                  // =0
	mov	x0, x19
	csel	w8, w8, wzr, eq
	str	w8, [x20]
	bl	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	ldr	w8, [x20]
	cbz	w8, .LBB241_21
.LBB241_9:                              // %while.cond.preheader
	mov	x8, xzr
.LBB241_10:                             // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	ldr	x9, [x24, x8, lsl #3]
	add	x8, x8, #1              // =1
	cbnz	x9, .LBB241_10
// %bb.11:                              // %while.end
	sub	x25, x8, #1             // =1
	mov	x8, sp
	sub	x26, x8, x25, lsl #4
	mov	sp, x26
	mov	w5, #3
	mov	w6, #1
	mov	x0, x19
	mov	w1, w25
	mov	x2, x24
	mov	x3, x23
	mov	x4, x22
	mov	x7, x26
	bl	map_arguments
	mov	w21, w0
	tbnz	w0, #31, .LBB241_33
// %bb.12:                              // %if.end56
	stur	w27, [x29, #-88]        // 4-byte Folded Spill
	add	x27, x26, w21, sxtw #4
	mov	w5, #2
	mov	w6, #2
	mov	x0, x19
	mov	w1, w25
	mov	x2, x24
	mov	x3, x23
	mov	x4, x22
	mov	x7, x27
	bl	map_arguments
	mov	w28, w0
	tbnz	w0, #31, .LBB241_20
// %bb.13:                              // %if.end60
	add	x8, x27, w28, sxtw #4
	mov	w5, #3
	mov	x0, x19
	mov	w1, w25
	mov	x2, x24
	mov	x3, x23
	mov	x4, x22
	mov	w6, wzr
	mov	x7, x8
	mov	x24, x8
	bl	map_arguments
	mov	w22, w0
	tbnz	w0, #31, .LBB241_24
// %bb.14:                              // %if.end66
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE]
	ldr	x8, [x8]
	cbz	x8, .LBB241_17
// %bb.15:                              // %if.then68
	bl	halide_profiler_get_state
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_]
	str	x8, [x0, #32]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE]
	ldr	x23, [x8]
	cbz	x23, .LBB241_17
// %bb.16:                              // %if.then71
	bl	halide_profiler_get_state
	ldr	w0, [x0, #16]
	blr	x23
.LBB241_17:                             // %if.end75
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon10remote_runE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon10remote_runE]
	ldr	w1, [x20]
	ldur	w0, [x29, #-88]         // 4-byte Folded Reload
	mov	x2, x26
	ldr	x8, [x8]
	mov	w3, w21
	mov	x4, x27
	mov	w5, w28
	mov	x6, x24
	mov	w7, w22
	blr	x8
	mov	w21, w0
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	cbz	w21, .LBB241_25
// %bb.18:                              // %if.then84
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB241_26
// %bb.19:                              // %if.else.i
	adrp	x2, .L.str.59.249
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.59.249
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
	b	.LBB241_33
.LBB241_20:
	mov	w21, w28
	b	.LBB241_33
.LBB241_21:                             // %if.then43
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB241_27
// %bb.22:                              // %if.then.i226
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.56.247
	add	x2, x2, :lo12:.L.str.56.247
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x26, .LBB241_28
.LBB241_23:                             // %if.else.i210
	mov	x1, x21
	mov	x2, x26
	b	.LBB241_29
.LBB241_24:
	mov	w21, w22
	b	.LBB241_33
.LBB241_25:                             // %if.end87
	bl	halide_profiler_get_state
	str	xzr, [x0, #32]
	b	.LBB241_33
.LBB241_26:                             // %if.then.i
	adrp	x2, .L.str.59.249
	add	x2, x2, :lo12:.L.str.59.249
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
	bl	halide_free
	b	.LBB241_33
.LBB241_27:                             // %if.then43.split
	adrp	x2, .L.str.56.247
	add	x2, x2, :lo12:.L.str.56.247
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x21, xzr
	cbnz	x26, .LBB241_23
.LBB241_28:                             // %if.then.i208
	adrp	x2, .L.str.112
	add	x2, x2, :lo12:.L.str.112
	mov	x1, x21
.LBB241_29:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.57.248
	add	x2, x2, :lo12:.L.str.57.248
	mov	x1, x21
	bl	halide_string_to_string
	cbz	x20, .LBB241_31
// %bb.30:                              // %if.else.i194
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB241_32
.LBB241_31:                             // %if.then.i188
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB241_32:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit199
	bl	halide_free
	mov	w21, #-1
.LBB241_33:                             // %cleanup101
	mov	w0, w21
	sub	sp, x29, #80            // =80
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end241:
	.size	halide_hexagon_run, .Lfunc_end241-halide_hexagon_run
                                        // -- End function
	.section	.text.halide_hexagon_power_hvx_on,"ax",@progbits
	.weak	halide_hexagon_power_hvx_on // -- Begin function halide_hexagon_power_hvx_on
	.p2align	2
	.type	halide_hexagon_power_hvx_on,@function
halide_hexagon_power_hvx_on:            // @halide_hexagon_power_hvx_on
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x20, x0
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w19, w0
	cbz	w0, .LBB242_2
.LBB242_1:                              // %cleanup
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB242_2:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE]
	ldr	x8, [x8]
	cbz	x8, .LBB242_6
// %bb.3:                               // %if.end2
	blr	x8
	mov	w19, w0
	cbz	w0, .LBB242_1
// %bb.4:                               // %if.then11
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	cbz	x0, .LBB242_7
// %bb.5:                               // %if.else.i
	adrp	x2, .L.str.98
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.98
	mov	x21, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB242_8
.LBB242_6:
	mov	w19, wzr
	b	.LBB242_1
.LBB242_7:                              // %if.then.i
	adrp	x2, .L.str.98
	add	x2, x2, :lo12:.L.str.98
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB242_8:                              // %cleanup
	bl	halide_free
	b	.LBB242_1
.Lfunc_end242:
	.size	halide_hexagon_power_hvx_on, .Lfunc_end242-halide_hexagon_power_hvx_on
                                        // -- End function
	.section	.text.halide_hexagon_power_hvx_off,"ax",@progbits
	.weak	halide_hexagon_power_hvx_off // -- Begin function halide_hexagon_power_hvx_off
	.p2align	2
	.type	halide_hexagon_power_hvx_off,@function
halide_hexagon_power_hvx_off:           // @halide_hexagon_power_hvx_off
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x20, x0
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w19, w0
	cbz	w0, .LBB243_2
.LBB243_1:                              // %cleanup
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB243_2:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE]
	ldr	x8, [x8]
	cbz	x8, .LBB243_6
// %bb.3:                               // %if.end2
	blr	x8
	mov	w19, w0
	cbz	w0, .LBB243_1
// %bb.4:                               // %if.then11
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	cbz	x0, .LBB243_7
// %bb.5:                               // %if.else.i
	adrp	x2, .L.str.101
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.101
	mov	x21, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB243_8
.LBB243_6:
	mov	w19, wzr
	b	.LBB243_1
.LBB243_7:                              // %if.then.i
	adrp	x2, .L.str.101
	add	x2, x2, :lo12:.L.str.101
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB243_8:                              // %cleanup
	bl	halide_free
	b	.LBB243_1
.Lfunc_end243:
	.size	halide_hexagon_power_hvx_off, .Lfunc_end243-halide_hexagon_power_hvx_off
                                        // -- End function
	.section	.text.halide_hexagon_power_hvx_off_as_destructor,"ax",@progbits
	.weak	halide_hexagon_power_hvx_off_as_destructor // -- Begin function halide_hexagon_power_hvx_off_as_destructor
	.p2align	2
	.type	halide_hexagon_power_hvx_off_as_destructor,@function
halide_hexagon_power_hvx_off_as_destructor: // @halide_hexagon_power_hvx_off_as_destructor
// %bb.0:                               // %entry
	b	halide_hexagon_power_hvx_off
.Lfunc_end244:
	.size	halide_hexagon_power_hvx_off_as_destructor, .Lfunc_end244-halide_hexagon_power_hvx_off_as_destructor
                                        // -- End function
	.section	.text.halide_hexagon_set_performance_mode,"ax",@progbits
	.weak	halide_hexagon_set_performance_mode // -- Begin function halide_hexagon_set_performance_mode
	.p2align	2
	.type	halide_hexagon_set_performance_mode,@function
halide_hexagon_set_performance_mode:    // @halide_hexagon_set_performance_mode
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	w21, w1
	mov	x20, x0
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w19, w0
	cbz	w0, .LBB245_2
.LBB245_1:                              // %cleanup
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB245_2:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE]
	ldr	x8, [x8]
	cbz	x8, .LBB245_6
// %bb.3:                               // %if.end2
	mov	w0, w21
	blr	x8
	mov	w19, w0
	cbz	w0, .LBB245_1
// %bb.4:                               // %if.then11
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	cbz	x0, .LBB245_7
// %bb.5:                               // %if.else.i
	adrp	x2, .L.str.104
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.104
	mov	x21, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB245_8
.LBB245_6:
	mov	w19, wzr
	b	.LBB245_1
.LBB245_7:                              // %if.then.i
	adrp	x2, .L.str.104
	add	x2, x2, :lo12:.L.str.104
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB245_8:                              // %cleanup
	bl	halide_free
	b	.LBB245_1
.Lfunc_end245:
	.size	halide_hexagon_set_performance_mode, .Lfunc_end245-halide_hexagon_set_performance_mode
                                        // -- End function
	.section	.text.halide_hexagon_set_performance,"ax",@progbits
	.weak	halide_hexagon_set_performance // -- Begin function halide_hexagon_set_performance
	.p2align	2
	.type	halide_hexagon_set_performance,@function
halide_hexagon_set_performance:         // @halide_hexagon_set_performance
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x21, x1
	mov	x19, x0
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w20, w0
	cbz	w0, .LBB246_2
.LBB246_1:                              // %cleanup
	mov	w0, w20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB246_2:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE]
	ldr	x8, [x8]
	cbz	x8, .LBB246_6
// %bb.3:                               // %if.end2
	ldrb	w0, [x21]
	ldp	w1, w2, [x21, #4]
	ldrb	w3, [x21, #12]
	ldr	w4, [x21, #16]
	ldrh	w5, [x21, #20]
	ldrb	w6, [x21, #22]
	ldr	w7, [x21, #24]
	blr	x8
	mov	w20, w0
	cbz	w0, .LBB246_1
// %bb.4:                               // %if.then17
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB246_7
// %bb.5:                               // %if.else.i
	adrp	x2, .L.str.107
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.107
	mov	x21, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB246_8
.LBB246_6:
	mov	w20, wzr
	b	.LBB246_1
.LBB246_7:                              // %if.then.i
	adrp	x2, .L.str.107
	add	x2, x2, :lo12:.L.str.107
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB246_8:                              // %cleanup
	bl	halide_free
	b	.LBB246_1
.Lfunc_end246:
	.size	halide_hexagon_set_performance, .Lfunc_end246-halide_hexagon_set_performance
                                        // -- End function
	.section	.text.halide_hexagon_set_thread_priority,"ax",@progbits
	.weak	halide_hexagon_set_thread_priority // -- Begin function halide_hexagon_set_thread_priority
	.p2align	2
	.type	halide_hexagon_set_thread_priority,@function
halide_hexagon_set_thread_priority:     // @halide_hexagon_set_thread_priority
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	w21, w1
	mov	x20, x0
	bl	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	mov	w19, w0
	cbz	w0, .LBB247_2
.LBB247_1:                              // %cleanup
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB247_2:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE]
	ldr	x8, [x8]
	cbz	x8, .LBB247_6
// %bb.3:                               // %if.end2
	mov	w0, w21
	blr	x8
	mov	w19, w0
	cbz	w0, .LBB247_1
// %bb.4:                               // %if.then11
	mov	w1, #1024
	mov	x0, x20
	bl	halide_malloc
	cbz	x0, .LBB247_7
// %bb.5:                               // %if.else.i
	adrp	x2, .L.str.110
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.110
	mov	x21, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB247_8
.LBB247_6:
	mov	w19, wzr
	b	.LBB247_1
.LBB247_7:                              // %if.then.i
	adrp	x2, .L.str.110
	add	x2, x2, :lo12:.L.str.110
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.111
	add	x1, x1, :lo12:.L.str.111
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB247_8:                              // %cleanup
	bl	halide_free
	b	.LBB247_1
.Lfunc_end247:
	.size	halide_hexagon_set_thread_priority, .Lfunc_end247-halide_hexagon_set_thread_priority
                                        // -- End function
	.section	.text.halide_hexagon_device_interface,"ax",@progbits
	.weak	halide_hexagon_device_interface // -- Begin function halide_hexagon_device_interface
	.p2align	2
	.type	halide_hexagon_device_interface,@function
halide_hexagon_device_interface:        // @halide_hexagon_device_interface
// %bb.0:                               // %entry
	adrp	x0, :got:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE]
	ret
.Lfunc_end248:
	.size	halide_hexagon_device_interface, .Lfunc_end248-halide_hexagon_device_interface
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               // -- Begin function halide_blur
.LCPI249_0:
	.word	1                       // 0x1
	.word	0                       // 0x0
.LCPI249_3:
	.word	2                       // 0x2
	.word	1                       // 0x1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI249_1:
	.xword	60                      // 0x3c
	.xword	8                       // 0x8
.LCPI249_2:
	.xword	1                       // 0x1
	.xword	0                       // 0x0
	.section	.text.halide_blur,"ax",@progbits
	.globl	halide_blur
	.p2align	2
	.type	halide_blur,@function
halide_blur:                            // @halide_blur
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	sub	sp, sp, #432            // =432
	mov	x19, x1
	adrp	x1, .Lhexagon_module_state_buf.data
	adrp	x2, .Lhalide_hexagon_code.data
	adrp	x4, .Lhalide_shared_runtime.data
	mov	w5, #25256
	mov	x21, x0
	add	x1, x1, :lo12:.Lhexagon_module_state_buf.data
	add	x2, x2, :lo12:.Lhalide_hexagon_code.data
	add	x4, x4, :lo12:.Lhalide_shared_runtime.data
	mov	w3, #8752
	movk	w5, #1, lsl #16
	mov	x0, xzr
	bl	halide_hexagon_initialize_kernels
	cbnz	w0, .LBB249_21
// %bb.1:                               // %"assert succeeded"
	cbz	x21, .LBB249_22
// %bb.2:                               // %"assert succeeded2"
	cbz	x19, .LBB249_23
// %bb.3:                               // %"assert succeeded4"
	add	x1, x19, #32            // =32
	add	x0, sp, #428            // =428
	mov	w2, #4
	bl	memcpy
	ldr	w9, [sp, #428]
	ldr	x8, [x19, #40]
	ldr	x27, [x21, #16]
	add	x1, x21, #32            // =32
	str	w9, [sp, #76]           // 4-byte Folded Spill
	ldr	w9, [x19, #36]
	ldr	w29, [x8, #24]
	add	x0, sp, #428            // =428
	mov	w2, #4
	str	w9, [sp, #60]           // 4-byte Folded Spill
	ldr	w9, [x8, #8]
	ldp	w20, w28, [x8]
	str	w9, [sp, #56]           // 4-byte Folded Spill
	ldp	w22, w25, [x8, #16]
	bl	memcpy
	ldr	x12, [x21, #40]
	subs	w26, w28, #256          // =256
	mov	w9, #256
	sub	w10, w25, #1            // =1
	sub	w1, w28, #1             // =1
	csel	w5, w28, w9, lt
	and	w16, w10, #0xffffff80
	ldp	w9, w10, [x12, #16]
	and	w13, w1, #0xffffff00
	ldr	w4, [sp, #428]
	ldr	w8, [x21, #36]
	ldr	x15, [x19, #16]
	cmp	w13, w26
	ldp	w6, w3, [x12]
	ldr	w2, [x12, #8]
	ldr	w11, [x12, #24]
	csel	w14, w13, w26, lt
	subs	w13, w25, #128          // =128
	mov	w12, #128
	str	w9, [sp, #72]           // 4-byte Folded Spill
	csel	w9, w25, w12, lt
	cmp	w16, w13
	csel	w13, w16, w13, lt
	cbnz	x15, .LBB249_5
// %bb.4:                               // %_halide_buffer_is_bounds_query.exit
	ldr	x15, [x19]
	cbz	x15, .LBB249_16
.LBB249_5:                              // %after_bb
	ldr	x15, [x21, #16]
	cbnz	x15, .LBB249_17
.LBB249_6:                              // %_halide_buffer_is_bounds_query.exit107
	ldr	x15, [x21]
	cbnz	x15, .LBB249_17
// %bb.7:                               // %true_bb5
	adrp	x18, .LCPI249_0
	cmp	w28, #128               // =128
	mov	w16, #128
	ldr	d0, [x18, :lo12:.LCPI249_0]
	add	w17, w25, #2            // =2
	csel	w18, w28, w16, lt
	csel	w16, w28, w16, gt
	stp	w22, w17, [sp, #128]
	add	w17, w20, w18
	add	w16, w16, #2            // =2
	sub	w17, w17, #128          // =128
	stp	w17, w16, [sp, #112]
	str	d0, [sp, #120]
	ldr	x15, [x21, #40]
	ldr	q0, [sp, #112]
	mov	x0, #4097
	movk	x0, #1, lsl #16
	movk	x0, #2, lsl #32
	stp	xzr, xzr, [x21, #8]
	str	xzr, [x21]
	str	x0, [x21, #32]
	stp	w16, wzr, [sp, #136]
	str	q0, [x15]
	ldr	x15, [x21, #40]
	ldr	q0, [sp, #128]
	str	q0, [x15, #16]
	str	xzr, [x21, #24]
	ldr	x15, [x19, #16]
	ldr	w30, [sp, #76]          // 4-byte Folded Reload
	cbnz	x15, .LBB249_18
.LBB249_8:                              // %land.rhs.i80
	ldr	x15, [x19]
	cmp	x15, #0                 // =0
	cset	w15, eq
	ldr	x16, [x21, #16]
	cbnz	x16, .LBB249_19
.LBB249_9:                              // %land.rhs.i74
	ldr	x16, [x21]
	cmp	x16, #0                 // =0
	cset	w16, eq
	orr	w15, w15, w16
	tbnz	w15, #0, .LBB249_20
.LBB249_10:                             // %true_bb8
	str	x11, [sp, #64]          // 8-byte Folded Spill
	ldr	w11, [sp, #60]          // 4-byte Folded Reload
	cmp	w25, #128               // =128
	mov	w18, #4097
	movk	w18, #1, lsl #16
	cset	w0, lt
	cmp	w28, #256               // =256
	cset	w7, lt
	cmp	w30, w18
	str	x29, [sp, #16]          // 8-byte Folded Spill
	mov	w29, w4
	cset	w30, ne
	cmp	w11, #2                 // =2
	add	w14, w14, w20
	cset	w11, ne
	cmp	w29, w18
	str	w1, [sp, #44]           // 4-byte Folded Spill
	str	x27, [sp, #48]          // 8-byte Folded Spill
	add	w27, w28, w20
	add	w17, w13, w22
	add	w1, w14, #256           // =256
	cset	w18, ne
	cmp	w8, #2                  // =2
	add	w13, w25, w22
	add	w4, w17, #128           // =128
	bfi	x30, x11, #1, #1
	cset	w11, ne
	cmp	w1, w27
	ldr	w24, [sp, #72]          // 4-byte Folded Reload
	sxtw	x15, w3
	cset	w1, gt
	cmp	w4, w13
	stp	w9, w5, [sp, #8]        // 8-byte Folded Spill
	add	w5, w27, #2             // =2
	add	w12, w15, w6
	orr	w1, w7, w1
	cset	w4, gt
	cmp	w20, w6
	ldr	w7, [sp, #56]           // 4-byte Folded Reload
	sxtw	x16, w10
	orr	w0, w0, w4
	cset	w4, lt
	cmp	w5, w12
	add	w23, w13, #2            // =2
	mov	w9, w8
	add	w8, w16, w24
	cset	w5, gt
	cmp	w24, w22
	orr	w4, w4, w5
	cset	w5, gt
	cmp	w23, w8
	stp	w6, w20, [sp, #28]      // 8-byte Folded Spill
	cset	w6, gt
	cmp	w7, #1                  // =1
	orr	w5, w5, w6
	cset	w6, ne
	bfi	x30, x6, #10, #1
	bfi	x30, x1, #4, #1
	bfi	x30, x18, #2, #1
	orr	x11, x30, x11, lsl #3
	lsr	x18, x3, #24
	orr	x11, x11, x0, lsl #5
	and	x18, x18, #0x80
	cmp	w2, #1                  // =1
	orr	x11, x11, x18
	cset	w18, ne
	orr	x11, x11, x18, lsl #11
	lsr	x18, x10, #22
	orr	x11, x11, x4, lsl #6
	and	x18, x18, #0x200
	orr	x11, x11, x18
	orr	x11, x11, x5, lsl #8
	orr	x11, x11, #0x8000000000000000
	rbit	x11, x11
	clz	x18, x11
	cmp	w18, #11                // =11
	stp	w8, w12, [sp, #36]      // 8-byte Folded Spill
	mov	w8, w2
	b.ls	.LBB249_25
// %bb.11:                              // %no_errors_bb
	ldr	x29, [sp, #16]          // 8-byte Folded Reload
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	sxtw	x9, w28
	sxtw	x10, w25
	cmp	x9, #0                  // =0
	sxtw	x11, w29
	sxtw	x12, w8
	mul	x8, x10, x9
	cneg	x9, x9, mi
	mul	x10, x11, x10
	lsr	x11, x9, #31
	cmp	x11, #0                 // =0
	cset	w14, ne
	cmp	x10, #0                 // =0
	cneg	x10, x10, mi
	lsr	x11, x10, #31
	mov	w13, #2147483647
	cmp	x11, #0                 // =0
	mul	x2, x16, x15
	mul	x12, x12, x16
	cset	w16, ne
	cmp	x8, x13
	cset	w17, gt
	cmp	x15, #0                 // =0
	cneg	x11, x15, mi
	lsr	x15, x11, #31
	cmp	x15, #0                 // =0
	cset	w15, ne
	cmp	x12, #0                 // =0
	bfi	x14, x17, #2, #1
	cneg	x12, x12, mi
	bfi	x14, x16, #1, #1
	lsr	x16, x12, #31
	cmp	x16, #0                 // =0
	cset	w16, ne
	cmp	x2, x13
	cset	w13, gt
	bfi	x14, x15, #3, #1
	bfi	x14, x13, #5, #1
	orr	x13, x14, x16, lsl #4
	orr	x13, x13, #0x8000000000000000
	rbit	x13, x13
	clz	x13, x13
	cmp	w13, #5                 // =5
	b.ls	.LBB249_27
// %bb.12:                              // %"produce blur_y"
	bl	halide_hexagon_device_interface
	mov	x2, x0
	mov	x0, xzr
	mov	x1, x19
	bl	halide_copy_to_device
	ldr	w20, [sp, #32]          // 4-byte Folded Reload
	cbnz	w0, .LBB249_21
// %bb.13:                              // %"assert succeeded30"
	bl	halide_hexagon_device_interface
	mov	x2, x0
	mov	x0, xzr
	mov	x1, x21
	bl	halide_copy_to_device
	cbnz	w0, .LBB249_21
// %bb.14:                              // %"assert succeeded32"
	ldr	w18, [sp, #28]          // 4-byte Folded Reload
	ldr	x1, [sp, #64]           // 8-byte Folded Reload
	ldr	w16, [sp, #72]          // 4-byte Folded Reload
	ldr	w9, [sp, #44]           // 4-byte Folded Reload
	ldr	x24, [sp, #48]          // 8-byte Folded Reload
	subs	w13, w20, w18
	mul	w17, w16, w1
	sub	w18, w27, w18
	and	w9, w9, #0xffffff80
	sub	w10, w28, #128          // =128
	str	x24, [sp, #328]
	add	x24, sp, #280           // =280
	sub	w18, w18, w17
	sub	w13, w13, w17
	add	x17, sp, #296           // =296
	stp	x24, x17, [sp, #344]
	cset	w17, ge
	cmp	w9, w10
	csel	w9, w9, w10, lt
	ldr	w10, [sp, #36]          // 4-byte Folded Reload
	adrp	x3, .LCPI249_1
	asr	w11, w28, #7
	adrp	x5, .LCPI249_2
	ldr	q1, [x3, :lo12:.LCPI249_1]
	add	w9, w9, #130            // =130
	ldr	q2, [x5, :lo12:.LCPI249_2]
	stp	w10, w13, [sp, #172]
	add	w10, w9, w20
	stp	w9, w11, [sp, #180]
	ldr	w9, [sp, #40]           // 4-byte Folded Reload
	mneg	w14, w22, w29
	msub	w0, w22, w29, w26
	mov	w2, #8
	mov	w4, #1
	stp	w14, w0, [sp, #196]
	add	x14, sp, #312           // =312
	dup	v0.2d, x2
	add	x0, sp, #328            // =328
	str	w1, [sp, #160]
	adrp	x1, .Lhexagon_module_state_buf.data
	ldr	x6, [x19]
	ldr	x7, [x19, #16]
	stp	x14, x0, [sp, #360]
	adrp	x14, .LCPI249_3
	stp	q0, q1, [sp, #208]
	dup	v0.2d, x4
	stp	w22, w29, [sp, #152]
	ldr	x22, [x21]
	ldr	x21, [x21, #16]
	ldr	x1, [x1, :lo12:.Lhexagon_module_state_buf.data]
	stp	q0, q2, [sp, #240]
	ldr	d0, [x14, :lo12:.LCPI249_3]
	cmp	w10, w9
	add	x2, sp, #341            // =341
	add	x3, sp, #342            // =342
	cset	w9, le
	tst	w28, #0xff
	add	w15, w25, #127          // =127
	add	x5, sp, #343            // =343
	stp	x2, x3, [sp, #376]
	cset	w10, ne
	tst	w28, #0x7f
	adrp	x2, .Lstr.256
	adrp	x3, .Loffload_rpc.blur_y.s0.__outermost_buf.data
	add	x8, sp, #400            // =400
	asr	w12, w28, #8
	add	w16, w16, #128          // =128
	add	x23, sp, #144           // =144
	asr	w15, w15, #7
	str	x5, [sp, #392]
	str	w4, [sp, #408]
	stp	x6, x7, [sp, #280]
	and	w9, w17, w9
	cset	w11, ne
	add	x2, x2, :lo12:.Lstr.256
	add	x3, x3, :lo12:.Loffload_rpc.blur_y.s0.__outermost_buf.data
	add	x4, sp, #208            // =208
	add	x5, sp, #344            // =344
	add	x6, sp, #400            // =400
	mov	x0, xzr
	stp	w28, w25, [sp, #144]
	stp	xzr, x23, [sp, #312]
	stp	w15, w16, [sp, #164]
	stp	w18, w12, [sp, #188]
	stp	x22, x21, [sp, #296]
	str	d0, [sp, #400]
	stur	xzr, [x8, #20]
	strb	w9, [sp, #341]
	strb	w10, [sp, #343]
	strb	w11, [sp, #342]
	stur	xzr, [x8, #12]
	bl	halide_hexagon_run
	cbnz	w0, .LBB249_21
// %bb.15:                              // %"assert succeeded34"
	ldr	x8, [x19, #24]
	orr	x8, x8, #0x2
	str	x8, [x19, #24]
	b	.LBB249_21
.LBB249_16:                             // %true_bb
	adrp	x0, .LCPI249_0
	ldr	d0, [x0, :lo12:.LCPI249_0]
	sub	w15, w14, w5
	add	w17, w20, w5
	sub	w17, w17, #256          // =256
	add	w15, w15, #512          // =512
	mov	x0, #4097
	stp	w17, w15, [sp, #80]
	str	d0, [sp, #88]
	ldr	x16, [x19, #40]
	movk	x0, #1, lsl #16
	ldr	q0, [sp, #80]
	movk	x0, #2, lsl #32
	add	w18, w22, w9
	str	x0, [x19, #32]
	sub	w0, w13, w9
	sub	w18, w18, #128          // =128
	add	w0, w0, #256            // =256
	stp	xzr, xzr, [x19, #8]
	str	xzr, [x19]
	stp	w18, w0, [sp, #96]
	stp	w15, wzr, [sp, #104]
	str	q0, [x16]
	ldr	x15, [x19, #40]
	ldr	q0, [sp, #96]
	str	q0, [x15, #16]
	str	xzr, [x19, #24]
	ldr	x15, [x21, #16]
	cbz	x15, .LBB249_6
.LBB249_17:                             // %after_bb7
	ldr	x15, [x19, #16]
	ldr	w30, [sp, #76]          // 4-byte Folded Reload
	cbz	x15, .LBB249_8
.LBB249_18:
	mov	w15, wzr
	ldr	x16, [x21, #16]
	cbz	x16, .LBB249_9
.LBB249_19:
	mov	w16, wzr
	orr	w15, w15, w16
	tbz	w15, #0, .LBB249_10
.LBB249_20:
	mov	w0, wzr
.LBB249_21:                             // %destructor_block
	add	sp, sp, #432            // =432
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.LBB249_22:                             // %"assert failed1"
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	b	.LBB249_24
.LBB249_23:                             // %"assert failed3"
	adrp	x1, .Lstr.250
	add	x1, x1, :lo12:.Lstr.250
.LBB249_24:                             // %"assert failed1"
	mov	x0, xzr
	add	sp, sp, #432            // =432
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	b	halide_error_buffer_argument_is_null
.LBB249_25:                             // %true_bb8
	adrp	x11, .LJTI249_0
	add	x11, x11, :lo12:.LJTI249_0
	adr	x15, .LBB249_26
	ldrb	w16, [x11, x18]
	add	x15, x15, x16, lsl #2
	br	x15
.LBB249_26:                             // %assert_failed
	ldr	w2, [sp, #76]           // 4-byte Folded Reload
	adrp	x1, .Lstr.251
	mov	w3, #4097
	add	x1, x1, :lo12:.Lstr.251
	movk	w3, #1, lsl #16
	mov	x0, xzr
	bl	halide_error_bad_type
	b	.LBB249_21
.LBB249_27:                             // %no_errors_bb
	adrp	x14, .LJTI249_1
	add	x14, x14, :lo12:.LJTI249_1
	adr	x15, .LBB249_28
	ldrb	w16, [x14, x13]
	add	x15, x15, x16, lsl #2
	br	x15
.LBB249_28:                             // %assert_failed23
	adrp	x1, .Lstr.250
	add	x1, x1, :lo12:.Lstr.250
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x9
	bl	halide_error_buffer_allocation_too_large
	b	.LBB249_21
.LBB249_29:                             // %assert_failed24
	adrp	x1, .Lstr.250
	add	x1, x1, :lo12:.Lstr.250
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x10
	bl	halide_error_buffer_allocation_too_large
	b	.LBB249_21
.LBB249_30:                             // %assert_failed25
	adrp	x1, .Lstr.250
	add	x1, x1, :lo12:.Lstr.250
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x8
	bl	halide_error_buffer_extents_too_large
	b	.LBB249_21
.LBB249_31:                             // %assert_failed26
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x11
	bl	halide_error_buffer_allocation_too_large
	b	.LBB249_21
.LBB249_32:                             // %assert_failed27
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x12
	bl	halide_error_buffer_allocation_too_large
	b	.LBB249_21
.LBB249_33:                             // %assert_failed28
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	mov	w3, #2147483647
	mov	x0, xzr
	bl	halide_error_buffer_extents_too_large
	b	.LBB249_21
.LBB249_34:                             // %assert_failed11
	ldr	w2, [sp, #60]           // 4-byte Folded Reload
	adrp	x1, .Lstr.251
	add	x1, x1, :lo12:.Lstr.251
	mov	w3, #2
	mov	x0, xzr
	bl	halide_error_bad_dimensions
	b	.LBB249_21
.LBB249_35:                             // %assert_failed12
	adrp	x1, .Lstr.252
	mov	w3, #4097
	add	x1, x1, :lo12:.Lstr.252
	movk	w3, #1, lsl #16
	mov	x0, xzr
	mov	w2, w29
	bl	halide_error_bad_type
	b	.LBB249_21
.LBB249_36:                             // %assert_failed13
	adrp	x1, .Lstr.252
	add	x1, x1, :lo12:.Lstr.252
	mov	w3, #2
	mov	x0, xzr
	mov	w2, w9
	bl	halide_error_bad_dimensions
	b	.LBB249_21
.LBB249_37:                             // %assert_failed14
	ldr	w5, [sp, #32]           // 4-byte Folded Reload
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	adrp	x1, .Lstr.251
	add	w4, w14, #255           // =255
	sub	w6, w27, #1             // =1
	add	w8, w5, w8
	sub	w3, w8, #256            // =256
	add	x1, x1, :lo12:.Lstr.251
	mov	x0, xzr
	mov	w2, wzr
	bl	halide_error_access_out_of_bounds
	b	.LBB249_21
.LBB249_38:                             // %assert_failed15
	ldr	w8, [sp, #8]            // 4-byte Folded Reload
	adrp	x1, .Lstr.251
	add	w4, w17, #127           // =127
	sub	w6, w13, #1             // =1
	add	w8, w22, w8
	sub	w3, w8, #128            // =128
	add	x1, x1, :lo12:.Lstr.251
	mov	w2, #1
	mov	x0, xzr
	mov	w5, w22
	bl	halide_error_access_out_of_bounds
	b	.LBB249_21
.LBB249_39:                             // %assert_failed16
	ldr	w8, [sp, #40]           // 4-byte Folded Reload
	ldp	w5, w3, [sp, #28]       // 8-byte Folded Reload
	adrp	x1, .Lstr.252
	add	w4, w27, #1             // =1
	sub	w6, w8, #1              // =1
	add	x1, x1, :lo12:.Lstr.252
	mov	x0, xzr
	mov	w2, wzr
	bl	halide_error_access_out_of_bounds
	b	.LBB249_21
.LBB249_40:                             // %assert_failed17
	adrp	x1, .Lstr.252
	add	x1, x1, :lo12:.Lstr.252
	mov	x0, xzr
	mov	w2, wzr
                                        // kill: def $w3 killed $w3 killed $x3
	bl	halide_error_buffer_extents_negative
	b	.LBB249_21
.LBB249_41:                             // %assert_failed18
	ldr	w8, [sp, #36]           // 4-byte Folded Reload
	ldr	w5, [sp, #72]           // 4-byte Folded Reload
	adrp	x1, .Lstr.252
	add	w4, w13, #1             // =1
	sub	w6, w8, #1              // =1
	add	x1, x1, :lo12:.Lstr.252
	mov	w2, #1
	mov	x0, xzr
	mov	w3, w22
	bl	halide_error_access_out_of_bounds
	b	.LBB249_21
.LBB249_42:                             // %assert_failed19
	adrp	x1, .Lstr.252
	add	x1, x1, :lo12:.Lstr.252
	mov	w2, #1
	mov	x0, xzr
	mov	w3, w10
	bl	halide_error_buffer_extents_negative
	b	.LBB249_21
.LBB249_43:                             // %assert_failed20
	ldr	w2, [sp, #56]           // 4-byte Folded Reload
	adrp	x1, .Lstr.253
	adrp	x3, .Lstr.254
	add	x1, x1, :lo12:.Lstr.253
	b	.LBB249_45
.LBB249_44:                             // %assert_failed21
	adrp	x1, .Lstr.255
	adrp	x3, .Lstr.254
	add	x1, x1, :lo12:.Lstr.255
.LBB249_45:                             // %destructor_block
	add	x3, x3, :lo12:.Lstr.254
	mov	w4, #1
	mov	x0, xzr
	bl	halide_error_constraint_violated
	b	.LBB249_21
.Lfunc_end249:
	.size	halide_blur, .Lfunc_end249-halide_blur
	.section	.rodata.halide_blur,"a",@progbits
.LJTI249_0:
	.byte	(.LBB249_26-.LBB249_26)>>2
	.byte	(.LBB249_34-.LBB249_26)>>2
	.byte	(.LBB249_35-.LBB249_26)>>2
	.byte	(.LBB249_36-.LBB249_26)>>2
	.byte	(.LBB249_37-.LBB249_26)>>2
	.byte	(.LBB249_38-.LBB249_26)>>2
	.byte	(.LBB249_39-.LBB249_26)>>2
	.byte	(.LBB249_40-.LBB249_26)>>2
	.byte	(.LBB249_41-.LBB249_26)>>2
	.byte	(.LBB249_42-.LBB249_26)>>2
	.byte	(.LBB249_43-.LBB249_26)>>2
	.byte	(.LBB249_44-.LBB249_26)>>2
.LJTI249_1:
	.byte	(.LBB249_28-.LBB249_28)>>2
	.byte	(.LBB249_29-.LBB249_28)>>2
	.byte	(.LBB249_30-.LBB249_28)>>2
	.byte	(.LBB249_31-.LBB249_28)>>2
	.byte	(.LBB249_32-.LBB249_28)>>2
	.byte	(.LBB249_33-.LBB249_28)>>2
                                        // -- End function
	.section	.text.halide_blur_argv,"ax",@progbits
	.globl	halide_blur_argv        // -- Begin function halide_blur_argv
	.p2align	2
	.type	halide_blur_argv,@function
halide_blur_argv:                       // @halide_blur_argv
// %bb.0:                               // %entry
	ldp	x8, x1, [x0]
	mov	x0, x8
	b	halide_blur
.Lfunc_end250:
	.size	halide_blur_argv, .Lfunc_end250-halide_blur_argv
                                        // -- End function
	.section	.text.halide_blur_metadata,"ax",@progbits
	.globl	halide_blur_metadata    // -- Begin function halide_blur_metadata
	.p2align	2
	.type	halide_blur_metadata,@function
halide_blur_metadata:                   // @halide_blur_metadata
// %bb.0:                               // %entry
	adrp	x0, .Lhalide_blur_metadata_storage
	add	x0, x0, :lo12:.Lhalide_blur_metadata_storage
	ret
.Lfunc_end251:
	.size	halide_blur_metadata, .Lfunc_end251-halide_blur_metadata
                                        // -- End function
	.type	_ZN6Halide7Runtime8Internal13custom_mallocE,@object // @_ZN6Halide7Runtime8Internal13custom_mallocE
	.data
	.weak	_ZN6Halide7Runtime8Internal13custom_mallocE
	.p2align	3
_ZN6Halide7Runtime8Internal13custom_mallocE:
	.xword	halide_default_malloc
	.size	_ZN6Halide7Runtime8Internal13custom_mallocE, 8

	.type	_ZN6Halide7Runtime8Internal11custom_freeE,@object // @_ZN6Halide7Runtime8Internal11custom_freeE
	.weak	_ZN6Halide7Runtime8Internal11custom_freeE
	.p2align	3
_ZN6Halide7Runtime8Internal11custom_freeE:
	.xword	halide_default_free
	.size	_ZN6Halide7Runtime8Internal11custom_freeE, 8

	.type	_ZN6Halide7Runtime8Internal13error_handlerE,@object // @_ZN6Halide7Runtime8Internal13error_handlerE
	.weak	_ZN6Halide7Runtime8Internal13error_handlerE
	.p2align	3
_ZN6Halide7Runtime8Internal13error_handlerE:
	.xword	halide_default_error
	.size	_ZN6Halide7Runtime8Internal13error_handlerE, 8

	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Error: "
	.size	.L.str, 8

	.type	_ZN6Halide7Runtime8Internal12custom_printE,@object // @_ZN6Halide7Runtime8Internal12custom_printE
	.data
	.weak	_ZN6Halide7Runtime8Internal12custom_printE
	.p2align	3
_ZN6Halide7Runtime8Internal12custom_printE:
	.xword	halide_default_print
	.size	_ZN6Halide7Runtime8Internal12custom_printE, 8

	.type	halide_reference_clock_inited,@object // @halide_reference_clock_inited
	.bss
	.weak	halide_reference_clock_inited
halide_reference_clock_inited:
	.byte	0                       // 0x0
	.size	halide_reference_clock_inited, 1

	.type	halide_reference_clock,@object // @halide_reference_clock
	.weak	halide_reference_clock
	.p2align	3
halide_reference_clock:
	.zero	16
	.size	halide_reference_clock, 16

	.type	.L.str.5,@object        // @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"halide"
	.size	.L.str.5, 7

	.type	.L.str.1,@object        // @.str.1
.L.str.1:
	.asciz	"%s"
	.size	.L.str.1, 3

	.type	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE,@object // @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	.bss
	.weak	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
_ZN6Halide7Runtime8Internal15Synchronization13table_storageE:
	.zero	24576
	.size	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE, 24576

	.type	_ZN6Halide7Runtime8Internal10work_queueE,@object // @_ZN6Halide7Runtime8Internal10work_queueE
	.weak	_ZN6Halide7Runtime8Internal10work_queueE
	.p2align	3
_ZN6Halide7Runtime8Internal10work_queueE:
	.zero	8
	.word	0                       // 0x0
	.word	0                       // 0x0
	.xword	0
	.word	0                       // 0x0
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.zero	8
	.zero	8
	.zero	8
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	2048
	.byte	0                       // 0x0
	.byte	0                       // 0x0
	.zero	2
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal10work_queueE, 2128

	.type	_ZN6Halide7Runtime8Internal14custom_do_taskE,@object // @_ZN6Halide7Runtime8Internal14custom_do_taskE
	.data
	.weak	_ZN6Halide7Runtime8Internal14custom_do_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal14custom_do_taskE:
	.xword	halide_default_do_task
	.size	_ZN6Halide7Runtime8Internal14custom_do_taskE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE,@object // @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.weak	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_do_loop_taskE:
	.xword	halide_default_do_loop_task
	.size	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, 8

	.type	_ZN6Halide7Runtime8Internal17custom_do_par_forE,@object // @_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.weak	_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_do_par_forE:
	.xword	halide_default_do_par_for
	.size	_ZN6Halide7Runtime8Internal17custom_do_par_forE, 8

	.type	.L.str.6,@object        // @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"/home/jason/code/Halide/src/runtime/synchronization_common.h:381 Assert failed: next != NULL\n"
	.size	.L.str.6, 94

	.type	.L.str.6.7,@object      // @.str.6.7
.L.str.6.7:
	.asciz	"/home/jason/code/Halide/src/runtime/synchronization_common.h:1096 Assert failed: val & 0x1\n"
	.size	.L.str.6.7, 92

	.type	.L.str.7,@object        // @.str.7
.L.str.7:
	.asciz	"/home/jason/code/Halide/src/runtime/thread_pool_common.h:151 Assert failed: bytes == limit && \"Logic error in thread pool work queue initialization.\\n\"\n"
	.size	.L.str.7, 153

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"/home/jason/code/Halide/src/runtime/thread_pool_common.h:498 Assert failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \"Logic error: thread over commit.\\n\"\n"
	.size	.L.str.3, 230

	.type	.L.str.1.8,@object      // @.str.1.8
.L.str.1.8:
	.asciz	"HL_NUM_THREADS"
	.size	.L.str.1.8, 15

	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"HL_NUMTHREADS"
	.size	.L.str.2, 14

	.type	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE,@object // @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.data
	.weak	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE:
	.xword	halide_default_do_parallel_tasks
	.size	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, 8

	.type	_ZN6Halide7Runtime8Internal21custom_semaphore_initE,@object // @_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.weak	_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.p2align	3
_ZN6Halide7Runtime8Internal21custom_semaphore_initE:
	.xword	halide_default_semaphore_init
	.size	_ZN6Halide7Runtime8Internal21custom_semaphore_initE, 8

	.type	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE,@object // @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.weak	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.p2align	3
_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE:
	.xword	halide_default_semaphore_try_acquire
	.size	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, 8

	.type	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE,@object // @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.weak	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE:
	.xword	halide_default_semaphore_release
	.size	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, 8

	.section	.fini_array,"aw",@fini_array
	.p2align	3
	.xword	halide_thread_pool_cleanup
	.xword	halide_trace_cleanup
	.xword	halide_cache_cleanup
	.xword	halide_profiler_shutdown
	.xword	halide_hexagon_cleanup
	.type	.L.str.4,@object        // @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"halide_set_num_threads: must be >= 0."
	.size	.L.str.4, 38

	.type	_ZN6Halide7Runtime8Internal17custom_get_symbolE,@object // @_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.data
	.weak	_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_get_symbolE:
	.xword	halide_default_get_symbol
	.size	_ZN6Halide7Runtime8Internal17custom_get_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_load_libraryE,@object // @_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.weak	_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_load_libraryE:
	.xword	halide_default_load_library
	.size	_ZN6Halide7Runtime8Internal19custom_load_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE,@object // @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.weak	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal25custom_get_library_symbolE:
	.xword	halide_default_get_library_symbol
	.size	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE,@object // @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.bss
	.weak	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_gpu_deviceE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE,@object // @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.weak	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, 4

	.type	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE,@object // @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, 1

	.type	.L.str.10,@object       // @.str.10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.10:
	.asciz	"HL_GPU_DEVICE"
	.size	.L.str.10, 14

	.type	_ZN6Halide7Runtime8Internal19halide_trace_bufferE,@object // @_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.bss
	.weak	_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_trace_bufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal19halide_trace_bufferE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_trace_fileE,@object // @_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.data
	.weak	_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_trace_fileE:
	.word	4294967295              // 0xffffffff
	.size	_ZN6Halide7Runtime8Internal17halide_trace_fileE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE,@object // @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal22halide_trace_file_lockE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, 4

	.type	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE,@object // @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE,@object // @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.weak	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.p2align	3
_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, 8

	.type	_ZN6Halide7Runtime8Internal19halide_custom_traceE,@object // @_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.data
	.weak	_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_custom_traceE:
	.xword	halide_default_trace
	.size	_ZN6Halide7Runtime8Internal19halide_custom_traceE, 8

	.type	_ZZ20halide_default_traceE3ids,@object // @_ZZ20halide_default_traceE3ids
	.p2align	2
_ZZ20halide_default_traceE3ids:
	.word	1                       // 0x1
	.size	_ZZ20halide_default_traceE3ids, 4

	.type	.L.str.32,@object       // @.str.32
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.32:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:115 Assert failed: success && \"Could not write to trace file\"\n"
	.size	.L.str.32, 111

	.type	.L.str.31,@object       // @.str.31
.L.str.31:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:86 Assert failed: size <= buffer_size\n"
	.size	.L.str.31, 87

	.type	.L.str.2.13,@object     // @.str.2.13
.L.str.2.13:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:215 Assert failed: print_bits <= 64 && \"Tracing bad type\"\n"
	.size	.L.str.2.13, 107

	.type	.L__const.halide_default_trace.event_types,@object // @__const.halide_default_trace.event_types
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3
.L__const.halide_default_trace.event_types:
	.xword	.L.str.3.14
	.xword	.L.str.4.15
	.xword	.L.str.5.16
	.xword	.L.str.6.17
	.xword	.L.str.7.18
	.xword	.L.str.8
	.xword	.L.str.9
	.xword	.L.str.10.19
	.xword	.L.str.11.20
	.xword	.L.str.12
	.xword	.L.str.13
	.size	.L__const.halide_default_trace.event_types, 88

	.type	.L.str.17,@object       // @.str.17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.17:
	.asciz	"<"
	.size	.L.str.17, 2

	.type	.L.str.20,@object       // @.str.20
.L.str.20:
	.asciz	">)"
	.size	.L.str.20, 3

	.type	.L.str.18,@object       // @.str.18
.L.str.18:
	.asciz	">, <"
	.size	.L.str.18, 5

	.type	.L.str.22,@object       // @.str.22
.L.str.22:
	.asciz	" = <"
	.size	.L.str.22, 5

	.type	.L.str.23,@object       // @.str.23
.L.str.23:
	.asciz	" = "
	.size	.L.str.23, 4

	.type	.L.str.24,@object       // @.str.24
.L.str.24:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:284 Assert failed: print_bits >= 16 && \"Tracing a bad type\"\n"
	.size	.L.str.24, 109

	.type	.L.str.25,@object       // @.str.25
.L.str.25:
	.asciz	">"
	.size	.L.str.25, 2

	.type	.L.str.26,@object       // @.str.26
.L.str.26:
	.asciz	" tag = \""
	.size	.L.str.26, 9

	.type	.L.str.27,@object       // @.str.27
.L.str.27:
	.asciz	"\""
	.size	.L.str.27, 2

	.type	.L.str.3.14,@object     // @.str.3.14
.L.str.3.14:
	.asciz	"Load"
	.size	.L.str.3.14, 5

	.type	.L.str.4.15,@object     // @.str.4.15
.L.str.4.15:
	.asciz	"Store"
	.size	.L.str.4.15, 6

	.type	.L.str.5.16,@object     // @.str.5.16
.L.str.5.16:
	.asciz	"Begin realization"
	.size	.L.str.5.16, 18

	.type	.L.str.6.17,@object     // @.str.6.17
.L.str.6.17:
	.asciz	"End realization"
	.size	.L.str.6.17, 16

	.type	.L.str.7.18,@object     // @.str.7.18
.L.str.7.18:
	.asciz	"Produce"
	.size	.L.str.7.18, 8

	.type	.L.str.8,@object        // @.str.8
.L.str.8:
	.asciz	"End produce"
	.size	.L.str.8, 12

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"Consume"
	.size	.L.str.9, 8

	.type	.L.str.10.19,@object    // @.str.10.19
.L.str.10.19:
	.asciz	"End consume"
	.size	.L.str.10.19, 12

	.type	.L.str.11.20,@object    // @.str.11.20
.L.str.11.20:
	.asciz	"Begin pipeline"
	.size	.L.str.11.20, 15

	.type	.L.str.12,@object       // @.str.12
.L.str.12:
	.asciz	"End pipeline"
	.size	.L.str.12, 13

	.type	.L.str.13,@object       // @.str.13
.L.str.13:
	.asciz	"Tag"
	.size	.L.str.13, 4

	.type	.L.str.28,@object       // @.str.28
.L.str.28:
	.asciz	"HL_TRACE_FILE"
	.size	.L.str.28, 14

	.type	.L.str.29,@object       // @.str.29
.L.str.29:
	.asciz	"ab"
	.size	.L.str.29, 3

	.type	.L.str.30,@object       // @.str.30
.L.str.30:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:345 Assert failed: file && \"Failed to open trace file\\n\"\n"
	.size	.L.str.30, 106

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE,@object // @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.data
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.p2align	1
_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE:
	.hword	3                       // 0x3
	.hword	3                       // 0x3
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, 20

	.type	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE,@object // @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
	.weak	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE:
	.ascii	"\007\006\t\b\013\n\r\f\017\016"
	.size	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, 10

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE,@object // @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE:
	.ascii	"\007\t\002\001\004\003\006\005\r\f"
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, 10

	.type	.L.str.35,@object       // @.str.35
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.35:
	.asciz	"Bounds query buffer passed to halide_debug_to_file"
	.size	.L.str.35, 51

	.type	.L.str.1.36,@object     // @.str.1.36
.L.str.1.36:
	.asciz	"Can't debug_to_file a Func with more than four dimensions\n"
	.size	.L.str.1.36, 59

	.type	.L.str.2.37,@object     // @.str.2.37
.L.str.2.37:
	.asciz	"wb"
	.size	.L.str.2.37, 3

	.type	.L.str.3.38,@object     // @.str.3.38
.L.str.3.38:
	.asciz	".tiff"
	.size	.L.str.3.38, 6

	.type	.L.str.4.39,@object     // @.str.4.39
.L.str.4.39:
	.asciz	".tif"
	.size	.L.str.4.39, 5

	.type	.L.str.5.40,@object     // @.str.5.40
.L.str.5.40:
	.asciz	".mat"
	.size	.L.str.5.40, 5

	.type	.L__const.halide_debug_to_file.header,@object // @__const.halide_debug_to_file.header
	.section	.rodata,"a",@progbits
.L__const.halide_debug_to_file.header:
	.asciz	"MATLAB 5.0 MAT-file, produced by Halide                                                                                     \000\001IM"
	.size	.L__const.halide_debug_to_file.header, 129

	.type	.L.str.6.41,@object     // @.str.6.41
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.41:
	.asciz	"Can't debug_to_file to a .mat file greater than 4GB\n"
	.size	.L.str.6.41, 53

	.type	.L.str.7.42,@object     // @.str.7.42
.L.str.7.42:
	.asciz	"Unexpectedly large final_padding_bytes"
	.size	.L.str.7.42, 39

	.type	_ZN6Halide7Runtime8Internal16memoization_lockE,@object // @_ZN6Halide7Runtime8Internal16memoization_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal16memoization_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal16memoization_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal16memoization_lockE, 8

	.type	_ZN6Halide7Runtime8Internal13cache_entriesE,@object // @_ZN6Halide7Runtime8Internal13cache_entriesE
	.weak	_ZN6Halide7Runtime8Internal13cache_entriesE
	.p2align	3
_ZN6Halide7Runtime8Internal13cache_entriesE:
	.zero	2048
	.size	_ZN6Halide7Runtime8Internal13cache_entriesE, 2048

	.type	_ZN6Halide7Runtime8Internal18most_recently_usedE,@object // @_ZN6Halide7Runtime8Internal18most_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal18most_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal18most_recently_usedE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal18most_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal19least_recently_usedE,@object // @_ZN6Halide7Runtime8Internal19least_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal19least_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal19least_recently_usedE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal19least_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal14max_cache_sizeE,@object // @_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.data
	.weak	_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal14max_cache_sizeE:
	.xword	1048576                 // 0x100000
	.size	_ZN6Halide7Runtime8Internal14max_cache_sizeE, 8

	.type	_ZN6Halide7Runtime8Internal18current_cache_sizeE,@object // @_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.bss
	.weak	_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal18current_cache_sizeE:
	.xword	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal18current_cache_sizeE, 8

	.type	.L.str.4.44,@object     // @.str.4.44
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.44:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:273 Assert failed: prev_hash_entry != NULL\n"
	.size	.L.str.4.44, 90

	.type	.L.str.5.45,@object     // @.str.5.45
.L.str.5.45:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:360 Assert failed: entry->more_recent != NULL\n"
	.size	.L.str.5.45, 93

	.type	.L.str.6.46,@object     // @.str.6.46
.L.str.6.46:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:364 Assert failed: least_recently_used == entry\n"
	.size	.L.str.6.46, 95

	.type	.L.str.7.47,@object     // @.str.7.47
.L.str.7.47:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:367 Assert failed: entry->more_recent != NULL\n"
	.size	.L.str.7.47, 93

	.type	.L.str.9.48,@object     // @.str.9.48
.L.str.9.48:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:458 Assert failed: no_host_pointers_equal\n"
	.size	.L.str.9.48, 89

	.type	.L.str.12.49,@object    // @.str.12.49
.L.str.12.49:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:536 Assert failed: entry->in_use_count > 0\n"
	.size	.L.str.12.49, 90

	.type	.L.str.58,@object       // @.str.58
.L.str.58:
	.asciz	"-nan"
	.size	.L.str.58, 5

	.type	.L.str.1.59,@object     // @.str.1.59
.L.str.1.59:
	.asciz	"nan"
	.size	.L.str.1.59, 4

	.type	.L.str.2.60,@object     // @.str.2.60
.L.str.2.60:
	.asciz	"-inf"
	.size	.L.str.2.60, 5

	.type	.L.str.3.61,@object     // @.str.3.61
.L.str.3.61:
	.asciz	"inf"
	.size	.L.str.3.61, 4

	.type	.L.str.4.62,@object     // @.str.4.62
.L.str.4.62:
	.asciz	"-0.000000e+00"
	.size	.L.str.4.62, 14

	.type	.L.str.5.63,@object     // @.str.5.63
.L.str.5.63:
	.asciz	"0.000000e+00"
	.size	.L.str.5.63, 13

	.type	.L.str.6.64,@object     // @.str.6.64
.L.str.6.64:
	.asciz	"-0.000000"
	.size	.L.str.6.64, 10

	.type	.L.str.7.65,@object     // @.str.7.65
.L.str.7.65:
	.asciz	"0.000000"
	.size	.L.str.7.65, 9

	.type	.L.str.8.66,@object     // @.str.8.66
.L.str.8.66:
	.asciz	"-"
	.size	.L.str.8.66, 2

	.type	.L.str.10.68,@object    // @.str.10.68
.L.str.10.68:
	.asciz	"e+"
	.size	.L.str.10.68, 3

	.type	.L.str.11.69,@object    // @.str.11.69
.L.str.11.69:
	.asciz	"e-"
	.size	.L.str.11.69, 3

	.type	.L.str.12.72,@object    // @.str.12.72
.L.str.12.72:
	.asciz	"0123456789abcdef"
	.size	.L.str.12.72, 17

	.type	.L.str.17.73,@object    // @.str.17.73
.L.str.17.73:
	.asciz	"bad_type_code"
	.size	.L.str.17.73, 14

	.type	.L.str.16.74,@object    // @.str.16.74
.L.str.16.74:
	.asciz	"handle"
	.size	.L.str.16.74, 7

	.type	.L.str.15.75,@object    // @.str.15.75
.L.str.15.75:
	.asciz	"float"
	.size	.L.str.15.75, 6

	.type	.L.str.14.76,@object    // @.str.14.76
.L.str.14.76:
	.asciz	"uint"
	.size	.L.str.14.76, 5

	.type	.L.str.13.77,@object    // @.str.13.77
.L.str.13.77:
	.asciz	"int"
	.size	.L.str.13.77, 4

	.type	.L.str.18.78,@object    // @.str.18.78
.L.str.18.78:
	.asciz	"x"
	.size	.L.str.18.78, 2

	.type	.L.str.19.79,@object    // @.str.19.79
.L.str.19.79:
	.asciz	"NULL"
	.size	.L.str.19.79, 5

	.type	.L.str.20.80,@object    // @.str.20.80
.L.str.20.80:
	.asciz	"buffer("
	.size	.L.str.20.80, 8

	.type	.L.str.22.83,@object    // @.str.22.83
.L.str.22.83:
	.asciz	", {"
	.size	.L.str.22.83, 4

	.type	.L.str.23.84,@object    // @.str.23.84
.L.str.23.84:
	.asciz	"}"
	.size	.L.str.23.84, 2

	.type	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE,@object // @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	.bss
	.weak	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, 1

	.type	_ZN6Halide7Runtime8Internal21allocation_pools_lockE,@object // @_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.weak	_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal21allocation_pools_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal21allocation_pools_lockE, 8

	.type	_ZN6Halide7Runtime8Internal23device_allocation_poolsE,@object // @_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.weak	_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.p2align	3
_ZN6Halide7Runtime8Internal23device_allocation_poolsE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal23device_allocation_poolsE, 8

	.type	_ZN6Halide7Runtime8Internal17device_copy_mutexE,@object // @_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.weak	_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.p2align	3
_ZN6Halide7Runtime8Internal17device_copy_mutexE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal17device_copy_mutexE, 8

	.type	.L.str.9.89,@object     // @.str.9.89
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9.89:
	.asciz	"halide_copy_to_host"
	.size	.L.str.9.89, 20

	.type	.L.str.10.90,@object    // @.str.10.90
.L.str.10.90:
	.asciz	"halide_copy_to_device"
	.size	.L.str.10.90, 22

	.type	.L.str.12.91,@object    // @.str.12.91
.L.str.12.91:
	.asciz	"halide_copy_to_device does not support switching interfaces\n"
	.size	.L.str.12.91, 61

	.type	.L.str.18.92,@object    // @.str.18.92
.L.str.18.92:
	.asciz	"halide_device_malloc"
	.size	.L.str.18.92, 21

	.type	.L.str.20.93,@object    // @.str.20.93
.L.str.20.93:
	.asciz	"halide_device_malloc doesn't support switching interfaces\n"
	.size	.L.str.20.93, 59

	.type	.L.str.17.94,@object    // @.str.17.94
.L.str.17.94:
	.asciz	"halide_device_sync"
	.size	.L.str.17.94, 19

	.type	.L.str.21.97,@object    // @.str.21.97
.L.str.21.97:
	.asciz	"halide_device_free"
	.size	.L.str.21.97, 19

	.type	.L.str.22.98,@object    // @.str.22.98
.L.str.22.98:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:247 Assert failed: buf->device == 0\n"
	.size	.L.str.22.98, 94

	.type	.L.str.23.99,@object    // @.str.23.99
.L.str.23.99:
	.asciz	"halide_device_and_host_malloc"
	.size	.L.str.23.99, 30

	.type	.L.str.25.100,@object   // @.str.25.100
.L.str.25.100:
	.asciz	"halide_device_and_host_malloc doesn't support switching interfaces\n"
	.size	.L.str.25.100, 68

	.type	.L.str.26.101,@object   // @.str.26.101
.L.str.26.101:
	.asciz	"allocating host and device memory failed\n"
	.size	.L.str.26.101, 42

	.type	.L.str.27.102,@object   // @.str.27.102
.L.str.27.102:
	.asciz	"halide_device_and_host_free"
	.size	.L.str.27.102, 28

	.type	.L.str.28.103,@object   // @.str.28.103
.L.str.28.103:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:312 Assert failed: buf->device == 0\n"
	.size	.L.str.28.103, 94

	.type	.L.str.29.104,@object   // @.str.29.104
.L.str.29.104:
	.asciz	"halide_default_device_and_host_malloc"
	.size	.L.str.29.104, 38

	.type	.L.str.30.105,@object   // @.str.30.105
.L.str.30.105:
	.asciz	"halide_default_device_and_host_free"
	.size	.L.str.30.105, 36

	.type	.L.str.31.106,@object   // @.str.31.106
.L.str.31.106:
	.asciz	"halide_device_wrap_native"
	.size	.L.str.31.106, 26

	.type	.L.str.32.107,@object   // @.str.32.107
.L.str.32.107:
	.asciz	"halide_device_wrap_native doesn't support switching interfaces\n"
	.size	.L.str.32.107, 64

	.type	.L.str.33.108,@object   // @.str.33.108
.L.str.33.108:
	.asciz	"halide_device_detach_native"
	.size	.L.str.33.108, 28

	.type	.L.str.34.109,@object   // @.str.34.109
.L.str.34.109:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:399 Assert failed: buf->device == 0\n"
	.size	.L.str.34.109, 94

	.type	.L.str.35.110,@object   // @.str.35.110
.L.str.35.110:
	.asciz	"halide_default_device_wrap_native"
	.size	.L.str.35.110, 34

	.type	.L.str.36,@object       // @.str.36
.L.str.36:
	.asciz	"halide_default_device_detach_native"
	.size	.L.str.36, 36

	.type	.L.str.42,@object       // @.str.42
.L.str.42:
	.asciz	"halide_buffer_copy does not support switching device interfaces"
	.size	.L.str.42, 64

	.type	.L.str.58.111,@object   // @.str.58.111
.L.str.58.111:
	.asciz	"device_interface does not support cropping\n"
	.size	.L.str.58.111, 44

	.type	.L.str.59,@object       // @.str.59
.L.str.59:
	.asciz	"device_interface does not support slicing\n"
	.size	.L.str.59, 43

	.type	.L.str.60,@object       // @.str.60
.L.str.60:
	.asciz	"destination buffer already has a device allocation\n"
	.size	.L.str.60, 52

	.type	.L.str.61,@object       // @.str.61
.L.str.61:
	.asciz	"src and dst must have identical dimensionality\n"
	.size	.L.str.61, 48

	.type	.L.str.64,@object       // @.str.64
.L.str.64:
	.asciz	"dst must have exactly one fewer dimension than src\n"
	.size	.L.str.64, 52

	.type	.L.str.114,@object      // @.str.114
.L.str.114:
	.asciz	"Bounds inference call to external stage "
	.size	.L.str.114, 41

	.type	.L.str.1.115,@object    // @.str.1.115
.L.str.1.115:
	.asciz	" returned non-zero value: "
	.size	.L.str.1.115, 27

	.type	.L.str.2.116,@object    // @.str.2.116
.L.str.2.116:
	.asciz	"Call to external stage "
	.size	.L.str.2.116, 24

	.type	.L.str.3.117,@object    // @.str.3.117
.L.str.3.117:
	.asciz	"Bounds given for "
	.size	.L.str.3.117, 18

	.type	.L.str.4.118,@object    // @.str.4.118
.L.str.4.118:
	.asciz	" in "
	.size	.L.str.4.118, 5

	.type	.L.str.5.119,@object    // @.str.5.119
.L.str.5.119:
	.asciz	" (from "
	.size	.L.str.5.119, 8

	.type	.L.str.6.120,@object    // @.str.6.120
.L.str.6.120:
	.asciz	" to "
	.size	.L.str.6.120, 5

	.type	.L.str.7.121,@object    // @.str.7.121
.L.str.7.121:
	.asciz	") do not cover required region (from "
	.size	.L.str.7.121, 38

	.type	.L.str.9.123,@object    // @.str.9.123
.L.str.9.123:
	.asciz	" has type "
	.size	.L.str.9.123, 11

	.type	.L.str.10.124,@object   // @.str.10.124
.L.str.10.124:
	.asciz	" but type of the buffer passed in is "
	.size	.L.str.10.124, 38

	.type	.L.str.11.125,@object   // @.str.11.125
.L.str.11.125:
	.asciz	" requires a buffer of exactly "
	.size	.L.str.11.125, 31

	.type	.L.str.12.126,@object   // @.str.12.126
.L.str.12.126:
	.asciz	" dimensions, but the buffer passed in has "
	.size	.L.str.12.126, 43

	.type	.L.str.13.127,@object   // @.str.13.127
.L.str.13.127:
	.asciz	" dimensions"
	.size	.L.str.13.127, 12

	.type	.L.str.14.128,@object   // @.str.14.128
.L.str.14.128:
	.asciz	" is accessed at "
	.size	.L.str.14.128, 17

	.type	.L.str.15.129,@object   // @.str.15.129
.L.str.15.129:
	.asciz	", which is before the min ("
	.size	.L.str.15.129, 28

	.type	.L.str.16.130,@object   // @.str.16.130
.L.str.16.130:
	.asciz	") in dimension "
	.size	.L.str.16.130, 16

	.type	.L.str.17.131,@object   // @.str.17.131
.L.str.17.131:
	.asciz	", which is beyond the max ("
	.size	.L.str.17.131, 28

	.type	.L.str.18.132,@object   // @.str.18.132
.L.str.18.132:
	.asciz	"Total allocation for buffer "
	.size	.L.str.18.132, 29

	.type	.L.str.19.133,@object   // @.str.19.133
.L.str.19.133:
	.asciz	" is "
	.size	.L.str.19.133, 5

	.type	.L.str.20.134,@object   // @.str.20.134
.L.str.20.134:
	.asciz	", which exceeds the maximum size of "
	.size	.L.str.20.134, 37

	.type	.L.str.21.135,@object   // @.str.21.135
.L.str.21.135:
	.asciz	"The extents for buffer "
	.size	.L.str.21.135, 24

	.type	.L.str.22.136,@object   // @.str.22.136
.L.str.22.136:
	.asciz	" dimension "
	.size	.L.str.22.136, 12

	.type	.L.str.23.137,@object   // @.str.23.137
.L.str.23.137:
	.asciz	" is negative ("
	.size	.L.str.23.137, 15

	.type	.L.str.24.138,@object   // @.str.24.138
.L.str.24.138:
	.asciz	"Product of extents for buffer "
	.size	.L.str.24.138, 31

	.type	.L.str.25.139,@object   // @.str.25.139
.L.str.25.139:
	.asciz	"Applying the constraints on "
	.size	.L.str.25.139, 29

	.type	.L.str.26.140,@object   // @.str.26.140
.L.str.26.140:
	.asciz	" to the required region made it smaller in dimension "
	.size	.L.str.26.140, 54

	.type	.L.str.27.141,@object   // @.str.27.141
.L.str.27.141:
	.asciz	". "
	.size	.L.str.27.141, 3

	.type	.L.str.28.142,@object   // @.str.28.142
.L.str.28.142:
	.asciz	"Required size: "
	.size	.L.str.28.142, 16

	.type	.L.str.29.143,@object   // @.str.29.143
.L.str.29.143:
	.asciz	"Constrained size: "
	.size	.L.str.29.143, 19

	.type	.L.str.30.144,@object   // @.str.30.144
.L.str.30.144:
	.asciz	"."
	.size	.L.str.30.144, 2

	.type	.L.str.31.145,@object   // @.str.31.145
.L.str.31.145:
	.asciz	"Constraint violated: "
	.size	.L.str.31.145, 22

	.type	.L.str.32.146,@object   // @.str.32.146
.L.str.32.146:
	.asciz	" ("
	.size	.L.str.32.146, 3

	.type	.L.str.33.147,@object   // @.str.33.147
.L.str.33.147:
	.asciz	") == "
	.size	.L.str.33.147, 6

	.type	.L.str.34.148,@object   // @.str.34.148
.L.str.34.148:
	.asciz	"Parameter "
	.size	.L.str.34.148, 11

	.type	.L.str.35.149,@object   // @.str.35.149
.L.str.35.149:
	.asciz	" but must be at least "
	.size	.L.str.35.149, 23

	.type	.L.str.36.150,@object   // @.str.36.150
.L.str.36.150:
	.asciz	" but must be at most "
	.size	.L.str.36.150, 22

	.type	.L.str.37,@object       // @.str.37
.L.str.37:
	.asciz	"Out of memory (halide_malloc returned NULL)"
	.size	.L.str.37, 44

	.type	.L.str.38,@object       // @.str.38
.L.str.38:
	.asciz	"Buffer argument "
	.size	.L.str.38, 17

	.type	.L.str.39,@object       // @.str.39
.L.str.39:
	.asciz	" is NULL"
	.size	.L.str.39, 9

	.type	.L.str.40,@object       // @.str.40
.L.str.40:
	.asciz	"Failed to dump function "
	.size	.L.str.40, 25

	.type	.L.str.41,@object       // @.str.41
.L.str.41:
	.asciz	" to file "
	.size	.L.str.41, 10

	.type	.L.str.42.151,@object   // @.str.42.151
.L.str.42.151:
	.asciz	" with error "
	.size	.L.str.42.151, 13

	.type	.L.str.43,@object       // @.str.43
.L.str.43:
	.asciz	"Failed to upgrade buffer_t to halide_buffer_t for "
	.size	.L.str.43, 51

	.type	.L.str.45,@object       // @.str.45
.L.str.45:
	.asciz	"Failed to downgrade halide_buffer_t to buffer_t for "
	.size	.L.str.45, 53

	.type	.L.str.46,@object       // @.str.46
.L.str.46:
	.asciz	"The host pointer of "
	.size	.L.str.46, 21

	.type	.L.str.47,@object       // @.str.47
.L.str.47:
	.asciz	" is not aligned to a "
	.size	.L.str.47, 22

	.type	.L.str.48,@object       // @.str.48
.L.str.48:
	.asciz	" bytes boundary."
	.size	.L.str.48, 17

	.type	.L.str.49,@object       // @.str.49
.L.str.49:
	.asciz	" is null, but the pipeline will access it on the host."
	.size	.L.str.49, 55

	.type	.L.str.50,@object       // @.str.50
.L.str.50:
	.asciz	"The folded storage dimension "
	.size	.L.str.50, 30

	.type	.L.str.51,@object       // @.str.51
.L.str.51:
	.asciz	" of "
	.size	.L.str.51, 5

	.type	.L.str.52,@object       // @.str.52
.L.str.52:
	.asciz	" was accessed out of order by loop "
	.size	.L.str.52, 36

	.type	.L.str.53,@object       // @.str.53
.L.str.53:
	.asciz	"Cannot fold dimension "
	.size	.L.str.53, 23

	.type	.L.str.54,@object       // @.str.54
.L.str.54:
	.asciz	" because an extern stage accesses ["
	.size	.L.str.54, 36

	.type	.L.str.55,@object       // @.str.55
.L.str.55:
	.asciz	", "
	.size	.L.str.55, 3

	.type	.L.str.56,@object       // @.str.56
.L.str.56:
	.asciz	"],"
	.size	.L.str.56, 3

	.type	.L.str.57,@object       // @.str.57
.L.str.57:
	.asciz	" which is outside the range currently valid: ["
	.size	.L.str.57, 47

	.type	.L.str.58.152,@object   // @.str.58.152
.L.str.58.152:
	.asciz	"]."
	.size	.L.str.58.152, 3

	.type	.L.str.59.153,@object   // @.str.59.153
.L.str.59.153:
	.asciz	" which wraps around the boundary of the fold, "
	.size	.L.str.59.153, 47

	.type	.L.str.60.154,@object   // @.str.60.154
.L.str.60.154:
	.asciz	"which occurs at multiples of "
	.size	.L.str.60.154, 30

	.type	.L.str.61.155,@object   // @.str.61.155
.L.str.61.155:
	.asciz	"The fold factor ("
	.size	.L.str.61.155, 18

	.type	.L.str.62,@object       // @.str.62
.L.str.62:
	.asciz	") of dimension "
	.size	.L.str.62, 16

	.type	.L.str.63,@object       // @.str.63
.L.str.63:
	.asciz	" is too small to store the required region accessed by loop "
	.size	.L.str.63, 61

	.type	.L.str.64.156,@object   // @.str.64.156
.L.str.64.156:
	.asciz	")."
	.size	.L.str.64.156, 3

	.type	.L.str.65,@object       // @.str.65
.L.str.65:
	.asciz	"Requirement Failed: ("
	.size	.L.str.65, 22

	.type	.L.str.67,@object       // @.str.67
.L.str.67:
	.asciz	"A schedule specialized with specialize_fail() was chosen: "
	.size	.L.str.67, 59

	.type	.L.str.68,@object       // @.str.68
.L.str.68:
	.asciz	"Buffer has a non-zero device but no device interface.\n"
	.size	.L.str.68, 55

	.type	.L.str.69,@object       // @.str.69
.L.str.69:
	.asciz	"Buffer has a non-null devie_interface but device is 0.\n"
	.size	.L.str.69, 56

	.type	.L.str.70,@object       // @.str.70
.L.str.70:
	.asciz	"Buffer has both host and device dirty bits set.\n"
	.size	.L.str.70, 49

	.type	.L.str.71,@object       // @.str.71
.L.str.71:
	.asciz	"Buffer pointer passed to "
	.size	.L.str.71, 26

	.type	.L.str.72,@object       // @.str.72
.L.str.72:
	.asciz	" is null.\n"
	.size	.L.str.72, 11

	.type	.L.str.73,@object       // @.str.73
.L.str.73:
	.asciz	"Integer division or modulo by zero.\n"
	.size	.L.str.73, 37

	.type	.L.str.165,@object      // @.str.165
.L.str.165:
	.zero	1
	.size	.L.str.165, 1

	.type	.L.str.1.166,@object    // @.str.1.166
.L.str.1.166:
	.asciz	"elem_size of buffer was not in [1, 2, 4, 8]"
	.size	.L.str.1.166, 44

	.type	.L.str.2.167,@object    // @.str.2.167
.L.str.2.167:
	.asciz	"buffer has incorrect elem_size ("
	.size	.L.str.2.167, 33

	.type	.L.str.3.168,@object    // @.str.3.168
.L.str.3.168:
	.asciz	") "
	.size	.L.str.3.168, 3

	.type	.L.str.4.169,@object    // @.str.4.169
.L.str.4.169:
	.asciz	"for expected type ("
	.size	.L.str.4.169, 20

	.type	.L.str.5.170,@object    // @.str.5.170
.L.str.5.170:
	.asciz	")"
	.size	.L.str.5.170, 2

	.type	.L.str.6.172,@object    // @.str.6.172
.L.str.6.172:
	.asciz	"Internal error: buffer host mismatch in halide_upgrade_buffer_t."
	.size	.L.str.6.172, 65

	.type	.L.str.7.173,@object    // @.str.7.173
.L.str.7.173:
	.asciz	"buffer has more than four dimensions"
	.size	.L.str.7.173, 37

	.type	.L.str.8.177,@object    // @.str.8.177
.L.str.8.177:
	.asciz	" total time: "
	.size	.L.str.8.177, 14

	.type	.L.str.9.178,@object    // @.str.9.178
.L.str.9.178:
	.asciz	" ms"
	.size	.L.str.9.178, 4

	.type	.L.str.10.179,@object   // @.str.10.179
.L.str.10.179:
	.asciz	"  samples: "
	.size	.L.str.10.179, 12

	.type	.L.str.11.180,@object   // @.str.11.180
.L.str.11.180:
	.asciz	"  runs: "
	.size	.L.str.11.180, 9

	.type	.L.str.12.181,@object   // @.str.12.181
.L.str.12.181:
	.asciz	"  time/run: "
	.size	.L.str.12.181, 13

	.type	.L.str.13.182,@object   // @.str.13.182
.L.str.13.182:
	.asciz	" ms\n"
	.size	.L.str.13.182, 5

	.type	.L.str.14.183,@object   // @.str.14.183
.L.str.14.183:
	.asciz	" average threads used: "
	.size	.L.str.14.183, 24

	.type	.L.str.15.184,@object   // @.str.15.184
.L.str.15.184:
	.asciz	" heap allocations: "
	.size	.L.str.15.184, 20

	.type	.L.str.16.185,@object   // @.str.16.185
.L.str.16.185:
	.asciz	"  peak heap usage: "
	.size	.L.str.16.185, 20

	.type	.L.str.17.186,@object   // @.str.17.186
.L.str.17.186:
	.asciz	" bytes\n"
	.size	.L.str.17.186, 8

	.type	.L.str.18.187,@object   // @.str.18.187
.L.str.18.187:
	.asciz	"  "
	.size	.L.str.18.187, 3

	.type	.L.str.19.188,@object   // @.str.19.188
.L.str.19.188:
	.asciz	": "
	.size	.L.str.19.188, 3

	.type	.L.str.20.189,@object   // @.str.20.189
.L.str.20.189:
	.asciz	" "
	.size	.L.str.20.189, 2

	.type	.L.str.21.190,@object   // @.str.21.190
.L.str.21.190:
	.asciz	"ms"
	.size	.L.str.21.190, 3

	.type	.L.str.22.191,@object   // @.str.22.191
.L.str.22.191:
	.asciz	"("
	.size	.L.str.22.191, 2

	.type	.L.str.23.192,@object   // @.str.23.192
.L.str.23.192:
	.asciz	"%)"
	.size	.L.str.23.192, 3

	.type	.L.str.24.193,@object   // @.str.24.193
.L.str.24.193:
	.asciz	"threads: "
	.size	.L.str.24.193, 10

	.type	.L.str.25.194,@object   // @.str.25.194
.L.str.25.194:
	.asciz	" peak: "
	.size	.L.str.25.194, 8

	.type	.L.str.26.195,@object   // @.str.26.195
.L.str.26.195:
	.asciz	" num: "
	.size	.L.str.26.195, 7

	.type	.L.str.27.196,@object   // @.str.27.196
.L.str.27.196:
	.asciz	" avg: "
	.size	.L.str.27.196, 7

	.type	.L.str.28.197,@object   // @.str.28.197
.L.str.28.197:
	.asciz	" stack: "
	.size	.L.str.28.197, 9

	.type	_ZZ25halide_profiler_get_stateE1s,@object // @_ZZ25halide_profiler_get_stateE1s
	.data
	.p2align	3
_ZZ25halide_profiler_get_stateE1s:
	.zero	8
	.word	1                       // 0x1
	.word	0                       // 0x0
	.word	0                       // 0x0
	.word	0                       // 0x0
	.xword	0
	.xword	0
	.xword	0
	.size	_ZZ25halide_profiler_get_stateE1s, 48

	.type	.L.str.198,@object      // @.str.198
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.198:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:201 Assert failed: p_stats != NULL\n"
	.size	.L.str.198, 85

	.type	.L.str.1.199,@object    // @.str.1.199
.L.str.1.199:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:228 Assert failed: p_stats != NULL\n"
	.size	.L.str.1.199, 85

	.type	.L.str.2.200,@object    // @.str.2.200
.L.str.2.200:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:229 Assert failed: func_id >= 0\n"
	.size	.L.str.2.200, 82

	.type	.L.str.3.201,@object    // @.str.3.201
.L.str.3.201:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:230 Assert failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.3.201, 98

	.type	.L.str.4.202,@object    // @.str.4.202
.L.str.4.202:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:264 Assert failed: p_stats != NULL\n"
	.size	.L.str.4.202, 85

	.type	.L.str.5.203,@object    // @.str.5.203
.L.str.5.203:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:265 Assert failed: func_id >= 0\n"
	.size	.L.str.5.203, 82

	.type	.L.str.6.204,@object    // @.str.6.204
.L.str.6.204:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:266 Assert failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.6.204, 98

	.type	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE,@object // @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.data
	.weak	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.p2align	3
_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE:
	.xword	halide_default_can_use_target_features
	.size	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, 8

	.type	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE,@object // @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE, 8

	.type	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE,@object // @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	.weak	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE,@object // @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.weak	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE:
	.zero	32
	.size	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, 32

	.type	.L.str.209,@object      // @.str.209
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.209:
	.asciz	"Internal error: wrong structure size passed to halide_can_use_target_features()\n"
	.size	.L.str.209, 81

	.type	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE,@object // @_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE,@object // @_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE,@object // @_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE,@object // @_ZN6Halide7Runtime8Internal7Hexagon10remote_runE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon10remote_runE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE,@object // @_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE,@object // @_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE,@object // @_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE,@object // @_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE,@object // @_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE,@object // @_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE,@object // @_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE,@object // @_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE,@object // @_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE,@object // @_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE,@object // @_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE,@object // @_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE,@object // @_ZN6Halide7Runtime8Internal7Hexagon9host_freeE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon9host_freeE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon10state_listE,@object // @_ZN6Halide7Runtime8Internal7Hexagon10state_listE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon10state_listE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon10state_listE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon10state_listE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE,@object // @_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE
	.p2align	2
_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE, 4

	.type	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE,@object // @_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	.data
	.weak	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE:
	.xword	halide_device_malloc
	.xword	halide_device_free
	.xword	halide_device_sync
	.xword	halide_device_release
	.xword	halide_copy_to_host
	.xword	halide_copy_to_device
	.xword	halide_device_and_host_malloc
	.xword	halide_device_and_host_free
	.xword	halide_buffer_copy
	.xword	halide_device_crop
	.xword	halide_device_slice
	.xword	halide_device_release_crop
	.xword	halide_device_wrap_native
	.xword	halide_device_detach_native
	.xword	0
	.xword	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE
	.size	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE, 128

	.type	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE,@object // @_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE:
	.xword	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
	.xword	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
	.xword	halide_hexagon_device_malloc
	.xword	halide_hexagon_device_free
	.xword	halide_hexagon_device_sync
	.xword	halide_hexagon_device_release
	.xword	halide_hexagon_copy_to_host
	.xword	halide_hexagon_copy_to_device
	.xword	halide_hexagon_device_and_host_malloc
	.xword	halide_hexagon_device_and_host_free
	.xword	halide_hexagon_buffer_copy
	.xword	halide_hexagon_device_crop
	.xword	halide_hexagon_device_slice
	.xword	halide_hexagon_device_release_crop
	.xword	halide_default_device_wrap_native
	.xword	halide_default_device_detach_native
	.size	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE, 128

	.type	.L.str.89,@object       // @.str.89
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.89:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:720 Assert failed: dst_device_interface == NULL || dst_device_interface == &hexagon_device_interface\n"
	.size	.L.str.89, 155

	.type	.L.str.90,@object       // @.str.90
.L.str.90:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:724 Assert failed: dst_device_interface == &hexagon_device_interface\n"
	.size	.L.str.90, 123

	.type	.L.str.92,@object       // @.str.92
.L.str.92:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:735 Assert failed: to_host || dst->device\n"
	.size	.L.str.92, 96

	.type	.L.str.85,@object       // @.str.85
.L.str.85:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:685 Assert failed: buf->device_interface == &hexagon_device_interface\n"
	.size	.L.str.85, 124

	.type	.L.str.79,@object       // @.str.79
.L.str.79:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:602 Assert failed: buf->host && buf->device\n"
	.size	.L.str.79, 98

	.type	.L.str.81,@object       // @.str.81
.L.str.81:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:626 Assert failed: buf->host && buf->device\n"
	.size	.L.str.81, 98

	.type	.L.str.4.214,@object    // @.str.4.214
.L.str.4.214:
	.asciz	"Hexagon: remote_poll_log failed "
	.size	.L.str.4.214, 33

	.type	.L.str.3.215,@object    // @.str.3.215
.L.str.3.215:
	.asciz	"\n"
	.size	.L.str.3.215, 2

	.type	.L.str.111,@object      // @.str.111
.L.str.111:
	.asciz	"Printer buffer allocation failed.\n"
	.size	.L.str.111, 35

	.type	.L.str.84,@object       // @.str.84
.L.str.84:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:671 Assert failed: buf->device_interface == &hexagon_device_interface\n"
	.size	.L.str.84, 124

	.type	.L.str.86,@object       // @.str.86
.L.str.86:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:694 Assert failed: buf->device_interface == &hexagon_device_interface\n"
	.size	.L.str.86, 124

	.type	.L.str.65.216,@object   // @.str.65.216
.L.str.65.216:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:491 Assert failed: size != 0\n"
	.size	.L.str.65.216, 83

	.type	.L.str.66.217,@object   // @.str.66.217
.L.str.66.217:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:499 Assert failed: buf->dim[i].stride >= 0\n"
	.size	.L.str.66.217, 97

	.type	.L.str.70.218,@object   // @.str.70.218
.L.str.70.218:
	.asciz	"host_malloc failed\n"
	.size	.L.str.70.218, 20

	.type	.L.str.72.219,@object   // @.str.72.219
.L.str.72.219:
	.asciz	"halide_malloc failed\n"
	.size	.L.str.72.219, 22

	.type	.L.str.83,@object       // @.str.83
.L.str.83:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:650 Assert failed: buf->device == 0\n"
	.size	.L.str.83, 90

	.type	.L.str.6.220,@object    // @.str.6.220
.L.str.6.220:
	.asciz	"libhalide_hexagon_host.so"
	.size	.L.str.6.220, 26

	.type	.L.str.7.221,@object    // @.str.7.221
.L.str.7.221:
	.asciz	"libhalide_hexagon_host.dll"
	.size	.L.str.7.221, 27

	.type	.L.str.10.222,@object   // @.str.10.222
.L.str.10.222:
	.asciz	"halide_hexagon_remote_load_library"
	.size	.L.str.10.222, 35

	.type	.L.str.115,@object      // @.str.115
.L.str.115:
	.asciz	"Required Hexagon runtime symbol '"
	.size	.L.str.115, 34

	.type	.L.str.116,@object      // @.str.116
.L.str.116:
	.asciz	"' not found.\n"
	.size	.L.str.116, 14

	.type	.L.str.11.223,@object   // @.str.11.223
.L.str.11.223:
	.asciz	"halide_hexagon_remote_get_symbol_v4"
	.size	.L.str.11.223, 36

	.type	.L.str.12.224,@object   // @.str.12.224
.L.str.12.224:
	.asciz	"halide_hexagon_remote_run"
	.size	.L.str.12.224, 26

	.type	.L.str.13.225,@object   // @.str.13.225
.L.str.13.225:
	.asciz	"halide_hexagon_remote_release_library"
	.size	.L.str.13.225, 38

	.type	.L.str.14.226,@object   // @.str.14.226
.L.str.14.226:
	.asciz	"halide_hexagon_host_malloc_init"
	.size	.L.str.14.226, 32

	.type	.L.str.15.227,@object   // @.str.15.227
.L.str.15.227:
	.asciz	"halide_hexagon_host_malloc_deinit"
	.size	.L.str.15.227, 34

	.type	.L.str.16.228,@object   // @.str.16.228
.L.str.16.228:
	.asciz	"halide_hexagon_host_malloc"
	.size	.L.str.16.228, 27

	.type	.L.str.17.229,@object   // @.str.17.229
.L.str.17.229:
	.asciz	"halide_hexagon_host_free"
	.size	.L.str.17.229, 25

	.type	.L.str.18.230,@object   // @.str.18.230
.L.str.18.230:
	.asciz	"halide_hexagon_remote_poll_log"
	.size	.L.str.18.230, 31

	.type	.L.str.19.231,@object   // @.str.19.231
.L.str.19.231:
	.asciz	"halide_hexagon_remote_poll_profiler_state"
	.size	.L.str.19.231, 42

	.type	.L.str.20.232,@object   // @.str.20.232
.L.str.20.232:
	.asciz	"halide_hexagon_remote_profiler_set_current_func"
	.size	.L.str.20.232, 48

	.type	.L.str.21.233,@object   // @.str.21.233
.L.str.21.233:
	.asciz	"halide_hexagon_remote_power_hvx_on"
	.size	.L.str.21.233, 35

	.type	.L.str.22.234,@object   // @.str.22.234
.L.str.22.234:
	.asciz	"halide_hexagon_remote_power_hvx_off"
	.size	.L.str.22.234, 36

	.type	.L.str.23.235,@object   // @.str.23.235
.L.str.23.235:
	.asciz	"halide_hexagon_remote_set_performance"
	.size	.L.str.23.235, 38

	.type	.L.str.24.236,@object   // @.str.24.236
.L.str.24.236:
	.asciz	"halide_hexagon_remote_set_performance_mode"
	.size	.L.str.24.236, 43

	.type	.L.str.25.237,@object   // @.str.25.237
.L.str.25.237:
	.asciz	"halide_hexagon_remote_set_thread_priority"
	.size	.L.str.25.237, 42

	.type	.L.str.5.239,@object    // @.str.5.239
.L.str.5.239:
	.asciz	"Hexagon: remote_poll_profiler_func not found\n"
	.size	.L.str.5.239, 46

	.type	.L.str.31.240,@object   // @.str.31.240
.L.str.31.240:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:218 Assert failed: state_ptr != NULL\n"
	.size	.L.str.31.240, 91

	.type	.L__const.halide_hexagon_initialize_kernels.soname,@object // @__const.halide_hexagon_initialize_kernels.soname
.L__const.halide_hexagon_initialize_kernels.soname:
	.asciz	"libhalide_shared_runtime.so"
	.size	.L__const.halide_hexagon_initialize_kernels.soname, 28

	.type	.L.str.36.241,@object   // @.str.36.241
.L.str.36.241:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:245 Assert failed: shared_runtime != 0\n"
	.size	.L.str.36.241, 93

	.type	.L.str.37.242,@object   // @.str.37.242
.L.str.37.242:
	.asciz	"Initialization of Hexagon kernels failed\n"
	.size	.L.str.37.242, 42

	.type	.L.str.40.243,@object   // @.str.40.243
.L.str.40.243:
	.asciz	"libhalide_kernels"
	.size	.L.str.40.243, 18

	.type	_ZZ33halide_hexagon_initialize_kernelsE9unique_id,@object // @_ZZ33halide_hexagon_initialize_kernelsE9unique_id
	.local	_ZZ33halide_hexagon_initialize_kernelsE9unique_id
	.comm	_ZZ33halide_hexagon_initialize_kernelsE9unique_id,4,4
	.type	.L.str.41.244,@object   // @.str.41.244
.L.str.41.244:
	.asciz	".so"
	.size	.L.str.41.244, 4

	.type	.L.str.44.245,@object   // @.str.44.245
.L.str.44.245:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:346 Assert failed: state_ptr != NULL\n"
	.size	.L.str.44.245, 91

	.type	.L.str.45.246,@object   // @.str.45.246
.L.str.45.246:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:347 Assert failed: function != NULL\n"
	.size	.L.str.45.246, 90

	.type	.L.str.56.247,@object   // @.str.56.247
.L.str.56.247:
	.asciz	"Failed to find function "
	.size	.L.str.56.247, 25

	.type	.L.str.112,@object      // @.str.112
.L.str.112:
	.asciz	"<NULL>"
	.size	.L.str.112, 7

	.type	.L.str.57.248,@object   // @.str.57.248
.L.str.57.248:
	.asciz	" in module.\n"
	.size	.L.str.57.248, 13

	.type	.L.str.59.249,@object   // @.str.59.249
.L.str.59.249:
	.asciz	"Hexagon pipeline failed.\n"
	.size	.L.str.59.249, 26

	.type	.L.str.98,@object       // @.str.98
.L.str.98:
	.asciz	"remote_power_hvx_on failed.\n"
	.size	.L.str.98, 29

	.type	.L.str.101,@object      // @.str.101
.L.str.101:
	.asciz	"remote_power_hvx_off failed.\n"
	.size	.L.str.101, 30

	.type	.L.str.104,@object      // @.str.104
.L.str.104:
	.asciz	"remote_set_performance_mode failed.\n"
	.size	.L.str.104, 37

	.type	.L.str.107,@object      // @.str.107
.L.str.107:
	.asciz	"remote_set_performance failed.\n"
	.size	.L.str.107, 32

	.type	.L.str.110,@object      // @.str.110
.L.str.110:
	.asciz	"remote_set_thread_priority failed.\n"
	.size	.L.str.110, 36

	.type	.Lhexagon_module_state_buf.data,@object // @hexagon_module_state_buf.data
	.local	.Lhexagon_module_state_buf.data
	.comm	.Lhexagon_module_state_buf.data,8,32
	.type	.Loffload_rpc.blur_y.s0.__outermost_buf.data,@object // @offload_rpc.blur_y.s0.__outermost_buf.data
	.local	.Loffload_rpc.blur_y.s0.__outermost_buf.data
	.comm	.Loffload_rpc.blur_y.s0.__outermost_buf.data,8,32
	.type	.Lhalide_hexagon_code.data,@object // @halide_hexagon_code.data
	.section	.rodata,"a",@progbits
	.p2align	5
.Lhalide_hexagon_code.data:
	.asciz	"\177ELF\001\001\001\000\000\000\000\000\000\000\000\000\003\000\244\000\001\000\000\000\000\000\000\0004\000\000\000\000 \000\000`\000\000\0004\000 \000\003\000(\000\016\000\f\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\020\000\000\005\000\000\000\000\020\000\000\001\000\000\000\000\020\000\000\000\020\000\000\000\020\000\000\000\020\000\000\000\020\000\000\006\000\000\000\000\020\000\000\002\000\000\000\f\035\000\000\f\035\000\000\f\035\000\000\210\000\000\000\210\000\000\000\004\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000B@\000\000\016\306Ij\034\300\216\221\000\300\234RB@\000\000\016\300Ij\034\300\216\221\000\300\234RA@\000\000\016\332Ij\034\300\216\221\000\300\234RA@\000\000\016\324Ij\034\300\216\221\000\300\234RA@\000\000\016\316Ij\034\300\216\221\000\300\234RA@\000\000\016\310Ij\034\300\216\221\000\300\234RA@\000\000\016\302Ij\034\300\216\221\000\300\234R@@\000\000\016\334Ij\034\300\216\221\000\300\234R@@\000\000\016\326Ij\034\300\216\221\000\300\234R@@\000\000\016\320Ij\034\300\216\221\000\300\234R@@\000\000\016\312Ij\034\300\216\221\000\300\234R\020` s\000H\001u\020\034\364\353\n@\000\\\000\300\000x&X \\\000P\001u \300\000x\374\177\377\017`\300\000Z\000@\000u\000`\021t\020@\335C\036\330\036\226\374\177\377\017P@\000Z\000@pp\001\300\002x6\300\000\020-@\000\000\202TIj\021@`p\341\377 \260\024\300\000X\374\177\377\017\000@\000Z\000@pp\001\300\002x(\300\000\020+@\000\000\002^Ij\021@`p\341\377 \260\000@qp\003@\000x\377\342\261\243\373\177\377\017@\300\000Z1B\200\333\000\320\021\365\373\177\377\017@@\000Z\003\337\002\214\032@\000X\000\320\021\365,@\000\000\202@Ij\n\300\000X*@\000\000\002\330Ij\372\177\377\017P@\000Z\000<\t(*@\000\000\001_Ij\000\300pp\372\177\377\017`\300\000Z\372\177\377\017p@\000Z\000P\021\365\361\377\337x\000@qp@\037\004>\020@`p\020\034\364\353\372\177\377\017P\300\000Z\000@\000u\000`\000~\020@\335C\036\330\036\226\371\177\377\017\000@\000Z\000@pp\001\300\002x\"@\000\020\021\300`p*@\000\000\202IIj\341\1771\260\000\300qp\370\177\377\017P@\000Z\003@\000x\377\342\261\2431B\200\333\000\320\021\365\370\177\377\017@@\000Z\003\337\002\214\024@\000X\000\320\021\365)@\000\000\202KIj\000\300\000|\367\177\377\017`\300\000Z(@\000\000\001EIj\000\300pp\367\177\377\017x\300\000Z\370\177\377\017\b@\000Z\000\320\021\365\340\177\337x@\037\004>\375\177\377\017 \300\000X\000\000\000\000\000\000\000\000\343O\000x\013\300\235\240A\300\201\221\000C\201\307z\310 \\H\300\200\221\000C\210\307\202\310 \\\006B\000\365\342O\000x@\300\202\221\000B\200\307\206\310 \\\000@\005\205\001@\004\205\245A\201\221\016\301\201\221\n@\201\221\000\322\275\241\211A\201\221l\301\201\221*@\201\221\001\322\275\241MA\201\221\243\300\201\221J@\201\221\002\322\275\241\304A\201\221\002\314=\221\234@\201\221j\300\201\221\357@\201\221\005\334\235\241\001@B\205<@\200z\312@\201\221\003\312\235\241\002@\000x!A\201\221\n\322\275\241!@\200z\tN\235\241\021\304\235\241\000@\000x@A\035\241\022\300\235\241\002@\000\000\001TIj\004@\035\260.\300\000z\004H\235\241\030\334\035\241\007J\235\241\b\317\235\241\013M\235\2410\316\035\241\rL\235\241\016\311\235\2416\t\365\350\364\177\377\017(@\000Z\024H\235\241\025\307\235\241\036\300\036\226%@\000\000\001XIj\000@\000x\002\320\000x\364\177\377\017\000@\000X\036\300\036\220%@\000\000\001ZIj\000@\000x\002\320\000x\363\177\377\017H@\000X\036\300\036\220%@\000\000\001\\Ij\000@\000x\002\320\000x\363\177\377\017\020@\000X\036\300\036\220\000\000\000\000\000\000\000\000\000\000\000\000\021@ap\001P\000x0\035\364\353P\300\202\221\215\n+\300\177\n/\301\206\n#\303\265@\202\221\016\330\335\241\026A\202\221\r\332\335\241\031C\"\221\000\300\235\241FA\202\221\022\322\275\241'A\202\221\027\322\275\241\005F\"\221\003\303\235\241\372@\202\221\024\305\235\241\244A\202\221\026\322\275\241\307A\202\221\025\322\275\241\006H\"\221\023\322\275\241tA\202\221%\302\202\221DB\202\221\001\305\235\241\370A\202\221\002\304\235\241\361\177\377\0178@\000Z\233\302\202\221\034@\000\0000@@\020\022\300`p\000@Y\205\000\360\000x\340\300\021\304\000\300\267\325\000\320\000\363\001\300Z\362\000A\340k$\310\000\\A@\000\260 \326\202 \002`5s\000p\340\277t\035!=\004U\000\357AA\001\214F\320\000xBa\002\200\000@A\204\000D\000\000\007\300\000x\302P@\202 \333\004\304B\306\342\323\000\302\200\246\000\300\000x\001\300\323\325 \\\001\214\032@\000\000x\300B$$C\201\336\354\177\377\017`@\000Z\000\300\235\221\033@\000\000 \300\000\020DG\021\214\005p\367\2772=\001P\004D\245\325Ep\033\260f@\235\221\005\324\275\241GA\006\214E`\033\260\004\322\275\241\005P\004\363\252n\252\n\247(\264j @\244\031G@\033\260\t\322\275\241\030E\006\357GP\033\260\b\322\275\241\001@B\205\007`\033\260\200B\235\221\007\324\275\241DA\030\214\207p\033\260\006@ep\006\324\275\241'@\005\260H@\005\260\305(%\334\000@@\205\002@A\211 @\024v\013\324\275\241\004@\000\000\005N\004\333BA\025\214\t\340\001\260CA\023\214\f@\000x\034T \363\002\300Tu\032@\000X#@\024u*@\000x\000\300\000\177,@\f\260GB\235\221(\302\235\221\001P\fu(@\b\2606=wQ\244<fQ\310A\001\\\016\304\016\363d@\007ve@\bv\001@\fu\023\306\235\241\004D\003\355f@\006v\017\324\275\241\004E\003\355\007@ ~\022\307\235\241\004F\003\355\016D\235\241\020\316\235\241\021H\235\241\r\304\235\241G@\254th`\200z\204A\235\221\356\302\235\221\fD\007\363%A\235\221\024\314\235\241\016L\025\357\004H\f\363\255@\235\221\347\300\235\221%E\016\304\004D,\363\006A\235\221\310\300\235\221&F\016\304'G\016\304\217\300\235\221(H\016\304-\315\016\304\000D$`.O\016\304\004\300lp\036B\000\\x\300\004v\022A\000X\000@\000\177\000\300\000\177\005B\005\363\006B\006\363'8D1\bB\b\363,\200\f\260\rB\r\363\016\302\016\363:\301\000X\374B \\x\300\004v\300C\000\\\031\300\000x6A\034\214o@\fv\342\347\b(\017O\003\355\372\177\366\277\344\300\007(\024O\t\363!@\226u\343\300\b(\030I\032`Y@\031\260\345\301\007(\021@%\260\242Bd\034\346\300\016(\013@&\260\022@'\260\347\300\r(\020@(\260\242Fb\034\350\345\b(\027@4\260\017@-\260\351\346\b(\006C \034\026@.\260\344\346\007(\002B \034\201GF\037\345\347\007(\244Hd\034\202CB\037\350\300\005(\032@tpFA\212\031\351\300\006(BB\212\031\244\310d\034\346\3014(\b\305 \034\bD \034\205\311H\037\203\311H\037^A \\\000@\000\177\000@\000\177A\305\212\031\000\300\000\177\032@wpCC\212\031\345\300\020(\027@7\260Y@\031\260\351\301\022(\344\347\020(\350\300\022(\026@6\260\244Dh\034\352\300\026(\017@/\260\353\300\017(\244Jd\034\347\346\020(\020@0\260\346\345\020(\355\347\022(\022@2\260\354\346\022(\013@+\260\246Fl\034\351\300\013(\021@1\260\350\300\021(\bE \034\246\310f\034\004D \034\210IH\037\342\3004(\nG \034\204ED\037\341\3474(\bF \034GH\212\031\205\313J\037BD\212\031\203IH\037\343\3464(\024\200zpAE\212\031\347\301:(CC\212\031\341\347:(\342\300:(\343\346:(8\340\000\022\013S\030\355\357\302\235\221\017U\004\357\353\313\031\304\357\317\031\304/\333\017\304\220@\017\260\222P\017\260Q@\017\260T\320\017\260\342\300\020(\344\300\017(/A\013\304\345\301\017(\343\300\022(\242Bd\034\346\300\021(\347\300\024(\242\306b\034\004\302 \034\002C \034\201\305D\037\202\303B\037A\301\212\031B\302\212\031\341\300/(\342\301/(\364\300\377\\+@\030\260\317\302\235\221\017U\004\357\013\323\013\355/[\017\304+\301\013\304\220`\357\277\222p\357\277Q`\357\277T\360\357\277\342\300\020(\344\346\017(\345\347\017(\343\300\022(\242Bd\034\346\300\021(\347\300\024(\242\306b\034\004\302 \034\002C \034\201\305D\037\202\303B\037A\301\212\031B\302\212\031\341\346+(\300~\377Y\000@\000\177\342\347+(\000\300\000\177\244B\235\221\016\302\235\221\262\300\304\022\344\301\235\221\bD\t\363\304\301\235\221\fD\t\363\244\301\235\221\005D\t\363\006@,\260\342\300\f(\004@(\260\007@%\260\344\300\005(\343\301\f(\345\301\005(\242Bd\034\346\300\b(\347\301\b(\242Fb\034\350\346\f(\351\347\f(\006C \034\352\346\005(\002B \034\201GF\037\353\347\005(\244Hj\034\206CB\037\354\346\b(\005@.\260GA\212\031\355\347\b(AF\212\031\244Ld\034\254\302\235\221\350\177\354\277\347\301.(\020B\b`\bE \034!@\214u\f\300np\bD \034\b@np\205\311H\037\203\311H\037RA \\B\305\212\031\b@epCC\212\031\345\301\007(\r@$\260\005@%\260\347\301\006(\344\300\007(\346\300\006(\244Fd\034\351\347\007(\007@'\260\350\346\007(\347\347\006(\006@&\260\346\346\006(\246Fh\034\351\301\004(\350\300\004(\244Hd\034\353\347\004(\004@mp\352\346\004(\bE \034\246\312f\034\004D \034\202IH\037\342\347,(\bG \034\201ED\037\341\300,(EB\212\031\204IH\037\343\346,(\002F \034\f@hpA\301\212\031B\204\212\031\203CB\037\345\301((CC\212\031\342\347((\341\300((\343\346((dA\235\221\214\302\235\221\001@D\205\226\371\376\\6\034\304<\004D\f\363%@\235\221H\300\235\221\005F\004\357G@\004\260&@\004\260d\300\004v%H\005\304g@\007vf@\006v$\300\004\260\004S\004\355f1w1\007S\007\355$\301\004\304'A\007\304\006\323\006\355&A\006\304\346\344\004(\344\344\007(\347\345\004(\345\345\007(\244Df\034\342\344\006(\343\345\006(\242Bd\034\350\346\004(\351\347\004(\352\346\007(\353\347\007(\244Jh\034\346\346\006(\347\347\006(\006B \034\244\306d\034\002C \034\201\307F\037\006D \034\202\303B\037\004E \034AA\212\031\203\307F\037BB\212\031\204\305D\037CC\212\031\341\300%(DD\212\031\342\301%(\343\302%(.}\377Y\344\303%(\020\300\235\221\323\177\377\017`@\000Z\2000\n(\333\177\377\017h@\000Z \3400s\000@rp\215\036\224>\177\036\206>\330A\335\221\272\301\335\221\036\300\036\226\006@\000\000\001XIj@A\001\214\020\300\235\221\002` s\377\177\377\007\005(\364+\323\177\377\017H@\000ZBB\002\200\000\300pp\n\300\000X\020\300\235\221\323\177\377\0178@\000Z\000\300pp\316\3120\027\000\000\000\000\000\000\000\000\000\000\000\000\001\300\235\240\006\006\004\004\003\000\005\005\000@cp\002\002\001\001D\020U\020\331\177\377\017p@\000Z\003@&\221\000\322\275\241\036\300\036\226\000\000\000\000\021@\000\000\000HIj\000\300\237R\000\000\000\000HVX lock size must be 64 or 128.\n\000Printer buffer allocation failed.\n\000qurt_hvx_lock failed\n\000qurt_hvx_unlock failed\n\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000scalar_indices\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000input\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000blur_y\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000blur_x\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000t83\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000t92\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000t97\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000hexagon-32-qurt-hvx_128-no_runtime\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000offload_rpc.blur_y.s0.__outermost\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\001zR\000\004|\037\001\020\f\036\000\030\000\000\000\030\000\000\000t\363\377\377T\001\000\000\000B\f\036\b\237\001\236\002\000\000\0000\000\000\0004\000\000\000\270\364\377\377\004\b\000\000\000C\f\036\b\237\001\236\002\221\003\220\004\223\005\222\006\225\007\224\b\227\t\226\n\231\013\230\f\233\r\232\016\000\000\000\030\000\000\000h\000\000\000\224\374\377\377,\000\000\000\000A\f\036\b\237\001\236\002\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\020\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\000 \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\001\020\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003@\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000?\000\000\000\020\003\000\000\000\000\000\000\003\000\002\000?\000\000\000\300\f\000\000\000\000\000\000\003\000\003\000?\000\000\000\200\f\000\000\000\000\000\000\003\000\002\000?\000\000\000\200\r\000\000\000\000\000\000\003\000\004\000?\000\000\000\000\020\000\000\000\000\000\000\003\000\006\000?\000\000\000p\004\000\000\000\000\000\000\003\000\002\000@\000\000\000\300\f\000\000\"\000\000\000\001\000\003\000G\000\000\000\005\r\000\000\026\000\000\000\001\000\003\000P\000\000\000\033\r\000\000\030\000\000\000\001\000\003\000Y\000\000\000\342\f\000\000#\000\000\000\001\000\003\000b\000\000\000 \021\000\000\004\000\000\000\001\000\007\000k\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000x\000\000\000p\004\000\000\004\b\000\000\002\000\002\000\260\000\000\000\020\001\000\000\020\000\000\000\002\000\001\000\306\000\000\000\340\000\000\000\020\000\000\000\002\000\001\000\327\000\000\0000\001\000\000\020\000\000\000\002\000\001\000\004\001\000\000@\001\000\000\020\000\000\000\002\000\001\000#\001\000\000 \001\000\000\020\000\000\000\002\000\001\000G\001\000\000\360\000\000\000\020\000\000\000\002\000\001\000W\001\000\000\260\000\000\000\020\000\000\000\002\000\001\000i\001\000\000\320\000\000\000\020\000\000\000\002\000\001\000\230\001\000\000\300\000\000\000\020\000\000\000\002\000\001\000\264\001\000\000\240\000\000\000\020\000\000\000\002\000\001\000\306\001\000\000\000\001\000\000\020\000\000\000\002\000\001\000\332\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\354\001\000\000\000\000\000\000\000\000\000\000 \000\000\000\371\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\"\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000=\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000]\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000i\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000w\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000\242\002\000\000P\001\000\000\000\001\000\000\"\000\002\000\267\002\000\000P\002\000\000\260\000\000\000\"\000\002\000\316\002\000\000\000\003\000\000\b\000\000\000\"\000\002\000\363\002\000\000\000\000\000\000\000\000\000\000 \000\000\000\013\003\000\000\020\003\000\000T\001\000\000\022\000\002\000-\003\000\000\200\f\000\000,\000\000\000\022\000\002\000T\003\000\000\260\f\000\000\f\000\000\000\022\000\002\000\177\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\215\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000?\000\000\000\020\003\000\000\000\000\000\000\003\000\002\000?\000\000\000\300\f\000\000\000\000\000\000\003\000\003\000?\000\000\000\200\f\000\000\000\000\000\000\003\000\002\000?\000\000\000\200\r\000\000\000\000\000\000\003\000\004\000?\000\000\000\000\020\000\000\000\000\000\000\003\000\006\000?\000\000\000p\004\000\000\000\000\000\000\003\000\002\000@\000\000\000\300\f\000\000\"\000\000\000\001\000\003\000G\000\000\000\005\r\000\000\026\000\000\000\001\000\003\000P\000\000\000\033\r\000\000\030\000\000\000\001\000\003\000Y\000\000\000\342\f\000\000#\000\000\000\001\000\003\000b\000\000\000 \021\000\000\004\000\000\000\001\000\007\000k\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000x\000\000\000p\004\000\000\004\b\000\000\002\000\002\000\260\000\000\000\020\001\000\000\020\000\000\000\002\000\001\000\306\000\000\000\340\000\000\000\020\000\000\000\002\000\001\000\327\000\000\0000\001\000\000\020\000\000\000\002\000\001\000\004\001\000\000@\001\000\000\020\000\000\000\002\000\001\000#\001\000\000 \001\000\000\020\000\000\000\002\000\001\000G\001\000\000\360\000\000\000\020\000\000\000\002\000\001\000W\001\000\000\260\000\000\000\020\000\000\000\002\000\001\000i\001\000\000\320\000\000\000\020\000\000\000\002\000\001\000\230\001\000\000\300\000\000\000\020\000\000\000\002\000\001\000\264\001\000\000\240\000\000\000\020\000\000\000\002\000\001\000\306\001\000\000\000\001\000\000\020\000\000\000\002\000\001\000\332\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\354\001\000\000\000\000\000\000\000\000\000\000 \000\000\000\371\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\"\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000=\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000]\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000i\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000w\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000\242\002\000\000P\001\000\000\000\001\000\000\"\000\002\000\267\002\000\000P\002\000\000\260\000\000\000\"\000\002\000\316\002\000\000\000\003\000\000\b\000\000\000\"\000\002\000\363\002\000\000\000\000\000\000\000\000\000\000 \000\000\000\013\003\000\000\020\003\000\000T\001\000\000\022\000\002\000-\003\000\000\200\f\000\000,\000\000\000\022\000\002\000T\003\000\000\260\f\000\000\f\000\000\000\022\000\002\000\177\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\215\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\001\000\000\000*\000\000\000)\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\002\000\000\000\003\000\000\000\004\000\000\000\005\000\000\000\006\000\000\000\007\000\000\000\b\000\000\000\t\000\000\000\n\000\000\000\013\000\000\000\f\000\000\000\r\000\000\000\016\000\000\000\017\000\000\000\020\000\000\000\021\000\000\000\022\000\000\000\023\000\000\000\024\000\000\000\025\000\000\000\026\000\000\000\027\000\000\000\030\000\000\000\031\000\000\000\032\000\000\000\033\000\000\000\034\000\000\000\035\000\000\000\036\000\000\000\037\000\000\000 \000\000\000!\000\000\000\"\000\000\000#\000\000\000$\000\000\000%\000\000\000&\000\000\000'\000\000\000(\000\000\000\000\000\000\000,\021\000\000\"(\000\000\000\000\000\0000\021\000\000\"\037\000\000\000\000\000\0004\021\000\000\"$\000\000\000\000\000\0008\021\000\000\" \000\000\000\000\000\000<\021\000\000\"\032\000\000\000\000\000\000@\021\000\000\"\036\000\000\000\000\000\000D\021\000\000\")\000\000\000\000\000\000H\021\000\000\"\031\000\000\000\000\000\000L\021\000\000\"\035\000\000\000\000\000\000P\021\000\000\"\033\000\000\000\000\000\000T\021\000\000\"\034\000\000\000\000\000\000\000\020\000\000#\000\000\000\240\r\000\000$\020\000\000#\000\000\000\200\r\000\000H\020\000\000#\000\000\000\300\r\000\000l\020\000\000#\000\000\000\240\r\000\000\220\020\000\000#\000\000\000\000\016\000\000\264\020\000\000#\000\000\000 \016\000\000\330\020\000\000#\000\000\000@\016\000\000\b\021\000\000#\000\000\000\000\020\000\000\f\021\000\000#\000\000\000\200\016\000\000\020\021\000\000#\000\000\000\000\017\000\000\000\000\000\000\000.plt\000.text\000.rodata.str1.1\000.rodata\000.eh_frame\000.data.rel.ro\000.got\000\000.L.str\000.L.str.5\000.L.str.7\000.L.str.8\000_DYNAMIC\000buffer_t.cpp\000offload_rpc.blur_y.s0.__outermost.par_for.blur_y.s0.y.y\000plt_halide_do_par_for\000plt_halide_error\000plt_halide_error_buffer_allocation_too_large\000plt_halide_error_out_of_memory\000plt_halide_error_unaligned_host_ptr\000plt_halide_free\000plt_halide_malloc\000plt_halide_msan_annotate_memory_is_initialized\000plt_halide_string_to_string\000plt_qurt_hvx_lock\000plt_qurt_hvx_unlock\000halide_do_par_for\000halide_error\000halide_error_buffer_allocation_too_large\000halide_error_out_of_memory\000halide_error_unaligned_host_ptr\000halide_free\000halide_malloc\000halide_msan_annotate_memory_is_initialized\000halide_qurt_hvx_lock\000halide_qurt_hvx_unlock\000halide_qurt_hvx_unlock_as_destructor\000halide_string_to_string\000offload_rpc.blur_y.s0.__outermost\000offload_rpc.blur_y.s0.__outermost_argv\000offload_rpc.blur_y.s0.__outermost_metadata\000qurt_hvx_lock\000qurt_hvx_unlock\000.symtab\000.dynsym\000.hash\000.rela.got\000libhalide_hexagon_code.so\000libhalide_hexagon_remote_skel.so\000.dynamic\000.strtab\000\000\000\000\001\000\000\000\327\003\000\000\016\000\000\000\275\003\000\000\020\000\000\000\000\000\000\000\004\000\000\000H\027\000\000\006\000\000\000\250\024\000\000\013\000\000\000\020\000\000\000\005\000\000\000\000\031\000\000\n\000\000\000\t\004\000\000\003\000\000\000 \021\000\000\027\000\000\000\000\030\000\000\024\000\000\000\007\000\000\000\002\000\000\000\204\000\000\000\007\000\000\000\204\030\000\000\b\000\000\000x\000\000\000\t\000\000\000\f\000\000\000\001\000\000p\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\006\000\000\000\240\000\000\000\240\000\000\000\260\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\006\000\000\000\001\000\000\000\006\000\000\000P\001\000\000P\001\000\000l\013\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\f\000\000\000\001\000\000\0002\000\000\000\300\f\000\000\300\f\000\000s\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\033\000\000\000\001\000\000\000\002\000\000\000\200\r\000\000\200\r\000\000\242\001\000\000\000\000\000\000\000\000\000\000\200\000\000\000\000\000\000\000#\000\000\000\001\000\000\000\002\000\000\000\200\017\000\000\200\017\000\000\200\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000-\000\000\000\001\000\000\000\003\000\000\000\000\020\000\000\000\020\000\000\024\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000:\000\000\000\001\000\000\000\002\000\000\000 \021\000\000 \021\000\000\350\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\235\003\000\000\002\000\000\000\002\000\000\000\b\022\000\000\b\022\000\000\240\002\000\000\f\000\000\000\031\000\000\000\004\000\000\000\020\000\000\000\245\003\000\000\013\000\000\000\002\000\000\000\250\024\000\000\250\024\000\000\240\002\000\000\f\000\000\000\031\000\000\000\004\000\000\000\020\000\000\000\255\003\000\000\005\000\000\000\002\000\000\000H\027\000\000H\027\000\000\264\000\000\000\t\000\000\000\000\000\000\000\004\000\000\000\004\000\000\000\263\003\000\000\004\000\000\000\002\000\000\000\000\030\000\000\000\030\000\000\374\000\000\000\b\000\000\000\007\000\000\000\b\000\000\000\f\000\000\000\001\004\000\000\003\000\000\000\002\000\000\000\000\031\000\000\000\031\000\000\t\004\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\370\003\000\000\006\000\000\000\002\000\000\000\f\035\000\000\f\035\000\000\210\000\000\000\f\000\000\000\000\000\000\000\004\000\000\000\b\000\000"
	.size	.Lhalide_hexagon_code.data, 8752

	.type	.Lhalide_shared_runtime.data,@object // @halide_shared_runtime.data
	.p2align	5
.Lhalide_shared_runtime.data:
	.size	.Lhalide_shared_runtime.data, 90792

	.type	.Lstr,@object           // @str
	.p2align	5
.Lstr:
	.asciz	"input"
	.size	.Lstr, 6

	.type	.Lstr.250,@object       // @str.250
	.p2align	5
.Lstr.250:
	.asciz	"blur_y"
	.size	.Lstr.250, 7

	.type	.Lstr.251,@object       // @str.251
	.p2align	5
.Lstr.251:
	.asciz	"Output buffer blur_y"
	.size	.Lstr.251, 21

	.type	.Lstr.252,@object       // @str.252
	.p2align	5
.Lstr.252:
	.asciz	"Input buffer input"
	.size	.Lstr.252, 19

	.type	.Lstr.253,@object       // @str.253
	.p2align	5
.Lstr.253:
	.asciz	"blur_y.stride.0"
	.size	.Lstr.253, 16

	.type	.Lstr.254,@object       // @str.254
	.p2align	5
.Lstr.254:
	.asciz	"1"
	.size	.Lstr.254, 2

	.type	.Lstr.255,@object       // @str.255
	.p2align	5
.Lstr.255:
	.asciz	"input.stride.0"
	.size	.Lstr.255, 15

	.type	.Lstr.256,@object       // @str.256
	.p2align	5
.Lstr.256:
	.asciz	"offload_rpc.blur_y.s0.__outermost_argv"
	.size	.Lstr.256, 39

	.type	.L__unnamed_1,@object   // @0
	.p2align	4
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.L__unnamed_2,@object   // @1
	.p2align	4
.L__unnamed_2:
	.zero	32
	.size	.L__unnamed_2, 32

	.type	.L__unnamed_3,@object   // @2
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.L__unnamed_3:
	.xword	.Lstr
	.word	1                       // 0x1
	.word	2                       // 0x2
	.byte	1                       // 0x1
	.byte	16                      // 0x10
	.hword	1                       // 0x1
	.zero	4
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	.L__unnamed_1
	.xword	.Lstr.250
	.word	2                       // 0x2
	.word	2                       // 0x2
	.byte	1                       // 0x1
	.byte	16                      // 0x10
	.hword	1                       // 0x1
	.zero	4
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	.L__unnamed_2
	.size	.L__unnamed_3, 128

	.type	.Lstr.257,@object       // @str.257
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.257:
	.asciz	"arm-64-android-hvx_128"
	.size	.Lstr.257, 23

	.type	.Lstr.258,@object       // @str.258
	.p2align	5
.Lstr.258:
	.asciz	"halide_blur"
	.size	.Lstr.258, 12

	.type	.Lhalide_blur_metadata_storage,@object // @halide_blur_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.Lhalide_blur_metadata_storage:
	.word	1                       // 0x1
	.word	2                       // 0x2
	.xword	.L__unnamed_3
	.xword	.Lstr.257
	.xword	.Lstr.258
	.size	.Lhalide_blur_metadata_storage, 32

	.type	.Lswitch.table.halide_type_to_string,@object // @switch.table.halide_type_to_string
	.p2align	3
.Lswitch.table.halide_type_to_string:
	.xword	.L.str.13.77
	.xword	.L.str.14.76
	.xword	.L.str.15.75
	.xword	.L.str.16.74
	.size	.Lswitch.table.halide_type_to_string, 32


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits