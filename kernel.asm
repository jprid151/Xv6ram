
kernel/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot_header>:
  100000:	02 b0 ad 1b 01 00    	add    0x11bad(%eax),%dh
  100006:	01 00                	add    %eax,(%eax)
  100008:	fd                   	std    
  100009:	4f                   	dec    %edi
  10000a:	51                   	push   %ecx
  10000b:	e4 00                	in     $0x0,%al
  10000d:	00 10                	add    %dl,(%eax)
  10000f:	00 00                	add    %al,(%eax)
  100011:	00 10                	add    %dl,(%eax)
  100013:	00 b6 ca 10 00 34    	add    %dh,0x340010ca(%esi)
  100019:	59                   	pop    %ecx
  10001a:	11 00                	adc    %eax,(%eax)
  10001c:	20 00                	and    %al,(%eax)
  10001e:	10 00                	adc    %al,(%eax)

00100020 <multiboot_entry>:
  100020:	0f 01 15 64 00 10 00 	lgdtl  0x100064
  100027:	ea 2e 00 10 00 08 00 	ljmp   $0x8,$0x10002e

0010002e <mbstart32>:
  10002e:	66 b8 10 00          	mov    $0x10,%ax
  100032:	8e d8                	mov    %eax,%ds
  100034:	8e c0                	mov    %eax,%es
  100036:	8e d0                	mov    %eax,%ss
  100038:	66 b8 00 00          	mov    $0x0,%ax
  10003c:	8e e0                	mov    %eax,%fs
  10003e:	8e e8                	mov    %eax,%gs
  100040:	bc 80 db 10 00       	mov    $0x10db80,%esp
  100045:	e8 9b 31 00 00       	call   1031e5 <main>

0010004a <spin>:
  10004a:	eb fe                	jmp    10004a <spin>

0010004c <gdt>:
	...
  100054:	ff                   	(bad)  
  100055:	ff 00                	incl   (%eax)
  100057:	00 00                	add    %al,(%eax)
  100059:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
  100060:	00                   	.byte 0x0
  100061:	92                   	xchg   %eax,%edx
  100062:	cf                   	iret   
	...

00100064 <gdtdesc>:
  100064:	17                   	pop    %ss
  100065:	00 4c 00 10          	add    %cl,0x10(%eax,%eax,1)
	...

0010006a <binit>:
  10006a:	55                   	push   %ebp
  10006b:	89 e5                	mov    %esp,%ebp
  10006d:	83 ec 18             	sub    $0x18,%esp
  100070:	83 ec 08             	sub    $0x8,%esp
  100073:	68 e0 8d 10 00       	push   $0x108de0
  100078:	68 80 db 10 00       	push   $0x10db80
  10007d:	e8 a4 48 00 00       	call   104926 <initlock>
  100082:	83 c4 10             	add    $0x10,%esp
  100085:	c7 05 b0 f0 10 00 a4 	movl   $0x10f0a4,0x10f0b0
  10008c:	f0 10 00 
  10008f:	c7 05 b4 f0 10 00 a4 	movl   $0x10f0a4,0x10f0b4
  100096:	f0 10 00 
  100099:	c7 45 f4 b4 db 10 00 	movl   $0x10dbb4,-0xc(%ebp)
  1000a0:	eb 3a                	jmp    1000dc <binit+0x72>
  1000a2:	8b 15 b4 f0 10 00    	mov    0x10f0b4,%edx
  1000a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000ab:	89 50 10             	mov    %edx,0x10(%eax)
  1000ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000b1:	c7 40 0c a4 f0 10 00 	movl   $0x10f0a4,0xc(%eax)
  1000b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000bb:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
  1000c2:	a1 b4 f0 10 00       	mov    0x10f0b4,%eax
  1000c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1000ca:	89 50 0c             	mov    %edx,0xc(%eax)
  1000cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000d0:	a3 b4 f0 10 00       	mov    %eax,0x10f0b4
  1000d5:	81 45 f4 18 02 00 00 	addl   $0x218,-0xc(%ebp)
  1000dc:	b8 a4 f0 10 00       	mov    $0x10f0a4,%eax
  1000e1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1000e4:	72 bc                	jb     1000a2 <binit+0x38>
  1000e6:	90                   	nop
  1000e7:	c9                   	leave  
  1000e8:	c3                   	ret    

001000e9 <bget>:
  1000e9:	55                   	push   %ebp
  1000ea:	89 e5                	mov    %esp,%ebp
  1000ec:	83 ec 18             	sub    $0x18,%esp
  1000ef:	83 ec 0c             	sub    $0xc,%esp
  1000f2:	68 80 db 10 00       	push   $0x10db80
  1000f7:	e8 4c 48 00 00       	call   104948 <acquire>
  1000fc:	83 c4 10             	add    $0x10,%esp
  1000ff:	a1 b4 f0 10 00       	mov    0x10f0b4,%eax
  100104:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100107:	eb 67                	jmp    100170 <bget+0x87>
  100109:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10010c:	8b 40 04             	mov    0x4(%eax),%eax
  10010f:	39 45 08             	cmp    %eax,0x8(%ebp)
  100112:	75 53                	jne    100167 <bget+0x7e>
  100114:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100117:	8b 40 08             	mov    0x8(%eax),%eax
  10011a:	39 45 0c             	cmp    %eax,0xc(%ebp)
  10011d:	75 48                	jne    100167 <bget+0x7e>
  10011f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100122:	8b 00                	mov    (%eax),%eax
  100124:	83 e0 01             	and    $0x1,%eax
  100127:	85 c0                	test   %eax,%eax
  100129:	75 27                	jne    100152 <bget+0x69>
  10012b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10012e:	8b 00                	mov    (%eax),%eax
  100130:	83 c8 01             	or     $0x1,%eax
  100133:	89 c2                	mov    %eax,%edx
  100135:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100138:	89 10                	mov    %edx,(%eax)
  10013a:	83 ec 0c             	sub    $0xc,%esp
  10013d:	68 80 db 10 00       	push   $0x10db80
  100142:	e8 68 48 00 00       	call   1049af <release>
  100147:	83 c4 10             	add    $0x10,%esp
  10014a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10014d:	e9 8c 00 00 00       	jmp    1001de <bget+0xf5>
  100152:	83 ec 08             	sub    $0x8,%esp
  100155:	68 80 db 10 00       	push   $0x10db80
  10015a:	ff 75 f4             	pushl  -0xc(%ebp)
  10015d:	e8 ed 44 00 00       	call   10464f <sleep>
  100162:	83 c4 10             	add    $0x10,%esp
  100165:	eb 98                	jmp    1000ff <bget+0x16>
  100167:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10016a:	8b 40 10             	mov    0x10(%eax),%eax
  10016d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100170:	81 7d f4 a4 f0 10 00 	cmpl   $0x10f0a4,-0xc(%ebp)
  100177:	75 90                	jne    100109 <bget+0x20>
  100179:	a1 b0 f0 10 00       	mov    0x10f0b0,%eax
  10017e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100181:	eb 45                	jmp    1001c8 <bget+0xdf>
  100183:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100186:	8b 00                	mov    (%eax),%eax
  100188:	83 e0 01             	and    $0x1,%eax
  10018b:	85 c0                	test   %eax,%eax
  10018d:	75 30                	jne    1001bf <bget+0xd6>
  10018f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100192:	8b 55 08             	mov    0x8(%ebp),%edx
  100195:	89 50 04             	mov    %edx,0x4(%eax)
  100198:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10019b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10019e:	89 50 08             	mov    %edx,0x8(%eax)
  1001a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1001a4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  1001aa:	83 ec 0c             	sub    $0xc,%esp
  1001ad:	68 80 db 10 00       	push   $0x10db80
  1001b2:	e8 f8 47 00 00       	call   1049af <release>
  1001b7:	83 c4 10             	add    $0x10,%esp
  1001ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1001bd:	eb 1f                	jmp    1001de <bget+0xf5>
  1001bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1001c2:	8b 40 0c             	mov    0xc(%eax),%eax
  1001c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1001c8:	81 7d f4 a4 f0 10 00 	cmpl   $0x10f0a4,-0xc(%ebp)
  1001cf:	75 b2                	jne    100183 <bget+0x9a>
  1001d1:	83 ec 0c             	sub    $0xc,%esp
  1001d4:	68 e7 8d 10 00       	push   $0x108de7
  1001d9:	e8 9a 03 00 00       	call   100578 <panic>
  1001de:	c9                   	leave  
  1001df:	c3                   	ret    

001001e0 <bread>:
  1001e0:	55                   	push   %ebp
  1001e1:	89 e5                	mov    %esp,%ebp
  1001e3:	83 ec 18             	sub    $0x18,%esp
  1001e6:	83 ec 08             	sub    $0x8,%esp
  1001e9:	ff 75 0c             	pushl  0xc(%ebp)
  1001ec:	ff 75 08             	pushl  0x8(%ebp)
  1001ef:	e8 f5 fe ff ff       	call   1000e9 <bget>
  1001f4:	83 c4 10             	add    $0x10,%esp
  1001f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1001fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1001fd:	8b 00                	mov    (%eax),%eax
  1001ff:	83 e0 02             	and    $0x2,%eax
  100202:	85 c0                	test   %eax,%eax
  100204:	75 0e                	jne    100214 <bread+0x34>
  100206:	83 ec 0c             	sub    $0xc,%esp
  100209:	ff 75 f4             	pushl  -0xc(%ebp)
  10020c:	e8 c9 27 00 00       	call   1029da <iderw>
  100211:	83 c4 10             	add    $0x10,%esp
  100214:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100217:	c9                   	leave  
  100218:	c3                   	ret    

00100219 <bwrite>:
  100219:	55                   	push   %ebp
  10021a:	89 e5                	mov    %esp,%ebp
  10021c:	83 ec 08             	sub    $0x8,%esp
  10021f:	8b 45 08             	mov    0x8(%ebp),%eax
  100222:	8b 00                	mov    (%eax),%eax
  100224:	83 e0 01             	and    $0x1,%eax
  100227:	85 c0                	test   %eax,%eax
  100229:	75 0d                	jne    100238 <bwrite+0x1f>
  10022b:	83 ec 0c             	sub    $0xc,%esp
  10022e:	68 f8 8d 10 00       	push   $0x108df8
  100233:	e8 40 03 00 00       	call   100578 <panic>
  100238:	8b 45 08             	mov    0x8(%ebp),%eax
  10023b:	8b 00                	mov    (%eax),%eax
  10023d:	83 c8 04             	or     $0x4,%eax
  100240:	89 c2                	mov    %eax,%edx
  100242:	8b 45 08             	mov    0x8(%ebp),%eax
  100245:	89 10                	mov    %edx,(%eax)
  100247:	83 ec 0c             	sub    $0xc,%esp
  10024a:	ff 75 08             	pushl  0x8(%ebp)
  10024d:	e8 88 27 00 00       	call   1029da <iderw>
  100252:	83 c4 10             	add    $0x10,%esp
  100255:	90                   	nop
  100256:	c9                   	leave  
  100257:	c3                   	ret    

00100258 <brelse>:
  100258:	55                   	push   %ebp
  100259:	89 e5                	mov    %esp,%ebp
  10025b:	83 ec 08             	sub    $0x8,%esp
  10025e:	8b 45 08             	mov    0x8(%ebp),%eax
  100261:	8b 00                	mov    (%eax),%eax
  100263:	83 e0 01             	and    $0x1,%eax
  100266:	85 c0                	test   %eax,%eax
  100268:	75 0d                	jne    100277 <brelse+0x1f>
  10026a:	83 ec 0c             	sub    $0xc,%esp
  10026d:	68 ff 8d 10 00       	push   $0x108dff
  100272:	e8 01 03 00 00       	call   100578 <panic>
  100277:	83 ec 0c             	sub    $0xc,%esp
  10027a:	68 80 db 10 00       	push   $0x10db80
  10027f:	e8 c4 46 00 00       	call   104948 <acquire>
  100284:	83 c4 10             	add    $0x10,%esp
  100287:	8b 45 08             	mov    0x8(%ebp),%eax
  10028a:	8b 40 10             	mov    0x10(%eax),%eax
  10028d:	8b 55 08             	mov    0x8(%ebp),%edx
  100290:	8b 52 0c             	mov    0xc(%edx),%edx
  100293:	89 50 0c             	mov    %edx,0xc(%eax)
  100296:	8b 45 08             	mov    0x8(%ebp),%eax
  100299:	8b 40 0c             	mov    0xc(%eax),%eax
  10029c:	8b 55 08             	mov    0x8(%ebp),%edx
  10029f:	8b 52 10             	mov    0x10(%edx),%edx
  1002a2:	89 50 10             	mov    %edx,0x10(%eax)
  1002a5:	8b 15 b4 f0 10 00    	mov    0x10f0b4,%edx
  1002ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ae:	89 50 10             	mov    %edx,0x10(%eax)
  1002b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1002b4:	c7 40 0c a4 f0 10 00 	movl   $0x10f0a4,0xc(%eax)
  1002bb:	a1 b4 f0 10 00       	mov    0x10f0b4,%eax
  1002c0:	8b 55 08             	mov    0x8(%ebp),%edx
  1002c3:	89 50 0c             	mov    %edx,0xc(%eax)
  1002c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c9:	a3 b4 f0 10 00       	mov    %eax,0x10f0b4
  1002ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d1:	8b 00                	mov    (%eax),%eax
  1002d3:	83 e0 fe             	and    $0xfffffffe,%eax
  1002d6:	89 c2                	mov    %eax,%edx
  1002d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
  1002dd:	83 ec 0c             	sub    $0xc,%esp
  1002e0:	ff 75 08             	pushl  0x8(%ebp)
  1002e3:	e8 52 44 00 00       	call   10473a <wakeup>
  1002e8:	83 c4 10             	add    $0x10,%esp
  1002eb:	83 ec 0c             	sub    $0xc,%esp
  1002ee:	68 80 db 10 00       	push   $0x10db80
  1002f3:	e8 b7 46 00 00       	call   1049af <release>
  1002f8:	83 c4 10             	add    $0x10,%esp
  1002fb:	90                   	nop
  1002fc:	c9                   	leave  
  1002fd:	c3                   	ret    

001002fe <inb>:
  1002fe:	55                   	push   %ebp
  1002ff:	89 e5                	mov    %esp,%ebp
  100301:	83 ec 14             	sub    $0x14,%esp
  100304:	8b 45 08             	mov    0x8(%ebp),%eax
  100307:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10030b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10030f:	89 c2                	mov    %eax,%edx
  100311:	ec                   	in     (%dx),%al
  100312:	88 45 ff             	mov    %al,-0x1(%ebp)
  100315:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  100319:	c9                   	leave  
  10031a:	c3                   	ret    

0010031b <outb>:
  10031b:	55                   	push   %ebp
  10031c:	89 e5                	mov    %esp,%ebp
  10031e:	83 ec 08             	sub    $0x8,%esp
  100321:	8b 55 08             	mov    0x8(%ebp),%edx
  100324:	8b 45 0c             	mov    0xc(%ebp),%eax
  100327:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  10032b:	88 45 f8             	mov    %al,-0x8(%ebp)
  10032e:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100332:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100336:	ee                   	out    %al,(%dx)
  100337:	90                   	nop
  100338:	c9                   	leave  
  100339:	c3                   	ret    

0010033a <cli>:
  10033a:	55                   	push   %ebp
  10033b:	89 e5                	mov    %esp,%ebp
  10033d:	fa                   	cli    
  10033e:	90                   	nop
  10033f:	5d                   	pop    %ebp
  100340:	c3                   	ret    

00100341 <printint>:
  100341:	55                   	push   %ebp
  100342:	89 e5                	mov    %esp,%ebp
  100344:	83 ec 28             	sub    $0x28,%esp
  100347:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10034b:	74 1c                	je     100369 <printint+0x28>
  10034d:	8b 45 08             	mov    0x8(%ebp),%eax
  100350:	c1 e8 1f             	shr    $0x1f,%eax
  100353:	0f b6 c0             	movzbl %al,%eax
  100356:	89 45 10             	mov    %eax,0x10(%ebp)
  100359:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10035d:	74 0a                	je     100369 <printint+0x28>
  10035f:	8b 45 08             	mov    0x8(%ebp),%eax
  100362:	f7 d8                	neg    %eax
  100364:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100367:	eb 06                	jmp    10036f <printint+0x2e>
  100369:	8b 45 08             	mov    0x8(%ebp),%eax
  10036c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10036f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100376:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100379:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10037c:	ba 00 00 00 00       	mov    $0x0,%edx
  100381:	f7 f1                	div    %ecx
  100383:	89 d1                	mov    %edx,%ecx
  100385:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100388:	8d 50 01             	lea    0x1(%eax),%edx
  10038b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10038e:	0f b6 91 08 c0 10 00 	movzbl 0x10c008(%ecx),%edx
  100395:	88 54 05 e0          	mov    %dl,-0x20(%ebp,%eax,1)
  100399:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10039c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10039f:	ba 00 00 00 00       	mov    $0x0,%edx
  1003a4:	f7 f1                	div    %ecx
  1003a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1003a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1003ad:	75 c7                	jne    100376 <printint+0x35>
  1003af:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1003b3:	74 2a                	je     1003df <printint+0x9e>
  1003b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003b8:	8d 50 01             	lea    0x1(%eax),%edx
  1003bb:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1003be:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)
  1003c3:	eb 1a                	jmp    1003df <printint+0x9e>
  1003c5:	8d 55 e0             	lea    -0x20(%ebp),%edx
  1003c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003cb:	01 d0                	add    %edx,%eax
  1003cd:	0f b6 00             	movzbl (%eax),%eax
  1003d0:	0f be c0             	movsbl %al,%eax
  1003d3:	83 ec 0c             	sub    $0xc,%esp
  1003d6:	50                   	push   %eax
  1003d7:	e8 c6 03 00 00       	call   1007a2 <consputc>
  1003dc:	83 c4 10             	add    $0x10,%esp
  1003df:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1003e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003e7:	79 dc                	jns    1003c5 <printint+0x84>
  1003e9:	90                   	nop
  1003ea:	c9                   	leave  
  1003eb:	c3                   	ret    

001003ec <cprintf>:
  1003ec:	55                   	push   %ebp
  1003ed:	89 e5                	mov    %esp,%ebp
  1003ef:	83 ec 28             	sub    $0x28,%esp
  1003f2:	a1 14 cb 10 00       	mov    0x10cb14,%eax
  1003f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1003fa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1003fe:	74 10                	je     100410 <cprintf+0x24>
  100400:	83 ec 0c             	sub    $0xc,%esp
  100403:	68 e0 ca 10 00       	push   $0x10cae0
  100408:	e8 3b 45 00 00       	call   104948 <acquire>
  10040d:	83 c4 10             	add    $0x10,%esp
  100410:	8d 45 0c             	lea    0xc(%ebp),%eax
  100413:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100416:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10041d:	e9 1a 01 00 00       	jmp    10053c <cprintf+0x150>
  100422:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
  100426:	74 13                	je     10043b <cprintf+0x4f>
  100428:	83 ec 0c             	sub    $0xc,%esp
  10042b:	ff 75 e4             	pushl  -0x1c(%ebp)
  10042e:	e8 6f 03 00 00       	call   1007a2 <consputc>
  100433:	83 c4 10             	add    $0x10,%esp
  100436:	e9 fd 00 00 00       	jmp    100538 <cprintf+0x14c>
  10043b:	8b 55 08             	mov    0x8(%ebp),%edx
  10043e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100442:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100445:	01 d0                	add    %edx,%eax
  100447:	0f b6 00             	movzbl (%eax),%eax
  10044a:	0f be c0             	movsbl %al,%eax
  10044d:	25 ff 00 00 00       	and    $0xff,%eax
  100452:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100455:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  100459:	0f 84 ff 00 00 00    	je     10055e <cprintf+0x172>
  10045f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100462:	83 f8 70             	cmp    $0x70,%eax
  100465:	74 47                	je     1004ae <cprintf+0xc2>
  100467:	83 f8 70             	cmp    $0x70,%eax
  10046a:	7f 13                	jg     10047f <cprintf+0x93>
  10046c:	83 f8 25             	cmp    $0x25,%eax
  10046f:	0f 84 98 00 00 00    	je     10050d <cprintf+0x121>
  100475:	83 f8 64             	cmp    $0x64,%eax
  100478:	74 14                	je     10048e <cprintf+0xa2>
  10047a:	e9 9d 00 00 00       	jmp    10051c <cprintf+0x130>
  10047f:	83 f8 73             	cmp    $0x73,%eax
  100482:	74 47                	je     1004cb <cprintf+0xdf>
  100484:	83 f8 78             	cmp    $0x78,%eax
  100487:	74 25                	je     1004ae <cprintf+0xc2>
  100489:	e9 8e 00 00 00       	jmp    10051c <cprintf+0x130>
  10048e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100491:	8d 50 04             	lea    0x4(%eax),%edx
  100494:	89 55 f0             	mov    %edx,-0x10(%ebp)
  100497:	8b 00                	mov    (%eax),%eax
  100499:	83 ec 04             	sub    $0x4,%esp
  10049c:	6a 01                	push   $0x1
  10049e:	6a 0a                	push   $0xa
  1004a0:	50                   	push   %eax
  1004a1:	e8 9b fe ff ff       	call   100341 <printint>
  1004a6:	83 c4 10             	add    $0x10,%esp
  1004a9:	e9 8a 00 00 00       	jmp    100538 <cprintf+0x14c>
  1004ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004b1:	8d 50 04             	lea    0x4(%eax),%edx
  1004b4:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1004b7:	8b 00                	mov    (%eax),%eax
  1004b9:	83 ec 04             	sub    $0x4,%esp
  1004bc:	6a 00                	push   $0x0
  1004be:	6a 10                	push   $0x10
  1004c0:	50                   	push   %eax
  1004c1:	e8 7b fe ff ff       	call   100341 <printint>
  1004c6:	83 c4 10             	add    $0x10,%esp
  1004c9:	eb 6d                	jmp    100538 <cprintf+0x14c>
  1004cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ce:	8d 50 04             	lea    0x4(%eax),%edx
  1004d1:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1004d4:	8b 00                	mov    (%eax),%eax
  1004d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1004dd:	75 22                	jne    100501 <cprintf+0x115>
  1004df:	c7 45 ec 06 8e 10 00 	movl   $0x108e06,-0x14(%ebp)
  1004e6:	eb 19                	jmp    100501 <cprintf+0x115>
  1004e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004eb:	0f b6 00             	movzbl (%eax),%eax
  1004ee:	0f be c0             	movsbl %al,%eax
  1004f1:	83 ec 0c             	sub    $0xc,%esp
  1004f4:	50                   	push   %eax
  1004f5:	e8 a8 02 00 00       	call   1007a2 <consputc>
  1004fa:	83 c4 10             	add    $0x10,%esp
  1004fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100501:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100504:	0f b6 00             	movzbl (%eax),%eax
  100507:	84 c0                	test   %al,%al
  100509:	75 dd                	jne    1004e8 <cprintf+0xfc>
  10050b:	eb 2b                	jmp    100538 <cprintf+0x14c>
  10050d:	83 ec 0c             	sub    $0xc,%esp
  100510:	6a 25                	push   $0x25
  100512:	e8 8b 02 00 00       	call   1007a2 <consputc>
  100517:	83 c4 10             	add    $0x10,%esp
  10051a:	eb 1c                	jmp    100538 <cprintf+0x14c>
  10051c:	83 ec 0c             	sub    $0xc,%esp
  10051f:	6a 25                	push   $0x25
  100521:	e8 7c 02 00 00       	call   1007a2 <consputc>
  100526:	83 c4 10             	add    $0x10,%esp
  100529:	83 ec 0c             	sub    $0xc,%esp
  10052c:	ff 75 e4             	pushl  -0x1c(%ebp)
  10052f:	e8 6e 02 00 00       	call   1007a2 <consputc>
  100534:	83 c4 10             	add    $0x10,%esp
  100537:	90                   	nop
  100538:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10053c:	8b 55 08             	mov    0x8(%ebp),%edx
  10053f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100542:	01 d0                	add    %edx,%eax
  100544:	0f b6 00             	movzbl (%eax),%eax
  100547:	0f be c0             	movsbl %al,%eax
  10054a:	25 ff 00 00 00       	and    $0xff,%eax
  10054f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100552:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  100556:	0f 85 c6 fe ff ff    	jne    100422 <cprintf+0x36>
  10055c:	eb 01                	jmp    10055f <cprintf+0x173>
  10055e:	90                   	nop
  10055f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  100563:	74 10                	je     100575 <cprintf+0x189>
  100565:	83 ec 0c             	sub    $0xc,%esp
  100568:	68 e0 ca 10 00       	push   $0x10cae0
  10056d:	e8 3d 44 00 00       	call   1049af <release>
  100572:	83 c4 10             	add    $0x10,%esp
  100575:	90                   	nop
  100576:	c9                   	leave  
  100577:	c3                   	ret    

00100578 <panic>:
  100578:	55                   	push   %ebp
  100579:	89 e5                	mov    %esp,%ebp
  10057b:	83 ec 38             	sub    $0x38,%esp
  10057e:	e8 b7 fd ff ff       	call   10033a <cli>
  100583:	c7 05 14 cb 10 00 00 	movl   $0x0,0x10cb14
  10058a:	00 00 00 
  10058d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  100593:	0f b6 00             	movzbl (%eax),%eax
  100596:	0f b6 c0             	movzbl %al,%eax
  100599:	83 ec 08             	sub    $0x8,%esp
  10059c:	50                   	push   %eax
  10059d:	68 0d 8e 10 00       	push   $0x108e0d
  1005a2:	e8 45 fe ff ff       	call   1003ec <cprintf>
  1005a7:	83 c4 10             	add    $0x10,%esp
  1005aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ad:	83 ec 0c             	sub    $0xc,%esp
  1005b0:	50                   	push   %eax
  1005b1:	e8 36 fe ff ff       	call   1003ec <cprintf>
  1005b6:	83 c4 10             	add    $0x10,%esp
  1005b9:	83 ec 0c             	sub    $0xc,%esp
  1005bc:	68 1c 8e 10 00       	push   $0x108e1c
  1005c1:	e8 26 fe ff ff       	call   1003ec <cprintf>
  1005c6:	83 c4 10             	add    $0x10,%esp
  1005c9:	83 ec 08             	sub    $0x8,%esp
  1005cc:	8d 45 cc             	lea    -0x34(%ebp),%eax
  1005cf:	50                   	push   %eax
  1005d0:	8d 45 08             	lea    0x8(%ebp),%eax
  1005d3:	50                   	push   %eax
  1005d4:	e8 28 44 00 00       	call   104a01 <getcallerpcs>
  1005d9:	83 c4 10             	add    $0x10,%esp
  1005dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1005e3:	eb 1c                	jmp    100601 <panic+0x89>
  1005e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005e8:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
  1005ec:	83 ec 08             	sub    $0x8,%esp
  1005ef:	50                   	push   %eax
  1005f0:	68 1e 8e 10 00       	push   $0x108e1e
  1005f5:	e8 f2 fd ff ff       	call   1003ec <cprintf>
  1005fa:	83 c4 10             	add    $0x10,%esp
  1005fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100601:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  100605:	7e de                	jle    1005e5 <panic+0x6d>
  100607:	c7 05 c0 ca 10 00 01 	movl   $0x1,0x10cac0
  10060e:	00 00 00 
  100611:	83 ec 08             	sub    $0x8,%esp
  100614:	6a 00                	push   $0x0
  100616:	68 f4 00 00 00       	push   $0xf4
  10061b:	e8 fb fc ff ff       	call   10031b <outb>
  100620:	83 c4 10             	add    $0x10,%esp
  100623:	eb fe                	jmp    100623 <panic+0xab>

00100625 <cgaputc>:
  100625:	55                   	push   %ebp
  100626:	89 e5                	mov    %esp,%ebp
  100628:	53                   	push   %ebx
  100629:	83 ec 14             	sub    $0x14,%esp
  10062c:	6a 0e                	push   $0xe
  10062e:	68 d4 03 00 00       	push   $0x3d4
  100633:	e8 e3 fc ff ff       	call   10031b <outb>
  100638:	83 c4 08             	add    $0x8,%esp
  10063b:	68 d5 03 00 00       	push   $0x3d5
  100640:	e8 b9 fc ff ff       	call   1002fe <inb>
  100645:	83 c4 04             	add    $0x4,%esp
  100648:	0f b6 c0             	movzbl %al,%eax
  10064b:	c1 e0 08             	shl    $0x8,%eax
  10064e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100651:	6a 0f                	push   $0xf
  100653:	68 d4 03 00 00       	push   $0x3d4
  100658:	e8 be fc ff ff       	call   10031b <outb>
  10065d:	83 c4 08             	add    $0x8,%esp
  100660:	68 d5 03 00 00       	push   $0x3d5
  100665:	e8 94 fc ff ff       	call   1002fe <inb>
  10066a:	83 c4 04             	add    $0x4,%esp
  10066d:	0f b6 c0             	movzbl %al,%eax
  100670:	09 45 f4             	or     %eax,-0xc(%ebp)
  100673:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
  100677:	75 30                	jne    1006a9 <cgaputc+0x84>
  100679:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  10067c:	ba 67 66 66 66       	mov    $0x66666667,%edx
  100681:	89 c8                	mov    %ecx,%eax
  100683:	f7 ea                	imul   %edx
  100685:	c1 fa 05             	sar    $0x5,%edx
  100688:	89 c8                	mov    %ecx,%eax
  10068a:	c1 f8 1f             	sar    $0x1f,%eax
  10068d:	29 c2                	sub    %eax,%edx
  10068f:	89 d0                	mov    %edx,%eax
  100691:	c1 e0 02             	shl    $0x2,%eax
  100694:	01 d0                	add    %edx,%eax
  100696:	c1 e0 04             	shl    $0x4,%eax
  100699:	29 c1                	sub    %eax,%ecx
  10069b:	89 ca                	mov    %ecx,%edx
  10069d:	b8 50 00 00 00       	mov    $0x50,%eax
  1006a2:	29 d0                	sub    %edx,%eax
  1006a4:	01 45 f4             	add    %eax,-0xc(%ebp)
  1006a7:	eb 38                	jmp    1006e1 <cgaputc+0xbc>
  1006a9:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
  1006b0:	75 0c                	jne    1006be <cgaputc+0x99>
  1006b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1006b6:	7e 29                	jle    1006e1 <cgaputc+0xbc>
  1006b8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1006bc:	eb 23                	jmp    1006e1 <cgaputc+0xbc>
  1006be:	8b 45 08             	mov    0x8(%ebp),%eax
  1006c1:	0f b6 c0             	movzbl %al,%eax
  1006c4:	80 cc 07             	or     $0x7,%ah
  1006c7:	89 c3                	mov    %eax,%ebx
  1006c9:	8b 0d 04 c0 10 00    	mov    0x10c004,%ecx
  1006cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d2:	8d 50 01             	lea    0x1(%eax),%edx
  1006d5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1006d8:	01 c0                	add    %eax,%eax
  1006da:	01 c8                	add    %ecx,%eax
  1006dc:	89 da                	mov    %ebx,%edx
  1006de:	66 89 10             	mov    %dx,(%eax)
  1006e1:	81 7d f4 7f 07 00 00 	cmpl   $0x77f,-0xc(%ebp)
  1006e8:	7e 4c                	jle    100736 <cgaputc+0x111>
  1006ea:	a1 04 c0 10 00       	mov    0x10c004,%eax
  1006ef:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1006f5:	a1 04 c0 10 00       	mov    0x10c004,%eax
  1006fa:	83 ec 04             	sub    $0x4,%esp
  1006fd:	68 60 0e 00 00       	push   $0xe60
  100702:	52                   	push   %edx
  100703:	50                   	push   %eax
  100704:	e8 ee 44 00 00       	call   104bf7 <memmove>
  100709:	83 c4 10             	add    $0x10,%esp
  10070c:	83 6d f4 50          	subl   $0x50,-0xc(%ebp)
  100710:	b8 80 07 00 00       	mov    $0x780,%eax
  100715:	2b 45 f4             	sub    -0xc(%ebp),%eax
  100718:	8d 14 00             	lea    (%eax,%eax,1),%edx
  10071b:	a1 04 c0 10 00       	mov    0x10c004,%eax
  100720:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100723:	01 c9                	add    %ecx,%ecx
  100725:	01 c8                	add    %ecx,%eax
  100727:	83 ec 04             	sub    $0x4,%esp
  10072a:	52                   	push   %edx
  10072b:	6a 00                	push   $0x0
  10072d:	50                   	push   %eax
  10072e:	e8 52 44 00 00       	call   104b85 <memset>
  100733:	83 c4 10             	add    $0x10,%esp
  100736:	83 ec 08             	sub    $0x8,%esp
  100739:	6a 0e                	push   $0xe
  10073b:	68 d4 03 00 00       	push   $0x3d4
  100740:	e8 d6 fb ff ff       	call   10031b <outb>
  100745:	83 c4 10             	add    $0x10,%esp
  100748:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10074b:	c1 f8 08             	sar    $0x8,%eax
  10074e:	0f b6 c0             	movzbl %al,%eax
  100751:	83 ec 08             	sub    $0x8,%esp
  100754:	50                   	push   %eax
  100755:	68 d5 03 00 00       	push   $0x3d5
  10075a:	e8 bc fb ff ff       	call   10031b <outb>
  10075f:	83 c4 10             	add    $0x10,%esp
  100762:	83 ec 08             	sub    $0x8,%esp
  100765:	6a 0f                	push   $0xf
  100767:	68 d4 03 00 00       	push   $0x3d4
  10076c:	e8 aa fb ff ff       	call   10031b <outb>
  100771:	83 c4 10             	add    $0x10,%esp
  100774:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100777:	0f b6 c0             	movzbl %al,%eax
  10077a:	83 ec 08             	sub    $0x8,%esp
  10077d:	50                   	push   %eax
  10077e:	68 d5 03 00 00       	push   $0x3d5
  100783:	e8 93 fb ff ff       	call   10031b <outb>
  100788:	83 c4 10             	add    $0x10,%esp
  10078b:	a1 04 c0 10 00       	mov    0x10c004,%eax
  100790:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100793:	01 d2                	add    %edx,%edx
  100795:	01 d0                	add    %edx,%eax
  100797:	66 c7 00 20 07       	movw   $0x720,(%eax)
  10079c:	90                   	nop
  10079d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007a0:	c9                   	leave  
  1007a1:	c3                   	ret    

001007a2 <consputc>:
  1007a2:	55                   	push   %ebp
  1007a3:	89 e5                	mov    %esp,%ebp
  1007a5:	83 ec 08             	sub    $0x8,%esp
  1007a8:	a1 c0 ca 10 00       	mov    0x10cac0,%eax
  1007ad:	85 c0                	test   %eax,%eax
  1007af:	74 07                	je     1007b8 <consputc+0x16>
  1007b1:	e8 84 fb ff ff       	call   10033a <cli>
  1007b6:	eb fe                	jmp    1007b6 <consputc+0x14>
  1007b8:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
  1007bf:	75 29                	jne    1007ea <consputc+0x48>
  1007c1:	83 ec 0c             	sub    $0xc,%esp
  1007c4:	6a 08                	push   $0x8
  1007c6:	e8 e2 5c 00 00       	call   1064ad <uartputc>
  1007cb:	83 c4 10             	add    $0x10,%esp
  1007ce:	83 ec 0c             	sub    $0xc,%esp
  1007d1:	6a 20                	push   $0x20
  1007d3:	e8 d5 5c 00 00       	call   1064ad <uartputc>
  1007d8:	83 c4 10             	add    $0x10,%esp
  1007db:	83 ec 0c             	sub    $0xc,%esp
  1007de:	6a 08                	push   $0x8
  1007e0:	e8 c8 5c 00 00       	call   1064ad <uartputc>
  1007e5:	83 c4 10             	add    $0x10,%esp
  1007e8:	eb 0e                	jmp    1007f8 <consputc+0x56>
  1007ea:	83 ec 0c             	sub    $0xc,%esp
  1007ed:	ff 75 08             	pushl  0x8(%ebp)
  1007f0:	e8 b8 5c 00 00       	call   1064ad <uartputc>
  1007f5:	83 c4 10             	add    $0x10,%esp
  1007f8:	83 ec 0c             	sub    $0xc,%esp
  1007fb:	ff 75 08             	pushl  0x8(%ebp)
  1007fe:	e8 22 fe ff ff       	call   100625 <cgaputc>
  100803:	83 c4 10             	add    $0x10,%esp
  100806:	90                   	nop
  100807:	c9                   	leave  
  100808:	c3                   	ret    

00100809 <consoleintr>:
  100809:	55                   	push   %ebp
  10080a:	89 e5                	mov    %esp,%ebp
  10080c:	83 ec 18             	sub    $0x18,%esp
  10080f:	83 ec 0c             	sub    $0xc,%esp
  100812:	68 c0 f2 10 00       	push   $0x10f2c0
  100817:	e8 2c 41 00 00       	call   104948 <acquire>
  10081c:	83 c4 10             	add    $0x10,%esp
  10081f:	e9 42 01 00 00       	jmp    100966 <consoleintr+0x15d>
  100824:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100827:	83 f8 10             	cmp    $0x10,%eax
  10082a:	74 1e                	je     10084a <consoleintr+0x41>
  10082c:	83 f8 10             	cmp    $0x10,%eax
  10082f:	7f 0a                	jg     10083b <consoleintr+0x32>
  100831:	83 f8 08             	cmp    $0x8,%eax
  100834:	74 69                	je     10089f <consoleintr+0x96>
  100836:	e9 99 00 00 00       	jmp    1008d4 <consoleintr+0xcb>
  10083b:	83 f8 15             	cmp    $0x15,%eax
  10083e:	74 31                	je     100871 <consoleintr+0x68>
  100840:	83 f8 7f             	cmp    $0x7f,%eax
  100843:	74 5a                	je     10089f <consoleintr+0x96>
  100845:	e9 8a 00 00 00       	jmp    1008d4 <consoleintr+0xcb>
  10084a:	e8 a6 3f 00 00       	call   1047f5 <procdump>
  10084f:	e9 12 01 00 00       	jmp    100966 <consoleintr+0x15d>
  100854:	a1 7c f3 10 00       	mov    0x10f37c,%eax
  100859:	83 e8 01             	sub    $0x1,%eax
  10085c:	a3 7c f3 10 00       	mov    %eax,0x10f37c
  100861:	83 ec 0c             	sub    $0xc,%esp
  100864:	68 00 01 00 00       	push   $0x100
  100869:	e8 34 ff ff ff       	call   1007a2 <consputc>
  10086e:	83 c4 10             	add    $0x10,%esp
  100871:	8b 15 7c f3 10 00    	mov    0x10f37c,%edx
  100877:	a1 78 f3 10 00       	mov    0x10f378,%eax
  10087c:	39 c2                	cmp    %eax,%edx
  10087e:	0f 84 e2 00 00 00    	je     100966 <consoleintr+0x15d>
  100884:	a1 7c f3 10 00       	mov    0x10f37c,%eax
  100889:	83 e8 01             	sub    $0x1,%eax
  10088c:	83 e0 7f             	and    $0x7f,%eax
  10088f:	0f b6 80 f4 f2 10 00 	movzbl 0x10f2f4(%eax),%eax
  100896:	3c 0a                	cmp    $0xa,%al
  100898:	75 ba                	jne    100854 <consoleintr+0x4b>
  10089a:	e9 c7 00 00 00       	jmp    100966 <consoleintr+0x15d>
  10089f:	8b 15 7c f3 10 00    	mov    0x10f37c,%edx
  1008a5:	a1 78 f3 10 00       	mov    0x10f378,%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	0f 84 b4 00 00 00    	je     100966 <consoleintr+0x15d>
  1008b2:	a1 7c f3 10 00       	mov    0x10f37c,%eax
  1008b7:	83 e8 01             	sub    $0x1,%eax
  1008ba:	a3 7c f3 10 00       	mov    %eax,0x10f37c
  1008bf:	83 ec 0c             	sub    $0xc,%esp
  1008c2:	68 00 01 00 00       	push   $0x100
  1008c7:	e8 d6 fe ff ff       	call   1007a2 <consputc>
  1008cc:	83 c4 10             	add    $0x10,%esp
  1008cf:	e9 92 00 00 00       	jmp    100966 <consoleintr+0x15d>
  1008d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1008d8:	0f 84 87 00 00 00    	je     100965 <consoleintr+0x15c>
  1008de:	8b 15 7c f3 10 00    	mov    0x10f37c,%edx
  1008e4:	a1 74 f3 10 00       	mov    0x10f374,%eax
  1008e9:	29 c2                	sub    %eax,%edx
  1008eb:	89 d0                	mov    %edx,%eax
  1008ed:	83 f8 7f             	cmp    $0x7f,%eax
  1008f0:	77 73                	ja     100965 <consoleintr+0x15c>
  1008f2:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
  1008f6:	74 05                	je     1008fd <consoleintr+0xf4>
  1008f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008fb:	eb 05                	jmp    100902 <consoleintr+0xf9>
  1008fd:	b8 0a 00 00 00       	mov    $0xa,%eax
  100902:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100905:	a1 7c f3 10 00       	mov    0x10f37c,%eax
  10090a:	8d 50 01             	lea    0x1(%eax),%edx
  10090d:	89 15 7c f3 10 00    	mov    %edx,0x10f37c
  100913:	83 e0 7f             	and    $0x7f,%eax
  100916:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100919:	88 90 f4 f2 10 00    	mov    %dl,0x10f2f4(%eax)
  10091f:	83 ec 0c             	sub    $0xc,%esp
  100922:	ff 75 f4             	pushl  -0xc(%ebp)
  100925:	e8 78 fe ff ff       	call   1007a2 <consputc>
  10092a:	83 c4 10             	add    $0x10,%esp
  10092d:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  100931:	74 18                	je     10094b <consoleintr+0x142>
  100933:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  100937:	74 12                	je     10094b <consoleintr+0x142>
  100939:	a1 7c f3 10 00       	mov    0x10f37c,%eax
  10093e:	8b 15 74 f3 10 00    	mov    0x10f374,%edx
  100944:	83 ea 80             	sub    $0xffffff80,%edx
  100947:	39 d0                	cmp    %edx,%eax
  100949:	75 1a                	jne    100965 <consoleintr+0x15c>
  10094b:	a1 7c f3 10 00       	mov    0x10f37c,%eax
  100950:	a3 78 f3 10 00       	mov    %eax,0x10f378
  100955:	83 ec 0c             	sub    $0xc,%esp
  100958:	68 74 f3 10 00       	push   $0x10f374
  10095d:	e8 d8 3d 00 00       	call   10473a <wakeup>
  100962:	83 c4 10             	add    $0x10,%esp
  100965:	90                   	nop
  100966:	8b 45 08             	mov    0x8(%ebp),%eax
  100969:	ff d0                	call   *%eax
  10096b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10096e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100972:	0f 89 ac fe ff ff    	jns    100824 <consoleintr+0x1b>
  100978:	83 ec 0c             	sub    $0xc,%esp
  10097b:	68 c0 f2 10 00       	push   $0x10f2c0
  100980:	e8 2a 40 00 00       	call   1049af <release>
  100985:	83 c4 10             	add    $0x10,%esp
  100988:	90                   	nop
  100989:	c9                   	leave  
  10098a:	c3                   	ret    

0010098b <consoleread>:
  10098b:	55                   	push   %ebp
  10098c:	89 e5                	mov    %esp,%ebp
  10098e:	83 ec 18             	sub    $0x18,%esp
  100991:	83 ec 0c             	sub    $0xc,%esp
  100994:	ff 75 08             	pushl  0x8(%ebp)
  100997:	e8 4b 10 00 00       	call   1019e7 <iunlock>
  10099c:	83 c4 10             	add    $0x10,%esp
  10099f:	8b 45 10             	mov    0x10(%ebp),%eax
  1009a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1009a5:	83 ec 0c             	sub    $0xc,%esp
  1009a8:	68 c0 f2 10 00       	push   $0x10f2c0
  1009ad:	e8 96 3f 00 00       	call   104948 <acquire>
  1009b2:	83 c4 10             	add    $0x10,%esp
  1009b5:	e9 ac 00 00 00       	jmp    100a66 <consoleread+0xdb>
  1009ba:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1009c0:	8b 40 24             	mov    0x24(%eax),%eax
  1009c3:	85 c0                	test   %eax,%eax
  1009c5:	74 28                	je     1009ef <consoleread+0x64>
  1009c7:	83 ec 0c             	sub    $0xc,%esp
  1009ca:	68 c0 f2 10 00       	push   $0x10f2c0
  1009cf:	e8 db 3f 00 00       	call   1049af <release>
  1009d4:	83 c4 10             	add    $0x10,%esp
  1009d7:	83 ec 0c             	sub    $0xc,%esp
  1009da:	ff 75 08             	pushl  0x8(%ebp)
  1009dd:	e8 93 0e 00 00       	call   101875 <ilock>
  1009e2:	83 c4 10             	add    $0x10,%esp
  1009e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1009ea:	e9 ab 00 00 00       	jmp    100a9a <consoleread+0x10f>
  1009ef:	83 ec 08             	sub    $0x8,%esp
  1009f2:	68 c0 f2 10 00       	push   $0x10f2c0
  1009f7:	68 74 f3 10 00       	push   $0x10f374
  1009fc:	e8 4e 3c 00 00       	call   10464f <sleep>
  100a01:	83 c4 10             	add    $0x10,%esp
  100a04:	8b 15 74 f3 10 00    	mov    0x10f374,%edx
  100a0a:	a1 78 f3 10 00       	mov    0x10f378,%eax
  100a0f:	39 c2                	cmp    %eax,%edx
  100a11:	74 a7                	je     1009ba <consoleread+0x2f>
  100a13:	a1 74 f3 10 00       	mov    0x10f374,%eax
  100a18:	8d 50 01             	lea    0x1(%eax),%edx
  100a1b:	89 15 74 f3 10 00    	mov    %edx,0x10f374
  100a21:	83 e0 7f             	and    $0x7f,%eax
  100a24:	0f b6 80 f4 f2 10 00 	movzbl 0x10f2f4(%eax),%eax
  100a2b:	0f be c0             	movsbl %al,%eax
  100a2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100a31:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
  100a35:	75 17                	jne    100a4e <consoleread+0xc3>
  100a37:	8b 45 10             	mov    0x10(%ebp),%eax
  100a3a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3d:	76 2f                	jbe    100a6e <consoleread+0xe3>
  100a3f:	a1 74 f3 10 00       	mov    0x10f374,%eax
  100a44:	83 e8 01             	sub    $0x1,%eax
  100a47:	a3 74 f3 10 00       	mov    %eax,0x10f374
  100a4c:	eb 20                	jmp    100a6e <consoleread+0xe3>
  100a4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a51:	8d 50 01             	lea    0x1(%eax),%edx
  100a54:	89 55 0c             	mov    %edx,0xc(%ebp)
  100a57:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100a5a:	88 10                	mov    %dl,(%eax)
  100a5c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  100a60:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100a64:	74 0b                	je     100a71 <consoleread+0xe6>
  100a66:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  100a6a:	7f 98                	jg     100a04 <consoleread+0x79>
  100a6c:	eb 04                	jmp    100a72 <consoleread+0xe7>
  100a6e:	90                   	nop
  100a6f:	eb 01                	jmp    100a72 <consoleread+0xe7>
  100a71:	90                   	nop
  100a72:	83 ec 0c             	sub    $0xc,%esp
  100a75:	68 c0 f2 10 00       	push   $0x10f2c0
  100a7a:	e8 30 3f 00 00       	call   1049af <release>
  100a7f:	83 c4 10             	add    $0x10,%esp
  100a82:	83 ec 0c             	sub    $0xc,%esp
  100a85:	ff 75 08             	pushl  0x8(%ebp)
  100a88:	e8 e8 0d 00 00       	call   101875 <ilock>
  100a8d:	83 c4 10             	add    $0x10,%esp
  100a90:	8b 45 10             	mov    0x10(%ebp),%eax
  100a93:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a96:	29 c2                	sub    %eax,%edx
  100a98:	89 d0                	mov    %edx,%eax
  100a9a:	c9                   	leave  
  100a9b:	c3                   	ret    

00100a9c <consolewrite>:
  100a9c:	55                   	push   %ebp
  100a9d:	89 e5                	mov    %esp,%ebp
  100a9f:	83 ec 18             	sub    $0x18,%esp
  100aa2:	83 ec 0c             	sub    $0xc,%esp
  100aa5:	ff 75 08             	pushl  0x8(%ebp)
  100aa8:	e8 3a 0f 00 00       	call   1019e7 <iunlock>
  100aad:	83 c4 10             	add    $0x10,%esp
  100ab0:	83 ec 0c             	sub    $0xc,%esp
  100ab3:	68 e0 ca 10 00       	push   $0x10cae0
  100ab8:	e8 8b 3e 00 00       	call   104948 <acquire>
  100abd:	83 c4 10             	add    $0x10,%esp
  100ac0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100ac7:	eb 21                	jmp    100aea <consolewrite+0x4e>
  100ac9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100acc:	8b 45 0c             	mov    0xc(%ebp),%eax
  100acf:	01 d0                	add    %edx,%eax
  100ad1:	0f b6 00             	movzbl (%eax),%eax
  100ad4:	0f be c0             	movsbl %al,%eax
  100ad7:	0f b6 c0             	movzbl %al,%eax
  100ada:	83 ec 0c             	sub    $0xc,%esp
  100add:	50                   	push   %eax
  100ade:	e8 bf fc ff ff       	call   1007a2 <consputc>
  100ae3:	83 c4 10             	add    $0x10,%esp
  100ae6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aed:	3b 45 10             	cmp    0x10(%ebp),%eax
  100af0:	7c d7                	jl     100ac9 <consolewrite+0x2d>
  100af2:	83 ec 0c             	sub    $0xc,%esp
  100af5:	68 e0 ca 10 00       	push   $0x10cae0
  100afa:	e8 b0 3e 00 00       	call   1049af <release>
  100aff:	83 c4 10             	add    $0x10,%esp
  100b02:	83 ec 0c             	sub    $0xc,%esp
  100b05:	ff 75 08             	pushl  0x8(%ebp)
  100b08:	e8 68 0d 00 00       	call   101875 <ilock>
  100b0d:	83 c4 10             	add    $0x10,%esp
  100b10:	8b 45 10             	mov    0x10(%ebp),%eax
  100b13:	c9                   	leave  
  100b14:	c3                   	ret    

00100b15 <consoleinit>:
  100b15:	55                   	push   %ebp
  100b16:	89 e5                	mov    %esp,%ebp
  100b18:	83 ec 08             	sub    $0x8,%esp
  100b1b:	83 ec 08             	sub    $0x8,%esp
  100b1e:	68 22 8e 10 00       	push   $0x108e22
  100b23:	68 e0 ca 10 00       	push   $0x10cae0
  100b28:	e8 f9 3d 00 00       	call   104926 <initlock>
  100b2d:	83 c4 10             	add    $0x10,%esp
  100b30:	83 ec 08             	sub    $0x8,%esp
  100b33:	68 2a 8e 10 00       	push   $0x108e2a
  100b38:	68 c0 f2 10 00       	push   $0x10f2c0
  100b3d:	e8 e4 3d 00 00       	call   104926 <initlock>
  100b42:	83 c4 10             	add    $0x10,%esp
  100b45:	c7 05 2c fd 10 00 9c 	movl   $0x100a9c,0x10fd2c
  100b4c:	0a 10 00 
  100b4f:	c7 05 28 fd 10 00 8b 	movl   $0x10098b,0x10fd28
  100b56:	09 10 00 
  100b59:	c7 05 14 cb 10 00 01 	movl   $0x1,0x10cb14
  100b60:	00 00 00 
  100b63:	83 ec 0c             	sub    $0xc,%esp
  100b66:	6a 01                	push   $0x1
  100b68:	e8 23 2d 00 00       	call   103890 <picenable>
  100b6d:	83 c4 10             	add    $0x10,%esp
  100b70:	83 ec 08             	sub    $0x8,%esp
  100b73:	6a 00                	push   $0x0
  100b75:	6a 01                	push   $0x1
  100b77:	e8 4d 20 00 00       	call   102bc9 <ioapicenable>
  100b7c:	83 c4 10             	add    $0x10,%esp
  100b7f:	90                   	nop
  100b80:	c9                   	leave  
  100b81:	c3                   	ret    

00100b82 <exec>:
  100b82:	55                   	push   %ebp
  100b83:	89 e5                	mov    %esp,%ebp
  100b85:	81 ec 18 01 00 00    	sub    $0x118,%esp
  100b8b:	83 ec 0c             	sub    $0xc,%esp
  100b8e:	ff 75 08             	pushl  0x8(%ebp)
  100b91:	e8 62 19 00 00       	call   1024f8 <namei>
  100b96:	83 c4 10             	add    $0x10,%esp
  100b99:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100b9c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  100ba0:	75 0a                	jne    100bac <exec+0x2a>
  100ba2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ba7:	e9 a7 03 00 00       	jmp    100f53 <exec+0x3d1>
  100bac:	83 ec 0c             	sub    $0xc,%esp
  100baf:	ff 75 d8             	pushl  -0x28(%ebp)
  100bb2:	e8 be 0c 00 00       	call   101875 <ilock>
  100bb7:	83 c4 10             	add    $0x10,%esp
  100bba:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  100bc1:	6a 34                	push   $0x34
  100bc3:	6a 00                	push   $0x0
  100bc5:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
  100bcb:	50                   	push   %eax
  100bcc:	ff 75 d8             	pushl  -0x28(%ebp)
  100bcf:	e8 1e 12 00 00       	call   101df2 <readi>
  100bd4:	83 c4 10             	add    $0x10,%esp
  100bd7:	83 f8 33             	cmp    $0x33,%eax
  100bda:	0f 86 27 03 00 00    	jbe    100f07 <exec+0x385>
  100be0:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
  100be6:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  100beb:	0f 85 19 03 00 00    	jne    100f0a <exec+0x388>
  100bf1:	e8 0e 6a 00 00       	call   107604 <setupkvm>
  100bf6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100bf9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  100bfd:	0f 84 0a 03 00 00    	je     100f0d <exec+0x38b>
  100c03:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100c0a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100c11:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
  100c17:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100c1a:	e9 ab 00 00 00       	jmp    100cca <exec+0x148>
  100c1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100c22:	6a 20                	push   $0x20
  100c24:	50                   	push   %eax
  100c25:	8d 85 ec fe ff ff    	lea    -0x114(%ebp),%eax
  100c2b:	50                   	push   %eax
  100c2c:	ff 75 d8             	pushl  -0x28(%ebp)
  100c2f:	e8 be 11 00 00       	call   101df2 <readi>
  100c34:	83 c4 10             	add    $0x10,%esp
  100c37:	83 f8 20             	cmp    $0x20,%eax
  100c3a:	0f 85 d0 02 00 00    	jne    100f10 <exec+0x38e>
  100c40:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  100c46:	83 f8 01             	cmp    $0x1,%eax
  100c49:	75 71                	jne    100cbc <exec+0x13a>
  100c4b:	8b 95 00 ff ff ff    	mov    -0x100(%ebp),%edx
  100c51:	8b 85 fc fe ff ff    	mov    -0x104(%ebp),%eax
  100c57:	39 c2                	cmp    %eax,%edx
  100c59:	0f 82 b4 02 00 00    	jb     100f13 <exec+0x391>
  100c5f:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
  100c65:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
  100c6b:	01 d0                	add    %edx,%eax
  100c6d:	83 ec 04             	sub    $0x4,%esp
  100c70:	50                   	push   %eax
  100c71:	ff 75 e0             	pushl  -0x20(%ebp)
  100c74:	ff 75 d4             	pushl  -0x2c(%ebp)
  100c77:	e8 f9 6c 00 00       	call   107975 <allocuvm>
  100c7c:	83 c4 10             	add    $0x10,%esp
  100c7f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100c82:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  100c86:	0f 84 8a 02 00 00    	je     100f16 <exec+0x394>
  100c8c:	8b 95 fc fe ff ff    	mov    -0x104(%ebp),%edx
  100c92:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  100c98:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
  100c9e:	83 ec 0c             	sub    $0xc,%esp
  100ca1:	52                   	push   %edx
  100ca2:	50                   	push   %eax
  100ca3:	ff 75 d8             	pushl  -0x28(%ebp)
  100ca6:	51                   	push   %ecx
  100ca7:	ff 75 d4             	pushl  -0x2c(%ebp)
  100caa:	e8 ff 6b 00 00       	call   1078ae <loaduvm>
  100caf:	83 c4 20             	add    $0x20,%esp
  100cb2:	85 c0                	test   %eax,%eax
  100cb4:	0f 88 5f 02 00 00    	js     100f19 <exec+0x397>
  100cba:	eb 01                	jmp    100cbd <exec+0x13b>
  100cbc:	90                   	nop
  100cbd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100cc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100cc4:	83 c0 20             	add    $0x20,%eax
  100cc7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100cca:	0f b7 85 38 ff ff ff 	movzwl -0xc8(%ebp),%eax
  100cd1:	0f b7 c0             	movzwl %ax,%eax
  100cd4:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  100cd7:	0f 8c 42 ff ff ff    	jl     100c1f <exec+0x9d>
  100cdd:	83 ec 0c             	sub    $0xc,%esp
  100ce0:	ff 75 d8             	pushl  -0x28(%ebp)
  100ce3:	e8 61 0e 00 00       	call   101b49 <iunlockput>
  100ce8:	83 c4 10             	add    $0x10,%esp
  100ceb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  100cf2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100cf5:	05 ff 0f 00 00       	add    $0xfff,%eax
  100cfa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100cff:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100d02:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100d05:	05 00 10 00 00       	add    $0x1000,%eax
  100d0a:	83 ec 04             	sub    $0x4,%esp
  100d0d:	50                   	push   %eax
  100d0e:	ff 75 e0             	pushl  -0x20(%ebp)
  100d11:	ff 75 d4             	pushl  -0x2c(%ebp)
  100d14:	e8 5c 6c 00 00       	call   107975 <allocuvm>
  100d19:	83 c4 10             	add    $0x10,%esp
  100d1c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100d1f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  100d23:	0f 84 f3 01 00 00    	je     100f1c <exec+0x39a>
  100d29:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100d2c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100d2f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100d36:	e9 90 00 00 00       	jmp    100dcb <exec+0x249>
  100d3b:	83 7d e4 1f          	cmpl   $0x1f,-0x1c(%ebp)
  100d3f:	0f 87 da 01 00 00    	ja     100f1f <exec+0x39d>
  100d45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d48:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100d4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d52:	01 d0                	add    %edx,%eax
  100d54:	8b 00                	mov    (%eax),%eax
  100d56:	83 ec 0c             	sub    $0xc,%esp
  100d59:	50                   	push   %eax
  100d5a:	e8 26 40 00 00       	call   104d85 <strlen>
  100d5f:	83 c4 10             	add    $0x10,%esp
  100d62:	83 c0 01             	add    $0x1,%eax
  100d65:	29 45 dc             	sub    %eax,-0x24(%ebp)
  100d68:	83 65 dc fc          	andl   $0xfffffffc,-0x24(%ebp)
  100d6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d6f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100d76:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d79:	01 d0                	add    %edx,%eax
  100d7b:	8b 00                	mov    (%eax),%eax
  100d7d:	83 ec 0c             	sub    $0xc,%esp
  100d80:	50                   	push   %eax
  100d81:	e8 ff 3f 00 00       	call   104d85 <strlen>
  100d86:	83 c4 10             	add    $0x10,%esp
  100d89:	83 c0 01             	add    $0x1,%eax
  100d8c:	89 c1                	mov    %eax,%ecx
  100d8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d91:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100d98:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d9b:	01 d0                	add    %edx,%eax
  100d9d:	8b 00                	mov    (%eax),%eax
  100d9f:	51                   	push   %ecx
  100da0:	50                   	push   %eax
  100da1:	ff 75 dc             	pushl  -0x24(%ebp)
  100da4:	ff 75 d4             	pushl  -0x2c(%ebp)
  100da7:	e8 ee 6e 00 00       	call   107c9a <copyout>
  100dac:	83 c4 10             	add    $0x10,%esp
  100daf:	85 c0                	test   %eax,%eax
  100db1:	0f 88 6b 01 00 00    	js     100f22 <exec+0x3a0>
  100db7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100dba:	8d 50 03             	lea    0x3(%eax),%edx
  100dbd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100dc0:	89 84 95 40 ff ff ff 	mov    %eax,-0xc0(%ebp,%edx,4)
  100dc7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  100dcb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100dce:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100dd5:	8b 45 0c             	mov    0xc(%ebp),%eax
  100dd8:	01 d0                	add    %edx,%eax
  100dda:	8b 00                	mov    (%eax),%eax
  100ddc:	85 c0                	test   %eax,%eax
  100dde:	0f 85 57 ff ff ff    	jne    100d3b <exec+0x1b9>
  100de4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100de7:	83 c0 03             	add    $0x3,%eax
  100dea:	c7 84 85 40 ff ff ff 	movl   $0x0,-0xc0(%ebp,%eax,4)
  100df1:	00 00 00 00 
  100df5:	c7 85 40 ff ff ff ff 	movl   $0xffffffff,-0xc0(%ebp)
  100dfc:	ff ff ff 
  100dff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100e02:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
  100e08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100e0b:	83 c0 01             	add    $0x1,%eax
  100e0e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100e15:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100e18:	29 d0                	sub    %edx,%eax
  100e1a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
  100e20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100e23:	83 c0 04             	add    $0x4,%eax
  100e26:	c1 e0 02             	shl    $0x2,%eax
  100e29:	29 45 dc             	sub    %eax,-0x24(%ebp)
  100e2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100e2f:	83 c0 04             	add    $0x4,%eax
  100e32:	c1 e0 02             	shl    $0x2,%eax
  100e35:	50                   	push   %eax
  100e36:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
  100e3c:	50                   	push   %eax
  100e3d:	ff 75 dc             	pushl  -0x24(%ebp)
  100e40:	ff 75 d4             	pushl  -0x2c(%ebp)
  100e43:	e8 52 6e 00 00       	call   107c9a <copyout>
  100e48:	83 c4 10             	add    $0x10,%esp
  100e4b:	85 c0                	test   %eax,%eax
  100e4d:	0f 88 d2 00 00 00    	js     100f25 <exec+0x3a3>
  100e53:	8b 45 08             	mov    0x8(%ebp),%eax
  100e56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100e59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100e5f:	eb 17                	jmp    100e78 <exec+0x2f6>
  100e61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e64:	0f b6 00             	movzbl (%eax),%eax
  100e67:	3c 2f                	cmp    $0x2f,%al
  100e69:	75 09                	jne    100e74 <exec+0x2f2>
  100e6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e6e:	83 c0 01             	add    $0x1,%eax
  100e71:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100e74:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100e78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e7b:	0f b6 00             	movzbl (%eax),%eax
  100e7e:	84 c0                	test   %al,%al
  100e80:	75 df                	jne    100e61 <exec+0x2df>
  100e82:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100e88:	83 c0 6c             	add    $0x6c,%eax
  100e8b:	83 ec 04             	sub    $0x4,%esp
  100e8e:	6a 10                	push   $0x10
  100e90:	ff 75 f0             	pushl  -0x10(%ebp)
  100e93:	50                   	push   %eax
  100e94:	e8 a2 3e 00 00       	call   104d3b <safestrcpy>
  100e99:	83 c4 10             	add    $0x10,%esp
  100e9c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ea2:	8b 40 04             	mov    0x4(%eax),%eax
  100ea5:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100ea8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100eae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100eb1:	89 50 04             	mov    %edx,0x4(%eax)
  100eb4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100eba:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100ebd:	89 10                	mov    %edx,(%eax)
  100ebf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ec5:	8b 40 18             	mov    0x18(%eax),%eax
  100ec8:	8b 95 24 ff ff ff    	mov    -0xdc(%ebp),%edx
  100ece:	89 50 38             	mov    %edx,0x38(%eax)
  100ed1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ed7:	8b 40 18             	mov    0x18(%eax),%eax
  100eda:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100edd:	89 50 44             	mov    %edx,0x44(%eax)
  100ee0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ee6:	83 ec 0c             	sub    $0xc,%esp
  100ee9:	50                   	push   %eax
  100eea:	e8 ec 67 00 00       	call   1076db <switchuvm>
  100eef:	83 c4 10             	add    $0x10,%esp
  100ef2:	83 ec 0c             	sub    $0xc,%esp
  100ef5:	ff 75 d0             	pushl  -0x30(%ebp)
  100ef8:	e8 cf 6b 00 00       	call   107acc <freevm>
  100efd:	83 c4 10             	add    $0x10,%esp
  100f00:	b8 00 00 00 00       	mov    $0x0,%eax
  100f05:	eb 4c                	jmp    100f53 <exec+0x3d1>
  100f07:	90                   	nop
  100f08:	eb 1c                	jmp    100f26 <exec+0x3a4>
  100f0a:	90                   	nop
  100f0b:	eb 19                	jmp    100f26 <exec+0x3a4>
  100f0d:	90                   	nop
  100f0e:	eb 16                	jmp    100f26 <exec+0x3a4>
  100f10:	90                   	nop
  100f11:	eb 13                	jmp    100f26 <exec+0x3a4>
  100f13:	90                   	nop
  100f14:	eb 10                	jmp    100f26 <exec+0x3a4>
  100f16:	90                   	nop
  100f17:	eb 0d                	jmp    100f26 <exec+0x3a4>
  100f19:	90                   	nop
  100f1a:	eb 0a                	jmp    100f26 <exec+0x3a4>
  100f1c:	90                   	nop
  100f1d:	eb 07                	jmp    100f26 <exec+0x3a4>
  100f1f:	90                   	nop
  100f20:	eb 04                	jmp    100f26 <exec+0x3a4>
  100f22:	90                   	nop
  100f23:	eb 01                	jmp    100f26 <exec+0x3a4>
  100f25:	90                   	nop
  100f26:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  100f2a:	74 0e                	je     100f3a <exec+0x3b8>
  100f2c:	83 ec 0c             	sub    $0xc,%esp
  100f2f:	ff 75 d4             	pushl  -0x2c(%ebp)
  100f32:	e8 95 6b 00 00       	call   107acc <freevm>
  100f37:	83 c4 10             	add    $0x10,%esp
  100f3a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  100f3e:	74 0e                	je     100f4e <exec+0x3cc>
  100f40:	83 ec 0c             	sub    $0xc,%esp
  100f43:	ff 75 d8             	pushl  -0x28(%ebp)
  100f46:	e8 fe 0b 00 00       	call   101b49 <iunlockput>
  100f4b:	83 c4 10             	add    $0x10,%esp
  100f4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f53:	c9                   	leave  
  100f54:	c3                   	ret    

00100f55 <fileinit>:
  100f55:	55                   	push   %ebp
  100f56:	89 e5                	mov    %esp,%ebp
  100f58:	83 ec 08             	sub    $0x8,%esp
  100f5b:	83 ec 08             	sub    $0x8,%esp
  100f5e:	68 30 8e 10 00       	push   $0x108e30
  100f63:	68 80 f3 10 00       	push   $0x10f380
  100f68:	e8 b9 39 00 00       	call   104926 <initlock>
  100f6d:	83 c4 10             	add    $0x10,%esp
  100f70:	90                   	nop
  100f71:	c9                   	leave  
  100f72:	c3                   	ret    

00100f73 <filealloc>:
  100f73:	55                   	push   %ebp
  100f74:	89 e5                	mov    %esp,%ebp
  100f76:	83 ec 18             	sub    $0x18,%esp
  100f79:	83 ec 0c             	sub    $0xc,%esp
  100f7c:	68 80 f3 10 00       	push   $0x10f380
  100f81:	e8 c2 39 00 00       	call   104948 <acquire>
  100f86:	83 c4 10             	add    $0x10,%esp
  100f89:	c7 45 f4 b4 f3 10 00 	movl   $0x10f3b4,-0xc(%ebp)
  100f90:	eb 2d                	jmp    100fbf <filealloc+0x4c>
  100f92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f95:	8b 40 04             	mov    0x4(%eax),%eax
  100f98:	85 c0                	test   %eax,%eax
  100f9a:	75 1f                	jne    100fbb <filealloc+0x48>
  100f9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f9f:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
  100fa6:	83 ec 0c             	sub    $0xc,%esp
  100fa9:	68 80 f3 10 00       	push   $0x10f380
  100fae:	e8 fc 39 00 00       	call   1049af <release>
  100fb3:	83 c4 10             	add    $0x10,%esp
  100fb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fb9:	eb 23                	jmp    100fde <filealloc+0x6b>
  100fbb:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
  100fbf:	b8 14 fd 10 00       	mov    $0x10fd14,%eax
  100fc4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100fc7:	72 c9                	jb     100f92 <filealloc+0x1f>
  100fc9:	83 ec 0c             	sub    $0xc,%esp
  100fcc:	68 80 f3 10 00       	push   $0x10f380
  100fd1:	e8 d9 39 00 00       	call   1049af <release>
  100fd6:	83 c4 10             	add    $0x10,%esp
  100fd9:	b8 00 00 00 00       	mov    $0x0,%eax
  100fde:	c9                   	leave  
  100fdf:	c3                   	ret    

00100fe0 <filedup>:
  100fe0:	55                   	push   %ebp
  100fe1:	89 e5                	mov    %esp,%ebp
  100fe3:	83 ec 08             	sub    $0x8,%esp
  100fe6:	83 ec 0c             	sub    $0xc,%esp
  100fe9:	68 80 f3 10 00       	push   $0x10f380
  100fee:	e8 55 39 00 00       	call   104948 <acquire>
  100ff3:	83 c4 10             	add    $0x10,%esp
  100ff6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ff9:	8b 40 04             	mov    0x4(%eax),%eax
  100ffc:	85 c0                	test   %eax,%eax
  100ffe:	7f 0d                	jg     10100d <filedup+0x2d>
  101000:	83 ec 0c             	sub    $0xc,%esp
  101003:	68 37 8e 10 00       	push   $0x108e37
  101008:	e8 6b f5 ff ff       	call   100578 <panic>
  10100d:	8b 45 08             	mov    0x8(%ebp),%eax
  101010:	8b 40 04             	mov    0x4(%eax),%eax
  101013:	8d 50 01             	lea    0x1(%eax),%edx
  101016:	8b 45 08             	mov    0x8(%ebp),%eax
  101019:	89 50 04             	mov    %edx,0x4(%eax)
  10101c:	83 ec 0c             	sub    $0xc,%esp
  10101f:	68 80 f3 10 00       	push   $0x10f380
  101024:	e8 86 39 00 00       	call   1049af <release>
  101029:	83 c4 10             	add    $0x10,%esp
  10102c:	8b 45 08             	mov    0x8(%ebp),%eax
  10102f:	c9                   	leave  
  101030:	c3                   	ret    

00101031 <fileclose>:
  101031:	55                   	push   %ebp
  101032:	89 e5                	mov    %esp,%ebp
  101034:	83 ec 28             	sub    $0x28,%esp
  101037:	83 ec 0c             	sub    $0xc,%esp
  10103a:	68 80 f3 10 00       	push   $0x10f380
  10103f:	e8 04 39 00 00       	call   104948 <acquire>
  101044:	83 c4 10             	add    $0x10,%esp
  101047:	8b 45 08             	mov    0x8(%ebp),%eax
  10104a:	8b 40 04             	mov    0x4(%eax),%eax
  10104d:	85 c0                	test   %eax,%eax
  10104f:	7f 0d                	jg     10105e <fileclose+0x2d>
  101051:	83 ec 0c             	sub    $0xc,%esp
  101054:	68 3f 8e 10 00       	push   $0x108e3f
  101059:	e8 1a f5 ff ff       	call   100578 <panic>
  10105e:	8b 45 08             	mov    0x8(%ebp),%eax
  101061:	8b 40 04             	mov    0x4(%eax),%eax
  101064:	8d 50 ff             	lea    -0x1(%eax),%edx
  101067:	8b 45 08             	mov    0x8(%ebp),%eax
  10106a:	89 50 04             	mov    %edx,0x4(%eax)
  10106d:	8b 45 08             	mov    0x8(%ebp),%eax
  101070:	8b 40 04             	mov    0x4(%eax),%eax
  101073:	85 c0                	test   %eax,%eax
  101075:	7e 15                	jle    10108c <fileclose+0x5b>
  101077:	83 ec 0c             	sub    $0xc,%esp
  10107a:	68 80 f3 10 00       	push   $0x10f380
  10107f:	e8 2b 39 00 00       	call   1049af <release>
  101084:	83 c4 10             	add    $0x10,%esp
  101087:	e9 81 00 00 00       	jmp    10110d <fileclose+0xdc>
  10108c:	8b 45 08             	mov    0x8(%ebp),%eax
  10108f:	8b 10                	mov    (%eax),%edx
  101091:	89 55 e0             	mov    %edx,-0x20(%ebp)
  101094:	8b 50 04             	mov    0x4(%eax),%edx
  101097:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10109a:	8b 50 08             	mov    0x8(%eax),%edx
  10109d:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1010a0:	8b 50 0c             	mov    0xc(%eax),%edx
  1010a3:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1010a6:	8b 50 10             	mov    0x10(%eax),%edx
  1010a9:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1010ac:	8b 40 14             	mov    0x14(%eax),%eax
  1010af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1010b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  1010bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1010bf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1010c5:	83 ec 0c             	sub    $0xc,%esp
  1010c8:	68 80 f3 10 00       	push   $0x10f380
  1010cd:	e8 dd 38 00 00       	call   1049af <release>
  1010d2:	83 c4 10             	add    $0x10,%esp
  1010d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1010d8:	83 f8 01             	cmp    $0x1,%eax
  1010db:	75 19                	jne    1010f6 <fileclose+0xc5>
  1010dd:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1010e1:	0f be d0             	movsbl %al,%edx
  1010e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1010e7:	83 ec 08             	sub    $0x8,%esp
  1010ea:	52                   	push   %edx
  1010eb:	50                   	push   %eax
  1010ec:	e8 0b 2a 00 00       	call   103afc <pipeclose>
  1010f1:	83 c4 10             	add    $0x10,%esp
  1010f4:	eb 17                	jmp    10110d <fileclose+0xdc>
  1010f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1010f9:	83 f8 02             	cmp    $0x2,%eax
  1010fc:	75 0f                	jne    10110d <fileclose+0xdc>
  1010fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101101:	83 ec 0c             	sub    $0xc,%esp
  101104:	50                   	push   %eax
  101105:	e8 55 6f 00 00       	call   10805f <vfs_iput>
  10110a:	83 c4 10             	add    $0x10,%esp
  10110d:	c9                   	leave  
  10110e:	c3                   	ret    

0010110f <filestat>:
  10110f:	55                   	push   %ebp
  101110:	89 e5                	mov    %esp,%ebp
  101112:	83 ec 08             	sub    $0x8,%esp
  101115:	8b 45 08             	mov    0x8(%ebp),%eax
  101118:	8b 00                	mov    (%eax),%eax
  10111a:	83 f8 02             	cmp    $0x2,%eax
  10111d:	75 40                	jne    10115f <filestat+0x50>
  10111f:	8b 45 08             	mov    0x8(%ebp),%eax
  101122:	8b 40 10             	mov    0x10(%eax),%eax
  101125:	83 ec 0c             	sub    $0xc,%esp
  101128:	50                   	push   %eax
  101129:	e8 14 6f 00 00       	call   108042 <vfs_ilock>
  10112e:	83 c4 10             	add    $0x10,%esp
  101131:	8b 45 08             	mov    0x8(%ebp),%eax
  101134:	8b 40 10             	mov    0x10(%eax),%eax
  101137:	83 ec 08             	sub    $0x8,%esp
  10113a:	ff 75 0c             	pushl  0xc(%ebp)
  10113d:	50                   	push   %eax
  10113e:	e8 1f 6e 00 00       	call   107f62 <vfs_stat>
  101143:	83 c4 10             	add    $0x10,%esp
  101146:	8b 45 08             	mov    0x8(%ebp),%eax
  101149:	8b 40 10             	mov    0x10(%eax),%eax
  10114c:	83 ec 0c             	sub    $0xc,%esp
  10114f:	50                   	push   %eax
  101150:	e8 6f 6f 00 00       	call   1080c4 <vfs_iunlock>
  101155:	83 c4 10             	add    $0x10,%esp
  101158:	b8 00 00 00 00       	mov    $0x0,%eax
  10115d:	eb 05                	jmp    101164 <filestat+0x55>
  10115f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101164:	c9                   	leave  
  101165:	c3                   	ret    

00101166 <fileread>:
  101166:	55                   	push   %ebp
  101167:	89 e5                	mov    %esp,%ebp
  101169:	83 ec 18             	sub    $0x18,%esp
  10116c:	8b 45 08             	mov    0x8(%ebp),%eax
  10116f:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  101173:	84 c0                	test   %al,%al
  101175:	75 0a                	jne    101181 <fileread+0x1b>
  101177:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10117c:	e9 9b 00 00 00       	jmp    10121c <fileread+0xb6>
  101181:	8b 45 08             	mov    0x8(%ebp),%eax
  101184:	8b 00                	mov    (%eax),%eax
  101186:	83 f8 01             	cmp    $0x1,%eax
  101189:	75 1a                	jne    1011a5 <fileread+0x3f>
  10118b:	8b 45 08             	mov    0x8(%ebp),%eax
  10118e:	8b 40 0c             	mov    0xc(%eax),%eax
  101191:	83 ec 04             	sub    $0x4,%esp
  101194:	ff 75 10             	pushl  0x10(%ebp)
  101197:	ff 75 0c             	pushl  0xc(%ebp)
  10119a:	50                   	push   %eax
  10119b:	e8 09 2b 00 00       	call   103ca9 <piperead>
  1011a0:	83 c4 10             	add    $0x10,%esp
  1011a3:	eb 77                	jmp    10121c <fileread+0xb6>
  1011a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1011a8:	8b 00                	mov    (%eax),%eax
  1011aa:	83 f8 02             	cmp    $0x2,%eax
  1011ad:	75 60                	jne    10120f <fileread+0xa9>
  1011af:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b2:	8b 40 10             	mov    0x10(%eax),%eax
  1011b5:	83 ec 0c             	sub    $0xc,%esp
  1011b8:	50                   	push   %eax
  1011b9:	e8 84 6e 00 00       	call   108042 <vfs_ilock>
  1011be:	83 c4 10             	add    $0x10,%esp
  1011c1:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1011c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1011c7:	8b 50 14             	mov    0x14(%eax),%edx
  1011ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1011cd:	8b 40 10             	mov    0x10(%eax),%eax
  1011d0:	51                   	push   %ecx
  1011d1:	52                   	push   %edx
  1011d2:	ff 75 0c             	pushl  0xc(%ebp)
  1011d5:	50                   	push   %eax
  1011d6:	e8 65 6d 00 00       	call   107f40 <vfs_read>
  1011db:	83 c4 10             	add    $0x10,%esp
  1011de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1011e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1011e5:	7e 11                	jle    1011f8 <fileread+0x92>
  1011e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1011ea:	8b 50 14             	mov    0x14(%eax),%edx
  1011ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1011f0:	01 c2                	add    %eax,%edx
  1011f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1011f5:	89 50 14             	mov    %edx,0x14(%eax)
  1011f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1011fb:	8b 40 10             	mov    0x10(%eax),%eax
  1011fe:	83 ec 0c             	sub    $0xc,%esp
  101201:	50                   	push   %eax
  101202:	e8 bd 6e 00 00       	call   1080c4 <vfs_iunlock>
  101207:	83 c4 10             	add    $0x10,%esp
  10120a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10120d:	eb 0d                	jmp    10121c <fileread+0xb6>
  10120f:	83 ec 0c             	sub    $0xc,%esp
  101212:	68 49 8e 10 00       	push   $0x108e49
  101217:	e8 5c f3 ff ff       	call   100578 <panic>
  10121c:	c9                   	leave  
  10121d:	c3                   	ret    

0010121e <filewrite>:
  10121e:	55                   	push   %ebp
  10121f:	89 e5                	mov    %esp,%ebp
  101221:	83 ec 18             	sub    $0x18,%esp
  101224:	8b 45 08             	mov    0x8(%ebp),%eax
  101227:	8b 40 14             	mov    0x14(%eax),%eax
  10122a:	3d 00 10 00 00       	cmp    $0x1000,%eax
  10122f:	75 07                	jne    101238 <filewrite+0x1a>
  101231:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101238:	8b 45 08             	mov    0x8(%ebp),%eax
  10123b:	0f b6 40 09          	movzbl 0x9(%eax),%eax
  10123f:	84 c0                	test   %al,%al
  101241:	75 0a                	jne    10124d <filewrite+0x2f>
  101243:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101248:	e9 9b 00 00 00       	jmp    1012e8 <filewrite+0xca>
  10124d:	8b 45 08             	mov    0x8(%ebp),%eax
  101250:	8b 00                	mov    (%eax),%eax
  101252:	83 f8 01             	cmp    $0x1,%eax
  101255:	75 1a                	jne    101271 <filewrite+0x53>
  101257:	8b 45 08             	mov    0x8(%ebp),%eax
  10125a:	8b 40 0c             	mov    0xc(%eax),%eax
  10125d:	83 ec 04             	sub    $0x4,%esp
  101260:	ff 75 10             	pushl  0x10(%ebp)
  101263:	ff 75 0c             	pushl  0xc(%ebp)
  101266:	50                   	push   %eax
  101267:	e8 3a 29 00 00       	call   103ba6 <pipewrite>
  10126c:	83 c4 10             	add    $0x10,%esp
  10126f:	eb 77                	jmp    1012e8 <filewrite+0xca>
  101271:	8b 45 08             	mov    0x8(%ebp),%eax
  101274:	8b 00                	mov    (%eax),%eax
  101276:	83 f8 02             	cmp    $0x2,%eax
  101279:	75 60                	jne    1012db <filewrite+0xbd>
  10127b:	8b 45 08             	mov    0x8(%ebp),%eax
  10127e:	8b 40 10             	mov    0x10(%eax),%eax
  101281:	83 ec 0c             	sub    $0xc,%esp
  101284:	50                   	push   %eax
  101285:	e8 b8 6d 00 00       	call   108042 <vfs_ilock>
  10128a:	83 c4 10             	add    $0x10,%esp
  10128d:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101290:	8b 45 08             	mov    0x8(%ebp),%eax
  101293:	8b 50 14             	mov    0x14(%eax),%edx
  101296:	8b 45 08             	mov    0x8(%ebp),%eax
  101299:	8b 40 10             	mov    0x10(%eax),%eax
  10129c:	51                   	push   %ecx
  10129d:	52                   	push   %edx
  10129e:	ff 75 0c             	pushl  0xc(%ebp)
  1012a1:	50                   	push   %eax
  1012a2:	e8 77 6c 00 00       	call   107f1e <vfs_write>
  1012a7:	83 c4 10             	add    $0x10,%esp
  1012aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1012ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012b1:	7e 11                	jle    1012c4 <filewrite+0xa6>
  1012b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1012b6:	8b 50 14             	mov    0x14(%eax),%edx
  1012b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1012bc:	01 c2                	add    %eax,%edx
  1012be:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c1:	89 50 14             	mov    %edx,0x14(%eax)
  1012c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c7:	8b 40 10             	mov    0x10(%eax),%eax
  1012ca:	83 ec 0c             	sub    $0xc,%esp
  1012cd:	50                   	push   %eax
  1012ce:	e8 f1 6d 00 00       	call   1080c4 <vfs_iunlock>
  1012d3:	83 c4 10             	add    $0x10,%esp
  1012d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1012d9:	eb 0d                	jmp    1012e8 <filewrite+0xca>
  1012db:	83 ec 0c             	sub    $0xc,%esp
  1012de:	68 52 8e 10 00       	push   $0x108e52
  1012e3:	e8 90 f2 ff ff       	call   100578 <panic>
  1012e8:	c9                   	leave  
  1012e9:	c3                   	ret    

001012ea <readsb>:
  1012ea:	55                   	push   %ebp
  1012eb:	89 e5                	mov    %esp,%ebp
  1012ed:	83 ec 18             	sub    $0x18,%esp
  1012f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1012f3:	83 ec 08             	sub    $0x8,%esp
  1012f6:	6a 01                	push   $0x1
  1012f8:	50                   	push   %eax
  1012f9:	e8 e2 ee ff ff       	call   1001e0 <bread>
  1012fe:	83 c4 10             	add    $0x10,%esp
  101301:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101304:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101307:	83 c0 18             	add    $0x18,%eax
  10130a:	83 ec 04             	sub    $0x4,%esp
  10130d:	6a 0c                	push   $0xc
  10130f:	50                   	push   %eax
  101310:	ff 75 0c             	pushl  0xc(%ebp)
  101313:	e8 df 38 00 00       	call   104bf7 <memmove>
  101318:	83 c4 10             	add    $0x10,%esp
  10131b:	83 ec 0c             	sub    $0xc,%esp
  10131e:	ff 75 f4             	pushl  -0xc(%ebp)
  101321:	e8 32 ef ff ff       	call   100258 <brelse>
  101326:	83 c4 10             	add    $0x10,%esp
  101329:	90                   	nop
  10132a:	c9                   	leave  
  10132b:	c3                   	ret    

0010132c <bzero>:
  10132c:	55                   	push   %ebp
  10132d:	89 e5                	mov    %esp,%ebp
  10132f:	83 ec 18             	sub    $0x18,%esp
  101332:	8b 55 0c             	mov    0xc(%ebp),%edx
  101335:	8b 45 08             	mov    0x8(%ebp),%eax
  101338:	83 ec 08             	sub    $0x8,%esp
  10133b:	52                   	push   %edx
  10133c:	50                   	push   %eax
  10133d:	e8 9e ee ff ff       	call   1001e0 <bread>
  101342:	83 c4 10             	add    $0x10,%esp
  101345:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101348:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10134b:	83 c0 18             	add    $0x18,%eax
  10134e:	83 ec 04             	sub    $0x4,%esp
  101351:	68 00 02 00 00       	push   $0x200
  101356:	6a 00                	push   $0x0
  101358:	50                   	push   %eax
  101359:	e8 27 38 00 00       	call   104b85 <memset>
  10135e:	83 c4 10             	add    $0x10,%esp
  101361:	83 ec 0c             	sub    $0xc,%esp
  101364:	ff 75 f4             	pushl  -0xc(%ebp)
  101367:	e8 ad ee ff ff       	call   100219 <bwrite>
  10136c:	83 c4 10             	add    $0x10,%esp
  10136f:	83 ec 0c             	sub    $0xc,%esp
  101372:	ff 75 f4             	pushl  -0xc(%ebp)
  101375:	e8 de ee ff ff       	call   100258 <brelse>
  10137a:	83 c4 10             	add    $0x10,%esp
  10137d:	90                   	nop
  10137e:	c9                   	leave  
  10137f:	c3                   	ret    

00101380 <balloc>:
  101380:	55                   	push   %ebp
  101381:	89 e5                	mov    %esp,%ebp
  101383:	83 ec 28             	sub    $0x28,%esp
  101386:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  10138d:	8b 45 08             	mov    0x8(%ebp),%eax
  101390:	83 ec 08             	sub    $0x8,%esp
  101393:	8d 55 dc             	lea    -0x24(%ebp),%edx
  101396:	52                   	push   %edx
  101397:	50                   	push   %eax
  101398:	e8 4d ff ff ff       	call   1012ea <readsb>
  10139d:	83 c4 10             	add    $0x10,%esp
  1013a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1013a7:	e9 ec 00 00 00       	jmp    101498 <balloc+0x118>
  1013ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1013af:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  1013b5:	85 c0                	test   %eax,%eax
  1013b7:	0f 48 c2             	cmovs  %edx,%eax
  1013ba:	c1 f8 0c             	sar    $0xc,%eax
  1013bd:	89 c2                	mov    %eax,%edx
  1013bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1013c2:	c1 e8 03             	shr    $0x3,%eax
  1013c5:	01 d0                	add    %edx,%eax
  1013c7:	83 c0 03             	add    $0x3,%eax
  1013ca:	83 ec 08             	sub    $0x8,%esp
  1013cd:	50                   	push   %eax
  1013ce:	ff 75 08             	pushl  0x8(%ebp)
  1013d1:	e8 0a ee ff ff       	call   1001e0 <bread>
  1013d6:	83 c4 10             	add    $0x10,%esp
  1013d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1013dc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1013e3:	e9 8e 00 00 00       	jmp    101476 <balloc+0xf6>
  1013e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013eb:	99                   	cltd   
  1013ec:	c1 ea 1d             	shr    $0x1d,%edx
  1013ef:	01 d0                	add    %edx,%eax
  1013f1:	83 e0 07             	and    $0x7,%eax
  1013f4:	29 d0                	sub    %edx,%eax
  1013f6:	ba 01 00 00 00       	mov    $0x1,%edx
  1013fb:	89 c1                	mov    %eax,%ecx
  1013fd:	d3 e2                	shl    %cl,%edx
  1013ff:	89 d0                	mov    %edx,%eax
  101401:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101404:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101407:	8d 50 07             	lea    0x7(%eax),%edx
  10140a:	85 c0                	test   %eax,%eax
  10140c:	0f 48 c2             	cmovs  %edx,%eax
  10140f:	c1 f8 03             	sar    $0x3,%eax
  101412:	89 c2                	mov    %eax,%edx
  101414:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101417:	0f b6 44 10 18       	movzbl 0x18(%eax,%edx,1),%eax
  10141c:	0f b6 c0             	movzbl %al,%eax
  10141f:	23 45 e8             	and    -0x18(%ebp),%eax
  101422:	85 c0                	test   %eax,%eax
  101424:	75 4c                	jne    101472 <balloc+0xf2>
  101426:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101429:	8d 50 07             	lea    0x7(%eax),%edx
  10142c:	85 c0                	test   %eax,%eax
  10142e:	0f 48 c2             	cmovs  %edx,%eax
  101431:	c1 f8 03             	sar    $0x3,%eax
  101434:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101437:	0f b6 54 02 18       	movzbl 0x18(%edx,%eax,1),%edx
  10143c:	89 d1                	mov    %edx,%ecx
  10143e:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101441:	09 ca                	or     %ecx,%edx
  101443:	89 d1                	mov    %edx,%ecx
  101445:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101448:	88 4c 02 18          	mov    %cl,0x18(%edx,%eax,1)
  10144c:	83 ec 0c             	sub    $0xc,%esp
  10144f:	ff 75 ec             	pushl  -0x14(%ebp)
  101452:	e8 c2 ed ff ff       	call   100219 <bwrite>
  101457:	83 c4 10             	add    $0x10,%esp
  10145a:	83 ec 0c             	sub    $0xc,%esp
  10145d:	ff 75 ec             	pushl  -0x14(%ebp)
  101460:	e8 f3 ed ff ff       	call   100258 <brelse>
  101465:	83 c4 10             	add    $0x10,%esp
  101468:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10146b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10146e:	01 d0                	add    %edx,%eax
  101470:	eb 41                	jmp    1014b3 <balloc+0x133>
  101472:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  101476:	81 7d f0 ff 0f 00 00 	cmpl   $0xfff,-0x10(%ebp)
  10147d:	0f 8e 65 ff ff ff    	jle    1013e8 <balloc+0x68>
  101483:	83 ec 0c             	sub    $0xc,%esp
  101486:	ff 75 ec             	pushl  -0x14(%ebp)
  101489:	e8 ca ed ff ff       	call   100258 <brelse>
  10148e:	83 c4 10             	add    $0x10,%esp
  101491:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  101498:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10149b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10149e:	39 c2                	cmp    %eax,%edx
  1014a0:	0f 87 06 ff ff ff    	ja     1013ac <balloc+0x2c>
  1014a6:	83 ec 0c             	sub    $0xc,%esp
  1014a9:	68 5c 8e 10 00       	push   $0x108e5c
  1014ae:	e8 c5 f0 ff ff       	call   100578 <panic>
  1014b3:	c9                   	leave  
  1014b4:	c3                   	ret    

001014b5 <bfree>:
  1014b5:	55                   	push   %ebp
  1014b6:	89 e5                	mov    %esp,%ebp
  1014b8:	83 ec 28             	sub    $0x28,%esp
  1014bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1014be:	83 ec 08             	sub    $0x8,%esp
  1014c1:	50                   	push   %eax
  1014c2:	ff 75 08             	pushl  0x8(%ebp)
  1014c5:	e8 62 fe ff ff       	call   10132c <bzero>
  1014ca:	83 c4 10             	add    $0x10,%esp
  1014cd:	83 ec 08             	sub    $0x8,%esp
  1014d0:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1014d3:	50                   	push   %eax
  1014d4:	ff 75 08             	pushl  0x8(%ebp)
  1014d7:	e8 0e fe ff ff       	call   1012ea <readsb>
  1014dc:	83 c4 10             	add    $0x10,%esp
  1014df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1014e2:	c1 e8 0c             	shr    $0xc,%eax
  1014e5:	89 c2                	mov    %eax,%edx
  1014e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1014ea:	c1 e8 03             	shr    $0x3,%eax
  1014ed:	01 d0                	add    %edx,%eax
  1014ef:	8d 50 03             	lea    0x3(%eax),%edx
  1014f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1014f5:	83 ec 08             	sub    $0x8,%esp
  1014f8:	52                   	push   %edx
  1014f9:	50                   	push   %eax
  1014fa:	e8 e1 ec ff ff       	call   1001e0 <bread>
  1014ff:	83 c4 10             	add    $0x10,%esp
  101502:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101505:	8b 45 0c             	mov    0xc(%ebp),%eax
  101508:	25 ff 0f 00 00       	and    $0xfff,%eax
  10150d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101513:	99                   	cltd   
  101514:	c1 ea 1d             	shr    $0x1d,%edx
  101517:	01 d0                	add    %edx,%eax
  101519:	83 e0 07             	and    $0x7,%eax
  10151c:	29 d0                	sub    %edx,%eax
  10151e:	ba 01 00 00 00       	mov    $0x1,%edx
  101523:	89 c1                	mov    %eax,%ecx
  101525:	d3 e2                	shl    %cl,%edx
  101527:	89 d0                	mov    %edx,%eax
  101529:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10152c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10152f:	8d 50 07             	lea    0x7(%eax),%edx
  101532:	85 c0                	test   %eax,%eax
  101534:	0f 48 c2             	cmovs  %edx,%eax
  101537:	c1 f8 03             	sar    $0x3,%eax
  10153a:	89 c2                	mov    %eax,%edx
  10153c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10153f:	0f b6 44 10 18       	movzbl 0x18(%eax,%edx,1),%eax
  101544:	0f b6 c0             	movzbl %al,%eax
  101547:	23 45 ec             	and    -0x14(%ebp),%eax
  10154a:	85 c0                	test   %eax,%eax
  10154c:	75 0d                	jne    10155b <bfree+0xa6>
  10154e:	83 ec 0c             	sub    $0xc,%esp
  101551:	68 72 8e 10 00       	push   $0x108e72
  101556:	e8 1d f0 ff ff       	call   100578 <panic>
  10155b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10155e:	8d 50 07             	lea    0x7(%eax),%edx
  101561:	85 c0                	test   %eax,%eax
  101563:	0f 48 c2             	cmovs  %edx,%eax
  101566:	c1 f8 03             	sar    $0x3,%eax
  101569:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10156c:	0f b6 54 02 18       	movzbl 0x18(%edx,%eax,1),%edx
  101571:	89 d1                	mov    %edx,%ecx
  101573:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101576:	f7 d2                	not    %edx
  101578:	21 ca                	and    %ecx,%edx
  10157a:	89 d1                	mov    %edx,%ecx
  10157c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10157f:	88 4c 02 18          	mov    %cl,0x18(%edx,%eax,1)
  101583:	83 ec 0c             	sub    $0xc,%esp
  101586:	ff 75 f4             	pushl  -0xc(%ebp)
  101589:	e8 8b ec ff ff       	call   100219 <bwrite>
  10158e:	83 c4 10             	add    $0x10,%esp
  101591:	83 ec 0c             	sub    $0xc,%esp
  101594:	ff 75 f4             	pushl  -0xc(%ebp)
  101597:	e8 bc ec ff ff       	call   100258 <brelse>
  10159c:	83 c4 10             	add    $0x10,%esp
  10159f:	90                   	nop
  1015a0:	c9                   	leave  
  1015a1:	c3                   	ret    

001015a2 <iinit>:
  1015a2:	55                   	push   %ebp
  1015a3:	89 e5                	mov    %esp,%ebp
  1015a5:	83 ec 08             	sub    $0x8,%esp
  1015a8:	83 ec 08             	sub    $0x8,%esp
  1015ab:	68 85 8e 10 00       	push   $0x108e85
  1015b0:	68 80 fd 10 00       	push   $0x10fd80
  1015b5:	e8 6c 33 00 00       	call   104926 <initlock>
  1015ba:	83 c4 10             	add    $0x10,%esp
  1015bd:	90                   	nop
  1015be:	c9                   	leave  
  1015bf:	c3                   	ret    

001015c0 <ialloc>:
  1015c0:	55                   	push   %ebp
  1015c1:	89 e5                	mov    %esp,%ebp
  1015c3:	83 ec 38             	sub    $0x38,%esp
  1015c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1015c9:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
  1015cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1015d0:	83 ec 08             	sub    $0x8,%esp
  1015d3:	8d 55 e0             	lea    -0x20(%ebp),%edx
  1015d6:	52                   	push   %edx
  1015d7:	50                   	push   %eax
  1015d8:	e8 0d fd ff ff       	call   1012ea <readsb>
  1015dd:	83 c4 10             	add    $0x10,%esp
  1015e0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1015e7:	e9 98 00 00 00       	jmp    101684 <ialloc+0xc4>
  1015ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015ef:	c1 e8 03             	shr    $0x3,%eax
  1015f2:	83 c0 02             	add    $0x2,%eax
  1015f5:	83 ec 08             	sub    $0x8,%esp
  1015f8:	50                   	push   %eax
  1015f9:	ff 75 08             	pushl  0x8(%ebp)
  1015fc:	e8 df eb ff ff       	call   1001e0 <bread>
  101601:	83 c4 10             	add    $0x10,%esp
  101604:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101607:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10160a:	8d 50 18             	lea    0x18(%eax),%edx
  10160d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101610:	83 e0 07             	and    $0x7,%eax
  101613:	c1 e0 06             	shl    $0x6,%eax
  101616:	01 d0                	add    %edx,%eax
  101618:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10161b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10161e:	0f b7 00             	movzwl (%eax),%eax
  101621:	66 85 c0             	test   %ax,%ax
  101624:	75 4c                	jne    101672 <ialloc+0xb2>
  101626:	83 ec 04             	sub    $0x4,%esp
  101629:	6a 40                	push   $0x40
  10162b:	6a 00                	push   $0x0
  10162d:	ff 75 ec             	pushl  -0x14(%ebp)
  101630:	e8 50 35 00 00       	call   104b85 <memset>
  101635:	83 c4 10             	add    $0x10,%esp
  101638:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10163b:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
  10163f:	66 89 10             	mov    %dx,(%eax)
  101642:	83 ec 0c             	sub    $0xc,%esp
  101645:	ff 75 f0             	pushl  -0x10(%ebp)
  101648:	e8 cc eb ff ff       	call   100219 <bwrite>
  10164d:	83 c4 10             	add    $0x10,%esp
  101650:	83 ec 0c             	sub    $0xc,%esp
  101653:	ff 75 f0             	pushl  -0x10(%ebp)
  101656:	e8 fd eb ff ff       	call   100258 <brelse>
  10165b:	83 c4 10             	add    $0x10,%esp
  10165e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101661:	83 ec 08             	sub    $0x8,%esp
  101664:	50                   	push   %eax
  101665:	ff 75 08             	pushl  0x8(%ebp)
  101668:	e8 ef 00 00 00       	call   10175c <iget>
  10166d:	83 c4 10             	add    $0x10,%esp
  101670:	eb 2d                	jmp    10169f <ialloc+0xdf>
  101672:	83 ec 0c             	sub    $0xc,%esp
  101675:	ff 75 f0             	pushl  -0x10(%ebp)
  101678:	e8 db eb ff ff       	call   100258 <brelse>
  10167d:	83 c4 10             	add    $0x10,%esp
  101680:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101684:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101687:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10168a:	39 c2                	cmp    %eax,%edx
  10168c:	0f 87 5a ff ff ff    	ja     1015ec <ialloc+0x2c>
  101692:	83 ec 0c             	sub    $0xc,%esp
  101695:	68 8c 8e 10 00       	push   $0x108e8c
  10169a:	e8 d9 ee ff ff       	call   100578 <panic>
  10169f:	c9                   	leave  
  1016a0:	c3                   	ret    

001016a1 <iupdate>:
  1016a1:	55                   	push   %ebp
  1016a2:	89 e5                	mov    %esp,%ebp
  1016a4:	83 ec 18             	sub    $0x18,%esp
  1016a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1016aa:	8b 40 04             	mov    0x4(%eax),%eax
  1016ad:	c1 e8 03             	shr    $0x3,%eax
  1016b0:	8d 50 02             	lea    0x2(%eax),%edx
  1016b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1016b6:	8b 00                	mov    (%eax),%eax
  1016b8:	83 ec 08             	sub    $0x8,%esp
  1016bb:	52                   	push   %edx
  1016bc:	50                   	push   %eax
  1016bd:	e8 1e eb ff ff       	call   1001e0 <bread>
  1016c2:	83 c4 10             	add    $0x10,%esp
  1016c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1016c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016cb:	8d 50 18             	lea    0x18(%eax),%edx
  1016ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1016d1:	8b 40 04             	mov    0x4(%eax),%eax
  1016d4:	83 e0 07             	and    $0x7,%eax
  1016d7:	c1 e0 06             	shl    $0x6,%eax
  1016da:	01 d0                	add    %edx,%eax
  1016dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1016df:	8b 45 08             	mov    0x8(%ebp),%eax
  1016e2:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  1016e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1016e9:	66 89 10             	mov    %dx,(%eax)
  1016ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1016ef:	0f b7 50 12          	movzwl 0x12(%eax),%edx
  1016f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1016f6:	66 89 50 02          	mov    %dx,0x2(%eax)
  1016fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1016fd:	0f b7 50 14          	movzwl 0x14(%eax),%edx
  101701:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101704:	66 89 50 04          	mov    %dx,0x4(%eax)
  101708:	8b 45 08             	mov    0x8(%ebp),%eax
  10170b:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  10170f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101712:	66 89 50 06          	mov    %dx,0x6(%eax)
  101716:	8b 45 08             	mov    0x8(%ebp),%eax
  101719:	8b 50 18             	mov    0x18(%eax),%edx
  10171c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10171f:	89 50 08             	mov    %edx,0x8(%eax)
  101722:	8b 45 08             	mov    0x8(%ebp),%eax
  101725:	8d 50 1c             	lea    0x1c(%eax),%edx
  101728:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10172b:	83 c0 0c             	add    $0xc,%eax
  10172e:	83 ec 04             	sub    $0x4,%esp
  101731:	6a 34                	push   $0x34
  101733:	52                   	push   %edx
  101734:	50                   	push   %eax
  101735:	e8 bd 34 00 00       	call   104bf7 <memmove>
  10173a:	83 c4 10             	add    $0x10,%esp
  10173d:	83 ec 0c             	sub    $0xc,%esp
  101740:	ff 75 f4             	pushl  -0xc(%ebp)
  101743:	e8 d1 ea ff ff       	call   100219 <bwrite>
  101748:	83 c4 10             	add    $0x10,%esp
  10174b:	83 ec 0c             	sub    $0xc,%esp
  10174e:	ff 75 f4             	pushl  -0xc(%ebp)
  101751:	e8 02 eb ff ff       	call   100258 <brelse>
  101756:	83 c4 10             	add    $0x10,%esp
  101759:	90                   	nop
  10175a:	c9                   	leave  
  10175b:	c3                   	ret    

0010175c <iget>:
  10175c:	55                   	push   %ebp
  10175d:	89 e5                	mov    %esp,%ebp
  10175f:	83 ec 18             	sub    $0x18,%esp
  101762:	83 ec 0c             	sub    $0xc,%esp
  101765:	68 80 fd 10 00       	push   $0x10fd80
  10176a:	e8 d9 31 00 00       	call   104948 <acquire>
  10176f:	83 c4 10             	add    $0x10,%esp
  101772:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101779:	c7 45 f4 b4 fd 10 00 	movl   $0x10fdb4,-0xc(%ebp)
  101780:	eb 5d                	jmp    1017df <iget+0x83>
  101782:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101785:	8b 40 08             	mov    0x8(%eax),%eax
  101788:	85 c0                	test   %eax,%eax
  10178a:	7e 39                	jle    1017c5 <iget+0x69>
  10178c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10178f:	8b 00                	mov    (%eax),%eax
  101791:	39 45 08             	cmp    %eax,0x8(%ebp)
  101794:	75 2f                	jne    1017c5 <iget+0x69>
  101796:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101799:	8b 40 04             	mov    0x4(%eax),%eax
  10179c:	39 45 0c             	cmp    %eax,0xc(%ebp)
  10179f:	75 24                	jne    1017c5 <iget+0x69>
  1017a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017a4:	8b 40 08             	mov    0x8(%eax),%eax
  1017a7:	8d 50 01             	lea    0x1(%eax),%edx
  1017aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017ad:	89 50 08             	mov    %edx,0x8(%eax)
  1017b0:	83 ec 0c             	sub    $0xc,%esp
  1017b3:	68 80 fd 10 00       	push   $0x10fd80
  1017b8:	e8 f2 31 00 00       	call   1049af <release>
  1017bd:	83 c4 10             	add    $0x10,%esp
  1017c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017c3:	eb 74                	jmp    101839 <iget+0xdd>
  1017c5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1017c9:	75 10                	jne    1017db <iget+0x7f>
  1017cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017ce:	8b 40 08             	mov    0x8(%eax),%eax
  1017d1:	85 c0                	test   %eax,%eax
  1017d3:	75 06                	jne    1017db <iget+0x7f>
  1017d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1017db:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
  1017df:	81 7d f4 54 0d 11 00 	cmpl   $0x110d54,-0xc(%ebp)
  1017e6:	72 9a                	jb     101782 <iget+0x26>
  1017e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1017ec:	75 0d                	jne    1017fb <iget+0x9f>
  1017ee:	83 ec 0c             	sub    $0xc,%esp
  1017f1:	68 9e 8e 10 00       	push   $0x108e9e
  1017f6:	e8 7d ed ff ff       	call   100578 <panic>
  1017fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1017fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101801:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101804:	8b 55 08             	mov    0x8(%ebp),%edx
  101807:	89 10                	mov    %edx,(%eax)
  101809:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10180c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10180f:	89 50 04             	mov    %edx,0x4(%eax)
  101812:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101815:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  10181c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10181f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  101826:	83 ec 0c             	sub    $0xc,%esp
  101829:	68 80 fd 10 00       	push   $0x10fd80
  10182e:	e8 7c 31 00 00       	call   1049af <release>
  101833:	83 c4 10             	add    $0x10,%esp
  101836:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101839:	c9                   	leave  
  10183a:	c3                   	ret    

0010183b <idup>:
  10183b:	55                   	push   %ebp
  10183c:	89 e5                	mov    %esp,%ebp
  10183e:	83 ec 08             	sub    $0x8,%esp
  101841:	83 ec 0c             	sub    $0xc,%esp
  101844:	68 80 fd 10 00       	push   $0x10fd80
  101849:	e8 fa 30 00 00       	call   104948 <acquire>
  10184e:	83 c4 10             	add    $0x10,%esp
  101851:	8b 45 08             	mov    0x8(%ebp),%eax
  101854:	8b 40 08             	mov    0x8(%eax),%eax
  101857:	8d 50 01             	lea    0x1(%eax),%edx
  10185a:	8b 45 08             	mov    0x8(%ebp),%eax
  10185d:	89 50 08             	mov    %edx,0x8(%eax)
  101860:	83 ec 0c             	sub    $0xc,%esp
  101863:	68 80 fd 10 00       	push   $0x10fd80
  101868:	e8 42 31 00 00       	call   1049af <release>
  10186d:	83 c4 10             	add    $0x10,%esp
  101870:	8b 45 08             	mov    0x8(%ebp),%eax
  101873:	c9                   	leave  
  101874:	c3                   	ret    

00101875 <ilock>:
  101875:	55                   	push   %ebp
  101876:	89 e5                	mov    %esp,%ebp
  101878:	83 ec 18             	sub    $0x18,%esp
  10187b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10187f:	74 0a                	je     10188b <ilock+0x16>
  101881:	8b 45 08             	mov    0x8(%ebp),%eax
  101884:	8b 40 08             	mov    0x8(%eax),%eax
  101887:	85 c0                	test   %eax,%eax
  101889:	7f 27                	jg     1018b2 <ilock+0x3d>
  10188b:	8b 45 08             	mov    0x8(%ebp),%eax
  10188e:	8b 40 08             	mov    0x8(%eax),%eax
  101891:	83 ec 04             	sub    $0x4,%esp
  101894:	50                   	push   %eax
  101895:	ff 75 08             	pushl  0x8(%ebp)
  101898:	68 b0 8e 10 00       	push   $0x108eb0
  10189d:	e8 4a eb ff ff       	call   1003ec <cprintf>
  1018a2:	83 c4 10             	add    $0x10,%esp
  1018a5:	83 ec 0c             	sub    $0xc,%esp
  1018a8:	68 d5 8e 10 00       	push   $0x108ed5
  1018ad:	e8 c6 ec ff ff       	call   100578 <panic>
  1018b2:	83 ec 0c             	sub    $0xc,%esp
  1018b5:	68 80 fd 10 00       	push   $0x10fd80
  1018ba:	e8 89 30 00 00       	call   104948 <acquire>
  1018bf:	83 c4 10             	add    $0x10,%esp
  1018c2:	eb 13                	jmp    1018d7 <ilock+0x62>
  1018c4:	83 ec 08             	sub    $0x8,%esp
  1018c7:	68 80 fd 10 00       	push   $0x10fd80
  1018cc:	ff 75 08             	pushl  0x8(%ebp)
  1018cf:	e8 7b 2d 00 00       	call   10464f <sleep>
  1018d4:	83 c4 10             	add    $0x10,%esp
  1018d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1018da:	8b 40 0c             	mov    0xc(%eax),%eax
  1018dd:	83 e0 01             	and    $0x1,%eax
  1018e0:	85 c0                	test   %eax,%eax
  1018e2:	75 e0                	jne    1018c4 <ilock+0x4f>
  1018e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1018e7:	8b 40 0c             	mov    0xc(%eax),%eax
  1018ea:	83 c8 01             	or     $0x1,%eax
  1018ed:	89 c2                	mov    %eax,%edx
  1018ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1018f2:	89 50 0c             	mov    %edx,0xc(%eax)
  1018f5:	83 ec 0c             	sub    $0xc,%esp
  1018f8:	68 80 fd 10 00       	push   $0x10fd80
  1018fd:	e8 ad 30 00 00       	call   1049af <release>
  101902:	83 c4 10             	add    $0x10,%esp
  101905:	8b 45 08             	mov    0x8(%ebp),%eax
  101908:	8b 40 0c             	mov    0xc(%eax),%eax
  10190b:	83 e0 02             	and    $0x2,%eax
  10190e:	85 c0                	test   %eax,%eax
  101910:	0f 85 ce 00 00 00    	jne    1019e4 <ilock+0x16f>
  101916:	8b 45 08             	mov    0x8(%ebp),%eax
  101919:	8b 40 04             	mov    0x4(%eax),%eax
  10191c:	c1 e8 03             	shr    $0x3,%eax
  10191f:	8d 50 02             	lea    0x2(%eax),%edx
  101922:	8b 45 08             	mov    0x8(%ebp),%eax
  101925:	8b 00                	mov    (%eax),%eax
  101927:	83 ec 08             	sub    $0x8,%esp
  10192a:	52                   	push   %edx
  10192b:	50                   	push   %eax
  10192c:	e8 af e8 ff ff       	call   1001e0 <bread>
  101931:	83 c4 10             	add    $0x10,%esp
  101934:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101937:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10193a:	8d 50 18             	lea    0x18(%eax),%edx
  10193d:	8b 45 08             	mov    0x8(%ebp),%eax
  101940:	8b 40 04             	mov    0x4(%eax),%eax
  101943:	83 e0 07             	and    $0x7,%eax
  101946:	c1 e0 06             	shl    $0x6,%eax
  101949:	01 d0                	add    %edx,%eax
  10194b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10194e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101951:	0f b7 10             	movzwl (%eax),%edx
  101954:	8b 45 08             	mov    0x8(%ebp),%eax
  101957:	66 89 50 10          	mov    %dx,0x10(%eax)
  10195b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10195e:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  101962:	8b 45 08             	mov    0x8(%ebp),%eax
  101965:	66 89 50 12          	mov    %dx,0x12(%eax)
  101969:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10196c:	0f b7 50 04          	movzwl 0x4(%eax),%edx
  101970:	8b 45 08             	mov    0x8(%ebp),%eax
  101973:	66 89 50 14          	mov    %dx,0x14(%eax)
  101977:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10197a:	0f b7 50 06          	movzwl 0x6(%eax),%edx
  10197e:	8b 45 08             	mov    0x8(%ebp),%eax
  101981:	66 89 50 16          	mov    %dx,0x16(%eax)
  101985:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101988:	8b 50 08             	mov    0x8(%eax),%edx
  10198b:	8b 45 08             	mov    0x8(%ebp),%eax
  10198e:	89 50 18             	mov    %edx,0x18(%eax)
  101991:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101994:	8d 50 0c             	lea    0xc(%eax),%edx
  101997:	8b 45 08             	mov    0x8(%ebp),%eax
  10199a:	83 c0 1c             	add    $0x1c,%eax
  10199d:	83 ec 04             	sub    $0x4,%esp
  1019a0:	6a 34                	push   $0x34
  1019a2:	52                   	push   %edx
  1019a3:	50                   	push   %eax
  1019a4:	e8 4e 32 00 00       	call   104bf7 <memmove>
  1019a9:	83 c4 10             	add    $0x10,%esp
  1019ac:	83 ec 0c             	sub    $0xc,%esp
  1019af:	ff 75 f4             	pushl  -0xc(%ebp)
  1019b2:	e8 a1 e8 ff ff       	call   100258 <brelse>
  1019b7:	83 c4 10             	add    $0x10,%esp
  1019ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bd:	8b 40 0c             	mov    0xc(%eax),%eax
  1019c0:	83 c8 02             	or     $0x2,%eax
  1019c3:	89 c2                	mov    %eax,%edx
  1019c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019c8:	89 50 0c             	mov    %edx,0xc(%eax)
  1019cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ce:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1019d2:	66 85 c0             	test   %ax,%ax
  1019d5:	75 0d                	jne    1019e4 <ilock+0x16f>
  1019d7:	83 ec 0c             	sub    $0xc,%esp
  1019da:	68 db 8e 10 00       	push   $0x108edb
  1019df:	e8 94 eb ff ff       	call   100578 <panic>
  1019e4:	90                   	nop
  1019e5:	c9                   	leave  
  1019e6:	c3                   	ret    

001019e7 <iunlock>:
  1019e7:	55                   	push   %ebp
  1019e8:	89 e5                	mov    %esp,%ebp
  1019ea:	83 ec 08             	sub    $0x8,%esp
  1019ed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1019f1:	74 17                	je     101a0a <iunlock+0x23>
  1019f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f6:	8b 40 0c             	mov    0xc(%eax),%eax
  1019f9:	83 e0 01             	and    $0x1,%eax
  1019fc:	85 c0                	test   %eax,%eax
  1019fe:	74 0a                	je     101a0a <iunlock+0x23>
  101a00:	8b 45 08             	mov    0x8(%ebp),%eax
  101a03:	8b 40 08             	mov    0x8(%eax),%eax
  101a06:	85 c0                	test   %eax,%eax
  101a08:	7f 0d                	jg     101a17 <iunlock+0x30>
  101a0a:	83 ec 0c             	sub    $0xc,%esp
  101a0d:	68 ea 8e 10 00       	push   $0x108eea
  101a12:	e8 61 eb ff ff       	call   100578 <panic>
  101a17:	83 ec 0c             	sub    $0xc,%esp
  101a1a:	68 80 fd 10 00       	push   $0x10fd80
  101a1f:	e8 24 2f 00 00       	call   104948 <acquire>
  101a24:	83 c4 10             	add    $0x10,%esp
  101a27:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2a:	8b 40 0c             	mov    0xc(%eax),%eax
  101a2d:	83 e0 fe             	and    $0xfffffffe,%eax
  101a30:	89 c2                	mov    %eax,%edx
  101a32:	8b 45 08             	mov    0x8(%ebp),%eax
  101a35:	89 50 0c             	mov    %edx,0xc(%eax)
  101a38:	83 ec 0c             	sub    $0xc,%esp
  101a3b:	ff 75 08             	pushl  0x8(%ebp)
  101a3e:	e8 f7 2c 00 00       	call   10473a <wakeup>
  101a43:	83 c4 10             	add    $0x10,%esp
  101a46:	83 ec 0c             	sub    $0xc,%esp
  101a49:	68 80 fd 10 00       	push   $0x10fd80
  101a4e:	e8 5c 2f 00 00       	call   1049af <release>
  101a53:	83 c4 10             	add    $0x10,%esp
  101a56:	90                   	nop
  101a57:	c9                   	leave  
  101a58:	c3                   	ret    

00101a59 <iput>:
  101a59:	55                   	push   %ebp
  101a5a:	89 e5                	mov    %esp,%ebp
  101a5c:	83 ec 08             	sub    $0x8,%esp
  101a5f:	83 ec 0c             	sub    $0xc,%esp
  101a62:	68 80 fd 10 00       	push   $0x10fd80
  101a67:	e8 dc 2e 00 00       	call   104948 <acquire>
  101a6c:	83 c4 10             	add    $0x10,%esp
  101a6f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a72:	8b 40 08             	mov    0x8(%eax),%eax
  101a75:	83 f8 01             	cmp    $0x1,%eax
  101a78:	0f 85 a9 00 00 00    	jne    101b27 <iput+0xce>
  101a7e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a81:	8b 40 0c             	mov    0xc(%eax),%eax
  101a84:	83 e0 02             	and    $0x2,%eax
  101a87:	85 c0                	test   %eax,%eax
  101a89:	0f 84 98 00 00 00    	je     101b27 <iput+0xce>
  101a8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a92:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  101a96:	66 85 c0             	test   %ax,%ax
  101a99:	0f 85 88 00 00 00    	jne    101b27 <iput+0xce>
  101a9f:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa2:	8b 40 0c             	mov    0xc(%eax),%eax
  101aa5:	83 e0 01             	and    $0x1,%eax
  101aa8:	85 c0                	test   %eax,%eax
  101aaa:	74 0d                	je     101ab9 <iput+0x60>
  101aac:	83 ec 0c             	sub    $0xc,%esp
  101aaf:	68 f2 8e 10 00       	push   $0x108ef2
  101ab4:	e8 bf ea ff ff       	call   100578 <panic>
  101ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  101abc:	8b 40 0c             	mov    0xc(%eax),%eax
  101abf:	83 c8 01             	or     $0x1,%eax
  101ac2:	89 c2                	mov    %eax,%edx
  101ac4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac7:	89 50 0c             	mov    %edx,0xc(%eax)
  101aca:	83 ec 0c             	sub    $0xc,%esp
  101acd:	68 80 fd 10 00       	push   $0x10fd80
  101ad2:	e8 d8 2e 00 00       	call   1049af <release>
  101ad7:	83 c4 10             	add    $0x10,%esp
  101ada:	83 ec 0c             	sub    $0xc,%esp
  101add:	ff 75 08             	pushl  0x8(%ebp)
  101ae0:	e8 a3 01 00 00       	call   101c88 <itrunc>
  101ae5:	83 c4 10             	add    $0x10,%esp
  101ae8:	8b 45 08             	mov    0x8(%ebp),%eax
  101aeb:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
  101af1:	83 ec 0c             	sub    $0xc,%esp
  101af4:	ff 75 08             	pushl  0x8(%ebp)
  101af7:	e8 a5 fb ff ff       	call   1016a1 <iupdate>
  101afc:	83 c4 10             	add    $0x10,%esp
  101aff:	83 ec 0c             	sub    $0xc,%esp
  101b02:	68 80 fd 10 00       	push   $0x10fd80
  101b07:	e8 3c 2e 00 00       	call   104948 <acquire>
  101b0c:	83 c4 10             	add    $0x10,%esp
  101b0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b12:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  101b19:	83 ec 0c             	sub    $0xc,%esp
  101b1c:	ff 75 08             	pushl  0x8(%ebp)
  101b1f:	e8 16 2c 00 00       	call   10473a <wakeup>
  101b24:	83 c4 10             	add    $0x10,%esp
  101b27:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2a:	8b 40 08             	mov    0x8(%eax),%eax
  101b2d:	8d 50 ff             	lea    -0x1(%eax),%edx
  101b30:	8b 45 08             	mov    0x8(%ebp),%eax
  101b33:	89 50 08             	mov    %edx,0x8(%eax)
  101b36:	83 ec 0c             	sub    $0xc,%esp
  101b39:	68 80 fd 10 00       	push   $0x10fd80
  101b3e:	e8 6c 2e 00 00       	call   1049af <release>
  101b43:	83 c4 10             	add    $0x10,%esp
  101b46:	90                   	nop
  101b47:	c9                   	leave  
  101b48:	c3                   	ret    

00101b49 <iunlockput>:
  101b49:	55                   	push   %ebp
  101b4a:	89 e5                	mov    %esp,%ebp
  101b4c:	83 ec 08             	sub    $0x8,%esp
  101b4f:	83 ec 0c             	sub    $0xc,%esp
  101b52:	ff 75 08             	pushl  0x8(%ebp)
  101b55:	e8 8d fe ff ff       	call   1019e7 <iunlock>
  101b5a:	83 c4 10             	add    $0x10,%esp
  101b5d:	83 ec 0c             	sub    $0xc,%esp
  101b60:	ff 75 08             	pushl  0x8(%ebp)
  101b63:	e8 f1 fe ff ff       	call   101a59 <iput>
  101b68:	83 c4 10             	add    $0x10,%esp
  101b6b:	90                   	nop
  101b6c:	c9                   	leave  
  101b6d:	c3                   	ret    

00101b6e <bmap>:
  101b6e:	55                   	push   %ebp
  101b6f:	89 e5                	mov    %esp,%ebp
  101b71:	83 ec 18             	sub    $0x18,%esp
  101b74:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
  101b78:	77 42                	ja     101bbc <bmap+0x4e>
  101b7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101b80:	83 c2 04             	add    $0x4,%edx
  101b83:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  101b87:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101b8a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101b8e:	75 24                	jne    101bb4 <bmap+0x46>
  101b90:	8b 45 08             	mov    0x8(%ebp),%eax
  101b93:	8b 00                	mov    (%eax),%eax
  101b95:	83 ec 0c             	sub    $0xc,%esp
  101b98:	50                   	push   %eax
  101b99:	e8 e2 f7 ff ff       	call   101380 <balloc>
  101b9e:	83 c4 10             	add    $0x10,%esp
  101ba1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101ba4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba7:	8b 55 0c             	mov    0xc(%ebp),%edx
  101baa:	8d 4a 04             	lea    0x4(%edx),%ecx
  101bad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101bb0:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
  101bb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bb7:	e9 ca 00 00 00       	jmp    101c86 <bmap+0x118>
  101bbc:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)
  101bc0:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
  101bc4:	0f 87 af 00 00 00    	ja     101c79 <bmap+0x10b>
  101bca:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcd:	8b 40 4c             	mov    0x4c(%eax),%eax
  101bd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101bd3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101bd7:	75 1d                	jne    101bf6 <bmap+0x88>
  101bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdc:	8b 00                	mov    (%eax),%eax
  101bde:	83 ec 0c             	sub    $0xc,%esp
  101be1:	50                   	push   %eax
  101be2:	e8 99 f7 ff ff       	call   101380 <balloc>
  101be7:	83 c4 10             	add    $0x10,%esp
  101bea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101bed:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101bf3:	89 50 4c             	mov    %edx,0x4c(%eax)
  101bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf9:	8b 00                	mov    (%eax),%eax
  101bfb:	83 ec 08             	sub    $0x8,%esp
  101bfe:	ff 75 f4             	pushl  -0xc(%ebp)
  101c01:	50                   	push   %eax
  101c02:	e8 d9 e5 ff ff       	call   1001e0 <bread>
  101c07:	83 c4 10             	add    $0x10,%esp
  101c0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101c0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c10:	83 c0 18             	add    $0x18,%eax
  101c13:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101c16:	8b 45 0c             	mov    0xc(%ebp),%eax
  101c19:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101c20:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101c23:	01 d0                	add    %edx,%eax
  101c25:	8b 00                	mov    (%eax),%eax
  101c27:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101c2a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101c2e:	75 36                	jne    101c66 <bmap+0xf8>
  101c30:	8b 45 08             	mov    0x8(%ebp),%eax
  101c33:	8b 00                	mov    (%eax),%eax
  101c35:	83 ec 0c             	sub    $0xc,%esp
  101c38:	50                   	push   %eax
  101c39:	e8 42 f7 ff ff       	call   101380 <balloc>
  101c3e:	83 c4 10             	add    $0x10,%esp
  101c41:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101c44:	8b 45 0c             	mov    0xc(%ebp),%eax
  101c47:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101c4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101c51:	01 c2                	add    %eax,%edx
  101c53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c56:	89 02                	mov    %eax,(%edx)
  101c58:	83 ec 0c             	sub    $0xc,%esp
  101c5b:	ff 75 f0             	pushl  -0x10(%ebp)
  101c5e:	e8 b6 e5 ff ff       	call   100219 <bwrite>
  101c63:	83 c4 10             	add    $0x10,%esp
  101c66:	83 ec 0c             	sub    $0xc,%esp
  101c69:	ff 75 f0             	pushl  -0x10(%ebp)
  101c6c:	e8 e7 e5 ff ff       	call   100258 <brelse>
  101c71:	83 c4 10             	add    $0x10,%esp
  101c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c77:	eb 0d                	jmp    101c86 <bmap+0x118>
  101c79:	83 ec 0c             	sub    $0xc,%esp
  101c7c:	68 fc 8e 10 00       	push   $0x108efc
  101c81:	e8 f2 e8 ff ff       	call   100578 <panic>
  101c86:	c9                   	leave  
  101c87:	c3                   	ret    

00101c88 <itrunc>:
  101c88:	55                   	push   %ebp
  101c89:	89 e5                	mov    %esp,%ebp
  101c8b:	83 ec 18             	sub    $0x18,%esp
  101c8e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101c95:	eb 45                	jmp    101cdc <itrunc+0x54>
  101c97:	8b 45 08             	mov    0x8(%ebp),%eax
  101c9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101c9d:	83 c2 04             	add    $0x4,%edx
  101ca0:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  101ca4:	85 c0                	test   %eax,%eax
  101ca6:	74 30                	je     101cd8 <itrunc+0x50>
  101ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  101cab:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101cae:	83 c2 04             	add    $0x4,%edx
  101cb1:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  101cb5:	8b 55 08             	mov    0x8(%ebp),%edx
  101cb8:	8b 12                	mov    (%edx),%edx
  101cba:	83 ec 08             	sub    $0x8,%esp
  101cbd:	50                   	push   %eax
  101cbe:	52                   	push   %edx
  101cbf:	e8 f1 f7 ff ff       	call   1014b5 <bfree>
  101cc4:	83 c4 10             	add    $0x10,%esp
  101cc7:	8b 45 08             	mov    0x8(%ebp),%eax
  101cca:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101ccd:	83 c2 04             	add    $0x4,%edx
  101cd0:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
  101cd7:	00 
  101cd8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101cdc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
  101ce0:	7e b5                	jle    101c97 <itrunc+0xf>
  101ce2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce5:	8b 40 4c             	mov    0x4c(%eax),%eax
  101ce8:	85 c0                	test   %eax,%eax
  101cea:	0f 84 a1 00 00 00    	je     101d91 <itrunc+0x109>
  101cf0:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf3:	8b 50 4c             	mov    0x4c(%eax),%edx
  101cf6:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf9:	8b 00                	mov    (%eax),%eax
  101cfb:	83 ec 08             	sub    $0x8,%esp
  101cfe:	52                   	push   %edx
  101cff:	50                   	push   %eax
  101d00:	e8 db e4 ff ff       	call   1001e0 <bread>
  101d05:	83 c4 10             	add    $0x10,%esp
  101d08:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101d0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101d0e:	83 c0 18             	add    $0x18,%eax
  101d11:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101d14:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101d1b:	eb 3c                	jmp    101d59 <itrunc+0xd1>
  101d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101d20:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101d27:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101d2a:	01 d0                	add    %edx,%eax
  101d2c:	8b 00                	mov    (%eax),%eax
  101d2e:	85 c0                	test   %eax,%eax
  101d30:	74 23                	je     101d55 <itrunc+0xcd>
  101d32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101d35:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101d3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101d3f:	01 d0                	add    %edx,%eax
  101d41:	8b 00                	mov    (%eax),%eax
  101d43:	8b 55 08             	mov    0x8(%ebp),%edx
  101d46:	8b 12                	mov    (%edx),%edx
  101d48:	83 ec 08             	sub    $0x8,%esp
  101d4b:	50                   	push   %eax
  101d4c:	52                   	push   %edx
  101d4d:	e8 63 f7 ff ff       	call   1014b5 <bfree>
  101d52:	83 c4 10             	add    $0x10,%esp
  101d55:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  101d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101d5c:	83 f8 7f             	cmp    $0x7f,%eax
  101d5f:	76 bc                	jbe    101d1d <itrunc+0x95>
  101d61:	83 ec 0c             	sub    $0xc,%esp
  101d64:	ff 75 ec             	pushl  -0x14(%ebp)
  101d67:	e8 ec e4 ff ff       	call   100258 <brelse>
  101d6c:	83 c4 10             	add    $0x10,%esp
  101d6f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d72:	8b 40 4c             	mov    0x4c(%eax),%eax
  101d75:	8b 55 08             	mov    0x8(%ebp),%edx
  101d78:	8b 12                	mov    (%edx),%edx
  101d7a:	83 ec 08             	sub    $0x8,%esp
  101d7d:	50                   	push   %eax
  101d7e:	52                   	push   %edx
  101d7f:	e8 31 f7 ff ff       	call   1014b5 <bfree>
  101d84:	83 c4 10             	add    $0x10,%esp
  101d87:	8b 45 08             	mov    0x8(%ebp),%eax
  101d8a:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  101d91:	8b 45 08             	mov    0x8(%ebp),%eax
  101d94:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  101d9b:	83 ec 0c             	sub    $0xc,%esp
  101d9e:	ff 75 08             	pushl  0x8(%ebp)
  101da1:	e8 fb f8 ff ff       	call   1016a1 <iupdate>
  101da6:	83 c4 10             	add    $0x10,%esp
  101da9:	90                   	nop
  101daa:	c9                   	leave  
  101dab:	c3                   	ret    

00101dac <stati>:
  101dac:	55                   	push   %ebp
  101dad:	89 e5                	mov    %esp,%ebp
  101daf:	8b 45 08             	mov    0x8(%ebp),%eax
  101db2:	8b 00                	mov    (%eax),%eax
  101db4:	89 c2                	mov    %eax,%edx
  101db6:	8b 45 0c             	mov    0xc(%ebp),%eax
  101db9:	89 50 04             	mov    %edx,0x4(%eax)
  101dbc:	8b 45 08             	mov    0x8(%ebp),%eax
  101dbf:	8b 50 04             	mov    0x4(%eax),%edx
  101dc2:	8b 45 0c             	mov    0xc(%ebp),%eax
  101dc5:	89 50 08             	mov    %edx,0x8(%eax)
  101dc8:	8b 45 08             	mov    0x8(%ebp),%eax
  101dcb:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  101dcf:	8b 45 0c             	mov    0xc(%ebp),%eax
  101dd2:	66 89 10             	mov    %dx,(%eax)
  101dd5:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd8:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  101ddc:	8b 45 0c             	mov    0xc(%ebp),%eax
  101ddf:	66 89 50 0c          	mov    %dx,0xc(%eax)
  101de3:	8b 45 08             	mov    0x8(%ebp),%eax
  101de6:	8b 50 18             	mov    0x18(%eax),%edx
  101de9:	8b 45 0c             	mov    0xc(%ebp),%eax
  101dec:	89 50 10             	mov    %edx,0x10(%eax)
  101def:	90                   	nop
  101df0:	5d                   	pop    %ebp
  101df1:	c3                   	ret    

00101df2 <readi>:
  101df2:	55                   	push   %ebp
  101df3:	89 e5                	mov    %esp,%ebp
  101df5:	83 ec 18             	sub    $0x18,%esp
  101df8:	8b 45 08             	mov    0x8(%ebp),%eax
  101dfb:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  101dff:	66 83 f8 03          	cmp    $0x3,%ax
  101e03:	75 5c                	jne    101e61 <readi+0x6f>
  101e05:	8b 45 08             	mov    0x8(%ebp),%eax
  101e08:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101e0c:	66 85 c0             	test   %ax,%ax
  101e0f:	78 20                	js     101e31 <readi+0x3f>
  101e11:	8b 45 08             	mov    0x8(%ebp),%eax
  101e14:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101e18:	66 83 f8 09          	cmp    $0x9,%ax
  101e1c:	7f 13                	jg     101e31 <readi+0x3f>
  101e1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e21:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101e25:	98                   	cwtl   
  101e26:	8b 04 c5 20 fd 10 00 	mov    0x10fd20(,%eax,8),%eax
  101e2d:	85 c0                	test   %eax,%eax
  101e2f:	75 0a                	jne    101e3b <readi+0x49>
  101e31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101e36:	e9 0c 01 00 00       	jmp    101f47 <readi+0x155>
  101e3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3e:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101e42:	98                   	cwtl   
  101e43:	8b 04 c5 20 fd 10 00 	mov    0x10fd20(,%eax,8),%eax
  101e4a:	8b 55 14             	mov    0x14(%ebp),%edx
  101e4d:	83 ec 04             	sub    $0x4,%esp
  101e50:	52                   	push   %edx
  101e51:	ff 75 0c             	pushl  0xc(%ebp)
  101e54:	ff 75 08             	pushl  0x8(%ebp)
  101e57:	ff d0                	call   *%eax
  101e59:	83 c4 10             	add    $0x10,%esp
  101e5c:	e9 e6 00 00 00       	jmp    101f47 <readi+0x155>
  101e61:	8b 45 08             	mov    0x8(%ebp),%eax
  101e64:	8b 40 18             	mov    0x18(%eax),%eax
  101e67:	39 45 10             	cmp    %eax,0x10(%ebp)
  101e6a:	77 0d                	ja     101e79 <readi+0x87>
  101e6c:	8b 55 10             	mov    0x10(%ebp),%edx
  101e6f:	8b 45 14             	mov    0x14(%ebp),%eax
  101e72:	01 d0                	add    %edx,%eax
  101e74:	39 45 10             	cmp    %eax,0x10(%ebp)
  101e77:	76 0a                	jbe    101e83 <readi+0x91>
  101e79:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101e7e:	e9 c4 00 00 00       	jmp    101f47 <readi+0x155>
  101e83:	8b 55 10             	mov    0x10(%ebp),%edx
  101e86:	8b 45 14             	mov    0x14(%ebp),%eax
  101e89:	01 c2                	add    %eax,%edx
  101e8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e8e:	8b 40 18             	mov    0x18(%eax),%eax
  101e91:	39 c2                	cmp    %eax,%edx
  101e93:	76 0c                	jbe    101ea1 <readi+0xaf>
  101e95:	8b 45 08             	mov    0x8(%ebp),%eax
  101e98:	8b 40 18             	mov    0x18(%eax),%eax
  101e9b:	2b 45 10             	sub    0x10(%ebp),%eax
  101e9e:	89 45 14             	mov    %eax,0x14(%ebp)
  101ea1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ea8:	e9 8b 00 00 00       	jmp    101f38 <readi+0x146>
  101ead:	8b 45 10             	mov    0x10(%ebp),%eax
  101eb0:	c1 e8 09             	shr    $0x9,%eax
  101eb3:	83 ec 08             	sub    $0x8,%esp
  101eb6:	50                   	push   %eax
  101eb7:	ff 75 08             	pushl  0x8(%ebp)
  101eba:	e8 af fc ff ff       	call   101b6e <bmap>
  101ebf:	83 c4 10             	add    $0x10,%esp
  101ec2:	89 c2                	mov    %eax,%edx
  101ec4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec7:	8b 00                	mov    (%eax),%eax
  101ec9:	83 ec 08             	sub    $0x8,%esp
  101ecc:	52                   	push   %edx
  101ecd:	50                   	push   %eax
  101ece:	e8 0d e3 ff ff       	call   1001e0 <bread>
  101ed3:	83 c4 10             	add    $0x10,%esp
  101ed6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101ed9:	8b 45 10             	mov    0x10(%ebp),%eax
  101edc:	25 ff 01 00 00       	and    $0x1ff,%eax
  101ee1:	ba 00 02 00 00       	mov    $0x200,%edx
  101ee6:	29 c2                	sub    %eax,%edx
  101ee8:	8b 45 14             	mov    0x14(%ebp),%eax
  101eeb:	2b 45 f4             	sub    -0xc(%ebp),%eax
  101eee:	39 c2                	cmp    %eax,%edx
  101ef0:	0f 46 c2             	cmovbe %edx,%eax
  101ef3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101ef6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ef9:	8d 50 18             	lea    0x18(%eax),%edx
  101efc:	8b 45 10             	mov    0x10(%ebp),%eax
  101eff:	25 ff 01 00 00       	and    $0x1ff,%eax
  101f04:	01 d0                	add    %edx,%eax
  101f06:	83 ec 04             	sub    $0x4,%esp
  101f09:	ff 75 ec             	pushl  -0x14(%ebp)
  101f0c:	50                   	push   %eax
  101f0d:	ff 75 0c             	pushl  0xc(%ebp)
  101f10:	e8 e2 2c 00 00       	call   104bf7 <memmove>
  101f15:	83 c4 10             	add    $0x10,%esp
  101f18:	83 ec 0c             	sub    $0xc,%esp
  101f1b:	ff 75 f0             	pushl  -0x10(%ebp)
  101f1e:	e8 35 e3 ff ff       	call   100258 <brelse>
  101f23:	83 c4 10             	add    $0x10,%esp
  101f26:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101f29:	01 45 f4             	add    %eax,-0xc(%ebp)
  101f2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101f2f:	01 45 10             	add    %eax,0x10(%ebp)
  101f32:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101f35:	01 45 0c             	add    %eax,0xc(%ebp)
  101f38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f3b:	3b 45 14             	cmp    0x14(%ebp),%eax
  101f3e:	0f 82 69 ff ff ff    	jb     101ead <readi+0xbb>
  101f44:	8b 45 14             	mov    0x14(%ebp),%eax
  101f47:	c9                   	leave  
  101f48:	c3                   	ret    

00101f49 <writei>:
  101f49:	55                   	push   %ebp
  101f4a:	89 e5                	mov    %esp,%ebp
  101f4c:	83 ec 18             	sub    $0x18,%esp
  101f4f:	8b 45 08             	mov    0x8(%ebp),%eax
  101f52:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  101f56:	66 83 f8 03          	cmp    $0x3,%ax
  101f5a:	75 5c                	jne    101fb8 <writei+0x6f>
  101f5c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f5f:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101f63:	66 85 c0             	test   %ax,%ax
  101f66:	78 20                	js     101f88 <writei+0x3f>
  101f68:	8b 45 08             	mov    0x8(%ebp),%eax
  101f6b:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101f6f:	66 83 f8 09          	cmp    $0x9,%ax
  101f73:	7f 13                	jg     101f88 <writei+0x3f>
  101f75:	8b 45 08             	mov    0x8(%ebp),%eax
  101f78:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101f7c:	98                   	cwtl   
  101f7d:	8b 04 c5 24 fd 10 00 	mov    0x10fd24(,%eax,8),%eax
  101f84:	85 c0                	test   %eax,%eax
  101f86:	75 0a                	jne    101f92 <writei+0x49>
  101f88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101f8d:	e9 3e 01 00 00       	jmp    1020d0 <writei+0x187>
  101f92:	8b 45 08             	mov    0x8(%ebp),%eax
  101f95:	0f b7 40 12          	movzwl 0x12(%eax),%eax
  101f99:	98                   	cwtl   
  101f9a:	8b 04 c5 24 fd 10 00 	mov    0x10fd24(,%eax,8),%eax
  101fa1:	8b 55 14             	mov    0x14(%ebp),%edx
  101fa4:	83 ec 04             	sub    $0x4,%esp
  101fa7:	52                   	push   %edx
  101fa8:	ff 75 0c             	pushl  0xc(%ebp)
  101fab:	ff 75 08             	pushl  0x8(%ebp)
  101fae:	ff d0                	call   *%eax
  101fb0:	83 c4 10             	add    $0x10,%esp
  101fb3:	e9 18 01 00 00       	jmp    1020d0 <writei+0x187>
  101fb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101fbb:	8b 40 18             	mov    0x18(%eax),%eax
  101fbe:	39 45 10             	cmp    %eax,0x10(%ebp)
  101fc1:	77 0d                	ja     101fd0 <writei+0x87>
  101fc3:	8b 55 10             	mov    0x10(%ebp),%edx
  101fc6:	8b 45 14             	mov    0x14(%ebp),%eax
  101fc9:	01 d0                	add    %edx,%eax
  101fcb:	39 45 10             	cmp    %eax,0x10(%ebp)
  101fce:	76 0a                	jbe    101fda <writei+0x91>
  101fd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101fd5:	e9 f6 00 00 00       	jmp    1020d0 <writei+0x187>
  101fda:	8b 55 10             	mov    0x10(%ebp),%edx
  101fdd:	8b 45 14             	mov    0x14(%ebp),%eax
  101fe0:	01 d0                	add    %edx,%eax
  101fe2:	3d 00 18 01 00       	cmp    $0x11800,%eax
  101fe7:	76 0b                	jbe    101ff4 <writei+0xab>
  101fe9:	b8 00 18 01 00       	mov    $0x11800,%eax
  101fee:	2b 45 10             	sub    0x10(%ebp),%eax
  101ff1:	89 45 14             	mov    %eax,0x14(%ebp)
  101ff4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ffb:	e9 99 00 00 00       	jmp    102099 <writei+0x150>
  102000:	8b 45 10             	mov    0x10(%ebp),%eax
  102003:	c1 e8 09             	shr    $0x9,%eax
  102006:	83 ec 08             	sub    $0x8,%esp
  102009:	50                   	push   %eax
  10200a:	ff 75 08             	pushl  0x8(%ebp)
  10200d:	e8 5c fb ff ff       	call   101b6e <bmap>
  102012:	83 c4 10             	add    $0x10,%esp
  102015:	89 c2                	mov    %eax,%edx
  102017:	8b 45 08             	mov    0x8(%ebp),%eax
  10201a:	8b 00                	mov    (%eax),%eax
  10201c:	83 ec 08             	sub    $0x8,%esp
  10201f:	52                   	push   %edx
  102020:	50                   	push   %eax
  102021:	e8 ba e1 ff ff       	call   1001e0 <bread>
  102026:	83 c4 10             	add    $0x10,%esp
  102029:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10202c:	8b 45 10             	mov    0x10(%ebp),%eax
  10202f:	25 ff 01 00 00       	and    $0x1ff,%eax
  102034:	ba 00 02 00 00       	mov    $0x200,%edx
  102039:	29 c2                	sub    %eax,%edx
  10203b:	8b 45 14             	mov    0x14(%ebp),%eax
  10203e:	2b 45 f4             	sub    -0xc(%ebp),%eax
  102041:	39 c2                	cmp    %eax,%edx
  102043:	0f 46 c2             	cmovbe %edx,%eax
  102046:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102049:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10204c:	8d 50 18             	lea    0x18(%eax),%edx
  10204f:	8b 45 10             	mov    0x10(%ebp),%eax
  102052:	25 ff 01 00 00       	and    $0x1ff,%eax
  102057:	01 d0                	add    %edx,%eax
  102059:	83 ec 04             	sub    $0x4,%esp
  10205c:	ff 75 ec             	pushl  -0x14(%ebp)
  10205f:	ff 75 0c             	pushl  0xc(%ebp)
  102062:	50                   	push   %eax
  102063:	e8 8f 2b 00 00       	call   104bf7 <memmove>
  102068:	83 c4 10             	add    $0x10,%esp
  10206b:	83 ec 0c             	sub    $0xc,%esp
  10206e:	ff 75 f0             	pushl  -0x10(%ebp)
  102071:	e8 a3 e1 ff ff       	call   100219 <bwrite>
  102076:	83 c4 10             	add    $0x10,%esp
  102079:	83 ec 0c             	sub    $0xc,%esp
  10207c:	ff 75 f0             	pushl  -0x10(%ebp)
  10207f:	e8 d4 e1 ff ff       	call   100258 <brelse>
  102084:	83 c4 10             	add    $0x10,%esp
  102087:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10208a:	01 45 f4             	add    %eax,-0xc(%ebp)
  10208d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102090:	01 45 10             	add    %eax,0x10(%ebp)
  102093:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102096:	01 45 0c             	add    %eax,0xc(%ebp)
  102099:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10209c:	3b 45 14             	cmp    0x14(%ebp),%eax
  10209f:	0f 82 5b ff ff ff    	jb     102000 <writei+0xb7>
  1020a5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1020a9:	74 22                	je     1020cd <writei+0x184>
  1020ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1020ae:	8b 40 18             	mov    0x18(%eax),%eax
  1020b1:	39 45 10             	cmp    %eax,0x10(%ebp)
  1020b4:	76 17                	jbe    1020cd <writei+0x184>
  1020b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1020b9:	8b 55 10             	mov    0x10(%ebp),%edx
  1020bc:	89 50 18             	mov    %edx,0x18(%eax)
  1020bf:	83 ec 0c             	sub    $0xc,%esp
  1020c2:	ff 75 08             	pushl  0x8(%ebp)
  1020c5:	e8 d7 f5 ff ff       	call   1016a1 <iupdate>
  1020ca:	83 c4 10             	add    $0x10,%esp
  1020cd:	8b 45 14             	mov    0x14(%ebp),%eax
  1020d0:	c9                   	leave  
  1020d1:	c3                   	ret    

001020d2 <namecmp>:
  1020d2:	55                   	push   %ebp
  1020d3:	89 e5                	mov    %esp,%ebp
  1020d5:	83 ec 08             	sub    $0x8,%esp
  1020d8:	83 ec 04             	sub    $0x4,%esp
  1020db:	6a 0e                	push   $0xe
  1020dd:	ff 75 0c             	pushl  0xc(%ebp)
  1020e0:	ff 75 08             	pushl  0x8(%ebp)
  1020e3:	e8 a5 2b 00 00       	call   104c8d <strncmp>
  1020e8:	83 c4 10             	add    $0x10,%esp
  1020eb:	c9                   	leave  
  1020ec:	c3                   	ret    

001020ed <dirlookup>:
  1020ed:	55                   	push   %ebp
  1020ee:	89 e5                	mov    %esp,%ebp
  1020f0:	83 ec 18             	sub    $0x18,%esp
  1020f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1020f6:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1020fa:	66 83 f8 01          	cmp    $0x1,%ax
  1020fe:	74 0d                	je     10210d <dirlookup+0x20>
  102100:	83 ec 0c             	sub    $0xc,%esp
  102103:	68 0f 8f 10 00       	push   $0x108f0f
  102108:	e8 6b e4 ff ff       	call   100578 <panic>
  10210d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102114:	e9 da 00 00 00       	jmp    1021f3 <dirlookup+0x106>
  102119:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10211c:	c1 e8 09             	shr    $0x9,%eax
  10211f:	83 ec 08             	sub    $0x8,%esp
  102122:	50                   	push   %eax
  102123:	ff 75 08             	pushl  0x8(%ebp)
  102126:	e8 43 fa ff ff       	call   101b6e <bmap>
  10212b:	83 c4 10             	add    $0x10,%esp
  10212e:	89 c2                	mov    %eax,%edx
  102130:	8b 45 08             	mov    0x8(%ebp),%eax
  102133:	8b 00                	mov    (%eax),%eax
  102135:	83 ec 08             	sub    $0x8,%esp
  102138:	52                   	push   %edx
  102139:	50                   	push   %eax
  10213a:	e8 a1 e0 ff ff       	call   1001e0 <bread>
  10213f:	83 c4 10             	add    $0x10,%esp
  102142:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102145:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102148:	83 c0 18             	add    $0x18,%eax
  10214b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10214e:	eb 7a                	jmp    1021ca <dirlookup+0xdd>
  102150:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102153:	0f b7 00             	movzwl (%eax),%eax
  102156:	66 85 c0             	test   %ax,%ax
  102159:	74 6a                	je     1021c5 <dirlookup+0xd8>
  10215b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10215e:	83 c0 02             	add    $0x2,%eax
  102161:	83 ec 08             	sub    $0x8,%esp
  102164:	50                   	push   %eax
  102165:	ff 75 0c             	pushl  0xc(%ebp)
  102168:	e8 65 ff ff ff       	call   1020d2 <namecmp>
  10216d:	83 c4 10             	add    $0x10,%esp
  102170:	85 c0                	test   %eax,%eax
  102172:	75 52                	jne    1021c6 <dirlookup+0xd9>
  102174:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102178:	74 1b                	je     102195 <dirlookup+0xa8>
  10217a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10217d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102180:	01 d0                	add    %edx,%eax
  102182:	89 c2                	mov    %eax,%edx
  102184:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102187:	83 c0 18             	add    $0x18,%eax
  10218a:	29 c2                	sub    %eax,%edx
  10218c:	89 d0                	mov    %edx,%eax
  10218e:	89 c2                	mov    %eax,%edx
  102190:	8b 45 10             	mov    0x10(%ebp),%eax
  102193:	89 10                	mov    %edx,(%eax)
  102195:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102198:	0f b7 00             	movzwl (%eax),%eax
  10219b:	0f b7 c0             	movzwl %ax,%eax
  10219e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1021a1:	83 ec 0c             	sub    $0xc,%esp
  1021a4:	ff 75 ec             	pushl  -0x14(%ebp)
  1021a7:	e8 ac e0 ff ff       	call   100258 <brelse>
  1021ac:	83 c4 10             	add    $0x10,%esp
  1021af:	8b 45 08             	mov    0x8(%ebp),%eax
  1021b2:	8b 00                	mov    (%eax),%eax
  1021b4:	83 ec 08             	sub    $0x8,%esp
  1021b7:	ff 75 e8             	pushl  -0x18(%ebp)
  1021ba:	50                   	push   %eax
  1021bb:	e8 9c f5 ff ff       	call   10175c <iget>
  1021c0:	83 c4 10             	add    $0x10,%esp
  1021c3:	eb 42                	jmp    102207 <dirlookup+0x11a>
  1021c5:	90                   	nop
  1021c6:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
  1021ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1021cd:	83 c0 18             	add    $0x18,%eax
  1021d0:	05 00 02 00 00       	add    $0x200,%eax
  1021d5:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  1021d8:	0f 82 72 ff ff ff    	jb     102150 <dirlookup+0x63>
  1021de:	83 ec 0c             	sub    $0xc,%esp
  1021e1:	ff 75 ec             	pushl  -0x14(%ebp)
  1021e4:	e8 6f e0 ff ff       	call   100258 <brelse>
  1021e9:	83 c4 10             	add    $0x10,%esp
  1021ec:	81 45 f4 00 02 00 00 	addl   $0x200,-0xc(%ebp)
  1021f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1021f6:	8b 40 18             	mov    0x18(%eax),%eax
  1021f9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1021fc:	0f 82 17 ff ff ff    	jb     102119 <dirlookup+0x2c>
  102202:	b8 00 00 00 00       	mov    $0x0,%eax
  102207:	c9                   	leave  
  102208:	c3                   	ret    

00102209 <dirlink>:
  102209:	55                   	push   %ebp
  10220a:	89 e5                	mov    %esp,%ebp
  10220c:	83 ec 28             	sub    $0x28,%esp
  10220f:	83 ec 04             	sub    $0x4,%esp
  102212:	6a 00                	push   $0x0
  102214:	ff 75 0c             	pushl  0xc(%ebp)
  102217:	ff 75 08             	pushl  0x8(%ebp)
  10221a:	e8 ce fe ff ff       	call   1020ed <dirlookup>
  10221f:	83 c4 10             	add    $0x10,%esp
  102222:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102225:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102229:	74 18                	je     102243 <dirlink+0x3a>
  10222b:	83 ec 0c             	sub    $0xc,%esp
  10222e:	ff 75 f0             	pushl  -0x10(%ebp)
  102231:	e8 23 f8 ff ff       	call   101a59 <iput>
  102236:	83 c4 10             	add    $0x10,%esp
  102239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10223e:	e9 9c 00 00 00       	jmp    1022df <dirlink+0xd6>
  102243:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10224a:	eb 39                	jmp    102285 <dirlink+0x7c>
  10224c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10224f:	6a 10                	push   $0x10
  102251:	50                   	push   %eax
  102252:	8d 45 e0             	lea    -0x20(%ebp),%eax
  102255:	50                   	push   %eax
  102256:	ff 75 08             	pushl  0x8(%ebp)
  102259:	e8 94 fb ff ff       	call   101df2 <readi>
  10225e:	83 c4 10             	add    $0x10,%esp
  102261:	83 f8 10             	cmp    $0x10,%eax
  102264:	74 0d                	je     102273 <dirlink+0x6a>
  102266:	83 ec 0c             	sub    $0xc,%esp
  102269:	68 21 8f 10 00       	push   $0x108f21
  10226e:	e8 05 e3 ff ff       	call   100578 <panic>
  102273:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  102277:	66 85 c0             	test   %ax,%ax
  10227a:	74 18                	je     102294 <dirlink+0x8b>
  10227c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10227f:	83 c0 10             	add    $0x10,%eax
  102282:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102285:	8b 45 08             	mov    0x8(%ebp),%eax
  102288:	8b 50 18             	mov    0x18(%eax),%edx
  10228b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10228e:	39 c2                	cmp    %eax,%edx
  102290:	77 ba                	ja     10224c <dirlink+0x43>
  102292:	eb 01                	jmp    102295 <dirlink+0x8c>
  102294:	90                   	nop
  102295:	83 ec 04             	sub    $0x4,%esp
  102298:	6a 0e                	push   $0xe
  10229a:	ff 75 0c             	pushl  0xc(%ebp)
  10229d:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1022a0:	83 c0 02             	add    $0x2,%eax
  1022a3:	50                   	push   %eax
  1022a4:	e8 3a 2a 00 00       	call   104ce3 <strncpy>
  1022a9:	83 c4 10             	add    $0x10,%esp
  1022ac:	8b 45 10             	mov    0x10(%ebp),%eax
  1022af:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  1022b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1022b6:	6a 10                	push   $0x10
  1022b8:	50                   	push   %eax
  1022b9:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1022bc:	50                   	push   %eax
  1022bd:	ff 75 08             	pushl  0x8(%ebp)
  1022c0:	e8 84 fc ff ff       	call   101f49 <writei>
  1022c5:	83 c4 10             	add    $0x10,%esp
  1022c8:	83 f8 10             	cmp    $0x10,%eax
  1022cb:	74 0d                	je     1022da <dirlink+0xd1>
  1022cd:	83 ec 0c             	sub    $0xc,%esp
  1022d0:	68 2e 8f 10 00       	push   $0x108f2e
  1022d5:	e8 9e e2 ff ff       	call   100578 <panic>
  1022da:	b8 00 00 00 00       	mov    $0x0,%eax
  1022df:	c9                   	leave  
  1022e0:	c3                   	ret    

001022e1 <skipelem>:
  1022e1:	55                   	push   %ebp
  1022e2:	89 e5                	mov    %esp,%ebp
  1022e4:	83 ec 18             	sub    $0x18,%esp
  1022e7:	eb 04                	jmp    1022ed <skipelem+0xc>
  1022e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1022ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1022f0:	0f b6 00             	movzbl (%eax),%eax
  1022f3:	3c 2f                	cmp    $0x2f,%al
  1022f5:	74 f2                	je     1022e9 <skipelem+0x8>
  1022f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1022fa:	0f b6 00             	movzbl (%eax),%eax
  1022fd:	84 c0                	test   %al,%al
  1022ff:	75 07                	jne    102308 <skipelem+0x27>
  102301:	b8 00 00 00 00       	mov    $0x0,%eax
  102306:	eb 7b                	jmp    102383 <skipelem+0xa2>
  102308:	8b 45 08             	mov    0x8(%ebp),%eax
  10230b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10230e:	eb 04                	jmp    102314 <skipelem+0x33>
  102310:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102314:	8b 45 08             	mov    0x8(%ebp),%eax
  102317:	0f b6 00             	movzbl (%eax),%eax
  10231a:	3c 2f                	cmp    $0x2f,%al
  10231c:	74 0a                	je     102328 <skipelem+0x47>
  10231e:	8b 45 08             	mov    0x8(%ebp),%eax
  102321:	0f b6 00             	movzbl (%eax),%eax
  102324:	84 c0                	test   %al,%al
  102326:	75 e8                	jne    102310 <skipelem+0x2f>
  102328:	8b 55 08             	mov    0x8(%ebp),%edx
  10232b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10232e:	29 c2                	sub    %eax,%edx
  102330:	89 d0                	mov    %edx,%eax
  102332:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102335:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  102339:	7e 15                	jle    102350 <skipelem+0x6f>
  10233b:	83 ec 04             	sub    $0x4,%esp
  10233e:	6a 0e                	push   $0xe
  102340:	ff 75 f4             	pushl  -0xc(%ebp)
  102343:	ff 75 0c             	pushl  0xc(%ebp)
  102346:	e8 ac 28 00 00       	call   104bf7 <memmove>
  10234b:	83 c4 10             	add    $0x10,%esp
  10234e:	eb 26                	jmp    102376 <skipelem+0x95>
  102350:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102353:	83 ec 04             	sub    $0x4,%esp
  102356:	50                   	push   %eax
  102357:	ff 75 f4             	pushl  -0xc(%ebp)
  10235a:	ff 75 0c             	pushl  0xc(%ebp)
  10235d:	e8 95 28 00 00       	call   104bf7 <memmove>
  102362:	83 c4 10             	add    $0x10,%esp
  102365:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102368:	8b 45 0c             	mov    0xc(%ebp),%eax
  10236b:	01 d0                	add    %edx,%eax
  10236d:	c6 00 00             	movb   $0x0,(%eax)
  102370:	eb 04                	jmp    102376 <skipelem+0x95>
  102372:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102376:	8b 45 08             	mov    0x8(%ebp),%eax
  102379:	0f b6 00             	movzbl (%eax),%eax
  10237c:	3c 2f                	cmp    $0x2f,%al
  10237e:	74 f2                	je     102372 <skipelem+0x91>
  102380:	8b 45 08             	mov    0x8(%ebp),%eax
  102383:	c9                   	leave  
  102384:	c3                   	ret    

00102385 <namex>:
  102385:	55                   	push   %ebp
  102386:	89 e5                	mov    %esp,%ebp
  102388:	83 ec 18             	sub    $0x18,%esp
  10238b:	8b 45 08             	mov    0x8(%ebp),%eax
  10238e:	0f b6 00             	movzbl (%eax),%eax
  102391:	3c 2f                	cmp    $0x2f,%al
  102393:	75 17                	jne    1023ac <namex+0x27>
  102395:	83 ec 08             	sub    $0x8,%esp
  102398:	6a 01                	push   $0x1
  10239a:	6a 01                	push   $0x1
  10239c:	e8 bb f3 ff ff       	call   10175c <iget>
  1023a1:	83 c4 10             	add    $0x10,%esp
  1023a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1023a7:	e9 0e 01 00 00       	jmp    1024ba <namex+0x135>
  1023ac:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1023b2:	8b 40 68             	mov    0x68(%eax),%eax
  1023b5:	83 ec 0c             	sub    $0xc,%esp
  1023b8:	50                   	push   %eax
  1023b9:	e8 7d f4 ff ff       	call   10183b <idup>
  1023be:	83 c4 10             	add    $0x10,%esp
  1023c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1023c4:	e9 f1 00 00 00       	jmp    1024ba <namex+0x135>
  1023c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023cc:	8b 00                	mov    (%eax),%eax
  1023ce:	83 f8 01             	cmp    $0x1,%eax
  1023d1:	75 49                	jne    10241c <namex+0x97>
  1023d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023d6:	8b 40 04             	mov    0x4(%eax),%eax
  1023d9:	83 f8 01             	cmp    $0x1,%eax
  1023dc:	75 3e                	jne    10241c <namex+0x97>
  1023de:	83 ec 04             	sub    $0x4,%esp
  1023e1:	6a 01                	push   $0x1
  1023e3:	68 36 8f 10 00       	push   $0x108f36
  1023e8:	ff 75 10             	pushl  0x10(%ebp)
  1023eb:	e8 9d 28 00 00       	call   104c8d <strncmp>
  1023f0:	83 c4 10             	add    $0x10,%esp
  1023f3:	85 c0                	test   %eax,%eax
  1023f5:	75 25                	jne    10241c <namex+0x97>
  1023f7:	83 ec 0c             	sub    $0xc,%esp
  1023fa:	ff 75 f4             	pushl  -0xc(%ebp)
  1023fd:	e8 57 f6 ff ff       	call   101a59 <iput>
  102402:	83 c4 10             	add    $0x10,%esp
  102405:	83 ec 08             	sub    $0x8,%esp
  102408:	6a 01                	push   $0x1
  10240a:	6a 02                	push   $0x2
  10240c:	e8 4b f3 ff ff       	call   10175c <iget>
  102411:	83 c4 10             	add    $0x10,%esp
  102414:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102417:	e9 9e 00 00 00       	jmp    1024ba <namex+0x135>
  10241c:	83 ec 0c             	sub    $0xc,%esp
  10241f:	ff 75 f4             	pushl  -0xc(%ebp)
  102422:	e8 4e f4 ff ff       	call   101875 <ilock>
  102427:	83 c4 10             	add    $0x10,%esp
  10242a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10242d:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  102431:	66 83 f8 01          	cmp    $0x1,%ax
  102435:	74 18                	je     10244f <namex+0xca>
  102437:	83 ec 0c             	sub    $0xc,%esp
  10243a:	ff 75 f4             	pushl  -0xc(%ebp)
  10243d:	e8 07 f7 ff ff       	call   101b49 <iunlockput>
  102442:	83 c4 10             	add    $0x10,%esp
  102445:	b8 00 00 00 00       	mov    $0x0,%eax
  10244a:	e9 a7 00 00 00       	jmp    1024f6 <namex+0x171>
  10244f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102453:	74 20                	je     102475 <namex+0xf0>
  102455:	8b 45 08             	mov    0x8(%ebp),%eax
  102458:	0f b6 00             	movzbl (%eax),%eax
  10245b:	84 c0                	test   %al,%al
  10245d:	75 16                	jne    102475 <namex+0xf0>
  10245f:	83 ec 0c             	sub    $0xc,%esp
  102462:	ff 75 f4             	pushl  -0xc(%ebp)
  102465:	e8 7d f5 ff ff       	call   1019e7 <iunlock>
  10246a:	83 c4 10             	add    $0x10,%esp
  10246d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102470:	e9 81 00 00 00       	jmp    1024f6 <namex+0x171>
  102475:	83 ec 04             	sub    $0x4,%esp
  102478:	6a 00                	push   $0x0
  10247a:	ff 75 10             	pushl  0x10(%ebp)
  10247d:	ff 75 f4             	pushl  -0xc(%ebp)
  102480:	e8 68 fc ff ff       	call   1020ed <dirlookup>
  102485:	83 c4 10             	add    $0x10,%esp
  102488:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10248b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10248f:	75 15                	jne    1024a6 <namex+0x121>
  102491:	83 ec 0c             	sub    $0xc,%esp
  102494:	ff 75 f4             	pushl  -0xc(%ebp)
  102497:	e8 ad f6 ff ff       	call   101b49 <iunlockput>
  10249c:	83 c4 10             	add    $0x10,%esp
  10249f:	b8 00 00 00 00       	mov    $0x0,%eax
  1024a4:	eb 50                	jmp    1024f6 <namex+0x171>
  1024a6:	83 ec 0c             	sub    $0xc,%esp
  1024a9:	ff 75 f4             	pushl  -0xc(%ebp)
  1024ac:	e8 98 f6 ff ff       	call   101b49 <iunlockput>
  1024b1:	83 c4 10             	add    $0x10,%esp
  1024b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1024b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1024ba:	83 ec 08             	sub    $0x8,%esp
  1024bd:	ff 75 10             	pushl  0x10(%ebp)
  1024c0:	ff 75 08             	pushl  0x8(%ebp)
  1024c3:	e8 19 fe ff ff       	call   1022e1 <skipelem>
  1024c8:	83 c4 10             	add    $0x10,%esp
  1024cb:	89 45 08             	mov    %eax,0x8(%ebp)
  1024ce:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1024d2:	0f 85 f1 fe ff ff    	jne    1023c9 <namex+0x44>
  1024d8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1024dc:	74 15                	je     1024f3 <namex+0x16e>
  1024de:	83 ec 0c             	sub    $0xc,%esp
  1024e1:	ff 75 f4             	pushl  -0xc(%ebp)
  1024e4:	e8 70 f5 ff ff       	call   101a59 <iput>
  1024e9:	83 c4 10             	add    $0x10,%esp
  1024ec:	b8 00 00 00 00       	mov    $0x0,%eax
  1024f1:	eb 03                	jmp    1024f6 <namex+0x171>
  1024f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024f6:	c9                   	leave  
  1024f7:	c3                   	ret    

001024f8 <namei>:
  1024f8:	55                   	push   %ebp
  1024f9:	89 e5                	mov    %esp,%ebp
  1024fb:	83 ec 18             	sub    $0x18,%esp
  1024fe:	83 ec 04             	sub    $0x4,%esp
  102501:	8d 45 ea             	lea    -0x16(%ebp),%eax
  102504:	50                   	push   %eax
  102505:	6a 00                	push   $0x0
  102507:	ff 75 08             	pushl  0x8(%ebp)
  10250a:	e8 76 fe ff ff       	call   102385 <namex>
  10250f:	83 c4 10             	add    $0x10,%esp
  102512:	c9                   	leave  
  102513:	c3                   	ret    

00102514 <nameiparent>:
  102514:	55                   	push   %ebp
  102515:	89 e5                	mov    %esp,%ebp
  102517:	83 ec 08             	sub    $0x8,%esp
  10251a:	83 ec 04             	sub    $0x4,%esp
  10251d:	ff 75 0c             	pushl  0xc(%ebp)
  102520:	6a 01                	push   $0x1
  102522:	ff 75 08             	pushl  0x8(%ebp)
  102525:	e8 5b fe ff ff       	call   102385 <namex>
  10252a:	83 c4 10             	add    $0x10,%esp
  10252d:	c9                   	leave  
  10252e:	c3                   	ret    

0010252f <inb>:
  10252f:	55                   	push   %ebp
  102530:	89 e5                	mov    %esp,%ebp
  102532:	83 ec 14             	sub    $0x14,%esp
  102535:	8b 45 08             	mov    0x8(%ebp),%eax
  102538:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10253c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  102540:	89 c2                	mov    %eax,%edx
  102542:	ec                   	in     (%dx),%al
  102543:	88 45 ff             	mov    %al,-0x1(%ebp)
  102546:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  10254a:	c9                   	leave  
  10254b:	c3                   	ret    

0010254c <insl>:
  10254c:	55                   	push   %ebp
  10254d:	89 e5                	mov    %esp,%ebp
  10254f:	57                   	push   %edi
  102550:	53                   	push   %ebx
  102551:	8b 55 08             	mov    0x8(%ebp),%edx
  102554:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  102557:	8b 45 10             	mov    0x10(%ebp),%eax
  10255a:	89 cb                	mov    %ecx,%ebx
  10255c:	89 df                	mov    %ebx,%edi
  10255e:	89 c1                	mov    %eax,%ecx
  102560:	fc                   	cld    
  102561:	f3 6d                	rep insl (%dx),%es:(%edi)
  102563:	89 c8                	mov    %ecx,%eax
  102565:	89 fb                	mov    %edi,%ebx
  102567:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  10256a:	89 45 10             	mov    %eax,0x10(%ebp)
  10256d:	90                   	nop
  10256e:	5b                   	pop    %ebx
  10256f:	5f                   	pop    %edi
  102570:	5d                   	pop    %ebp
  102571:	c3                   	ret    

00102572 <outb>:
  102572:	55                   	push   %ebp
  102573:	89 e5                	mov    %esp,%ebp
  102575:	83 ec 08             	sub    $0x8,%esp
  102578:	8b 55 08             	mov    0x8(%ebp),%edx
  10257b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10257e:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  102582:	88 45 f8             	mov    %al,-0x8(%ebp)
  102585:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  102589:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10258d:	ee                   	out    %al,(%dx)
  10258e:	90                   	nop
  10258f:	c9                   	leave  
  102590:	c3                   	ret    

00102591 <outsl>:
  102591:	55                   	push   %ebp
  102592:	89 e5                	mov    %esp,%ebp
  102594:	56                   	push   %esi
  102595:	53                   	push   %ebx
  102596:	8b 55 08             	mov    0x8(%ebp),%edx
  102599:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10259c:	8b 45 10             	mov    0x10(%ebp),%eax
  10259f:	89 cb                	mov    %ecx,%ebx
  1025a1:	89 de                	mov    %ebx,%esi
  1025a3:	89 c1                	mov    %eax,%ecx
  1025a5:	fc                   	cld    
  1025a6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  1025a8:	89 c8                	mov    %ecx,%eax
  1025aa:	89 f3                	mov    %esi,%ebx
  1025ac:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1025af:	89 45 10             	mov    %eax,0x10(%ebp)
  1025b2:	90                   	nop
  1025b3:	5b                   	pop    %ebx
  1025b4:	5e                   	pop    %esi
  1025b5:	5d                   	pop    %ebp
  1025b6:	c3                   	ret    

001025b7 <ide_control_port>:
  1025b7:	55                   	push   %ebp
  1025b8:	89 e5                	mov    %esp,%ebp
  1025ba:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  1025be:	77 07                	ja     1025c7 <ide_control_port+0x10>
  1025c0:	b8 f6 03 00 00       	mov    $0x3f6,%eax
  1025c5:	eb 05                	jmp    1025cc <ide_control_port+0x15>
  1025c7:	b8 76 03 00 00       	mov    $0x376,%eax
  1025cc:	5d                   	pop    %ebp
  1025cd:	c3                   	ret    

001025ce <ide_base_port>:
  1025ce:	55                   	push   %ebp
  1025cf:	89 e5                	mov    %esp,%ebp
  1025d1:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  1025d5:	77 07                	ja     1025de <ide_base_port+0x10>
  1025d7:	b8 f0 01 00 00       	mov    $0x1f0,%eax
  1025dc:	eb 05                	jmp    1025e3 <ide_base_port+0x15>
  1025de:	b8 70 01 00 00       	mov    $0x170,%eax
  1025e3:	5d                   	pop    %ebp
  1025e4:	c3                   	ret    

001025e5 <idewait>:
  1025e5:	55                   	push   %ebp
  1025e6:	89 e5                	mov    %esp,%ebp
  1025e8:	83 ec 10             	sub    $0x10,%esp
  1025eb:	ff 75 08             	pushl  0x8(%ebp)
  1025ee:	e8 db ff ff ff       	call   1025ce <ide_base_port>
  1025f3:	83 c4 04             	add    $0x4,%esp
  1025f6:	83 c0 07             	add    $0x7,%eax
  1025f9:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  1025fd:	90                   	nop
  1025fe:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102602:	50                   	push   %eax
  102603:	e8 27 ff ff ff       	call   10252f <inb>
  102608:	83 c4 04             	add    $0x4,%esp
  10260b:	0f b6 c0             	movzbl %al,%eax
  10260e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102611:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102614:	25 c0 00 00 00       	and    $0xc0,%eax
  102619:	83 f8 40             	cmp    $0x40,%eax
  10261c:	75 e0                	jne    1025fe <idewait+0x19>
  10261e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102622:	74 11                	je     102635 <idewait+0x50>
  102624:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102627:	83 e0 21             	and    $0x21,%eax
  10262a:	85 c0                	test   %eax,%eax
  10262c:	74 07                	je     102635 <idewait+0x50>
  10262e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102633:	eb 05                	jmp    10263a <idewait+0x55>
  102635:	b8 00 00 00 00       	mov    $0x0,%eax
  10263a:	c9                   	leave  
  10263b:	c3                   	ret    

0010263c <ideinit>:
  10263c:	55                   	push   %ebp
  10263d:	89 e5                	mov    %esp,%ebp
  10263f:	83 ec 18             	sub    $0x18,%esp
  102642:	83 ec 08             	sub    $0x8,%esp
  102645:	68 38 8f 10 00       	push   $0x108f38
  10264a:	68 20 cb 10 00       	push   $0x10cb20
  10264f:	e8 d2 22 00 00       	call   104926 <initlock>
  102654:	83 c4 10             	add    $0x10,%esp
  102657:	83 ec 0c             	sub    $0xc,%esp
  10265a:	6a 0e                	push   $0xe
  10265c:	e8 2f 12 00 00       	call   103890 <picenable>
  102661:	83 c4 10             	add    $0x10,%esp
  102664:	83 ec 0c             	sub    $0xc,%esp
  102667:	6a 0f                	push   $0xf
  102669:	e8 22 12 00 00       	call   103890 <picenable>
  10266e:	83 c4 10             	add    $0x10,%esp
  102671:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  102676:	83 e8 01             	sub    $0x1,%eax
  102679:	83 ec 08             	sub    $0x8,%esp
  10267c:	50                   	push   %eax
  10267d:	6a 0e                	push   $0xe
  10267f:	e8 45 05 00 00       	call   102bc9 <ioapicenable>
  102684:	83 c4 10             	add    $0x10,%esp
  102687:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  10268c:	83 e8 01             	sub    $0x1,%eax
  10268f:	83 ec 08             	sub    $0x8,%esp
  102692:	50                   	push   %eax
  102693:	6a 0f                	push   $0xf
  102695:	e8 2f 05 00 00       	call   102bc9 <ioapicenable>
  10269a:	83 c4 10             	add    $0x10,%esp
  10269d:	83 ec 08             	sub    $0x8,%esp
  1026a0:	6a 00                	push   $0x0
  1026a2:	6a 00                	push   $0x0
  1026a4:	e8 3c ff ff ff       	call   1025e5 <idewait>
  1026a9:	83 c4 10             	add    $0x10,%esp
  1026ac:	83 ec 08             	sub    $0x8,%esp
  1026af:	68 f0 00 00 00       	push   $0xf0
  1026b4:	68 f6 01 00 00       	push   $0x1f6
  1026b9:	e8 b4 fe ff ff       	call   102572 <outb>
  1026be:	83 c4 10             	add    $0x10,%esp
  1026c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1026c8:	eb 24                	jmp    1026ee <ideinit+0xb2>
  1026ca:	83 ec 0c             	sub    $0xc,%esp
  1026cd:	68 f7 01 00 00       	push   $0x1f7
  1026d2:	e8 58 fe ff ff       	call   10252f <inb>
  1026d7:	83 c4 10             	add    $0x10,%esp
  1026da:	84 c0                	test   %al,%al
  1026dc:	74 0c                	je     1026ea <ideinit+0xae>
  1026de:	c7 05 58 cb 10 00 01 	movl   $0x1,0x10cb58
  1026e5:	00 00 00 
  1026e8:	eb 0d                	jmp    1026f7 <ideinit+0xbb>
  1026ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1026ee:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  1026f5:	7e d3                	jle    1026ca <ideinit+0x8e>
  1026f7:	83 ec 08             	sub    $0x8,%esp
  1026fa:	68 e0 00 00 00       	push   $0xe0
  1026ff:	68 f6 01 00 00       	push   $0x1f6
  102704:	e8 69 fe ff ff       	call   102572 <outb>
  102709:	83 c4 10             	add    $0x10,%esp
  10270c:	83 ec 08             	sub    $0x8,%esp
  10270f:	68 e0 00 00 00       	push   $0xe0
  102714:	68 76 01 00 00       	push   $0x176
  102719:	e8 54 fe ff ff       	call   102572 <outb>
  10271e:	83 c4 10             	add    $0x10,%esp
  102721:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102728:	eb 34                	jmp    10275e <ideinit+0x122>
  10272a:	83 ec 0c             	sub    $0xc,%esp
  10272d:	68 77 01 00 00       	push   $0x177
  102732:	e8 f8 fd ff ff       	call   10252f <inb>
  102737:	83 c4 10             	add    $0x10,%esp
  10273a:	84 c0                	test   %al,%al
  10273c:	74 1c                	je     10275a <ideinit+0x11e>
  10273e:	c7 05 5c cb 10 00 01 	movl   $0x1,0x10cb5c
  102745:	00 00 00 
  102748:	83 ec 0c             	sub    $0xc,%esp
  10274b:	68 3c 8f 10 00       	push   $0x108f3c
  102750:	e8 97 dc ff ff       	call   1003ec <cprintf>
  102755:	83 c4 10             	add    $0x10,%esp
  102758:	eb 0d                	jmp    102767 <ideinit+0x12b>
  10275a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10275e:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  102765:	7e c3                	jle    10272a <ideinit+0xee>
  102767:	90                   	nop
  102768:	c9                   	leave  
  102769:	c3                   	ret    

0010276a <idestart>:
  10276a:	55                   	push   %ebp
  10276b:	89 e5                	mov    %esp,%ebp
  10276d:	83 ec 18             	sub    $0x18,%esp
  102770:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102774:	75 0d                	jne    102783 <idestart+0x19>
  102776:	83 ec 0c             	sub    $0xc,%esp
  102779:	68 4a 8f 10 00       	push   $0x108f4a
  10277e:	e8 f5 dd ff ff       	call   100578 <panic>
  102783:	8b 45 08             	mov    0x8(%ebp),%eax
  102786:	8b 40 04             	mov    0x4(%eax),%eax
  102789:	83 ec 0c             	sub    $0xc,%esp
  10278c:	50                   	push   %eax
  10278d:	e8 25 fe ff ff       	call   1025b7 <ide_control_port>
  102792:	83 c4 10             	add    $0x10,%esp
  102795:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  102799:	8b 45 08             	mov    0x8(%ebp),%eax
  10279c:	8b 40 04             	mov    0x4(%eax),%eax
  10279f:	83 ec 0c             	sub    $0xc,%esp
  1027a2:	50                   	push   %eax
  1027a3:	e8 26 fe ff ff       	call   1025ce <ide_base_port>
  1027a8:	83 c4 10             	add    $0x10,%esp
  1027ab:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  1027af:	8b 45 08             	mov    0x8(%ebp),%eax
  1027b2:	8b 40 04             	mov    0x4(%eax),%eax
  1027b5:	83 ec 08             	sub    $0x8,%esp
  1027b8:	6a 00                	push   $0x0
  1027ba:	50                   	push   %eax
  1027bb:	e8 25 fe ff ff       	call   1025e5 <idewait>
  1027c0:	83 c4 10             	add    $0x10,%esp
  1027c3:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1027c7:	83 ec 08             	sub    $0x8,%esp
  1027ca:	6a 00                	push   $0x0
  1027cc:	50                   	push   %eax
  1027cd:	e8 a0 fd ff ff       	call   102572 <outb>
  1027d2:	83 c4 10             	add    $0x10,%esp
  1027d5:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  1027d9:	83 c0 02             	add    $0x2,%eax
  1027dc:	0f b7 c0             	movzwl %ax,%eax
  1027df:	83 ec 08             	sub    $0x8,%esp
  1027e2:	6a 01                	push   $0x1
  1027e4:	50                   	push   %eax
  1027e5:	e8 88 fd ff ff       	call   102572 <outb>
  1027ea:	83 c4 10             	add    $0x10,%esp
  1027ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1027f0:	8b 40 08             	mov    0x8(%eax),%eax
  1027f3:	0f b6 d0             	movzbl %al,%edx
  1027f6:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  1027fa:	83 c0 03             	add    $0x3,%eax
  1027fd:	0f b7 c0             	movzwl %ax,%eax
  102800:	83 ec 08             	sub    $0x8,%esp
  102803:	52                   	push   %edx
  102804:	50                   	push   %eax
  102805:	e8 68 fd ff ff       	call   102572 <outb>
  10280a:	83 c4 10             	add    $0x10,%esp
  10280d:	8b 45 08             	mov    0x8(%ebp),%eax
  102810:	8b 40 08             	mov    0x8(%eax),%eax
  102813:	c1 e8 08             	shr    $0x8,%eax
  102816:	0f b6 d0             	movzbl %al,%edx
  102819:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10281d:	83 c0 04             	add    $0x4,%eax
  102820:	0f b7 c0             	movzwl %ax,%eax
  102823:	83 ec 08             	sub    $0x8,%esp
  102826:	52                   	push   %edx
  102827:	50                   	push   %eax
  102828:	e8 45 fd ff ff       	call   102572 <outb>
  10282d:	83 c4 10             	add    $0x10,%esp
  102830:	8b 45 08             	mov    0x8(%ebp),%eax
  102833:	8b 40 08             	mov    0x8(%eax),%eax
  102836:	c1 e8 10             	shr    $0x10,%eax
  102839:	0f b6 d0             	movzbl %al,%edx
  10283c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  102840:	83 c0 05             	add    $0x5,%eax
  102843:	0f b7 c0             	movzwl %ax,%eax
  102846:	83 ec 08             	sub    $0x8,%esp
  102849:	52                   	push   %edx
  10284a:	50                   	push   %eax
  10284b:	e8 22 fd ff ff       	call   102572 <outb>
  102850:	83 c4 10             	add    $0x10,%esp
  102853:	8b 45 08             	mov    0x8(%ebp),%eax
  102856:	8b 40 04             	mov    0x4(%eax),%eax
  102859:	c1 e0 04             	shl    $0x4,%eax
  10285c:	83 e0 10             	and    $0x10,%eax
  10285f:	89 c2                	mov    %eax,%edx
  102861:	8b 45 08             	mov    0x8(%ebp),%eax
  102864:	8b 40 08             	mov    0x8(%eax),%eax
  102867:	c1 e8 18             	shr    $0x18,%eax
  10286a:	83 e0 0f             	and    $0xf,%eax
  10286d:	09 d0                	or     %edx,%eax
  10286f:	83 c8 e0             	or     $0xffffffe0,%eax
  102872:	0f b6 d0             	movzbl %al,%edx
  102875:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  102879:	83 c0 06             	add    $0x6,%eax
  10287c:	0f b7 c0             	movzwl %ax,%eax
  10287f:	83 ec 08             	sub    $0x8,%esp
  102882:	52                   	push   %edx
  102883:	50                   	push   %eax
  102884:	e8 e9 fc ff ff       	call   102572 <outb>
  102889:	83 c4 10             	add    $0x10,%esp
  10288c:	8b 45 08             	mov    0x8(%ebp),%eax
  10288f:	8b 00                	mov    (%eax),%eax
  102891:	83 e0 04             	and    $0x4,%eax
  102894:	85 c0                	test   %eax,%eax
  102896:	74 36                	je     1028ce <idestart+0x164>
  102898:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10289c:	83 c0 07             	add    $0x7,%eax
  10289f:	0f b7 c0             	movzwl %ax,%eax
  1028a2:	83 ec 08             	sub    $0x8,%esp
  1028a5:	6a 30                	push   $0x30
  1028a7:	50                   	push   %eax
  1028a8:	e8 c5 fc ff ff       	call   102572 <outb>
  1028ad:	83 c4 10             	add    $0x10,%esp
  1028b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1028b3:	8d 50 18             	lea    0x18(%eax),%edx
  1028b6:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  1028ba:	83 ec 04             	sub    $0x4,%esp
  1028bd:	68 80 00 00 00       	push   $0x80
  1028c2:	52                   	push   %edx
  1028c3:	50                   	push   %eax
  1028c4:	e8 c8 fc ff ff       	call   102591 <outsl>
  1028c9:	83 c4 10             	add    $0x10,%esp
  1028cc:	eb 18                	jmp    1028e6 <idestart+0x17c>
  1028ce:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  1028d2:	83 c0 07             	add    $0x7,%eax
  1028d5:	0f b7 c0             	movzwl %ax,%eax
  1028d8:	83 ec 08             	sub    $0x8,%esp
  1028db:	6a 20                	push   $0x20
  1028dd:	50                   	push   %eax
  1028de:	e8 8f fc ff ff       	call   102572 <outb>
  1028e3:	83 c4 10             	add    $0x10,%esp
  1028e6:	90                   	nop
  1028e7:	c9                   	leave  
  1028e8:	c3                   	ret    

001028e9 <ideintr>:
  1028e9:	55                   	push   %ebp
  1028ea:	89 e5                	mov    %esp,%ebp
  1028ec:	53                   	push   %ebx
  1028ed:	83 ec 14             	sub    $0x14,%esp
  1028f0:	83 ec 0c             	sub    $0xc,%esp
  1028f3:	68 20 cb 10 00       	push   $0x10cb20
  1028f8:	e8 4b 20 00 00       	call   104948 <acquire>
  1028fd:	83 c4 10             	add    $0x10,%esp
  102900:	a1 54 cb 10 00       	mov    0x10cb54,%eax
  102905:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102908:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10290c:	75 15                	jne    102923 <ideintr+0x3a>
  10290e:	83 ec 0c             	sub    $0xc,%esp
  102911:	68 20 cb 10 00       	push   $0x10cb20
  102916:	e8 94 20 00 00       	call   1049af <release>
  10291b:	83 c4 10             	add    $0x10,%esp
  10291e:	e9 b2 00 00 00       	jmp    1029d5 <ideintr+0xec>
  102923:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102926:	8b 40 14             	mov    0x14(%eax),%eax
  102929:	a3 54 cb 10 00       	mov    %eax,0x10cb54
  10292e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102931:	8b 00                	mov    (%eax),%eax
  102933:	83 e0 04             	and    $0x4,%eax
  102936:	85 c0                	test   %eax,%eax
  102938:	75 45                	jne    10297f <ideintr+0x96>
  10293a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10293d:	8b 40 04             	mov    0x4(%eax),%eax
  102940:	83 ec 08             	sub    $0x8,%esp
  102943:	6a 01                	push   $0x1
  102945:	50                   	push   %eax
  102946:	e8 9a fc ff ff       	call   1025e5 <idewait>
  10294b:	83 c4 10             	add    $0x10,%esp
  10294e:	85 c0                	test   %eax,%eax
  102950:	78 2d                	js     10297f <ideintr+0x96>
  102952:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102955:	8d 58 18             	lea    0x18(%eax),%ebx
  102958:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10295b:	8b 40 04             	mov    0x4(%eax),%eax
  10295e:	83 ec 0c             	sub    $0xc,%esp
  102961:	50                   	push   %eax
  102962:	e8 67 fc ff ff       	call   1025ce <ide_base_port>
  102967:	83 c4 10             	add    $0x10,%esp
  10296a:	0f b7 c0             	movzwl %ax,%eax
  10296d:	83 ec 04             	sub    $0x4,%esp
  102970:	68 80 00 00 00       	push   $0x80
  102975:	53                   	push   %ebx
  102976:	50                   	push   %eax
  102977:	e8 d0 fb ff ff       	call   10254c <insl>
  10297c:	83 c4 10             	add    $0x10,%esp
  10297f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102982:	8b 00                	mov    (%eax),%eax
  102984:	83 c8 02             	or     $0x2,%eax
  102987:	89 c2                	mov    %eax,%edx
  102989:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10298c:	89 10                	mov    %edx,(%eax)
  10298e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102991:	8b 00                	mov    (%eax),%eax
  102993:	83 e0 fb             	and    $0xfffffffb,%eax
  102996:	89 c2                	mov    %eax,%edx
  102998:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10299b:	89 10                	mov    %edx,(%eax)
  10299d:	83 ec 0c             	sub    $0xc,%esp
  1029a0:	ff 75 f4             	pushl  -0xc(%ebp)
  1029a3:	e8 92 1d 00 00       	call   10473a <wakeup>
  1029a8:	83 c4 10             	add    $0x10,%esp
  1029ab:	a1 54 cb 10 00       	mov    0x10cb54,%eax
  1029b0:	85 c0                	test   %eax,%eax
  1029b2:	74 11                	je     1029c5 <ideintr+0xdc>
  1029b4:	a1 54 cb 10 00       	mov    0x10cb54,%eax
  1029b9:	83 ec 0c             	sub    $0xc,%esp
  1029bc:	50                   	push   %eax
  1029bd:	e8 a8 fd ff ff       	call   10276a <idestart>
  1029c2:	83 c4 10             	add    $0x10,%esp
  1029c5:	83 ec 0c             	sub    $0xc,%esp
  1029c8:	68 20 cb 10 00       	push   $0x10cb20
  1029cd:	e8 dd 1f 00 00       	call   1049af <release>
  1029d2:	83 c4 10             	add    $0x10,%esp
  1029d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1029d8:	c9                   	leave  
  1029d9:	c3                   	ret    

001029da <iderw>:
  1029da:	55                   	push   %ebp
  1029db:	89 e5                	mov    %esp,%ebp
  1029dd:	83 ec 18             	sub    $0x18,%esp
  1029e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e3:	8b 00                	mov    (%eax),%eax
  1029e5:	83 e0 01             	and    $0x1,%eax
  1029e8:	85 c0                	test   %eax,%eax
  1029ea:	75 0d                	jne    1029f9 <iderw+0x1f>
  1029ec:	83 ec 0c             	sub    $0xc,%esp
  1029ef:	68 53 8f 10 00       	push   $0x108f53
  1029f4:	e8 7f db ff ff       	call   100578 <panic>
  1029f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fc:	8b 00                	mov    (%eax),%eax
  1029fe:	83 e0 06             	and    $0x6,%eax
  102a01:	83 f8 02             	cmp    $0x2,%eax
  102a04:	75 0d                	jne    102a13 <iderw+0x39>
  102a06:	83 ec 0c             	sub    $0xc,%esp
  102a09:	68 67 8f 10 00       	push   $0x108f67
  102a0e:	e8 65 db ff ff       	call   100578 <panic>
  102a13:	8b 45 08             	mov    0x8(%ebp),%eax
  102a16:	8b 40 04             	mov    0x4(%eax),%eax
  102a19:	83 f8 01             	cmp    $0x1,%eax
  102a1c:	75 16                	jne    102a34 <iderw+0x5a>
  102a1e:	a1 58 cb 10 00       	mov    0x10cb58,%eax
  102a23:	85 c0                	test   %eax,%eax
  102a25:	75 0d                	jne    102a34 <iderw+0x5a>
  102a27:	83 ec 0c             	sub    $0xc,%esp
  102a2a:	68 7c 8f 10 00       	push   $0x108f7c
  102a2f:	e8 44 db ff ff       	call   100578 <panic>
  102a34:	8b 45 08             	mov    0x8(%ebp),%eax
  102a37:	8b 40 04             	mov    0x4(%eax),%eax
  102a3a:	83 f8 02             	cmp    $0x2,%eax
  102a3d:	75 16                	jne    102a55 <iderw+0x7b>
  102a3f:	a1 5c cb 10 00       	mov    0x10cb5c,%eax
  102a44:	85 c0                	test   %eax,%eax
  102a46:	75 0d                	jne    102a55 <iderw+0x7b>
  102a48:	83 ec 0c             	sub    $0xc,%esp
  102a4b:	68 9a 8f 10 00       	push   $0x108f9a
  102a50:	e8 23 db ff ff       	call   100578 <panic>
  102a55:	83 ec 0c             	sub    $0xc,%esp
  102a58:	68 20 cb 10 00       	push   $0x10cb20
  102a5d:	e8 e6 1e 00 00       	call   104948 <acquire>
  102a62:	83 c4 10             	add    $0x10,%esp
  102a65:	8b 45 08             	mov    0x8(%ebp),%eax
  102a68:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  102a6f:	c7 45 f4 54 cb 10 00 	movl   $0x10cb54,-0xc(%ebp)
  102a76:	eb 0b                	jmp    102a83 <iderw+0xa9>
  102a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a7b:	8b 00                	mov    (%eax),%eax
  102a7d:	83 c0 14             	add    $0x14,%eax
  102a80:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a86:	8b 00                	mov    (%eax),%eax
  102a88:	85 c0                	test   %eax,%eax
  102a8a:	75 ec                	jne    102a78 <iderw+0x9e>
  102a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a8f:	8b 55 08             	mov    0x8(%ebp),%edx
  102a92:	89 10                	mov    %edx,(%eax)
  102a94:	a1 54 cb 10 00       	mov    0x10cb54,%eax
  102a99:	39 45 08             	cmp    %eax,0x8(%ebp)
  102a9c:	75 23                	jne    102ac1 <iderw+0xe7>
  102a9e:	83 ec 0c             	sub    $0xc,%esp
  102aa1:	ff 75 08             	pushl  0x8(%ebp)
  102aa4:	e8 c1 fc ff ff       	call   10276a <idestart>
  102aa9:	83 c4 10             	add    $0x10,%esp
  102aac:	eb 13                	jmp    102ac1 <iderw+0xe7>
  102aae:	83 ec 08             	sub    $0x8,%esp
  102ab1:	68 20 cb 10 00       	push   $0x10cb20
  102ab6:	ff 75 08             	pushl  0x8(%ebp)
  102ab9:	e8 91 1b 00 00       	call   10464f <sleep>
  102abe:	83 c4 10             	add    $0x10,%esp
  102ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac4:	8b 00                	mov    (%eax),%eax
  102ac6:	83 e0 06             	and    $0x6,%eax
  102ac9:	83 f8 02             	cmp    $0x2,%eax
  102acc:	75 e0                	jne    102aae <iderw+0xd4>
  102ace:	83 ec 0c             	sub    $0xc,%esp
  102ad1:	68 20 cb 10 00       	push   $0x10cb20
  102ad6:	e8 d4 1e 00 00       	call   1049af <release>
  102adb:	83 c4 10             	add    $0x10,%esp
  102ade:	90                   	nop
  102adf:	c9                   	leave  
  102ae0:	c3                   	ret    

00102ae1 <ioapicread>:
  102ae1:	55                   	push   %ebp
  102ae2:	89 e5                	mov    %esp,%ebp
  102ae4:	a1 54 0d 11 00       	mov    0x110d54,%eax
  102ae9:	8b 55 08             	mov    0x8(%ebp),%edx
  102aec:	89 10                	mov    %edx,(%eax)
  102aee:	a1 54 0d 11 00       	mov    0x110d54,%eax
  102af3:	8b 40 10             	mov    0x10(%eax),%eax
  102af6:	5d                   	pop    %ebp
  102af7:	c3                   	ret    

00102af8 <ioapicwrite>:
  102af8:	55                   	push   %ebp
  102af9:	89 e5                	mov    %esp,%ebp
  102afb:	a1 54 0d 11 00       	mov    0x110d54,%eax
  102b00:	8b 55 08             	mov    0x8(%ebp),%edx
  102b03:	89 10                	mov    %edx,(%eax)
  102b05:	a1 54 0d 11 00       	mov    0x110d54,%eax
  102b0a:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b0d:	89 50 10             	mov    %edx,0x10(%eax)
  102b10:	90                   	nop
  102b11:	5d                   	pop    %ebp
  102b12:	c3                   	ret    

00102b13 <ioapicinit>:
  102b13:	55                   	push   %ebp
  102b14:	89 e5                	mov    %esp,%ebp
  102b16:	83 ec 18             	sub    $0x18,%esp
  102b19:	a1 a4 0d 11 00       	mov    0x110da4,%eax
  102b1e:	85 c0                	test   %eax,%eax
  102b20:	0f 84 a0 00 00 00    	je     102bc6 <ioapicinit+0xb3>
  102b26:	c7 05 54 0d 11 00 00 	movl   $0xfec00000,0x110d54
  102b2d:	00 c0 fe 
  102b30:	6a 01                	push   $0x1
  102b32:	e8 aa ff ff ff       	call   102ae1 <ioapicread>
  102b37:	83 c4 04             	add    $0x4,%esp
  102b3a:	c1 e8 10             	shr    $0x10,%eax
  102b3d:	25 ff 00 00 00       	and    $0xff,%eax
  102b42:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b45:	6a 00                	push   $0x0
  102b47:	e8 95 ff ff ff       	call   102ae1 <ioapicread>
  102b4c:	83 c4 04             	add    $0x4,%esp
  102b4f:	c1 e8 18             	shr    $0x18,%eax
  102b52:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b55:	0f b6 05 a0 0d 11 00 	movzbl 0x110da0,%eax
  102b5c:	0f b6 c0             	movzbl %al,%eax
  102b5f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  102b62:	74 10                	je     102b74 <ioapicinit+0x61>
  102b64:	83 ec 0c             	sub    $0xc,%esp
  102b67:	68 b8 8f 10 00       	push   $0x108fb8
  102b6c:	e8 7b d8 ff ff       	call   1003ec <cprintf>
  102b71:	83 c4 10             	add    $0x10,%esp
  102b74:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102b7b:	eb 3f                	jmp    102bbc <ioapicinit+0xa9>
  102b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b80:	83 c0 20             	add    $0x20,%eax
  102b83:	0d 00 00 01 00       	or     $0x10000,%eax
  102b88:	89 c2                	mov    %eax,%edx
  102b8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b8d:	83 c0 08             	add    $0x8,%eax
  102b90:	01 c0                	add    %eax,%eax
  102b92:	83 ec 08             	sub    $0x8,%esp
  102b95:	52                   	push   %edx
  102b96:	50                   	push   %eax
  102b97:	e8 5c ff ff ff       	call   102af8 <ioapicwrite>
  102b9c:	83 c4 10             	add    $0x10,%esp
  102b9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ba2:	83 c0 08             	add    $0x8,%eax
  102ba5:	01 c0                	add    %eax,%eax
  102ba7:	83 c0 01             	add    $0x1,%eax
  102baa:	83 ec 08             	sub    $0x8,%esp
  102bad:	6a 00                	push   $0x0
  102baf:	50                   	push   %eax
  102bb0:	e8 43 ff ff ff       	call   102af8 <ioapicwrite>
  102bb5:	83 c4 10             	add    $0x10,%esp
  102bb8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102bbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bbf:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  102bc2:	7e b9                	jle    102b7d <ioapicinit+0x6a>
  102bc4:	eb 01                	jmp    102bc7 <ioapicinit+0xb4>
  102bc6:	90                   	nop
  102bc7:	c9                   	leave  
  102bc8:	c3                   	ret    

00102bc9 <ioapicenable>:
  102bc9:	55                   	push   %ebp
  102bca:	89 e5                	mov    %esp,%ebp
  102bcc:	a1 a4 0d 11 00       	mov    0x110da4,%eax
  102bd1:	85 c0                	test   %eax,%eax
  102bd3:	74 39                	je     102c0e <ioapicenable+0x45>
  102bd5:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd8:	83 c0 20             	add    $0x20,%eax
  102bdb:	89 c2                	mov    %eax,%edx
  102bdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102be0:	83 c0 08             	add    $0x8,%eax
  102be3:	01 c0                	add    %eax,%eax
  102be5:	52                   	push   %edx
  102be6:	50                   	push   %eax
  102be7:	e8 0c ff ff ff       	call   102af8 <ioapicwrite>
  102bec:	83 c4 08             	add    $0x8,%esp
  102bef:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bf2:	c1 e0 18             	shl    $0x18,%eax
  102bf5:	89 c2                	mov    %eax,%edx
  102bf7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bfa:	83 c0 08             	add    $0x8,%eax
  102bfd:	01 c0                	add    %eax,%eax
  102bff:	83 c0 01             	add    $0x1,%eax
  102c02:	52                   	push   %edx
  102c03:	50                   	push   %eax
  102c04:	e8 ef fe ff ff       	call   102af8 <ioapicwrite>
  102c09:	83 c4 08             	add    $0x8,%esp
  102c0c:	eb 01                	jmp    102c0f <ioapicenable+0x46>
  102c0e:	90                   	nop
  102c0f:	c9                   	leave  
  102c10:	c3                   	ret    

00102c11 <kinit>:
  102c11:	55                   	push   %ebp
  102c12:	89 e5                	mov    %esp,%ebp
  102c14:	83 ec 18             	sub    $0x18,%esp
  102c17:	83 ec 08             	sub    $0x8,%esp
  102c1a:	68 ea 8f 10 00       	push   $0x108fea
  102c1f:	68 60 0d 11 00       	push   $0x110d60
  102c24:	e8 fd 1c 00 00       	call   104926 <initlock>
  102c29:	83 c4 10             	add    $0x10,%esp
  102c2c:	b8 34 59 11 00       	mov    $0x115934,%eax
  102c31:	05 ff 0f 00 00       	add    $0xfff,%eax
  102c36:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102c3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c3e:	eb 15                	jmp    102c55 <kinit+0x44>
  102c40:	83 ec 0c             	sub    $0xc,%esp
  102c43:	ff 75 f4             	pushl  -0xc(%ebp)
  102c46:	e8 1c 00 00 00       	call   102c67 <kfree>
  102c4b:	83 c4 10             	add    $0x10,%esp
  102c4e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  102c55:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c58:	05 00 10 00 00       	add    $0x1000,%eax
  102c5d:	3d 00 00 00 01       	cmp    $0x1000000,%eax
  102c62:	76 dc                	jbe    102c40 <kinit+0x2f>
  102c64:	90                   	nop
  102c65:	c9                   	leave  
  102c66:	c3                   	ret    

00102c67 <kfree>:
  102c67:	55                   	push   %ebp
  102c68:	89 e5                	mov    %esp,%ebp
  102c6a:	83 ec 18             	sub    $0x18,%esp
  102c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c70:	25 ff 0f 00 00       	and    $0xfff,%eax
  102c75:	85 c0                	test   %eax,%eax
  102c77:	75 13                	jne    102c8c <kfree+0x25>
  102c79:	81 7d 08 34 59 11 00 	cmpl   $0x115934,0x8(%ebp)
  102c80:	72 0a                	jb     102c8c <kfree+0x25>
  102c82:	8b 45 08             	mov    0x8(%ebp),%eax
  102c85:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  102c8a:	76 0d                	jbe    102c99 <kfree+0x32>
  102c8c:	83 ec 0c             	sub    $0xc,%esp
  102c8f:	68 ef 8f 10 00       	push   $0x108fef
  102c94:	e8 df d8 ff ff       	call   100578 <panic>
  102c99:	83 ec 04             	sub    $0x4,%esp
  102c9c:	68 00 10 00 00       	push   $0x1000
  102ca1:	6a 01                	push   $0x1
  102ca3:	ff 75 08             	pushl  0x8(%ebp)
  102ca6:	e8 da 1e 00 00       	call   104b85 <memset>
  102cab:	83 c4 10             	add    $0x10,%esp
  102cae:	83 ec 0c             	sub    $0xc,%esp
  102cb1:	68 60 0d 11 00       	push   $0x110d60
  102cb6:	e8 8d 1c 00 00       	call   104948 <acquire>
  102cbb:	83 c4 10             	add    $0x10,%esp
  102cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cc4:	8b 15 94 0d 11 00    	mov    0x110d94,%edx
  102cca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ccd:	89 10                	mov    %edx,(%eax)
  102ccf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cd2:	a3 94 0d 11 00       	mov    %eax,0x110d94
  102cd7:	83 ec 0c             	sub    $0xc,%esp
  102cda:	68 60 0d 11 00       	push   $0x110d60
  102cdf:	e8 cb 1c 00 00       	call   1049af <release>
  102ce4:	83 c4 10             	add    $0x10,%esp
  102ce7:	90                   	nop
  102ce8:	c9                   	leave  
  102ce9:	c3                   	ret    

00102cea <kalloc>:
  102cea:	55                   	push   %ebp
  102ceb:	89 e5                	mov    %esp,%ebp
  102ced:	83 ec 18             	sub    $0x18,%esp
  102cf0:	83 ec 0c             	sub    $0xc,%esp
  102cf3:	68 60 0d 11 00       	push   $0x110d60
  102cf8:	e8 4b 1c 00 00       	call   104948 <acquire>
  102cfd:	83 c4 10             	add    $0x10,%esp
  102d00:	a1 94 0d 11 00       	mov    0x110d94,%eax
  102d05:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d08:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102d0c:	74 0a                	je     102d18 <kalloc+0x2e>
  102d0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d11:	8b 00                	mov    (%eax),%eax
  102d13:	a3 94 0d 11 00       	mov    %eax,0x110d94
  102d18:	83 ec 0c             	sub    $0xc,%esp
  102d1b:	68 60 0d 11 00       	push   $0x110d60
  102d20:	e8 8a 1c 00 00       	call   1049af <release>
  102d25:	83 c4 10             	add    $0x10,%esp
  102d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d2b:	c9                   	leave  
  102d2c:	c3                   	ret    

00102d2d <inb>:
  102d2d:	55                   	push   %ebp
  102d2e:	89 e5                	mov    %esp,%ebp
  102d30:	83 ec 14             	sub    $0x14,%esp
  102d33:	8b 45 08             	mov    0x8(%ebp),%eax
  102d36:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  102d3a:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  102d3e:	89 c2                	mov    %eax,%edx
  102d40:	ec                   	in     (%dx),%al
  102d41:	88 45 ff             	mov    %al,-0x1(%ebp)
  102d44:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  102d48:	c9                   	leave  
  102d49:	c3                   	ret    

00102d4a <kbdgetc>:
  102d4a:	55                   	push   %ebp
  102d4b:	89 e5                	mov    %esp,%ebp
  102d4d:	83 ec 10             	sub    $0x10,%esp
  102d50:	6a 64                	push   $0x64
  102d52:	e8 d6 ff ff ff       	call   102d2d <inb>
  102d57:	83 c4 04             	add    $0x4,%esp
  102d5a:	0f b6 c0             	movzbl %al,%eax
  102d5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d63:	83 e0 01             	and    $0x1,%eax
  102d66:	85 c0                	test   %eax,%eax
  102d68:	75 0a                	jne    102d74 <kbdgetc+0x2a>
  102d6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102d6f:	e9 23 01 00 00       	jmp    102e97 <kbdgetc+0x14d>
  102d74:	6a 60                	push   $0x60
  102d76:	e8 b2 ff ff ff       	call   102d2d <inb>
  102d7b:	83 c4 04             	add    $0x4,%esp
  102d7e:	0f b6 c0             	movzbl %al,%eax
  102d81:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102d84:	81 7d fc e0 00 00 00 	cmpl   $0xe0,-0x4(%ebp)
  102d8b:	75 17                	jne    102da4 <kbdgetc+0x5a>
  102d8d:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102d92:	83 c8 40             	or     $0x40,%eax
  102d95:	a3 60 cb 10 00       	mov    %eax,0x10cb60
  102d9a:	b8 00 00 00 00       	mov    $0x0,%eax
  102d9f:	e9 f3 00 00 00       	jmp    102e97 <kbdgetc+0x14d>
  102da4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102da7:	25 80 00 00 00       	and    $0x80,%eax
  102dac:	85 c0                	test   %eax,%eax
  102dae:	74 45                	je     102df5 <kbdgetc+0xab>
  102db0:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102db5:	83 e0 40             	and    $0x40,%eax
  102db8:	85 c0                	test   %eax,%eax
  102dba:	75 08                	jne    102dc4 <kbdgetc+0x7a>
  102dbc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102dbf:	83 e0 7f             	and    $0x7f,%eax
  102dc2:	eb 03                	jmp    102dc7 <kbdgetc+0x7d>
  102dc4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102dc7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102dca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102dcd:	05 20 c0 10 00       	add    $0x10c020,%eax
  102dd2:	0f b6 00             	movzbl (%eax),%eax
  102dd5:	83 c8 40             	or     $0x40,%eax
  102dd8:	0f b6 c0             	movzbl %al,%eax
  102ddb:	f7 d0                	not    %eax
  102ddd:	89 c2                	mov    %eax,%edx
  102ddf:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102de4:	21 d0                	and    %edx,%eax
  102de6:	a3 60 cb 10 00       	mov    %eax,0x10cb60
  102deb:	b8 00 00 00 00       	mov    $0x0,%eax
  102df0:	e9 a2 00 00 00       	jmp    102e97 <kbdgetc+0x14d>
  102df5:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102dfa:	83 e0 40             	and    $0x40,%eax
  102dfd:	85 c0                	test   %eax,%eax
  102dff:	74 14                	je     102e15 <kbdgetc+0xcb>
  102e01:	81 4d fc 80 00 00 00 	orl    $0x80,-0x4(%ebp)
  102e08:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102e0d:	83 e0 bf             	and    $0xffffffbf,%eax
  102e10:	a3 60 cb 10 00       	mov    %eax,0x10cb60
  102e15:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e18:	05 20 c0 10 00       	add    $0x10c020,%eax
  102e1d:	0f b6 00             	movzbl (%eax),%eax
  102e20:	0f b6 d0             	movzbl %al,%edx
  102e23:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102e28:	09 d0                	or     %edx,%eax
  102e2a:	a3 60 cb 10 00       	mov    %eax,0x10cb60
  102e2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e32:	05 20 c1 10 00       	add    $0x10c120,%eax
  102e37:	0f b6 00             	movzbl (%eax),%eax
  102e3a:	0f b6 d0             	movzbl %al,%edx
  102e3d:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102e42:	31 d0                	xor    %edx,%eax
  102e44:	a3 60 cb 10 00       	mov    %eax,0x10cb60
  102e49:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102e4e:	83 e0 03             	and    $0x3,%eax
  102e51:	8b 14 85 20 c5 10 00 	mov    0x10c520(,%eax,4),%edx
  102e58:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e5b:	01 d0                	add    %edx,%eax
  102e5d:	0f b6 00             	movzbl (%eax),%eax
  102e60:	0f b6 c0             	movzbl %al,%eax
  102e63:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102e66:	a1 60 cb 10 00       	mov    0x10cb60,%eax
  102e6b:	83 e0 08             	and    $0x8,%eax
  102e6e:	85 c0                	test   %eax,%eax
  102e70:	74 22                	je     102e94 <kbdgetc+0x14a>
  102e72:	83 7d f8 60          	cmpl   $0x60,-0x8(%ebp)
  102e76:	76 0c                	jbe    102e84 <kbdgetc+0x13a>
  102e78:	83 7d f8 7a          	cmpl   $0x7a,-0x8(%ebp)
  102e7c:	77 06                	ja     102e84 <kbdgetc+0x13a>
  102e7e:	83 6d f8 20          	subl   $0x20,-0x8(%ebp)
  102e82:	eb 10                	jmp    102e94 <kbdgetc+0x14a>
  102e84:	83 7d f8 40          	cmpl   $0x40,-0x8(%ebp)
  102e88:	76 0a                	jbe    102e94 <kbdgetc+0x14a>
  102e8a:	83 7d f8 5a          	cmpl   $0x5a,-0x8(%ebp)
  102e8e:	77 04                	ja     102e94 <kbdgetc+0x14a>
  102e90:	83 45 f8 20          	addl   $0x20,-0x8(%ebp)
  102e94:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e97:	c9                   	leave  
  102e98:	c3                   	ret    

00102e99 <kbdintr>:
  102e99:	55                   	push   %ebp
  102e9a:	89 e5                	mov    %esp,%ebp
  102e9c:	83 ec 08             	sub    $0x8,%esp
  102e9f:	83 ec 0c             	sub    $0xc,%esp
  102ea2:	68 4a 2d 10 00       	push   $0x102d4a
  102ea7:	e8 5d d9 ff ff       	call   100809 <consoleintr>
  102eac:	83 c4 10             	add    $0x10,%esp
  102eaf:	90                   	nop
  102eb0:	c9                   	leave  
  102eb1:	c3                   	ret    

00102eb2 <outb>:
  102eb2:	55                   	push   %ebp
  102eb3:	89 e5                	mov    %esp,%ebp
  102eb5:	83 ec 08             	sub    $0x8,%esp
  102eb8:	8b 55 08             	mov    0x8(%ebp),%edx
  102ebb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ebe:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  102ec2:	88 45 f8             	mov    %al,-0x8(%ebp)
  102ec5:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  102ec9:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  102ecd:	ee                   	out    %al,(%dx)
  102ece:	90                   	nop
  102ecf:	c9                   	leave  
  102ed0:	c3                   	ret    

00102ed1 <readeflags>:
  102ed1:	55                   	push   %ebp
  102ed2:	89 e5                	mov    %esp,%ebp
  102ed4:	83 ec 10             	sub    $0x10,%esp
  102ed7:	9c                   	pushf  
  102ed8:	58                   	pop    %eax
  102ed9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102edc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102edf:	c9                   	leave  
  102ee0:	c3                   	ret    

00102ee1 <lapicw>:
  102ee1:	55                   	push   %ebp
  102ee2:	89 e5                	mov    %esp,%ebp
  102ee4:	a1 98 0d 11 00       	mov    0x110d98,%eax
  102ee9:	8b 55 08             	mov    0x8(%ebp),%edx
  102eec:	c1 e2 02             	shl    $0x2,%edx
  102eef:	01 c2                	add    %eax,%edx
  102ef1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ef4:	89 02                	mov    %eax,(%edx)
  102ef6:	a1 98 0d 11 00       	mov    0x110d98,%eax
  102efb:	83 c0 20             	add    $0x20,%eax
  102efe:	8b 00                	mov    (%eax),%eax
  102f00:	90                   	nop
  102f01:	5d                   	pop    %ebp
  102f02:	c3                   	ret    

00102f03 <lapicinit>:
  102f03:	55                   	push   %ebp
  102f04:	89 e5                	mov    %esp,%ebp
  102f06:	83 ec 08             	sub    $0x8,%esp
  102f09:	a1 98 0d 11 00       	mov    0x110d98,%eax
  102f0e:	83 ec 04             	sub    $0x4,%esp
  102f11:	50                   	push   %eax
  102f12:	ff 75 08             	pushl  0x8(%ebp)
  102f15:	68 f8 8f 10 00       	push   $0x108ff8
  102f1a:	e8 cd d4 ff ff       	call   1003ec <cprintf>
  102f1f:	83 c4 10             	add    $0x10,%esp
  102f22:	a1 98 0d 11 00       	mov    0x110d98,%eax
  102f27:	85 c0                	test   %eax,%eax
  102f29:	0f 84 35 01 00 00    	je     103064 <lapicinit+0x161>
  102f2f:	83 ec 08             	sub    $0x8,%esp
  102f32:	68 3f 01 00 00       	push   $0x13f
  102f37:	6a 3c                	push   $0x3c
  102f39:	e8 a3 ff ff ff       	call   102ee1 <lapicw>
  102f3e:	83 c4 10             	add    $0x10,%esp
  102f41:	83 ec 08             	sub    $0x8,%esp
  102f44:	6a 0b                	push   $0xb
  102f46:	68 f8 00 00 00       	push   $0xf8
  102f4b:	e8 91 ff ff ff       	call   102ee1 <lapicw>
  102f50:	83 c4 10             	add    $0x10,%esp
  102f53:	83 ec 08             	sub    $0x8,%esp
  102f56:	68 20 00 02 00       	push   $0x20020
  102f5b:	68 c8 00 00 00       	push   $0xc8
  102f60:	e8 7c ff ff ff       	call   102ee1 <lapicw>
  102f65:	83 c4 10             	add    $0x10,%esp
  102f68:	83 ec 08             	sub    $0x8,%esp
  102f6b:	68 80 96 98 00       	push   $0x989680
  102f70:	68 e0 00 00 00       	push   $0xe0
  102f75:	e8 67 ff ff ff       	call   102ee1 <lapicw>
  102f7a:	83 c4 10             	add    $0x10,%esp
  102f7d:	83 ec 08             	sub    $0x8,%esp
  102f80:	68 00 00 01 00       	push   $0x10000
  102f85:	68 d4 00 00 00       	push   $0xd4
  102f8a:	e8 52 ff ff ff       	call   102ee1 <lapicw>
  102f8f:	83 c4 10             	add    $0x10,%esp
  102f92:	83 ec 08             	sub    $0x8,%esp
  102f95:	68 00 00 01 00       	push   $0x10000
  102f9a:	68 d8 00 00 00       	push   $0xd8
  102f9f:	e8 3d ff ff ff       	call   102ee1 <lapicw>
  102fa4:	83 c4 10             	add    $0x10,%esp
  102fa7:	a1 98 0d 11 00       	mov    0x110d98,%eax
  102fac:	83 c0 30             	add    $0x30,%eax
  102faf:	8b 00                	mov    (%eax),%eax
  102fb1:	c1 e8 10             	shr    $0x10,%eax
  102fb4:	0f b6 c0             	movzbl %al,%eax
  102fb7:	83 f8 03             	cmp    $0x3,%eax
  102fba:	76 15                	jbe    102fd1 <lapicinit+0xce>
  102fbc:	83 ec 08             	sub    $0x8,%esp
  102fbf:	68 00 00 01 00       	push   $0x10000
  102fc4:	68 d0 00 00 00       	push   $0xd0
  102fc9:	e8 13 ff ff ff       	call   102ee1 <lapicw>
  102fce:	83 c4 10             	add    $0x10,%esp
  102fd1:	83 ec 08             	sub    $0x8,%esp
  102fd4:	6a 33                	push   $0x33
  102fd6:	68 dc 00 00 00       	push   $0xdc
  102fdb:	e8 01 ff ff ff       	call   102ee1 <lapicw>
  102fe0:	83 c4 10             	add    $0x10,%esp
  102fe3:	83 ec 08             	sub    $0x8,%esp
  102fe6:	6a 00                	push   $0x0
  102fe8:	68 a0 00 00 00       	push   $0xa0
  102fed:	e8 ef fe ff ff       	call   102ee1 <lapicw>
  102ff2:	83 c4 10             	add    $0x10,%esp
  102ff5:	83 ec 08             	sub    $0x8,%esp
  102ff8:	6a 00                	push   $0x0
  102ffa:	68 a0 00 00 00       	push   $0xa0
  102fff:	e8 dd fe ff ff       	call   102ee1 <lapicw>
  103004:	83 c4 10             	add    $0x10,%esp
  103007:	83 ec 08             	sub    $0x8,%esp
  10300a:	6a 00                	push   $0x0
  10300c:	6a 2c                	push   $0x2c
  10300e:	e8 ce fe ff ff       	call   102ee1 <lapicw>
  103013:	83 c4 10             	add    $0x10,%esp
  103016:	83 ec 08             	sub    $0x8,%esp
  103019:	6a 00                	push   $0x0
  10301b:	68 c4 00 00 00       	push   $0xc4
  103020:	e8 bc fe ff ff       	call   102ee1 <lapicw>
  103025:	83 c4 10             	add    $0x10,%esp
  103028:	83 ec 08             	sub    $0x8,%esp
  10302b:	68 00 85 08 00       	push   $0x88500
  103030:	68 c0 00 00 00       	push   $0xc0
  103035:	e8 a7 fe ff ff       	call   102ee1 <lapicw>
  10303a:	83 c4 10             	add    $0x10,%esp
  10303d:	90                   	nop
  10303e:	a1 98 0d 11 00       	mov    0x110d98,%eax
  103043:	05 00 03 00 00       	add    $0x300,%eax
  103048:	8b 00                	mov    (%eax),%eax
  10304a:	25 00 10 00 00       	and    $0x1000,%eax
  10304f:	85 c0                	test   %eax,%eax
  103051:	75 eb                	jne    10303e <lapicinit+0x13b>
  103053:	83 ec 08             	sub    $0x8,%esp
  103056:	6a 00                	push   $0x0
  103058:	6a 20                	push   $0x20
  10305a:	e8 82 fe ff ff       	call   102ee1 <lapicw>
  10305f:	83 c4 10             	add    $0x10,%esp
  103062:	eb 01                	jmp    103065 <lapicinit+0x162>
  103064:	90                   	nop
  103065:	c9                   	leave  
  103066:	c3                   	ret    

00103067 <cpunum>:
  103067:	55                   	push   %ebp
  103068:	89 e5                	mov    %esp,%ebp
  10306a:	83 ec 08             	sub    $0x8,%esp
  10306d:	e8 5f fe ff ff       	call   102ed1 <readeflags>
  103072:	25 00 02 00 00       	and    $0x200,%eax
  103077:	85 c0                	test   %eax,%eax
  103079:	74 26                	je     1030a1 <cpunum+0x3a>
  10307b:	a1 64 cb 10 00       	mov    0x10cb64,%eax
  103080:	8d 50 01             	lea    0x1(%eax),%edx
  103083:	89 15 64 cb 10 00    	mov    %edx,0x10cb64
  103089:	85 c0                	test   %eax,%eax
  10308b:	75 14                	jne    1030a1 <cpunum+0x3a>
  10308d:	8b 45 04             	mov    0x4(%ebp),%eax
  103090:	83 ec 08             	sub    $0x8,%esp
  103093:	50                   	push   %eax
  103094:	68 0c 90 10 00       	push   $0x10900c
  103099:	e8 4e d3 ff ff       	call   1003ec <cprintf>
  10309e:	83 c4 10             	add    $0x10,%esp
  1030a1:	a1 98 0d 11 00       	mov    0x110d98,%eax
  1030a6:	85 c0                	test   %eax,%eax
  1030a8:	74 0f                	je     1030b9 <cpunum+0x52>
  1030aa:	a1 98 0d 11 00       	mov    0x110d98,%eax
  1030af:	83 c0 20             	add    $0x20,%eax
  1030b2:	8b 00                	mov    (%eax),%eax
  1030b4:	c1 e8 18             	shr    $0x18,%eax
  1030b7:	eb 05                	jmp    1030be <cpunum+0x57>
  1030b9:	b8 00 00 00 00       	mov    $0x0,%eax
  1030be:	c9                   	leave  
  1030bf:	c3                   	ret    

001030c0 <lapiceoi>:
  1030c0:	55                   	push   %ebp
  1030c1:	89 e5                	mov    %esp,%ebp
  1030c3:	a1 98 0d 11 00       	mov    0x110d98,%eax
  1030c8:	85 c0                	test   %eax,%eax
  1030ca:	74 0c                	je     1030d8 <lapiceoi+0x18>
  1030cc:	6a 00                	push   $0x0
  1030ce:	6a 2c                	push   $0x2c
  1030d0:	e8 0c fe ff ff       	call   102ee1 <lapicw>
  1030d5:	83 c4 08             	add    $0x8,%esp
  1030d8:	90                   	nop
  1030d9:	c9                   	leave  
  1030da:	c3                   	ret    

001030db <microdelay>:
  1030db:	55                   	push   %ebp
  1030dc:	89 e5                	mov    %esp,%ebp
  1030de:	90                   	nop
  1030df:	5d                   	pop    %ebp
  1030e0:	c3                   	ret    

001030e1 <lapicstartap>:
  1030e1:	55                   	push   %ebp
  1030e2:	89 e5                	mov    %esp,%ebp
  1030e4:	83 ec 14             	sub    $0x14,%esp
  1030e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ea:	88 45 ec             	mov    %al,-0x14(%ebp)
  1030ed:	6a 0f                	push   $0xf
  1030ef:	6a 70                	push   $0x70
  1030f1:	e8 bc fd ff ff       	call   102eb2 <outb>
  1030f6:	83 c4 08             	add    $0x8,%esp
  1030f9:	6a 0a                	push   $0xa
  1030fb:	6a 71                	push   $0x71
  1030fd:	e8 b0 fd ff ff       	call   102eb2 <outb>
  103102:	83 c4 08             	add    $0x8,%esp
  103105:	c7 45 f8 67 04 00 00 	movl   $0x467,-0x8(%ebp)
  10310c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10310f:	66 c7 00 00 00       	movw   $0x0,(%eax)
  103114:	8b 45 0c             	mov    0xc(%ebp),%eax
  103117:	c1 e8 04             	shr    $0x4,%eax
  10311a:	89 c2                	mov    %eax,%edx
  10311c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10311f:	83 c0 02             	add    $0x2,%eax
  103122:	66 89 10             	mov    %dx,(%eax)
  103125:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  103129:	c1 e0 18             	shl    $0x18,%eax
  10312c:	50                   	push   %eax
  10312d:	68 c4 00 00 00       	push   $0xc4
  103132:	e8 aa fd ff ff       	call   102ee1 <lapicw>
  103137:	83 c4 08             	add    $0x8,%esp
  10313a:	68 00 c5 00 00       	push   $0xc500
  10313f:	68 c0 00 00 00       	push   $0xc0
  103144:	e8 98 fd ff ff       	call   102ee1 <lapicw>
  103149:	83 c4 08             	add    $0x8,%esp
  10314c:	68 c8 00 00 00       	push   $0xc8
  103151:	e8 85 ff ff ff       	call   1030db <microdelay>
  103156:	83 c4 04             	add    $0x4,%esp
  103159:	68 00 85 00 00       	push   $0x8500
  10315e:	68 c0 00 00 00       	push   $0xc0
  103163:	e8 79 fd ff ff       	call   102ee1 <lapicw>
  103168:	83 c4 08             	add    $0x8,%esp
  10316b:	6a 64                	push   $0x64
  10316d:	e8 69 ff ff ff       	call   1030db <microdelay>
  103172:	83 c4 04             	add    $0x4,%esp
  103175:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10317c:	eb 3d                	jmp    1031bb <lapicstartap+0xda>
  10317e:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  103182:	c1 e0 18             	shl    $0x18,%eax
  103185:	50                   	push   %eax
  103186:	68 c4 00 00 00       	push   $0xc4
  10318b:	e8 51 fd ff ff       	call   102ee1 <lapicw>
  103190:	83 c4 08             	add    $0x8,%esp
  103193:	8b 45 0c             	mov    0xc(%ebp),%eax
  103196:	c1 e8 0c             	shr    $0xc,%eax
  103199:	80 cc 06             	or     $0x6,%ah
  10319c:	50                   	push   %eax
  10319d:	68 c0 00 00 00       	push   $0xc0
  1031a2:	e8 3a fd ff ff       	call   102ee1 <lapicw>
  1031a7:	83 c4 08             	add    $0x8,%esp
  1031aa:	68 c8 00 00 00       	push   $0xc8
  1031af:	e8 27 ff ff ff       	call   1030db <microdelay>
  1031b4:	83 c4 04             	add    $0x4,%esp
  1031b7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1031bb:	83 7d fc 01          	cmpl   $0x1,-0x4(%ebp)
  1031bf:	7e bd                	jle    10317e <lapicstartap+0x9d>
  1031c1:	90                   	nop
  1031c2:	c9                   	leave  
  1031c3:	c3                   	ret    

001031c4 <sti>:
  1031c4:	55                   	push   %ebp
  1031c5:	89 e5                	mov    %esp,%ebp
  1031c7:	fb                   	sti    
  1031c8:	90                   	nop
  1031c9:	5d                   	pop    %ebp
  1031ca:	c3                   	ret    

001031cb <xchg>:
  1031cb:	55                   	push   %ebp
  1031cc:	89 e5                	mov    %esp,%ebp
  1031ce:	83 ec 10             	sub    $0x10,%esp
  1031d1:	8b 55 08             	mov    0x8(%ebp),%edx
  1031d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1031da:	f0 87 02             	lock xchg %eax,(%edx)
  1031dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1031e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031e3:	c9                   	leave  
  1031e4:	c3                   	ret    

001031e5 <main>:
  1031e5:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  1031e9:	83 e4 f0             	and    $0xfffffff0,%esp
  1031ec:	ff 71 fc             	pushl  -0x4(%ecx)
  1031ef:	55                   	push   %ebp
  1031f0:	89 e5                	mov    %esp,%ebp
  1031f2:	51                   	push   %ecx
  1031f3:	83 ec 04             	sub    $0x4,%esp
  1031f6:	e8 6c 04 00 00       	call   103667 <mpinit>
  1031fb:	e8 5a 02 00 00       	call   10345a <mpbcpu>
  103200:	83 ec 0c             	sub    $0xc,%esp
  103203:	50                   	push   %eax
  103204:	e8 fa fc ff ff       	call   102f03 <lapicinit>
  103209:	83 c4 10             	add    $0x10,%esp
  10320c:	e8 62 3e 00 00       	call   107073 <seginit>
  103211:	e8 fb f9 ff ff       	call   102c11 <kinit>
  103216:	e8 00 00 00 00       	call   10321b <jmpkstack>

0010321b <jmpkstack>:
  10321b:	55                   	push   %ebp
  10321c:	89 e5                	mov    %esp,%ebp
  10321e:	83 ec 18             	sub    $0x18,%esp
  103221:	e8 c4 fa ff ff       	call   102cea <kalloc>
  103226:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103229:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10322d:	75 0d                	jne    10323c <jmpkstack+0x21>
  10322f:	83 ec 0c             	sub    $0xc,%esp
  103232:	68 38 90 10 00       	push   $0x109038
  103237:	e8 3c d3 ff ff       	call   100578 <panic>
  10323c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10323f:	05 00 10 00 00       	add    $0x1000,%eax
  103244:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103247:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10324a:	89 c4                	mov    %eax,%esp
  10324c:	e8 0d 00 00 00       	call   10325e <mainc>
  103251:	83 ec 0c             	sub    $0xc,%esp
  103254:	68 49 90 10 00       	push   $0x109049
  103259:	e8 1a d3 ff ff       	call   100578 <panic>

0010325e <mainc>:
  10325e:	55                   	push   %ebp
  10325f:	89 e5                	mov    %esp,%ebp
  103261:	83 ec 08             	sub    $0x8,%esp
  103264:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  10326a:	0f b6 00             	movzbl (%eax),%eax
  10326d:	0f b6 c0             	movzbl %al,%eax
  103270:	83 ec 08             	sub    $0x8,%esp
  103273:	50                   	push   %eax
  103274:	68 53 90 10 00       	push   $0x109053
  103279:	e8 6e d1 ff ff       	call   1003ec <cprintf>
  10327e:	83 c4 10             	add    $0x10,%esp
  103281:	e8 37 06 00 00       	call   1038bd <picinit>
  103286:	e8 88 f8 ff ff       	call   102b13 <ioapicinit>
  10328b:	e8 85 d8 ff ff       	call   100b15 <consoleinit>
  103290:	e8 24 31 00 00       	call   1063b9 <uartinit>
  103295:	e8 c6 3d 00 00       	call   107060 <kvmalloc>
  10329a:	e8 1e 0b 00 00       	call   103dbd <pinit>
  10329f:	e8 d3 2c 00 00       	call   105f77 <tvinit>
  1032a4:	e8 c1 cd ff ff       	call   10006a <binit>
  1032a9:	e8 a7 dc ff ff       	call   100f55 <fileinit>
  1032ae:	e8 ef e2 ff ff       	call   1015a2 <iinit>
  1032b3:	e8 84 f3 ff ff       	call   10263c <ideinit>
  1032b8:	e8 7b 4a 00 00       	call   107d38 <vfsinit>
  1032bd:	e8 e4 52 00 00       	call   1085a6 <ram_init>
  1032c2:	a1 a4 0d 11 00       	mov    0x110da4,%eax
  1032c7:	85 c0                	test   %eax,%eax
  1032c9:	75 05                	jne    1032d0 <mainc+0x72>
  1032cb:	e8 04 2c 00 00       	call   105ed4 <timerinit>
  1032d0:	e8 97 00 00 00       	call   10336c <bootothers>
  1032d5:	e8 0f 00 00 00       	call   1032e9 <cinit>
  1032da:	e8 e5 fe ff ff       	call   1031c4 <sti>
  1032df:	e8 fd 0b 00 00       	call   103ee1 <userinit>
  1032e4:	e8 b1 11 00 00       	call   10449a <scheduler>

001032e9 <cinit>:
  1032e9:	55                   	push   %ebp
  1032ea:	89 e5                	mov    %esp,%ebp
  1032ec:	53                   	push   %ebx
  1032ed:	83 ec 04             	sub    $0x4,%esp
  1032f0:	e8 72 fd ff ff       	call   103067 <cpunum>
  1032f5:	89 c3                	mov    %eax,%ebx
  1032f7:	e8 5e 01 00 00       	call   10345a <mpbcpu>
  1032fc:	39 c3                	cmp    %eax,%ebx
  1032fe:	74 16                	je     103316 <cinit+0x2d>
  103300:	e8 6e 3d 00 00       	call   107073 <seginit>
  103305:	e8 5d fd ff ff       	call   103067 <cpunum>
  10330a:	83 ec 0c             	sub    $0xc,%esp
  10330d:	50                   	push   %eax
  10330e:	e8 f0 fb ff ff       	call   102f03 <lapicinit>
  103313:	83 c4 10             	add    $0x10,%esp
  103316:	e8 81 43 00 00       	call   10769c <vmenable>
  10331b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  103321:	0f b6 00             	movzbl (%eax),%eax
  103324:	0f b6 c0             	movzbl %al,%eax
  103327:	83 ec 08             	sub    $0x8,%esp
  10332a:	50                   	push   %eax
  10332b:	68 6a 90 10 00       	push   $0x10906a
  103330:	e8 b7 d0 ff ff       	call   1003ec <cprintf>
  103335:	83 c4 10             	add    $0x10,%esp
  103338:	e8 b0 2d 00 00       	call   1060ed <idtinit>
  10333d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  103343:	05 a8 00 00 00       	add    $0xa8,%eax
  103348:	83 ec 08             	sub    $0x8,%esp
  10334b:	6a 01                	push   $0x1
  10334d:	50                   	push   %eax
  10334e:	e8 78 fe ff ff       	call   1031cb <xchg>
  103353:	83 c4 10             	add    $0x10,%esp
  103356:	90                   	nop
  103357:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10335a:	c9                   	leave  
  10335b:	c3                   	ret    

0010335c <mpmain>:
  10335c:	55                   	push   %ebp
  10335d:	89 e5                	mov    %esp,%ebp
  10335f:	83 ec 08             	sub    $0x8,%esp
  103362:	e8 82 ff ff ff       	call   1032e9 <cinit>
  103367:	e8 2e 11 00 00       	call   10449a <scheduler>

0010336c <bootothers>:
  10336c:	55                   	push   %ebp
  10336d:	89 e5                	mov    %esp,%ebp
  10336f:	83 ec 18             	sub    $0x18,%esp
  103372:	c7 45 f0 00 70 00 00 	movl   $0x7000,-0x10(%ebp)
  103379:	b8 6a 00 00 00       	mov    $0x6a,%eax
  10337e:	83 ec 04             	sub    $0x4,%esp
  103381:	50                   	push   %eax
  103382:	68 4c ca 10 00       	push   $0x10ca4c
  103387:	ff 75 f0             	pushl  -0x10(%ebp)
  10338a:	e8 68 18 00 00       	call   104bf7 <memmove>
  10338f:	83 c4 10             	add    $0x10,%esp
  103392:	c7 45 f4 c0 0d 11 00 	movl   $0x110dc0,-0xc(%ebp)
  103399:	eb 6b                	jmp    103406 <bootothers+0x9a>
  10339b:	e8 c7 fc ff ff       	call   103067 <cpunum>
  1033a0:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  1033a6:	05 c0 0d 11 00       	add    $0x110dc0,%eax
  1033ab:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1033ae:	74 4e                	je     1033fe <bootothers+0x92>
  1033b0:	e8 35 f9 ff ff       	call   102cea <kalloc>
  1033b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1033b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033bb:	83 e8 04             	sub    $0x4,%eax
  1033be:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1033c1:	81 c2 00 10 00 00    	add    $0x1000,%edx
  1033c7:	89 10                	mov    %edx,(%eax)
  1033c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033cc:	83 e8 08             	sub    $0x8,%eax
  1033cf:	c7 00 5c 33 10 00    	movl   $0x10335c,(%eax)
  1033d5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1033d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033db:	0f b6 00             	movzbl (%eax),%eax
  1033de:	0f b6 c0             	movzbl %al,%eax
  1033e1:	83 ec 08             	sub    $0x8,%esp
  1033e4:	52                   	push   %edx
  1033e5:	50                   	push   %eax
  1033e6:	e8 f6 fc ff ff       	call   1030e1 <lapicstartap>
  1033eb:	83 c4 10             	add    $0x10,%esp
  1033ee:	90                   	nop
  1033ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033f2:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
  1033f8:	85 c0                	test   %eax,%eax
  1033fa:	74 f3                	je     1033ef <bootothers+0x83>
  1033fc:	eb 01                	jmp    1033ff <bootothers+0x93>
  1033fe:	90                   	nop
  1033ff:	81 45 f4 bc 00 00 00 	addl   $0xbc,-0xc(%ebp)
  103406:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  10340b:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  103411:	05 c0 0d 11 00       	add    $0x110dc0,%eax
  103416:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103419:	72 80                	jb     10339b <bootothers+0x2f>
  10341b:	90                   	nop
  10341c:	c9                   	leave  
  10341d:	c3                   	ret    

0010341e <inb>:
  10341e:	55                   	push   %ebp
  10341f:	89 e5                	mov    %esp,%ebp
  103421:	83 ec 14             	sub    $0x14,%esp
  103424:	8b 45 08             	mov    0x8(%ebp),%eax
  103427:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10342b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10342f:	89 c2                	mov    %eax,%edx
  103431:	ec                   	in     (%dx),%al
  103432:	88 45 ff             	mov    %al,-0x1(%ebp)
  103435:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  103439:	c9                   	leave  
  10343a:	c3                   	ret    

0010343b <outb>:
  10343b:	55                   	push   %ebp
  10343c:	89 e5                	mov    %esp,%ebp
  10343e:	83 ec 08             	sub    $0x8,%esp
  103441:	8b 55 08             	mov    0x8(%ebp),%edx
  103444:	8b 45 0c             	mov    0xc(%ebp),%eax
  103447:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  10344b:	88 45 f8             	mov    %al,-0x8(%ebp)
  10344e:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  103452:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  103456:	ee                   	out    %al,(%dx)
  103457:	90                   	nop
  103458:	c9                   	leave  
  103459:	c3                   	ret    

0010345a <mpbcpu>:
  10345a:	55                   	push   %ebp
  10345b:	89 e5                	mov    %esp,%ebp
  10345d:	a1 68 cb 10 00       	mov    0x10cb68,%eax
  103462:	89 c2                	mov    %eax,%edx
  103464:	b8 c0 0d 11 00       	mov    $0x110dc0,%eax
  103469:	29 c2                	sub    %eax,%edx
  10346b:	89 d0                	mov    %edx,%eax
  10346d:	c1 f8 02             	sar    $0x2,%eax
  103470:	69 c0 cf 46 7d 67    	imul   $0x677d46cf,%eax,%eax
  103476:	5d                   	pop    %ebp
  103477:	c3                   	ret    

00103478 <sum>:
  103478:	55                   	push   %ebp
  103479:	89 e5                	mov    %esp,%ebp
  10347b:	83 ec 10             	sub    $0x10,%esp
  10347e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  103485:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10348c:	eb 15                	jmp    1034a3 <sum+0x2b>
  10348e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103491:	8b 45 08             	mov    0x8(%ebp),%eax
  103494:	01 d0                	add    %edx,%eax
  103496:	0f b6 00             	movzbl (%eax),%eax
  103499:	0f b6 c0             	movzbl %al,%eax
  10349c:	01 45 f8             	add    %eax,-0x8(%ebp)
  10349f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1034a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1034a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1034a9:	7c e3                	jl     10348e <sum+0x16>
  1034ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034ae:	c9                   	leave  
  1034af:	c3                   	ret    

001034b0 <mpsearch1>:
  1034b0:	55                   	push   %ebp
  1034b1:	89 e5                	mov    %esp,%ebp
  1034b3:	83 ec 18             	sub    $0x18,%esp
  1034b6:	8b 55 0c             	mov    0xc(%ebp),%edx
  1034b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1034bc:	01 d0                	add    %edx,%eax
  1034be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1034c7:	eb 36                	jmp    1034ff <mpsearch1+0x4f>
  1034c9:	83 ec 04             	sub    $0x4,%esp
  1034cc:	6a 04                	push   $0x4
  1034ce:	68 7c 90 10 00       	push   $0x10907c
  1034d3:	ff 75 f4             	pushl  -0xc(%ebp)
  1034d6:	e8 c4 16 00 00       	call   104b9f <memcmp>
  1034db:	83 c4 10             	add    $0x10,%esp
  1034de:	85 c0                	test   %eax,%eax
  1034e0:	75 19                	jne    1034fb <mpsearch1+0x4b>
  1034e2:	83 ec 08             	sub    $0x8,%esp
  1034e5:	6a 10                	push   $0x10
  1034e7:	ff 75 f4             	pushl  -0xc(%ebp)
  1034ea:	e8 89 ff ff ff       	call   103478 <sum>
  1034ef:	83 c4 10             	add    $0x10,%esp
  1034f2:	84 c0                	test   %al,%al
  1034f4:	75 05                	jne    1034fb <mpsearch1+0x4b>
  1034f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1034f9:	eb 11                	jmp    10350c <mpsearch1+0x5c>
  1034fb:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  1034ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103502:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  103505:	72 c2                	jb     1034c9 <mpsearch1+0x19>
  103507:	b8 00 00 00 00       	mov    $0x0,%eax
  10350c:	c9                   	leave  
  10350d:	c3                   	ret    

0010350e <mpsearch>:
  10350e:	55                   	push   %ebp
  10350f:	89 e5                	mov    %esp,%ebp
  103511:	83 ec 18             	sub    $0x18,%esp
  103514:	c7 45 f4 00 04 00 00 	movl   $0x400,-0xc(%ebp)
  10351b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10351e:	83 c0 0f             	add    $0xf,%eax
  103521:	0f b6 00             	movzbl (%eax),%eax
  103524:	0f b6 c0             	movzbl %al,%eax
  103527:	c1 e0 08             	shl    $0x8,%eax
  10352a:	89 c2                	mov    %eax,%edx
  10352c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10352f:	83 c0 0e             	add    $0xe,%eax
  103532:	0f b6 00             	movzbl (%eax),%eax
  103535:	0f b6 c0             	movzbl %al,%eax
  103538:	09 d0                	or     %edx,%eax
  10353a:	c1 e0 04             	shl    $0x4,%eax
  10353d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103540:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103544:	74 22                	je     103568 <mpsearch+0x5a>
  103546:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103549:	83 ec 08             	sub    $0x8,%esp
  10354c:	68 00 04 00 00       	push   $0x400
  103551:	50                   	push   %eax
  103552:	e8 59 ff ff ff       	call   1034b0 <mpsearch1>
  103557:	83 c4 10             	add    $0x10,%esp
  10355a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10355d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  103561:	74 51                	je     1035b4 <mpsearch+0xa6>
  103563:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103566:	eb 61                	jmp    1035c9 <mpsearch+0xbb>
  103568:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10356b:	83 c0 14             	add    $0x14,%eax
  10356e:	0f b6 00             	movzbl (%eax),%eax
  103571:	0f b6 c0             	movzbl %al,%eax
  103574:	c1 e0 08             	shl    $0x8,%eax
  103577:	89 c2                	mov    %eax,%edx
  103579:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10357c:	83 c0 13             	add    $0x13,%eax
  10357f:	0f b6 00             	movzbl (%eax),%eax
  103582:	0f b6 c0             	movzbl %al,%eax
  103585:	09 d0                	or     %edx,%eax
  103587:	c1 e0 0a             	shl    $0xa,%eax
  10358a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10358d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103590:	2d 00 04 00 00       	sub    $0x400,%eax
  103595:	83 ec 08             	sub    $0x8,%esp
  103598:	68 00 04 00 00       	push   $0x400
  10359d:	50                   	push   %eax
  10359e:	e8 0d ff ff ff       	call   1034b0 <mpsearch1>
  1035a3:	83 c4 10             	add    $0x10,%esp
  1035a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1035a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1035ad:	74 05                	je     1035b4 <mpsearch+0xa6>
  1035af:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035b2:	eb 15                	jmp    1035c9 <mpsearch+0xbb>
  1035b4:	83 ec 08             	sub    $0x8,%esp
  1035b7:	68 00 00 01 00       	push   $0x10000
  1035bc:	68 00 00 0f 00       	push   $0xf0000
  1035c1:	e8 ea fe ff ff       	call   1034b0 <mpsearch1>
  1035c6:	83 c4 10             	add    $0x10,%esp
  1035c9:	c9                   	leave  
  1035ca:	c3                   	ret    

001035cb <mpconfig>:
  1035cb:	55                   	push   %ebp
  1035cc:	89 e5                	mov    %esp,%ebp
  1035ce:	83 ec 18             	sub    $0x18,%esp
  1035d1:	e8 38 ff ff ff       	call   10350e <mpsearch>
  1035d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1035d9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1035dd:	74 0a                	je     1035e9 <mpconfig+0x1e>
  1035df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1035e2:	8b 40 04             	mov    0x4(%eax),%eax
  1035e5:	85 c0                	test   %eax,%eax
  1035e7:	75 07                	jne    1035f0 <mpconfig+0x25>
  1035e9:	b8 00 00 00 00       	mov    $0x0,%eax
  1035ee:	eb 75                	jmp    103665 <mpconfig+0x9a>
  1035f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1035f3:	8b 40 04             	mov    0x4(%eax),%eax
  1035f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035f9:	83 ec 04             	sub    $0x4,%esp
  1035fc:	6a 04                	push   $0x4
  1035fe:	68 81 90 10 00       	push   $0x109081
  103603:	ff 75 f0             	pushl  -0x10(%ebp)
  103606:	e8 94 15 00 00       	call   104b9f <memcmp>
  10360b:	83 c4 10             	add    $0x10,%esp
  10360e:	85 c0                	test   %eax,%eax
  103610:	74 07                	je     103619 <mpconfig+0x4e>
  103612:	b8 00 00 00 00       	mov    $0x0,%eax
  103617:	eb 4c                	jmp    103665 <mpconfig+0x9a>
  103619:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10361c:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  103620:	3c 01                	cmp    $0x1,%al
  103622:	74 12                	je     103636 <mpconfig+0x6b>
  103624:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103627:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  10362b:	3c 04                	cmp    $0x4,%al
  10362d:	74 07                	je     103636 <mpconfig+0x6b>
  10362f:	b8 00 00 00 00       	mov    $0x0,%eax
  103634:	eb 2f                	jmp    103665 <mpconfig+0x9a>
  103636:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103639:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  10363d:	0f b7 c0             	movzwl %ax,%eax
  103640:	83 ec 08             	sub    $0x8,%esp
  103643:	50                   	push   %eax
  103644:	ff 75 f0             	pushl  -0x10(%ebp)
  103647:	e8 2c fe ff ff       	call   103478 <sum>
  10364c:	83 c4 10             	add    $0x10,%esp
  10364f:	84 c0                	test   %al,%al
  103651:	74 07                	je     10365a <mpconfig+0x8f>
  103653:	b8 00 00 00 00       	mov    $0x0,%eax
  103658:	eb 0b                	jmp    103665 <mpconfig+0x9a>
  10365a:	8b 45 08             	mov    0x8(%ebp),%eax
  10365d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103660:	89 10                	mov    %edx,(%eax)
  103662:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103665:	c9                   	leave  
  103666:	c3                   	ret    

00103667 <mpinit>:
  103667:	55                   	push   %ebp
  103668:	89 e5                	mov    %esp,%ebp
  10366a:	83 ec 28             	sub    $0x28,%esp
  10366d:	c7 05 68 cb 10 00 c0 	movl   $0x110dc0,0x10cb68
  103674:	0d 11 00 
  103677:	83 ec 0c             	sub    $0xc,%esp
  10367a:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10367d:	50                   	push   %eax
  10367e:	e8 48 ff ff ff       	call   1035cb <mpconfig>
  103683:	83 c4 10             	add    $0x10,%esp
  103686:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103689:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10368d:	0f 84 96 01 00 00    	je     103829 <mpinit+0x1c2>
  103693:	c7 05 a4 0d 11 00 01 	movl   $0x1,0x110da4
  10369a:	00 00 00 
  10369d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036a0:	8b 40 24             	mov    0x24(%eax),%eax
  1036a3:	a3 98 0d 11 00       	mov    %eax,0x110d98
  1036a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036ab:	83 c0 2c             	add    $0x2c,%eax
  1036ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1036b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036b4:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  1036b8:	0f b7 d0             	movzwl %ax,%edx
  1036bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036be:	01 d0                	add    %edx,%eax
  1036c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1036c3:	e9 f2 00 00 00       	jmp    1037ba <mpinit+0x153>
  1036c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1036cb:	0f b6 00             	movzbl (%eax),%eax
  1036ce:	0f b6 c0             	movzbl %al,%eax
  1036d1:	83 f8 04             	cmp    $0x4,%eax
  1036d4:	0f 87 bc 00 00 00    	ja     103796 <mpinit+0x12f>
  1036da:	8b 04 85 c4 90 10 00 	mov    0x1090c4(,%eax,4),%eax
  1036e1:	ff e0                	jmp    *%eax
  1036e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1036e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1036e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1036ec:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  1036f0:	0f b6 d0             	movzbl %al,%edx
  1036f3:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  1036f8:	39 c2                	cmp    %eax,%edx
  1036fa:	74 2b                	je     103727 <mpinit+0xc0>
  1036fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1036ff:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  103703:	0f b6 d0             	movzbl %al,%edx
  103706:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  10370b:	83 ec 04             	sub    $0x4,%esp
  10370e:	52                   	push   %edx
  10370f:	50                   	push   %eax
  103710:	68 86 90 10 00       	push   $0x109086
  103715:	e8 d2 cc ff ff       	call   1003ec <cprintf>
  10371a:	83 c4 10             	add    $0x10,%esp
  10371d:	c7 05 a4 0d 11 00 00 	movl   $0x0,0x110da4
  103724:	00 00 00 
  103727:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10372a:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  10372e:	0f b6 c0             	movzbl %al,%eax
  103731:	83 e0 02             	and    $0x2,%eax
  103734:	85 c0                	test   %eax,%eax
  103736:	74 15                	je     10374d <mpinit+0xe6>
  103738:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  10373d:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  103743:	05 c0 0d 11 00       	add    $0x110dc0,%eax
  103748:	a3 68 cb 10 00       	mov    %eax,0x10cb68
  10374d:	8b 15 a0 13 11 00    	mov    0x1113a0,%edx
  103753:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  103758:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  10375e:	05 c0 0d 11 00       	add    $0x110dc0,%eax
  103763:	88 10                	mov    %dl,(%eax)
  103765:	a1 a0 13 11 00       	mov    0x1113a0,%eax
  10376a:	83 c0 01             	add    $0x1,%eax
  10376d:	a3 a0 13 11 00       	mov    %eax,0x1113a0
  103772:	83 45 f4 14          	addl   $0x14,-0xc(%ebp)
  103776:	eb 42                	jmp    1037ba <mpinit+0x153>
  103778:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10377b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10377e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103781:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  103785:	a2 a0 0d 11 00       	mov    %al,0x110da0
  10378a:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
  10378e:	eb 2a                	jmp    1037ba <mpinit+0x153>
  103790:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
  103794:	eb 24                	jmp    1037ba <mpinit+0x153>
  103796:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103799:	0f b6 00             	movzbl (%eax),%eax
  10379c:	0f b6 c0             	movzbl %al,%eax
  10379f:	83 ec 08             	sub    $0x8,%esp
  1037a2:	50                   	push   %eax
  1037a3:	68 a4 90 10 00       	push   $0x1090a4
  1037a8:	e8 3f cc ff ff       	call   1003ec <cprintf>
  1037ad:	83 c4 10             	add    $0x10,%esp
  1037b0:	c7 05 a4 0d 11 00 00 	movl   $0x0,0x110da4
  1037b7:	00 00 00 
  1037ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037bd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1037c0:	0f 82 02 ff ff ff    	jb     1036c8 <mpinit+0x61>
  1037c6:	a1 a4 0d 11 00       	mov    0x110da4,%eax
  1037cb:	85 c0                	test   %eax,%eax
  1037cd:	75 1d                	jne    1037ec <mpinit+0x185>
  1037cf:	c7 05 a0 13 11 00 01 	movl   $0x1,0x1113a0
  1037d6:	00 00 00 
  1037d9:	c7 05 98 0d 11 00 00 	movl   $0x0,0x110d98
  1037e0:	00 00 00 
  1037e3:	c6 05 a0 0d 11 00 00 	movb   $0x0,0x110da0
  1037ea:	eb 3e                	jmp    10382a <mpinit+0x1c3>
  1037ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1037ef:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
  1037f3:	84 c0                	test   %al,%al
  1037f5:	74 33                	je     10382a <mpinit+0x1c3>
  1037f7:	83 ec 08             	sub    $0x8,%esp
  1037fa:	6a 70                	push   $0x70
  1037fc:	6a 22                	push   $0x22
  1037fe:	e8 38 fc ff ff       	call   10343b <outb>
  103803:	83 c4 10             	add    $0x10,%esp
  103806:	83 ec 0c             	sub    $0xc,%esp
  103809:	6a 23                	push   $0x23
  10380b:	e8 0e fc ff ff       	call   10341e <inb>
  103810:	83 c4 10             	add    $0x10,%esp
  103813:	83 c8 01             	or     $0x1,%eax
  103816:	0f b6 c0             	movzbl %al,%eax
  103819:	83 ec 08             	sub    $0x8,%esp
  10381c:	50                   	push   %eax
  10381d:	6a 23                	push   $0x23
  10381f:	e8 17 fc ff ff       	call   10343b <outb>
  103824:	83 c4 10             	add    $0x10,%esp
  103827:	eb 01                	jmp    10382a <mpinit+0x1c3>
  103829:	90                   	nop
  10382a:	c9                   	leave  
  10382b:	c3                   	ret    

0010382c <outb>:
  10382c:	55                   	push   %ebp
  10382d:	89 e5                	mov    %esp,%ebp
  10382f:	83 ec 08             	sub    $0x8,%esp
  103832:	8b 55 08             	mov    0x8(%ebp),%edx
  103835:	8b 45 0c             	mov    0xc(%ebp),%eax
  103838:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  10383c:	88 45 f8             	mov    %al,-0x8(%ebp)
  10383f:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  103843:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  103847:	ee                   	out    %al,(%dx)
  103848:	90                   	nop
  103849:	c9                   	leave  
  10384a:	c3                   	ret    

0010384b <picsetmask>:
  10384b:	55                   	push   %ebp
  10384c:	89 e5                	mov    %esp,%ebp
  10384e:	83 ec 04             	sub    $0x4,%esp
  103851:	8b 45 08             	mov    0x8(%ebp),%eax
  103854:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103858:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  10385c:	66 a3 30 c5 10 00    	mov    %ax,0x10c530
  103862:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103866:	0f b6 c0             	movzbl %al,%eax
  103869:	50                   	push   %eax
  10386a:	6a 21                	push   $0x21
  10386c:	e8 bb ff ff ff       	call   10382c <outb>
  103871:	83 c4 08             	add    $0x8,%esp
  103874:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103878:	66 c1 e8 08          	shr    $0x8,%ax
  10387c:	0f b6 c0             	movzbl %al,%eax
  10387f:	50                   	push   %eax
  103880:	68 a1 00 00 00       	push   $0xa1
  103885:	e8 a2 ff ff ff       	call   10382c <outb>
  10388a:	83 c4 08             	add    $0x8,%esp
  10388d:	90                   	nop
  10388e:	c9                   	leave  
  10388f:	c3                   	ret    

00103890 <picenable>:
  103890:	55                   	push   %ebp
  103891:	89 e5                	mov    %esp,%ebp
  103893:	8b 45 08             	mov    0x8(%ebp),%eax
  103896:	ba 01 00 00 00       	mov    $0x1,%edx
  10389b:	89 c1                	mov    %eax,%ecx
  10389d:	d3 e2                	shl    %cl,%edx
  10389f:	89 d0                	mov    %edx,%eax
  1038a1:	f7 d0                	not    %eax
  1038a3:	89 c2                	mov    %eax,%edx
  1038a5:	0f b7 05 30 c5 10 00 	movzwl 0x10c530,%eax
  1038ac:	21 d0                	and    %edx,%eax
  1038ae:	0f b7 c0             	movzwl %ax,%eax
  1038b1:	50                   	push   %eax
  1038b2:	e8 94 ff ff ff       	call   10384b <picsetmask>
  1038b7:	83 c4 04             	add    $0x4,%esp
  1038ba:	90                   	nop
  1038bb:	c9                   	leave  
  1038bc:	c3                   	ret    

001038bd <picinit>:
  1038bd:	55                   	push   %ebp
  1038be:	89 e5                	mov    %esp,%ebp
  1038c0:	68 ff 00 00 00       	push   $0xff
  1038c5:	6a 21                	push   $0x21
  1038c7:	e8 60 ff ff ff       	call   10382c <outb>
  1038cc:	83 c4 08             	add    $0x8,%esp
  1038cf:	68 ff 00 00 00       	push   $0xff
  1038d4:	68 a1 00 00 00       	push   $0xa1
  1038d9:	e8 4e ff ff ff       	call   10382c <outb>
  1038de:	83 c4 08             	add    $0x8,%esp
  1038e1:	6a 11                	push   $0x11
  1038e3:	6a 20                	push   $0x20
  1038e5:	e8 42 ff ff ff       	call   10382c <outb>
  1038ea:	83 c4 08             	add    $0x8,%esp
  1038ed:	6a 20                	push   $0x20
  1038ef:	6a 21                	push   $0x21
  1038f1:	e8 36 ff ff ff       	call   10382c <outb>
  1038f6:	83 c4 08             	add    $0x8,%esp
  1038f9:	6a 04                	push   $0x4
  1038fb:	6a 21                	push   $0x21
  1038fd:	e8 2a ff ff ff       	call   10382c <outb>
  103902:	83 c4 08             	add    $0x8,%esp
  103905:	6a 03                	push   $0x3
  103907:	6a 21                	push   $0x21
  103909:	e8 1e ff ff ff       	call   10382c <outb>
  10390e:	83 c4 08             	add    $0x8,%esp
  103911:	6a 11                	push   $0x11
  103913:	68 a0 00 00 00       	push   $0xa0
  103918:	e8 0f ff ff ff       	call   10382c <outb>
  10391d:	83 c4 08             	add    $0x8,%esp
  103920:	6a 28                	push   $0x28
  103922:	68 a1 00 00 00       	push   $0xa1
  103927:	e8 00 ff ff ff       	call   10382c <outb>
  10392c:	83 c4 08             	add    $0x8,%esp
  10392f:	6a 02                	push   $0x2
  103931:	68 a1 00 00 00       	push   $0xa1
  103936:	e8 f1 fe ff ff       	call   10382c <outb>
  10393b:	83 c4 08             	add    $0x8,%esp
  10393e:	6a 03                	push   $0x3
  103940:	68 a1 00 00 00       	push   $0xa1
  103945:	e8 e2 fe ff ff       	call   10382c <outb>
  10394a:	83 c4 08             	add    $0x8,%esp
  10394d:	6a 68                	push   $0x68
  10394f:	6a 20                	push   $0x20
  103951:	e8 d6 fe ff ff       	call   10382c <outb>
  103956:	83 c4 08             	add    $0x8,%esp
  103959:	6a 0a                	push   $0xa
  10395b:	6a 20                	push   $0x20
  10395d:	e8 ca fe ff ff       	call   10382c <outb>
  103962:	83 c4 08             	add    $0x8,%esp
  103965:	6a 68                	push   $0x68
  103967:	68 a0 00 00 00       	push   $0xa0
  10396c:	e8 bb fe ff ff       	call   10382c <outb>
  103971:	83 c4 08             	add    $0x8,%esp
  103974:	6a 0a                	push   $0xa
  103976:	68 a0 00 00 00       	push   $0xa0
  10397b:	e8 ac fe ff ff       	call   10382c <outb>
  103980:	83 c4 08             	add    $0x8,%esp
  103983:	0f b7 05 30 c5 10 00 	movzwl 0x10c530,%eax
  10398a:	66 83 f8 ff          	cmp    $0xffff,%ax
  10398e:	74 13                	je     1039a3 <picinit+0xe6>
  103990:	0f b7 05 30 c5 10 00 	movzwl 0x10c530,%eax
  103997:	0f b7 c0             	movzwl %ax,%eax
  10399a:	50                   	push   %eax
  10399b:	e8 ab fe ff ff       	call   10384b <picsetmask>
  1039a0:	83 c4 04             	add    $0x4,%esp
  1039a3:	90                   	nop
  1039a4:	c9                   	leave  
  1039a5:	c3                   	ret    

001039a6 <pipealloc>:
  1039a6:	55                   	push   %ebp
  1039a7:	89 e5                	mov    %esp,%ebp
  1039a9:	83 ec 18             	sub    $0x18,%esp
  1039ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1039b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1039b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1039bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1039bf:	8b 10                	mov    (%eax),%edx
  1039c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1039c4:	89 10                	mov    %edx,(%eax)
  1039c6:	e8 a8 d5 ff ff       	call   100f73 <filealloc>
  1039cb:	89 c2                	mov    %eax,%edx
  1039cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1039d0:	89 10                	mov    %edx,(%eax)
  1039d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1039d5:	8b 00                	mov    (%eax),%eax
  1039d7:	85 c0                	test   %eax,%eax
  1039d9:	0f 84 ca 00 00 00    	je     103aa9 <pipealloc+0x103>
  1039df:	e8 8f d5 ff ff       	call   100f73 <filealloc>
  1039e4:	89 c2                	mov    %eax,%edx
  1039e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1039e9:	89 10                	mov    %edx,(%eax)
  1039eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1039ee:	8b 00                	mov    (%eax),%eax
  1039f0:	85 c0                	test   %eax,%eax
  1039f2:	0f 84 b1 00 00 00    	je     103aa9 <pipealloc+0x103>
  1039f8:	e8 ed f2 ff ff       	call   102cea <kalloc>
  1039fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103a00:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103a04:	0f 84 a2 00 00 00    	je     103aac <pipealloc+0x106>
  103a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a0d:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
  103a14:	00 00 00 
  103a17:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a1a:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
  103a21:	00 00 00 
  103a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a27:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
  103a2e:	00 00 00 
  103a31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a34:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
  103a3b:	00 00 00 
  103a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a41:	83 ec 08             	sub    $0x8,%esp
  103a44:	68 d8 90 10 00       	push   $0x1090d8
  103a49:	50                   	push   %eax
  103a4a:	e8 d7 0e 00 00       	call   104926 <initlock>
  103a4f:	83 c4 10             	add    $0x10,%esp
  103a52:	8b 45 08             	mov    0x8(%ebp),%eax
  103a55:	8b 00                	mov    (%eax),%eax
  103a57:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  103a5d:	8b 45 08             	mov    0x8(%ebp),%eax
  103a60:	8b 00                	mov    (%eax),%eax
  103a62:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  103a66:	8b 45 08             	mov    0x8(%ebp),%eax
  103a69:	8b 00                	mov    (%eax),%eax
  103a6b:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  103a6f:	8b 45 08             	mov    0x8(%ebp),%eax
  103a72:	8b 00                	mov    (%eax),%eax
  103a74:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103a77:	89 50 0c             	mov    %edx,0xc(%eax)
  103a7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  103a7d:	8b 00                	mov    (%eax),%eax
  103a7f:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  103a85:	8b 45 0c             	mov    0xc(%ebp),%eax
  103a88:	8b 00                	mov    (%eax),%eax
  103a8a:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  103a8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103a91:	8b 00                	mov    (%eax),%eax
  103a93:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  103a97:	8b 45 0c             	mov    0xc(%ebp),%eax
  103a9a:	8b 00                	mov    (%eax),%eax
  103a9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103a9f:	89 50 0c             	mov    %edx,0xc(%eax)
  103aa2:	b8 00 00 00 00       	mov    $0x0,%eax
  103aa7:	eb 51                	jmp    103afa <pipealloc+0x154>
  103aa9:	90                   	nop
  103aaa:	eb 01                	jmp    103aad <pipealloc+0x107>
  103aac:	90                   	nop
  103aad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103ab1:	74 0e                	je     103ac1 <pipealloc+0x11b>
  103ab3:	83 ec 0c             	sub    $0xc,%esp
  103ab6:	ff 75 f4             	pushl  -0xc(%ebp)
  103ab9:	e8 a9 f1 ff ff       	call   102c67 <kfree>
  103abe:	83 c4 10             	add    $0x10,%esp
  103ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  103ac4:	8b 00                	mov    (%eax),%eax
  103ac6:	85 c0                	test   %eax,%eax
  103ac8:	74 11                	je     103adb <pipealloc+0x135>
  103aca:	8b 45 08             	mov    0x8(%ebp),%eax
  103acd:	8b 00                	mov    (%eax),%eax
  103acf:	83 ec 0c             	sub    $0xc,%esp
  103ad2:	50                   	push   %eax
  103ad3:	e8 59 d5 ff ff       	call   101031 <fileclose>
  103ad8:	83 c4 10             	add    $0x10,%esp
  103adb:	8b 45 0c             	mov    0xc(%ebp),%eax
  103ade:	8b 00                	mov    (%eax),%eax
  103ae0:	85 c0                	test   %eax,%eax
  103ae2:	74 11                	je     103af5 <pipealloc+0x14f>
  103ae4:	8b 45 0c             	mov    0xc(%ebp),%eax
  103ae7:	8b 00                	mov    (%eax),%eax
  103ae9:	83 ec 0c             	sub    $0xc,%esp
  103aec:	50                   	push   %eax
  103aed:	e8 3f d5 ff ff       	call   101031 <fileclose>
  103af2:	83 c4 10             	add    $0x10,%esp
  103af5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103afa:	c9                   	leave  
  103afb:	c3                   	ret    

00103afc <pipeclose>:
  103afc:	55                   	push   %ebp
  103afd:	89 e5                	mov    %esp,%ebp
  103aff:	83 ec 08             	sub    $0x8,%esp
  103b02:	8b 45 08             	mov    0x8(%ebp),%eax
  103b05:	83 ec 0c             	sub    $0xc,%esp
  103b08:	50                   	push   %eax
  103b09:	e8 3a 0e 00 00       	call   104948 <acquire>
  103b0e:	83 c4 10             	add    $0x10,%esp
  103b11:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103b15:	74 23                	je     103b3a <pipeclose+0x3e>
  103b17:	8b 45 08             	mov    0x8(%ebp),%eax
  103b1a:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
  103b21:	00 00 00 
  103b24:	8b 45 08             	mov    0x8(%ebp),%eax
  103b27:	05 34 02 00 00       	add    $0x234,%eax
  103b2c:	83 ec 0c             	sub    $0xc,%esp
  103b2f:	50                   	push   %eax
  103b30:	e8 05 0c 00 00       	call   10473a <wakeup>
  103b35:	83 c4 10             	add    $0x10,%esp
  103b38:	eb 21                	jmp    103b5b <pipeclose+0x5f>
  103b3a:	8b 45 08             	mov    0x8(%ebp),%eax
  103b3d:	c7 80 3c 02 00 00 00 	movl   $0x0,0x23c(%eax)
  103b44:	00 00 00 
  103b47:	8b 45 08             	mov    0x8(%ebp),%eax
  103b4a:	05 38 02 00 00       	add    $0x238,%eax
  103b4f:	83 ec 0c             	sub    $0xc,%esp
  103b52:	50                   	push   %eax
  103b53:	e8 e2 0b 00 00       	call   10473a <wakeup>
  103b58:	83 c4 10             	add    $0x10,%esp
  103b5b:	8b 45 08             	mov    0x8(%ebp),%eax
  103b5e:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
  103b64:	85 c0                	test   %eax,%eax
  103b66:	75 2c                	jne    103b94 <pipeclose+0x98>
  103b68:	8b 45 08             	mov    0x8(%ebp),%eax
  103b6b:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
  103b71:	85 c0                	test   %eax,%eax
  103b73:	75 1f                	jne    103b94 <pipeclose+0x98>
  103b75:	8b 45 08             	mov    0x8(%ebp),%eax
  103b78:	83 ec 0c             	sub    $0xc,%esp
  103b7b:	50                   	push   %eax
  103b7c:	e8 2e 0e 00 00       	call   1049af <release>
  103b81:	83 c4 10             	add    $0x10,%esp
  103b84:	83 ec 0c             	sub    $0xc,%esp
  103b87:	ff 75 08             	pushl  0x8(%ebp)
  103b8a:	e8 d8 f0 ff ff       	call   102c67 <kfree>
  103b8f:	83 c4 10             	add    $0x10,%esp
  103b92:	eb 0f                	jmp    103ba3 <pipeclose+0xa7>
  103b94:	8b 45 08             	mov    0x8(%ebp),%eax
  103b97:	83 ec 0c             	sub    $0xc,%esp
  103b9a:	50                   	push   %eax
  103b9b:	e8 0f 0e 00 00       	call   1049af <release>
  103ba0:	83 c4 10             	add    $0x10,%esp
  103ba3:	90                   	nop
  103ba4:	c9                   	leave  
  103ba5:	c3                   	ret    

00103ba6 <pipewrite>:
  103ba6:	55                   	push   %ebp
  103ba7:	89 e5                	mov    %esp,%ebp
  103ba9:	53                   	push   %ebx
  103baa:	83 ec 14             	sub    $0x14,%esp
  103bad:	8b 45 08             	mov    0x8(%ebp),%eax
  103bb0:	83 ec 0c             	sub    $0xc,%esp
  103bb3:	50                   	push   %eax
  103bb4:	e8 8f 0d 00 00       	call   104948 <acquire>
  103bb9:	83 c4 10             	add    $0x10,%esp
  103bbc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103bc3:	e9 ae 00 00 00       	jmp    103c76 <pipewrite+0xd0>
  103bc8:	8b 45 08             	mov    0x8(%ebp),%eax
  103bcb:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
  103bd1:	85 c0                	test   %eax,%eax
  103bd3:	74 0d                	je     103be2 <pipewrite+0x3c>
  103bd5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103bdb:	8b 40 24             	mov    0x24(%eax),%eax
  103bde:	85 c0                	test   %eax,%eax
  103be0:	74 19                	je     103bfb <pipewrite+0x55>
  103be2:	8b 45 08             	mov    0x8(%ebp),%eax
  103be5:	83 ec 0c             	sub    $0xc,%esp
  103be8:	50                   	push   %eax
  103be9:	e8 c1 0d 00 00       	call   1049af <release>
  103bee:	83 c4 10             	add    $0x10,%esp
  103bf1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103bf6:	e9 a9 00 00 00       	jmp    103ca4 <pipewrite+0xfe>
  103bfb:	8b 45 08             	mov    0x8(%ebp),%eax
  103bfe:	05 34 02 00 00       	add    $0x234,%eax
  103c03:	83 ec 0c             	sub    $0xc,%esp
  103c06:	50                   	push   %eax
  103c07:	e8 2e 0b 00 00       	call   10473a <wakeup>
  103c0c:	83 c4 10             	add    $0x10,%esp
  103c0f:	8b 45 08             	mov    0x8(%ebp),%eax
  103c12:	8b 55 08             	mov    0x8(%ebp),%edx
  103c15:	81 c2 38 02 00 00    	add    $0x238,%edx
  103c1b:	83 ec 08             	sub    $0x8,%esp
  103c1e:	50                   	push   %eax
  103c1f:	52                   	push   %edx
  103c20:	e8 2a 0a 00 00       	call   10464f <sleep>
  103c25:	83 c4 10             	add    $0x10,%esp
  103c28:	8b 45 08             	mov    0x8(%ebp),%eax
  103c2b:	8b 90 38 02 00 00    	mov    0x238(%eax),%edx
  103c31:	8b 45 08             	mov    0x8(%ebp),%eax
  103c34:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
  103c3a:	05 00 02 00 00       	add    $0x200,%eax
  103c3f:	39 c2                	cmp    %eax,%edx
  103c41:	74 85                	je     103bc8 <pipewrite+0x22>
  103c43:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103c46:	8b 45 0c             	mov    0xc(%ebp),%eax
  103c49:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  103c4c:	8b 45 08             	mov    0x8(%ebp),%eax
  103c4f:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
  103c55:	8d 48 01             	lea    0x1(%eax),%ecx
  103c58:	8b 55 08             	mov    0x8(%ebp),%edx
  103c5b:	89 8a 38 02 00 00    	mov    %ecx,0x238(%edx)
  103c61:	25 ff 01 00 00       	and    $0x1ff,%eax
  103c66:	89 c1                	mov    %eax,%ecx
  103c68:	0f b6 13             	movzbl (%ebx),%edx
  103c6b:	8b 45 08             	mov    0x8(%ebp),%eax
  103c6e:	88 54 08 34          	mov    %dl,0x34(%eax,%ecx,1)
  103c72:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103c76:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c79:	3b 45 10             	cmp    0x10(%ebp),%eax
  103c7c:	7c aa                	jl     103c28 <pipewrite+0x82>
  103c7e:	8b 45 08             	mov    0x8(%ebp),%eax
  103c81:	05 34 02 00 00       	add    $0x234,%eax
  103c86:	83 ec 0c             	sub    $0xc,%esp
  103c89:	50                   	push   %eax
  103c8a:	e8 ab 0a 00 00       	call   10473a <wakeup>
  103c8f:	83 c4 10             	add    $0x10,%esp
  103c92:	8b 45 08             	mov    0x8(%ebp),%eax
  103c95:	83 ec 0c             	sub    $0xc,%esp
  103c98:	50                   	push   %eax
  103c99:	e8 11 0d 00 00       	call   1049af <release>
  103c9e:	83 c4 10             	add    $0x10,%esp
  103ca1:	8b 45 10             	mov    0x10(%ebp),%eax
  103ca4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103ca7:	c9                   	leave  
  103ca8:	c3                   	ret    

00103ca9 <piperead>:
  103ca9:	55                   	push   %ebp
  103caa:	89 e5                	mov    %esp,%ebp
  103cac:	83 ec 18             	sub    $0x18,%esp
  103caf:	8b 45 08             	mov    0x8(%ebp),%eax
  103cb2:	83 ec 0c             	sub    $0xc,%esp
  103cb5:	50                   	push   %eax
  103cb6:	e8 8d 0c 00 00       	call   104948 <acquire>
  103cbb:	83 c4 10             	add    $0x10,%esp
  103cbe:	eb 3f                	jmp    103cff <piperead+0x56>
  103cc0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103cc6:	8b 40 24             	mov    0x24(%eax),%eax
  103cc9:	85 c0                	test   %eax,%eax
  103ccb:	74 19                	je     103ce6 <piperead+0x3d>
  103ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  103cd0:	83 ec 0c             	sub    $0xc,%esp
  103cd3:	50                   	push   %eax
  103cd4:	e8 d6 0c 00 00       	call   1049af <release>
  103cd9:	83 c4 10             	add    $0x10,%esp
  103cdc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103ce1:	e9 be 00 00 00       	jmp    103da4 <piperead+0xfb>
  103ce6:	8b 45 08             	mov    0x8(%ebp),%eax
  103ce9:	8b 55 08             	mov    0x8(%ebp),%edx
  103cec:	81 c2 34 02 00 00    	add    $0x234,%edx
  103cf2:	83 ec 08             	sub    $0x8,%esp
  103cf5:	50                   	push   %eax
  103cf6:	52                   	push   %edx
  103cf7:	e8 53 09 00 00       	call   10464f <sleep>
  103cfc:	83 c4 10             	add    $0x10,%esp
  103cff:	8b 45 08             	mov    0x8(%ebp),%eax
  103d02:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
  103d08:	8b 45 08             	mov    0x8(%ebp),%eax
  103d0b:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
  103d11:	39 c2                	cmp    %eax,%edx
  103d13:	75 0d                	jne    103d22 <piperead+0x79>
  103d15:	8b 45 08             	mov    0x8(%ebp),%eax
  103d18:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
  103d1e:	85 c0                	test   %eax,%eax
  103d20:	75 9e                	jne    103cc0 <piperead+0x17>
  103d22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103d29:	eb 48                	jmp    103d73 <piperead+0xca>
  103d2b:	8b 45 08             	mov    0x8(%ebp),%eax
  103d2e:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
  103d34:	8b 45 08             	mov    0x8(%ebp),%eax
  103d37:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
  103d3d:	39 c2                	cmp    %eax,%edx
  103d3f:	74 3c                	je     103d7d <piperead+0xd4>
  103d41:	8b 45 08             	mov    0x8(%ebp),%eax
  103d44:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
  103d4a:	8d 48 01             	lea    0x1(%eax),%ecx
  103d4d:	8b 55 08             	mov    0x8(%ebp),%edx
  103d50:	89 8a 34 02 00 00    	mov    %ecx,0x234(%edx)
  103d56:	25 ff 01 00 00       	and    $0x1ff,%eax
  103d5b:	89 c1                	mov    %eax,%ecx
  103d5d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103d60:	8b 45 0c             	mov    0xc(%ebp),%eax
  103d63:	01 c2                	add    %eax,%edx
  103d65:	8b 45 08             	mov    0x8(%ebp),%eax
  103d68:	0f b6 44 08 34       	movzbl 0x34(%eax,%ecx,1),%eax
  103d6d:	88 02                	mov    %al,(%edx)
  103d6f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103d76:	3b 45 10             	cmp    0x10(%ebp),%eax
  103d79:	7c b0                	jl     103d2b <piperead+0x82>
  103d7b:	eb 01                	jmp    103d7e <piperead+0xd5>
  103d7d:	90                   	nop
  103d7e:	8b 45 08             	mov    0x8(%ebp),%eax
  103d81:	05 38 02 00 00       	add    $0x238,%eax
  103d86:	83 ec 0c             	sub    $0xc,%esp
  103d89:	50                   	push   %eax
  103d8a:	e8 ab 09 00 00       	call   10473a <wakeup>
  103d8f:	83 c4 10             	add    $0x10,%esp
  103d92:	8b 45 08             	mov    0x8(%ebp),%eax
  103d95:	83 ec 0c             	sub    $0xc,%esp
  103d98:	50                   	push   %eax
  103d99:	e8 11 0c 00 00       	call   1049af <release>
  103d9e:	83 c4 10             	add    $0x10,%esp
  103da1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103da4:	c9                   	leave  
  103da5:	c3                   	ret    

00103da6 <readeflags>:
  103da6:	55                   	push   %ebp
  103da7:	89 e5                	mov    %esp,%ebp
  103da9:	83 ec 10             	sub    $0x10,%esp
  103dac:	9c                   	pushf  
  103dad:	58                   	pop    %eax
  103dae:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103db1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103db4:	c9                   	leave  
  103db5:	c3                   	ret    

00103db6 <sti>:
  103db6:	55                   	push   %ebp
  103db7:	89 e5                	mov    %esp,%ebp
  103db9:	fb                   	sti    
  103dba:	90                   	nop
  103dbb:	5d                   	pop    %ebp
  103dbc:	c3                   	ret    

00103dbd <pinit>:
  103dbd:	55                   	push   %ebp
  103dbe:	89 e5                	mov    %esp,%ebp
  103dc0:	83 ec 08             	sub    $0x8,%esp
  103dc3:	83 ec 08             	sub    $0x8,%esp
  103dc6:	68 dd 90 10 00       	push   $0x1090dd
  103dcb:	68 c0 13 11 00       	push   $0x1113c0
  103dd0:	e8 51 0b 00 00       	call   104926 <initlock>
  103dd5:	83 c4 10             	add    $0x10,%esp
  103dd8:	90                   	nop
  103dd9:	c9                   	leave  
  103dda:	c3                   	ret    

00103ddb <allocproc>:
  103ddb:	55                   	push   %ebp
  103ddc:	89 e5                	mov    %esp,%ebp
  103dde:	83 ec 18             	sub    $0x18,%esp
  103de1:	83 ec 0c             	sub    $0xc,%esp
  103de4:	68 c0 13 11 00       	push   $0x1113c0
  103de9:	e8 5a 0b 00 00       	call   104948 <acquire>
  103dee:	83 c4 10             	add    $0x10,%esp
  103df1:	c7 45 f4 f4 13 11 00 	movl   $0x1113f4,-0xc(%ebp)
  103df8:	eb 0e                	jmp    103e08 <allocproc+0x2d>
  103dfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103dfd:	8b 40 0c             	mov    0xc(%eax),%eax
  103e00:	85 c0                	test   %eax,%eax
  103e02:	74 27                	je     103e2b <allocproc+0x50>
  103e04:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
  103e08:	81 7d f4 f4 32 11 00 	cmpl   $0x1132f4,-0xc(%ebp)
  103e0f:	72 e9                	jb     103dfa <allocproc+0x1f>
  103e11:	83 ec 0c             	sub    $0xc,%esp
  103e14:	68 c0 13 11 00       	push   $0x1113c0
  103e19:	e8 91 0b 00 00       	call   1049af <release>
  103e1e:	83 c4 10             	add    $0x10,%esp
  103e21:	b8 00 00 00 00       	mov    $0x0,%eax
  103e26:	e9 b4 00 00 00       	jmp    103edf <allocproc+0x104>
  103e2b:	90                   	nop
  103e2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e2f:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
  103e36:	a1 34 c5 10 00       	mov    0x10c534,%eax
  103e3b:	8d 50 01             	lea    0x1(%eax),%edx
  103e3e:	89 15 34 c5 10 00    	mov    %edx,0x10c534
  103e44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103e47:	89 42 10             	mov    %eax,0x10(%edx)
  103e4a:	83 ec 0c             	sub    $0xc,%esp
  103e4d:	68 c0 13 11 00       	push   $0x1113c0
  103e52:	e8 58 0b 00 00       	call   1049af <release>
  103e57:	83 c4 10             	add    $0x10,%esp
  103e5a:	e8 8b ee ff ff       	call   102cea <kalloc>
  103e5f:	89 c2                	mov    %eax,%edx
  103e61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e64:	89 50 08             	mov    %edx,0x8(%eax)
  103e67:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e6a:	8b 40 08             	mov    0x8(%eax),%eax
  103e6d:	85 c0                	test   %eax,%eax
  103e6f:	75 11                	jne    103e82 <allocproc+0xa7>
  103e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e74:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  103e7b:	b8 00 00 00 00       	mov    $0x0,%eax
  103e80:	eb 5d                	jmp    103edf <allocproc+0x104>
  103e82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e85:	8b 40 08             	mov    0x8(%eax),%eax
  103e88:	05 00 10 00 00       	add    $0x1000,%eax
  103e8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103e90:	83 6d f0 4c          	subl   $0x4c,-0x10(%ebp)
  103e94:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e97:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103e9a:	89 50 18             	mov    %edx,0x18(%eax)
  103e9d:	83 6d f0 04          	subl   $0x4,-0x10(%ebp)
  103ea1:	ba 31 5f 10 00       	mov    $0x105f31,%edx
  103ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ea9:	89 10                	mov    %edx,(%eax)
  103eab:	83 6d f0 14          	subl   $0x14,-0x10(%ebp)
  103eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103eb2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103eb5:	89 50 1c             	mov    %edx,0x1c(%eax)
  103eb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ebb:	8b 40 1c             	mov    0x1c(%eax),%eax
  103ebe:	83 ec 04             	sub    $0x4,%esp
  103ec1:	6a 14                	push   $0x14
  103ec3:	6a 00                	push   $0x0
  103ec5:	50                   	push   %eax
  103ec6:	e8 ba 0c 00 00       	call   104b85 <memset>
  103ecb:	83 c4 10             	add    $0x10,%esp
  103ece:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ed1:	8b 40 1c             	mov    0x1c(%eax),%eax
  103ed4:	ba 36 46 10 00       	mov    $0x104636,%edx
  103ed9:	89 50 10             	mov    %edx,0x10(%eax)
  103edc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103edf:	c9                   	leave  
  103ee0:	c3                   	ret    

00103ee1 <userinit>:
  103ee1:	55                   	push   %ebp
  103ee2:	89 e5                	mov    %esp,%ebp
  103ee4:	83 ec 18             	sub    $0x18,%esp
  103ee7:	e8 ef fe ff ff       	call   103ddb <allocproc>
  103eec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103eef:	83 ec 0c             	sub    $0xc,%esp
  103ef2:	68 c0 13 11 00       	push   $0x1113c0
  103ef7:	e8 4c 0a 00 00       	call   104948 <acquire>
  103efc:	83 c4 10             	add    $0x10,%esp
  103eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f02:	a3 6c cb 10 00       	mov    %eax,0x10cb6c
  103f07:	e8 f8 36 00 00       	call   107604 <setupkvm>
  103f0c:	89 c2                	mov    %eax,%edx
  103f0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f11:	89 50 04             	mov    %edx,0x4(%eax)
  103f14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f17:	8b 40 04             	mov    0x4(%eax),%eax
  103f1a:	85 c0                	test   %eax,%eax
  103f1c:	75 0d                	jne    103f2b <userinit+0x4a>
  103f1e:	83 ec 0c             	sub    $0xc,%esp
  103f21:	68 e4 90 10 00       	push   $0x1090e4
  103f26:	e8 4d c6 ff ff       	call   100578 <panic>
  103f2b:	ba 2c 00 00 00       	mov    $0x2c,%edx
  103f30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f33:	8b 40 04             	mov    0x4(%eax),%eax
  103f36:	83 ec 04             	sub    $0x4,%esp
  103f39:	52                   	push   %edx
  103f3a:	68 20 ca 10 00       	push   $0x10ca20
  103f3f:	50                   	push   %eax
  103f40:	e8 fe 38 00 00       	call   107843 <inituvm>
  103f45:	83 c4 10             	add    $0x10,%esp
  103f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f4b:	c7 00 00 10 00 00    	movl   $0x1000,(%eax)
  103f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f54:	8b 40 18             	mov    0x18(%eax),%eax
  103f57:	83 ec 04             	sub    $0x4,%esp
  103f5a:	6a 4c                	push   $0x4c
  103f5c:	6a 00                	push   $0x0
  103f5e:	50                   	push   %eax
  103f5f:	e8 21 0c 00 00       	call   104b85 <memset>
  103f64:	83 c4 10             	add    $0x10,%esp
  103f67:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f6a:	8b 40 18             	mov    0x18(%eax),%eax
  103f6d:	66 c7 40 3c 23 00    	movw   $0x23,0x3c(%eax)
  103f73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f76:	8b 40 18             	mov    0x18(%eax),%eax
  103f79:	66 c7 40 2c 2b 00    	movw   $0x2b,0x2c(%eax)
  103f7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f82:	8b 50 18             	mov    0x18(%eax),%edx
  103f85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f88:	8b 40 18             	mov    0x18(%eax),%eax
  103f8b:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
  103f8f:	66 89 50 28          	mov    %dx,0x28(%eax)
  103f93:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f96:	8b 50 18             	mov    0x18(%eax),%edx
  103f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f9c:	8b 40 18             	mov    0x18(%eax),%eax
  103f9f:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
  103fa3:	66 89 50 48          	mov    %dx,0x48(%eax)
  103fa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103faa:	8b 40 18             	mov    0x18(%eax),%eax
  103fad:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  103fb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fb7:	8b 40 18             	mov    0x18(%eax),%eax
  103fba:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  103fc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fc4:	8b 40 18             	mov    0x18(%eax),%eax
  103fc7:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  103fce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fd1:	83 c0 6c             	add    $0x6c,%eax
  103fd4:	83 ec 04             	sub    $0x4,%esp
  103fd7:	6a 10                	push   $0x10
  103fd9:	68 fd 90 10 00       	push   $0x1090fd
  103fde:	50                   	push   %eax
  103fdf:	e8 57 0d 00 00       	call   104d3b <safestrcpy>
  103fe4:	83 c4 10             	add    $0x10,%esp
  103fe7:	83 ec 0c             	sub    $0xc,%esp
  103fea:	68 06 91 10 00       	push   $0x109106
  103fef:	e8 04 e5 ff ff       	call   1024f8 <namei>
  103ff4:	83 c4 10             	add    $0x10,%esp
  103ff7:	89 c2                	mov    %eax,%edx
  103ff9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ffc:	89 50 68             	mov    %edx,0x68(%eax)
  103fff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104002:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  104009:	83 ec 0c             	sub    $0xc,%esp
  10400c:	68 c0 13 11 00       	push   $0x1113c0
  104011:	e8 99 09 00 00       	call   1049af <release>
  104016:	83 c4 10             	add    $0x10,%esp
  104019:	90                   	nop
  10401a:	c9                   	leave  
  10401b:	c3                   	ret    

0010401c <growproc>:
  10401c:	55                   	push   %ebp
  10401d:	89 e5                	mov    %esp,%ebp
  10401f:	83 ec 18             	sub    $0x18,%esp
  104022:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104028:	8b 00                	mov    (%eax),%eax
  10402a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10402d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  104031:	7e 31                	jle    104064 <growproc+0x48>
  104033:	8b 55 08             	mov    0x8(%ebp),%edx
  104036:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104039:	01 c2                	add    %eax,%edx
  10403b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104041:	8b 40 04             	mov    0x4(%eax),%eax
  104044:	83 ec 04             	sub    $0x4,%esp
  104047:	52                   	push   %edx
  104048:	ff 75 f4             	pushl  -0xc(%ebp)
  10404b:	50                   	push   %eax
  10404c:	e8 24 39 00 00       	call   107975 <allocuvm>
  104051:	83 c4 10             	add    $0x10,%esp
  104054:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104057:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10405b:	75 3e                	jne    10409b <growproc+0x7f>
  10405d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104062:	eb 59                	jmp    1040bd <growproc+0xa1>
  104064:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  104068:	79 31                	jns    10409b <growproc+0x7f>
  10406a:	8b 55 08             	mov    0x8(%ebp),%edx
  10406d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104070:	01 c2                	add    %eax,%edx
  104072:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104078:	8b 40 04             	mov    0x4(%eax),%eax
  10407b:	83 ec 04             	sub    $0x4,%esp
  10407e:	52                   	push   %edx
  10407f:	ff 75 f4             	pushl  -0xc(%ebp)
  104082:	50                   	push   %eax
  104083:	e8 a7 39 00 00       	call   107a2f <deallocuvm>
  104088:	83 c4 10             	add    $0x10,%esp
  10408b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10408e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  104092:	75 07                	jne    10409b <growproc+0x7f>
  104094:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104099:	eb 22                	jmp    1040bd <growproc+0xa1>
  10409b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1040a4:	89 10                	mov    %edx,(%eax)
  1040a6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040ac:	83 ec 0c             	sub    $0xc,%esp
  1040af:	50                   	push   %eax
  1040b0:	e8 26 36 00 00       	call   1076db <switchuvm>
  1040b5:	83 c4 10             	add    $0x10,%esp
  1040b8:	b8 00 00 00 00       	mov    $0x0,%eax
  1040bd:	c9                   	leave  
  1040be:	c3                   	ret    

001040bf <fork>:
  1040bf:	55                   	push   %ebp
  1040c0:	89 e5                	mov    %esp,%ebp
  1040c2:	57                   	push   %edi
  1040c3:	56                   	push   %esi
  1040c4:	53                   	push   %ebx
  1040c5:	83 ec 1c             	sub    $0x1c,%esp
  1040c8:	e8 0e fd ff ff       	call   103ddb <allocproc>
  1040cd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1040d0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  1040d4:	75 0a                	jne    1040e0 <fork+0x21>
  1040d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1040db:	e9 4a 01 00 00       	jmp    10422a <fork+0x16b>
  1040e0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040e6:	8b 10                	mov    (%eax),%edx
  1040e8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040ee:	8b 40 04             	mov    0x4(%eax),%eax
  1040f1:	83 ec 08             	sub    $0x8,%esp
  1040f4:	52                   	push   %edx
  1040f5:	50                   	push   %eax
  1040f6:	e8 60 3a 00 00       	call   107b5b <copyuvm>
  1040fb:	83 c4 10             	add    $0x10,%esp
  1040fe:	89 c2                	mov    %eax,%edx
  104100:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104103:	89 50 04             	mov    %edx,0x4(%eax)
  104106:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104109:	8b 40 04             	mov    0x4(%eax),%eax
  10410c:	85 c0                	test   %eax,%eax
  10410e:	75 30                	jne    104140 <fork+0x81>
  104110:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104113:	8b 40 08             	mov    0x8(%eax),%eax
  104116:	83 ec 0c             	sub    $0xc,%esp
  104119:	50                   	push   %eax
  10411a:	e8 48 eb ff ff       	call   102c67 <kfree>
  10411f:	83 c4 10             	add    $0x10,%esp
  104122:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104125:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  10412c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10412f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  104136:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10413b:	e9 ea 00 00 00       	jmp    10422a <fork+0x16b>
  104140:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104146:	8b 10                	mov    (%eax),%edx
  104148:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10414b:	89 10                	mov    %edx,(%eax)
  10414d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  104154:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104157:	89 50 14             	mov    %edx,0x14(%eax)
  10415a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104160:	8b 48 18             	mov    0x18(%eax),%ecx
  104163:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104166:	8b 40 18             	mov    0x18(%eax),%eax
  104169:	89 c2                	mov    %eax,%edx
  10416b:	89 cb                	mov    %ecx,%ebx
  10416d:	b8 13 00 00 00       	mov    $0x13,%eax
  104172:	89 d7                	mov    %edx,%edi
  104174:	89 de                	mov    %ebx,%esi
  104176:	89 c1                	mov    %eax,%ecx
  104178:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10417a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10417d:	8b 40 18             	mov    0x18(%eax),%eax
  104180:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  104187:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10418e:	eb 43                	jmp    1041d3 <fork+0x114>
  104190:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104196:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  104199:	83 c2 08             	add    $0x8,%edx
  10419c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  1041a0:	85 c0                	test   %eax,%eax
  1041a2:	74 2b                	je     1041cf <fork+0x110>
  1041a4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1041aa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1041ad:	83 c2 08             	add    $0x8,%edx
  1041b0:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  1041b4:	83 ec 0c             	sub    $0xc,%esp
  1041b7:	50                   	push   %eax
  1041b8:	e8 23 ce ff ff       	call   100fe0 <filedup>
  1041bd:	83 c4 10             	add    $0x10,%esp
  1041c0:	89 c1                	mov    %eax,%ecx
  1041c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1041c5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1041c8:	83 c2 08             	add    $0x8,%edx
  1041cb:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
  1041cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  1041d3:	83 7d e4 0f          	cmpl   $0xf,-0x1c(%ebp)
  1041d7:	7e b7                	jle    104190 <fork+0xd1>
  1041d9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1041df:	8b 40 68             	mov    0x68(%eax),%eax
  1041e2:	83 ec 0c             	sub    $0xc,%esp
  1041e5:	50                   	push   %eax
  1041e6:	e8 50 d6 ff ff       	call   10183b <idup>
  1041eb:	83 c4 10             	add    $0x10,%esp
  1041ee:	89 c2                	mov    %eax,%edx
  1041f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1041f3:	89 50 68             	mov    %edx,0x68(%eax)
  1041f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1041f9:	8b 40 10             	mov    0x10(%eax),%eax
  1041fc:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1041ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104202:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  104209:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10420f:	8d 50 6c             	lea    0x6c(%eax),%edx
  104212:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104215:	83 c0 6c             	add    $0x6c,%eax
  104218:	83 ec 04             	sub    $0x4,%esp
  10421b:	6a 10                	push   $0x10
  10421d:	52                   	push   %edx
  10421e:	50                   	push   %eax
  10421f:	e8 17 0b 00 00       	call   104d3b <safestrcpy>
  104224:	83 c4 10             	add    $0x10,%esp
  104227:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10422a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10422d:	5b                   	pop    %ebx
  10422e:	5e                   	pop    %esi
  10422f:	5f                   	pop    %edi
  104230:	5d                   	pop    %ebp
  104231:	c3                   	ret    

00104232 <exit>:
  104232:	55                   	push   %ebp
  104233:	89 e5                	mov    %esp,%ebp
  104235:	83 ec 18             	sub    $0x18,%esp
  104238:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  10423f:	a1 6c cb 10 00       	mov    0x10cb6c,%eax
  104244:	39 c2                	cmp    %eax,%edx
  104246:	75 0d                	jne    104255 <exit+0x23>
  104248:	83 ec 0c             	sub    $0xc,%esp
  10424b:	68 08 91 10 00       	push   $0x109108
  104250:	e8 23 c3 ff ff       	call   100578 <panic>
  104255:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10425c:	eb 48                	jmp    1042a6 <exit+0x74>
  10425e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104264:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104267:	83 c2 08             	add    $0x8,%edx
  10426a:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  10426e:	85 c0                	test   %eax,%eax
  104270:	74 30                	je     1042a2 <exit+0x70>
  104272:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104278:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10427b:	83 c2 08             	add    $0x8,%edx
  10427e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  104282:	83 ec 0c             	sub    $0xc,%esp
  104285:	50                   	push   %eax
  104286:	e8 a6 cd ff ff       	call   101031 <fileclose>
  10428b:	83 c4 10             	add    $0x10,%esp
  10428e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104294:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104297:	83 c2 08             	add    $0x8,%edx
  10429a:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  1042a1:	00 
  1042a2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  1042a6:	83 7d f0 0f          	cmpl   $0xf,-0x10(%ebp)
  1042aa:	7e b2                	jle    10425e <exit+0x2c>
  1042ac:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1042b2:	8b 40 68             	mov    0x68(%eax),%eax
  1042b5:	83 ec 0c             	sub    $0xc,%esp
  1042b8:	50                   	push   %eax
  1042b9:	e8 9b d7 ff ff       	call   101a59 <iput>
  1042be:	83 c4 10             	add    $0x10,%esp
  1042c1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1042c7:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)
  1042ce:	83 ec 0c             	sub    $0xc,%esp
  1042d1:	68 c0 13 11 00       	push   $0x1113c0
  1042d6:	e8 6d 06 00 00       	call   104948 <acquire>
  1042db:	83 c4 10             	add    $0x10,%esp
  1042de:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1042e4:	8b 40 14             	mov    0x14(%eax),%eax
  1042e7:	83 ec 0c             	sub    $0xc,%esp
  1042ea:	50                   	push   %eax
  1042eb:	e8 0b 04 00 00       	call   1046fb <wakeup1>
  1042f0:	83 c4 10             	add    $0x10,%esp
  1042f3:	c7 45 f4 f4 13 11 00 	movl   $0x1113f4,-0xc(%ebp)
  1042fa:	eb 3c                	jmp    104338 <exit+0x106>
  1042fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1042ff:	8b 50 14             	mov    0x14(%eax),%edx
  104302:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104308:	39 c2                	cmp    %eax,%edx
  10430a:	75 28                	jne    104334 <exit+0x102>
  10430c:	8b 15 6c cb 10 00    	mov    0x10cb6c,%edx
  104312:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104315:	89 50 14             	mov    %edx,0x14(%eax)
  104318:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10431b:	8b 40 0c             	mov    0xc(%eax),%eax
  10431e:	83 f8 05             	cmp    $0x5,%eax
  104321:	75 11                	jne    104334 <exit+0x102>
  104323:	a1 6c cb 10 00       	mov    0x10cb6c,%eax
  104328:	83 ec 0c             	sub    $0xc,%esp
  10432b:	50                   	push   %eax
  10432c:	e8 ca 03 00 00       	call   1046fb <wakeup1>
  104331:	83 c4 10             	add    $0x10,%esp
  104334:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
  104338:	81 7d f4 f4 32 11 00 	cmpl   $0x1132f4,-0xc(%ebp)
  10433f:	72 bb                	jb     1042fc <exit+0xca>
  104341:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104347:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
  10434e:	e8 ec 01 00 00       	call   10453f <sched>
  104353:	83 ec 0c             	sub    $0xc,%esp
  104356:	68 15 91 10 00       	push   $0x109115
  10435b:	e8 18 c2 ff ff       	call   100578 <panic>

00104360 <rammake>:
  104360:	55                   	push   %ebp
  104361:	89 e5                	mov    %esp,%ebp
  104363:	83 ec 08             	sub    $0x8,%esp
  104366:	83 ec 0c             	sub    $0xc,%esp
  104369:	ff 75 08             	pushl  0x8(%ebp)
  10436c:	e8 72 42 00 00       	call   1085e3 <add_ram>
  104371:	83 c4 10             	add    $0x10,%esp
  104374:	c9                   	leave  
  104375:	c3                   	ret    

00104376 <wait>:
  104376:	55                   	push   %ebp
  104377:	89 e5                	mov    %esp,%ebp
  104379:	83 ec 18             	sub    $0x18,%esp
  10437c:	83 ec 0c             	sub    $0xc,%esp
  10437f:	68 c0 13 11 00       	push   $0x1113c0
  104384:	e8 bf 05 00 00       	call   104948 <acquire>
  104389:	83 c4 10             	add    $0x10,%esp
  10438c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  104393:	c7 45 f4 f4 13 11 00 	movl   $0x1113f4,-0xc(%ebp)
  10439a:	e9 a6 00 00 00       	jmp    104445 <wait+0xcf>
  10439f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043a2:	8b 50 14             	mov    0x14(%eax),%edx
  1043a5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1043ab:	39 c2                	cmp    %eax,%edx
  1043ad:	0f 85 8d 00 00 00    	jne    104440 <wait+0xca>
  1043b3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  1043ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043bd:	8b 40 0c             	mov    0xc(%eax),%eax
  1043c0:	83 f8 05             	cmp    $0x5,%eax
  1043c3:	75 7c                	jne    104441 <wait+0xcb>
  1043c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043c8:	8b 40 10             	mov    0x10(%eax),%eax
  1043cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1043ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043d1:	8b 40 08             	mov    0x8(%eax),%eax
  1043d4:	83 ec 0c             	sub    $0xc,%esp
  1043d7:	50                   	push   %eax
  1043d8:	e8 8a e8 ff ff       	call   102c67 <kfree>
  1043dd:	83 c4 10             	add    $0x10,%esp
  1043e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043e3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  1043ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043ed:	8b 40 04             	mov    0x4(%eax),%eax
  1043f0:	83 ec 0c             	sub    $0xc,%esp
  1043f3:	50                   	push   %eax
  1043f4:	e8 d3 36 00 00       	call   107acc <freevm>
  1043f9:	83 c4 10             	add    $0x10,%esp
  1043fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043ff:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  104406:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104409:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  104410:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104413:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  10441a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10441d:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
  104421:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104424:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
  10442b:	83 ec 0c             	sub    $0xc,%esp
  10442e:	68 c0 13 11 00       	push   $0x1113c0
  104433:	e8 77 05 00 00       	call   1049af <release>
  104438:	83 c4 10             	add    $0x10,%esp
  10443b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10443e:	eb 58                	jmp    104498 <wait+0x122>
  104440:	90                   	nop
  104441:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
  104445:	81 7d f4 f4 32 11 00 	cmpl   $0x1132f4,-0xc(%ebp)
  10444c:	0f 82 4d ff ff ff    	jb     10439f <wait+0x29>
  104452:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  104456:	74 0d                	je     104465 <wait+0xef>
  104458:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10445e:	8b 40 24             	mov    0x24(%eax),%eax
  104461:	85 c0                	test   %eax,%eax
  104463:	74 17                	je     10447c <wait+0x106>
  104465:	83 ec 0c             	sub    $0xc,%esp
  104468:	68 c0 13 11 00       	push   $0x1113c0
  10446d:	e8 3d 05 00 00       	call   1049af <release>
  104472:	83 c4 10             	add    $0x10,%esp
  104475:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10447a:	eb 1c                	jmp    104498 <wait+0x122>
  10447c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104482:	83 ec 08             	sub    $0x8,%esp
  104485:	68 c0 13 11 00       	push   $0x1113c0
  10448a:	50                   	push   %eax
  10448b:	e8 bf 01 00 00       	call   10464f <sleep>
  104490:	83 c4 10             	add    $0x10,%esp
  104493:	e9 f4 fe ff ff       	jmp    10438c <wait+0x16>
  104498:	c9                   	leave  
  104499:	c3                   	ret    

0010449a <scheduler>:
  10449a:	55                   	push   %ebp
  10449b:	89 e5                	mov    %esp,%ebp
  10449d:	83 ec 18             	sub    $0x18,%esp
  1044a0:	e8 11 f9 ff ff       	call   103db6 <sti>
  1044a5:	83 ec 0c             	sub    $0xc,%esp
  1044a8:	68 c0 13 11 00       	push   $0x1113c0
  1044ad:	e8 96 04 00 00       	call   104948 <acquire>
  1044b2:	83 c4 10             	add    $0x10,%esp
  1044b5:	c7 45 f4 f4 13 11 00 	movl   $0x1113f4,-0xc(%ebp)
  1044bc:	eb 63                	jmp    104521 <scheduler+0x87>
  1044be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1044c1:	8b 40 0c             	mov    0xc(%eax),%eax
  1044c4:	83 f8 03             	cmp    $0x3,%eax
  1044c7:	75 53                	jne    10451c <scheduler+0x82>
  1044c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1044cc:	65 a3 04 00 00 00    	mov    %eax,%gs:0x4
  1044d2:	83 ec 0c             	sub    $0xc,%esp
  1044d5:	ff 75 f4             	pushl  -0xc(%ebp)
  1044d8:	e8 fe 31 00 00       	call   1076db <switchuvm>
  1044dd:	83 c4 10             	add    $0x10,%esp
  1044e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1044e3:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
  1044ea:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1044f0:	8b 40 1c             	mov    0x1c(%eax),%eax
  1044f3:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1044fa:	83 c2 04             	add    $0x4,%edx
  1044fd:	83 ec 08             	sub    $0x8,%esp
  104500:	50                   	push   %eax
  104501:	52                   	push   %edx
  104502:	e8 a5 08 00 00       	call   104dac <swtch>
  104507:	83 c4 10             	add    $0x10,%esp
  10450a:	e8 b8 31 00 00       	call   1076c7 <switchkvm>
  10450f:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
  104516:	00 00 00 00 
  10451a:	eb 01                	jmp    10451d <scheduler+0x83>
  10451c:	90                   	nop
  10451d:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
  104521:	81 7d f4 f4 32 11 00 	cmpl   $0x1132f4,-0xc(%ebp)
  104528:	72 94                	jb     1044be <scheduler+0x24>
  10452a:	83 ec 0c             	sub    $0xc,%esp
  10452d:	68 c0 13 11 00       	push   $0x1113c0
  104532:	e8 78 04 00 00       	call   1049af <release>
  104537:	83 c4 10             	add    $0x10,%esp
  10453a:	e9 61 ff ff ff       	jmp    1044a0 <scheduler+0x6>

0010453f <sched>:
  10453f:	55                   	push   %ebp
  104540:	89 e5                	mov    %esp,%ebp
  104542:	83 ec 18             	sub    $0x18,%esp
  104545:	83 ec 0c             	sub    $0xc,%esp
  104548:	68 c0 13 11 00       	push   $0x1113c0
  10454d:	e8 29 05 00 00       	call   104a7b <holding>
  104552:	83 c4 10             	add    $0x10,%esp
  104555:	85 c0                	test   %eax,%eax
  104557:	75 0d                	jne    104566 <sched+0x27>
  104559:	83 ec 0c             	sub    $0xc,%esp
  10455c:	68 21 91 10 00       	push   $0x109121
  104561:	e8 12 c0 ff ff       	call   100578 <panic>
  104566:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  10456c:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  104572:	83 f8 01             	cmp    $0x1,%eax
  104575:	74 0d                	je     104584 <sched+0x45>
  104577:	83 ec 0c             	sub    $0xc,%esp
  10457a:	68 33 91 10 00       	push   $0x109133
  10457f:	e8 f4 bf ff ff       	call   100578 <panic>
  104584:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10458a:	8b 40 0c             	mov    0xc(%eax),%eax
  10458d:	83 f8 04             	cmp    $0x4,%eax
  104590:	75 0d                	jne    10459f <sched+0x60>
  104592:	83 ec 0c             	sub    $0xc,%esp
  104595:	68 3f 91 10 00       	push   $0x10913f
  10459a:	e8 d9 bf ff ff       	call   100578 <panic>
  10459f:	e8 02 f8 ff ff       	call   103da6 <readeflags>
  1045a4:	25 00 02 00 00       	and    $0x200,%eax
  1045a9:	85 c0                	test   %eax,%eax
  1045ab:	74 0d                	je     1045ba <sched+0x7b>
  1045ad:	83 ec 0c             	sub    $0xc,%esp
  1045b0:	68 4d 91 10 00       	push   $0x10914d
  1045b5:	e8 be bf ff ff       	call   100578 <panic>
  1045ba:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1045c0:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  1045c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1045c9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1045cf:	8b 40 04             	mov    0x4(%eax),%eax
  1045d2:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  1045d9:	83 c2 1c             	add    $0x1c,%edx
  1045dc:	83 ec 08             	sub    $0x8,%esp
  1045df:	50                   	push   %eax
  1045e0:	52                   	push   %edx
  1045e1:	e8 c6 07 00 00       	call   104dac <swtch>
  1045e6:	83 c4 10             	add    $0x10,%esp
  1045e9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1045ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1045f2:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
  1045f8:	90                   	nop
  1045f9:	c9                   	leave  
  1045fa:	c3                   	ret    

001045fb <yield>:
  1045fb:	55                   	push   %ebp
  1045fc:	89 e5                	mov    %esp,%ebp
  1045fe:	83 ec 08             	sub    $0x8,%esp
  104601:	83 ec 0c             	sub    $0xc,%esp
  104604:	68 c0 13 11 00       	push   $0x1113c0
  104609:	e8 3a 03 00 00       	call   104948 <acquire>
  10460e:	83 c4 10             	add    $0x10,%esp
  104611:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104617:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  10461e:	e8 1c ff ff ff       	call   10453f <sched>
  104623:	83 ec 0c             	sub    $0xc,%esp
  104626:	68 c0 13 11 00       	push   $0x1113c0
  10462b:	e8 7f 03 00 00       	call   1049af <release>
  104630:	83 c4 10             	add    $0x10,%esp
  104633:	90                   	nop
  104634:	c9                   	leave  
  104635:	c3                   	ret    

00104636 <forkret>:
  104636:	55                   	push   %ebp
  104637:	89 e5                	mov    %esp,%ebp
  104639:	83 ec 08             	sub    $0x8,%esp
  10463c:	83 ec 0c             	sub    $0xc,%esp
  10463f:	68 c0 13 11 00       	push   $0x1113c0
  104644:	e8 66 03 00 00       	call   1049af <release>
  104649:	83 c4 10             	add    $0x10,%esp
  10464c:	90                   	nop
  10464d:	c9                   	leave  
  10464e:	c3                   	ret    

0010464f <sleep>:
  10464f:	55                   	push   %ebp
  104650:	89 e5                	mov    %esp,%ebp
  104652:	83 ec 08             	sub    $0x8,%esp
  104655:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10465b:	85 c0                	test   %eax,%eax
  10465d:	75 0d                	jne    10466c <sleep+0x1d>
  10465f:	83 ec 0c             	sub    $0xc,%esp
  104662:	68 61 91 10 00       	push   $0x109161
  104667:	e8 0c bf ff ff       	call   100578 <panic>
  10466c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  104670:	75 0d                	jne    10467f <sleep+0x30>
  104672:	83 ec 0c             	sub    $0xc,%esp
  104675:	68 67 91 10 00       	push   $0x109167
  10467a:	e8 f9 be ff ff       	call   100578 <panic>
  10467f:	81 7d 0c c0 13 11 00 	cmpl   $0x1113c0,0xc(%ebp)
  104686:	74 1e                	je     1046a6 <sleep+0x57>
  104688:	83 ec 0c             	sub    $0xc,%esp
  10468b:	68 c0 13 11 00       	push   $0x1113c0
  104690:	e8 b3 02 00 00       	call   104948 <acquire>
  104695:	83 c4 10             	add    $0x10,%esp
  104698:	83 ec 0c             	sub    $0xc,%esp
  10469b:	ff 75 0c             	pushl  0xc(%ebp)
  10469e:	e8 0c 03 00 00       	call   1049af <release>
  1046a3:	83 c4 10             	add    $0x10,%esp
  1046a6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1046ac:	8b 55 08             	mov    0x8(%ebp),%edx
  1046af:	89 50 20             	mov    %edx,0x20(%eax)
  1046b2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1046b8:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  1046bf:	e8 7b fe ff ff       	call   10453f <sched>
  1046c4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1046ca:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  1046d1:	81 7d 0c c0 13 11 00 	cmpl   $0x1113c0,0xc(%ebp)
  1046d8:	74 1e                	je     1046f8 <sleep+0xa9>
  1046da:	83 ec 0c             	sub    $0xc,%esp
  1046dd:	68 c0 13 11 00       	push   $0x1113c0
  1046e2:	e8 c8 02 00 00       	call   1049af <release>
  1046e7:	83 c4 10             	add    $0x10,%esp
  1046ea:	83 ec 0c             	sub    $0xc,%esp
  1046ed:	ff 75 0c             	pushl  0xc(%ebp)
  1046f0:	e8 53 02 00 00       	call   104948 <acquire>
  1046f5:	83 c4 10             	add    $0x10,%esp
  1046f8:	90                   	nop
  1046f9:	c9                   	leave  
  1046fa:	c3                   	ret    

001046fb <wakeup1>:
  1046fb:	55                   	push   %ebp
  1046fc:	89 e5                	mov    %esp,%ebp
  1046fe:	83 ec 10             	sub    $0x10,%esp
  104701:	c7 45 fc f4 13 11 00 	movl   $0x1113f4,-0x4(%ebp)
  104708:	eb 24                	jmp    10472e <wakeup1+0x33>
  10470a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10470d:	8b 40 0c             	mov    0xc(%eax),%eax
  104710:	83 f8 02             	cmp    $0x2,%eax
  104713:	75 15                	jne    10472a <wakeup1+0x2f>
  104715:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104718:	8b 40 20             	mov    0x20(%eax),%eax
  10471b:	39 45 08             	cmp    %eax,0x8(%ebp)
  10471e:	75 0a                	jne    10472a <wakeup1+0x2f>
  104720:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104723:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  10472a:	83 45 fc 7c          	addl   $0x7c,-0x4(%ebp)
  10472e:	81 7d fc f4 32 11 00 	cmpl   $0x1132f4,-0x4(%ebp)
  104735:	72 d3                	jb     10470a <wakeup1+0xf>
  104737:	90                   	nop
  104738:	c9                   	leave  
  104739:	c3                   	ret    

0010473a <wakeup>:
  10473a:	55                   	push   %ebp
  10473b:	89 e5                	mov    %esp,%ebp
  10473d:	83 ec 08             	sub    $0x8,%esp
  104740:	83 ec 0c             	sub    $0xc,%esp
  104743:	68 c0 13 11 00       	push   $0x1113c0
  104748:	e8 fb 01 00 00       	call   104948 <acquire>
  10474d:	83 c4 10             	add    $0x10,%esp
  104750:	83 ec 0c             	sub    $0xc,%esp
  104753:	ff 75 08             	pushl  0x8(%ebp)
  104756:	e8 a0 ff ff ff       	call   1046fb <wakeup1>
  10475b:	83 c4 10             	add    $0x10,%esp
  10475e:	83 ec 0c             	sub    $0xc,%esp
  104761:	68 c0 13 11 00       	push   $0x1113c0
  104766:	e8 44 02 00 00       	call   1049af <release>
  10476b:	83 c4 10             	add    $0x10,%esp
  10476e:	90                   	nop
  10476f:	c9                   	leave  
  104770:	c3                   	ret    

00104771 <kill>:
  104771:	55                   	push   %ebp
  104772:	89 e5                	mov    %esp,%ebp
  104774:	83 ec 18             	sub    $0x18,%esp
  104777:	83 ec 0c             	sub    $0xc,%esp
  10477a:	68 c0 13 11 00       	push   $0x1113c0
  10477f:	e8 c4 01 00 00       	call   104948 <acquire>
  104784:	83 c4 10             	add    $0x10,%esp
  104787:	c7 45 f4 f4 13 11 00 	movl   $0x1113f4,-0xc(%ebp)
  10478e:	eb 45                	jmp    1047d5 <kill+0x64>
  104790:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104793:	8b 40 10             	mov    0x10(%eax),%eax
  104796:	39 45 08             	cmp    %eax,0x8(%ebp)
  104799:	75 36                	jne    1047d1 <kill+0x60>
  10479b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10479e:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  1047a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1047a8:	8b 40 0c             	mov    0xc(%eax),%eax
  1047ab:	83 f8 02             	cmp    $0x2,%eax
  1047ae:	75 0a                	jne    1047ba <kill+0x49>
  1047b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1047b3:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  1047ba:	83 ec 0c             	sub    $0xc,%esp
  1047bd:	68 c0 13 11 00       	push   $0x1113c0
  1047c2:	e8 e8 01 00 00       	call   1049af <release>
  1047c7:	83 c4 10             	add    $0x10,%esp
  1047ca:	b8 00 00 00 00       	mov    $0x0,%eax
  1047cf:	eb 22                	jmp    1047f3 <kill+0x82>
  1047d1:	83 45 f4 7c          	addl   $0x7c,-0xc(%ebp)
  1047d5:	81 7d f4 f4 32 11 00 	cmpl   $0x1132f4,-0xc(%ebp)
  1047dc:	72 b2                	jb     104790 <kill+0x1f>
  1047de:	83 ec 0c             	sub    $0xc,%esp
  1047e1:	68 c0 13 11 00       	push   $0x1113c0
  1047e6:	e8 c4 01 00 00       	call   1049af <release>
  1047eb:	83 c4 10             	add    $0x10,%esp
  1047ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1047f3:	c9                   	leave  
  1047f4:	c3                   	ret    

001047f5 <procdump>:
  1047f5:	55                   	push   %ebp
  1047f6:	89 e5                	mov    %esp,%ebp
  1047f8:	83 ec 48             	sub    $0x48,%esp
  1047fb:	c7 45 f0 f4 13 11 00 	movl   $0x1113f4,-0x10(%ebp)
  104802:	e9 d7 00 00 00       	jmp    1048de <procdump+0xe9>
  104807:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10480a:	8b 40 0c             	mov    0xc(%eax),%eax
  10480d:	85 c0                	test   %eax,%eax
  10480f:	0f 84 c4 00 00 00    	je     1048d9 <procdump+0xe4>
  104815:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104818:	8b 40 0c             	mov    0xc(%eax),%eax
  10481b:	83 f8 05             	cmp    $0x5,%eax
  10481e:	77 23                	ja     104843 <procdump+0x4e>
  104820:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104823:	8b 40 0c             	mov    0xc(%eax),%eax
  104826:	8b 04 85 38 c5 10 00 	mov    0x10c538(,%eax,4),%eax
  10482d:	85 c0                	test   %eax,%eax
  10482f:	74 12                	je     104843 <procdump+0x4e>
  104831:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104834:	8b 40 0c             	mov    0xc(%eax),%eax
  104837:	8b 04 85 38 c5 10 00 	mov    0x10c538(,%eax,4),%eax
  10483e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  104841:	eb 07                	jmp    10484a <procdump+0x55>
  104843:	c7 45 ec 78 91 10 00 	movl   $0x109178,-0x14(%ebp)
  10484a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10484d:	8d 50 6c             	lea    0x6c(%eax),%edx
  104850:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104853:	8b 40 10             	mov    0x10(%eax),%eax
  104856:	52                   	push   %edx
  104857:	ff 75 ec             	pushl  -0x14(%ebp)
  10485a:	50                   	push   %eax
  10485b:	68 7c 91 10 00       	push   $0x10917c
  104860:	e8 87 bb ff ff       	call   1003ec <cprintf>
  104865:	83 c4 10             	add    $0x10,%esp
  104868:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10486b:	8b 40 0c             	mov    0xc(%eax),%eax
  10486e:	83 f8 02             	cmp    $0x2,%eax
  104871:	75 54                	jne    1048c7 <procdump+0xd2>
  104873:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104876:	8b 40 1c             	mov    0x1c(%eax),%eax
  104879:	8b 40 0c             	mov    0xc(%eax),%eax
  10487c:	83 c0 08             	add    $0x8,%eax
  10487f:	89 c2                	mov    %eax,%edx
  104881:	83 ec 08             	sub    $0x8,%esp
  104884:	8d 45 c4             	lea    -0x3c(%ebp),%eax
  104887:	50                   	push   %eax
  104888:	52                   	push   %edx
  104889:	e8 73 01 00 00       	call   104a01 <getcallerpcs>
  10488e:	83 c4 10             	add    $0x10,%esp
  104891:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104898:	eb 1c                	jmp    1048b6 <procdump+0xc1>
  10489a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10489d:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
  1048a1:	83 ec 08             	sub    $0x8,%esp
  1048a4:	50                   	push   %eax
  1048a5:	68 85 91 10 00       	push   $0x109185
  1048aa:	e8 3d bb ff ff       	call   1003ec <cprintf>
  1048af:	83 c4 10             	add    $0x10,%esp
  1048b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1048b6:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  1048ba:	7f 0b                	jg     1048c7 <procdump+0xd2>
  1048bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1048bf:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
  1048c3:	85 c0                	test   %eax,%eax
  1048c5:	75 d3                	jne    10489a <procdump+0xa5>
  1048c7:	83 ec 0c             	sub    $0xc,%esp
  1048ca:	68 89 91 10 00       	push   $0x109189
  1048cf:	e8 18 bb ff ff       	call   1003ec <cprintf>
  1048d4:	83 c4 10             	add    $0x10,%esp
  1048d7:	eb 01                	jmp    1048da <procdump+0xe5>
  1048d9:	90                   	nop
  1048da:	83 45 f0 7c          	addl   $0x7c,-0x10(%ebp)
  1048de:	81 7d f0 f4 32 11 00 	cmpl   $0x1132f4,-0x10(%ebp)
  1048e5:	0f 82 1c ff ff ff    	jb     104807 <procdump+0x12>
  1048eb:	90                   	nop
  1048ec:	c9                   	leave  
  1048ed:	c3                   	ret    

001048ee <readeflags>:
  1048ee:	55                   	push   %ebp
  1048ef:	89 e5                	mov    %esp,%ebp
  1048f1:	83 ec 10             	sub    $0x10,%esp
  1048f4:	9c                   	pushf  
  1048f5:	58                   	pop    %eax
  1048f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1048f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1048fc:	c9                   	leave  
  1048fd:	c3                   	ret    

001048fe <cli>:
  1048fe:	55                   	push   %ebp
  1048ff:	89 e5                	mov    %esp,%ebp
  104901:	fa                   	cli    
  104902:	90                   	nop
  104903:	5d                   	pop    %ebp
  104904:	c3                   	ret    

00104905 <sti>:
  104905:	55                   	push   %ebp
  104906:	89 e5                	mov    %esp,%ebp
  104908:	fb                   	sti    
  104909:	90                   	nop
  10490a:	5d                   	pop    %ebp
  10490b:	c3                   	ret    

0010490c <xchg>:
  10490c:	55                   	push   %ebp
  10490d:	89 e5                	mov    %esp,%ebp
  10490f:	83 ec 10             	sub    $0x10,%esp
  104912:	8b 55 08             	mov    0x8(%ebp),%edx
  104915:	8b 45 0c             	mov    0xc(%ebp),%eax
  104918:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10491b:	f0 87 02             	lock xchg %eax,(%edx)
  10491e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104921:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104924:	c9                   	leave  
  104925:	c3                   	ret    

00104926 <initlock>:
  104926:	55                   	push   %ebp
  104927:	89 e5                	mov    %esp,%ebp
  104929:	8b 45 08             	mov    0x8(%ebp),%eax
  10492c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10492f:	89 50 04             	mov    %edx,0x4(%eax)
  104932:	8b 45 08             	mov    0x8(%ebp),%eax
  104935:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  10493b:	8b 45 08             	mov    0x8(%ebp),%eax
  10493e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  104945:	90                   	nop
  104946:	5d                   	pop    %ebp
  104947:	c3                   	ret    

00104948 <acquire>:
  104948:	55                   	push   %ebp
  104949:	89 e5                	mov    %esp,%ebp
  10494b:	83 ec 08             	sub    $0x8,%esp
  10494e:	e8 52 01 00 00       	call   104aa5 <pushcli>
  104953:	8b 45 08             	mov    0x8(%ebp),%eax
  104956:	83 ec 0c             	sub    $0xc,%esp
  104959:	50                   	push   %eax
  10495a:	e8 1c 01 00 00       	call   104a7b <holding>
  10495f:	83 c4 10             	add    $0x10,%esp
  104962:	85 c0                	test   %eax,%eax
  104964:	74 0d                	je     104973 <acquire+0x2b>
  104966:	83 ec 0c             	sub    $0xc,%esp
  104969:	68 b5 91 10 00       	push   $0x1091b5
  10496e:	e8 05 bc ff ff       	call   100578 <panic>
  104973:	90                   	nop
  104974:	8b 45 08             	mov    0x8(%ebp),%eax
  104977:	83 ec 08             	sub    $0x8,%esp
  10497a:	6a 01                	push   $0x1
  10497c:	50                   	push   %eax
  10497d:	e8 8a ff ff ff       	call   10490c <xchg>
  104982:	83 c4 10             	add    $0x10,%esp
  104985:	85 c0                	test   %eax,%eax
  104987:	75 eb                	jne    104974 <acquire+0x2c>
  104989:	8b 45 08             	mov    0x8(%ebp),%eax
  10498c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  104993:	89 50 08             	mov    %edx,0x8(%eax)
  104996:	8b 45 08             	mov    0x8(%ebp),%eax
  104999:	83 c0 0c             	add    $0xc,%eax
  10499c:	83 ec 08             	sub    $0x8,%esp
  10499f:	50                   	push   %eax
  1049a0:	8d 45 08             	lea    0x8(%ebp),%eax
  1049a3:	50                   	push   %eax
  1049a4:	e8 58 00 00 00       	call   104a01 <getcallerpcs>
  1049a9:	83 c4 10             	add    $0x10,%esp
  1049ac:	90                   	nop
  1049ad:	c9                   	leave  
  1049ae:	c3                   	ret    

001049af <release>:
  1049af:	55                   	push   %ebp
  1049b0:	89 e5                	mov    %esp,%ebp
  1049b2:	83 ec 08             	sub    $0x8,%esp
  1049b5:	83 ec 0c             	sub    $0xc,%esp
  1049b8:	ff 75 08             	pushl  0x8(%ebp)
  1049bb:	e8 bb 00 00 00       	call   104a7b <holding>
  1049c0:	83 c4 10             	add    $0x10,%esp
  1049c3:	85 c0                	test   %eax,%eax
  1049c5:	75 0d                	jne    1049d4 <release+0x25>
  1049c7:	83 ec 0c             	sub    $0xc,%esp
  1049ca:	68 bd 91 10 00       	push   $0x1091bd
  1049cf:	e8 a4 bb ff ff       	call   100578 <panic>
  1049d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1049d7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  1049de:	8b 45 08             	mov    0x8(%ebp),%eax
  1049e1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  1049e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1049eb:	83 ec 08             	sub    $0x8,%esp
  1049ee:	6a 00                	push   $0x0
  1049f0:	50                   	push   %eax
  1049f1:	e8 16 ff ff ff       	call   10490c <xchg>
  1049f6:	83 c4 10             	add    $0x10,%esp
  1049f9:	e8 ec 00 00 00       	call   104aea <popcli>
  1049fe:	90                   	nop
  1049ff:	c9                   	leave  
  104a00:	c3                   	ret    

00104a01 <getcallerpcs>:
  104a01:	55                   	push   %ebp
  104a02:	89 e5                	mov    %esp,%ebp
  104a04:	83 ec 10             	sub    $0x10,%esp
  104a07:	8b 45 08             	mov    0x8(%ebp),%eax
  104a0a:	83 e8 08             	sub    $0x8,%eax
  104a0d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104a10:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  104a17:	eb 38                	jmp    104a51 <getcallerpcs+0x50>
  104a19:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  104a1d:	74 53                	je     104a72 <getcallerpcs+0x71>
  104a1f:	81 7d fc ff ff 0f 00 	cmpl   $0xfffff,-0x4(%ebp)
  104a26:	76 4a                	jbe    104a72 <getcallerpcs+0x71>
  104a28:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  104a2c:	74 44                	je     104a72 <getcallerpcs+0x71>
  104a2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  104a31:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  104a38:	8b 45 0c             	mov    0xc(%ebp),%eax
  104a3b:	01 c2                	add    %eax,%edx
  104a3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104a40:	8b 40 04             	mov    0x4(%eax),%eax
  104a43:	89 02                	mov    %eax,(%edx)
  104a45:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104a48:	8b 00                	mov    (%eax),%eax
  104a4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104a4d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  104a51:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  104a55:	7e c2                	jle    104a19 <getcallerpcs+0x18>
  104a57:	eb 19                	jmp    104a72 <getcallerpcs+0x71>
  104a59:	8b 45 f8             	mov    -0x8(%ebp),%eax
  104a5c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  104a63:	8b 45 0c             	mov    0xc(%ebp),%eax
  104a66:	01 d0                	add    %edx,%eax
  104a68:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  104a6e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  104a72:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  104a76:	7e e1                	jle    104a59 <getcallerpcs+0x58>
  104a78:	90                   	nop
  104a79:	c9                   	leave  
  104a7a:	c3                   	ret    

00104a7b <holding>:
  104a7b:	55                   	push   %ebp
  104a7c:	89 e5                	mov    %esp,%ebp
  104a7e:	8b 45 08             	mov    0x8(%ebp),%eax
  104a81:	8b 00                	mov    (%eax),%eax
  104a83:	85 c0                	test   %eax,%eax
  104a85:	74 17                	je     104a9e <holding+0x23>
  104a87:	8b 45 08             	mov    0x8(%ebp),%eax
  104a8a:	8b 50 08             	mov    0x8(%eax),%edx
  104a8d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  104a93:	39 c2                	cmp    %eax,%edx
  104a95:	75 07                	jne    104a9e <holding+0x23>
  104a97:	b8 01 00 00 00       	mov    $0x1,%eax
  104a9c:	eb 05                	jmp    104aa3 <holding+0x28>
  104a9e:	b8 00 00 00 00       	mov    $0x0,%eax
  104aa3:	5d                   	pop    %ebp
  104aa4:	c3                   	ret    

00104aa5 <pushcli>:
  104aa5:	55                   	push   %ebp
  104aa6:	89 e5                	mov    %esp,%ebp
  104aa8:	83 ec 10             	sub    $0x10,%esp
  104aab:	e8 3e fe ff ff       	call   1048ee <readeflags>
  104ab0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104ab3:	e8 46 fe ff ff       	call   1048fe <cli>
  104ab8:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  104abf:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
  104ac5:	8d 48 01             	lea    0x1(%eax),%ecx
  104ac8:	89 8a ac 00 00 00    	mov    %ecx,0xac(%edx)
  104ace:	85 c0                	test   %eax,%eax
  104ad0:	75 15                	jne    104ae7 <pushcli+0x42>
  104ad2:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  104ad8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  104adb:	81 e2 00 02 00 00    	and    $0x200,%edx
  104ae1:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
  104ae7:	90                   	nop
  104ae8:	c9                   	leave  
  104ae9:	c3                   	ret    

00104aea <popcli>:
  104aea:	55                   	push   %ebp
  104aeb:	89 e5                	mov    %esp,%ebp
  104aed:	83 ec 08             	sub    $0x8,%esp
  104af0:	e8 f9 fd ff ff       	call   1048ee <readeflags>
  104af5:	25 00 02 00 00       	and    $0x200,%eax
  104afa:	85 c0                	test   %eax,%eax
  104afc:	74 0d                	je     104b0b <popcli+0x21>
  104afe:	83 ec 0c             	sub    $0xc,%esp
  104b01:	68 c5 91 10 00       	push   $0x1091c5
  104b06:	e8 6d ba ff ff       	call   100578 <panic>
  104b0b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  104b11:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
  104b17:	83 ea 01             	sub    $0x1,%edx
  104b1a:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
  104b20:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  104b26:	85 c0                	test   %eax,%eax
  104b28:	79 0d                	jns    104b37 <popcli+0x4d>
  104b2a:	83 ec 0c             	sub    $0xc,%esp
  104b2d:	68 dc 91 10 00       	push   $0x1091dc
  104b32:	e8 41 ba ff ff       	call   100578 <panic>
  104b37:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  104b3d:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  104b43:	85 c0                	test   %eax,%eax
  104b45:	75 15                	jne    104b5c <popcli+0x72>
  104b47:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  104b4d:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  104b53:	85 c0                	test   %eax,%eax
  104b55:	74 05                	je     104b5c <popcli+0x72>
  104b57:	e8 a9 fd ff ff       	call   104905 <sti>
  104b5c:	90                   	nop
  104b5d:	c9                   	leave  
  104b5e:	c3                   	ret    

00104b5f <stosb>:
  104b5f:	55                   	push   %ebp
  104b60:	89 e5                	mov    %esp,%ebp
  104b62:	57                   	push   %edi
  104b63:	53                   	push   %ebx
  104b64:	8b 4d 08             	mov    0x8(%ebp),%ecx
  104b67:	8b 55 10             	mov    0x10(%ebp),%edx
  104b6a:	8b 45 0c             	mov    0xc(%ebp),%eax
  104b6d:	89 cb                	mov    %ecx,%ebx
  104b6f:	89 df                	mov    %ebx,%edi
  104b71:	89 d1                	mov    %edx,%ecx
  104b73:	fc                   	cld    
  104b74:	f3 aa                	rep stos %al,%es:(%edi)
  104b76:	89 ca                	mov    %ecx,%edx
  104b78:	89 fb                	mov    %edi,%ebx
  104b7a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  104b7d:	89 55 10             	mov    %edx,0x10(%ebp)
  104b80:	90                   	nop
  104b81:	5b                   	pop    %ebx
  104b82:	5f                   	pop    %edi
  104b83:	5d                   	pop    %ebp
  104b84:	c3                   	ret    

00104b85 <memset>:
  104b85:	55                   	push   %ebp
  104b86:	89 e5                	mov    %esp,%ebp
  104b88:	8b 45 10             	mov    0x10(%ebp),%eax
  104b8b:	50                   	push   %eax
  104b8c:	ff 75 0c             	pushl  0xc(%ebp)
  104b8f:	ff 75 08             	pushl  0x8(%ebp)
  104b92:	e8 c8 ff ff ff       	call   104b5f <stosb>
  104b97:	83 c4 0c             	add    $0xc,%esp
  104b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  104b9d:	c9                   	leave  
  104b9e:	c3                   	ret    

00104b9f <memcmp>:
  104b9f:	55                   	push   %ebp
  104ba0:	89 e5                	mov    %esp,%ebp
  104ba2:	83 ec 10             	sub    $0x10,%esp
  104ba5:	8b 45 08             	mov    0x8(%ebp),%eax
  104ba8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104bab:	8b 45 0c             	mov    0xc(%ebp),%eax
  104bae:	89 45 f8             	mov    %eax,-0x8(%ebp)
  104bb1:	eb 30                	jmp    104be3 <memcmp+0x44>
  104bb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104bb6:	0f b6 10             	movzbl (%eax),%edx
  104bb9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  104bbc:	0f b6 00             	movzbl (%eax),%eax
  104bbf:	38 c2                	cmp    %al,%dl
  104bc1:	74 18                	je     104bdb <memcmp+0x3c>
  104bc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104bc6:	0f b6 00             	movzbl (%eax),%eax
  104bc9:	0f b6 d0             	movzbl %al,%edx
  104bcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  104bcf:	0f b6 00             	movzbl (%eax),%eax
  104bd2:	0f b6 c0             	movzbl %al,%eax
  104bd5:	29 c2                	sub    %eax,%edx
  104bd7:	89 d0                	mov    %edx,%eax
  104bd9:	eb 1a                	jmp    104bf5 <memcmp+0x56>
  104bdb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  104bdf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  104be3:	8b 45 10             	mov    0x10(%ebp),%eax
  104be6:	8d 50 ff             	lea    -0x1(%eax),%edx
  104be9:	89 55 10             	mov    %edx,0x10(%ebp)
  104bec:	85 c0                	test   %eax,%eax
  104bee:	75 c3                	jne    104bb3 <memcmp+0x14>
  104bf0:	b8 00 00 00 00       	mov    $0x0,%eax
  104bf5:	c9                   	leave  
  104bf6:	c3                   	ret    

00104bf7 <memmove>:
  104bf7:	55                   	push   %ebp
  104bf8:	89 e5                	mov    %esp,%ebp
  104bfa:	83 ec 10             	sub    $0x10,%esp
  104bfd:	8b 45 0c             	mov    0xc(%ebp),%eax
  104c00:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104c03:	8b 45 08             	mov    0x8(%ebp),%eax
  104c06:	89 45 f8             	mov    %eax,-0x8(%ebp)
  104c09:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104c0c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  104c0f:	73 54                	jae    104c65 <memmove+0x6e>
  104c11:	8b 55 fc             	mov    -0x4(%ebp),%edx
  104c14:	8b 45 10             	mov    0x10(%ebp),%eax
  104c17:	01 d0                	add    %edx,%eax
  104c19:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  104c1c:	73 47                	jae    104c65 <memmove+0x6e>
  104c1e:	8b 45 10             	mov    0x10(%ebp),%eax
  104c21:	01 45 fc             	add    %eax,-0x4(%ebp)
  104c24:	8b 45 10             	mov    0x10(%ebp),%eax
  104c27:	01 45 f8             	add    %eax,-0x8(%ebp)
  104c2a:	eb 13                	jmp    104c3f <memmove+0x48>
  104c2c:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  104c30:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  104c34:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104c37:	0f b6 10             	movzbl (%eax),%edx
  104c3a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  104c3d:	88 10                	mov    %dl,(%eax)
  104c3f:	8b 45 10             	mov    0x10(%ebp),%eax
  104c42:	8d 50 ff             	lea    -0x1(%eax),%edx
  104c45:	89 55 10             	mov    %edx,0x10(%ebp)
  104c48:	85 c0                	test   %eax,%eax
  104c4a:	75 e0                	jne    104c2c <memmove+0x35>
  104c4c:	eb 24                	jmp    104c72 <memmove+0x7b>
  104c4e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  104c51:	8d 42 01             	lea    0x1(%edx),%eax
  104c54:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104c57:	8b 45 f8             	mov    -0x8(%ebp),%eax
  104c5a:	8d 48 01             	lea    0x1(%eax),%ecx
  104c5d:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  104c60:	0f b6 12             	movzbl (%edx),%edx
  104c63:	88 10                	mov    %dl,(%eax)
  104c65:	8b 45 10             	mov    0x10(%ebp),%eax
  104c68:	8d 50 ff             	lea    -0x1(%eax),%edx
  104c6b:	89 55 10             	mov    %edx,0x10(%ebp)
  104c6e:	85 c0                	test   %eax,%eax
  104c70:	75 dc                	jne    104c4e <memmove+0x57>
  104c72:	8b 45 08             	mov    0x8(%ebp),%eax
  104c75:	c9                   	leave  
  104c76:	c3                   	ret    

00104c77 <memcpy>:
  104c77:	55                   	push   %ebp
  104c78:	89 e5                	mov    %esp,%ebp
  104c7a:	ff 75 10             	pushl  0x10(%ebp)
  104c7d:	ff 75 0c             	pushl  0xc(%ebp)
  104c80:	ff 75 08             	pushl  0x8(%ebp)
  104c83:	e8 6f ff ff ff       	call   104bf7 <memmove>
  104c88:	83 c4 0c             	add    $0xc,%esp
  104c8b:	c9                   	leave  
  104c8c:	c3                   	ret    

00104c8d <strncmp>:
  104c8d:	55                   	push   %ebp
  104c8e:	89 e5                	mov    %esp,%ebp
  104c90:	eb 0c                	jmp    104c9e <strncmp+0x11>
  104c92:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  104c96:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  104c9a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  104c9e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  104ca2:	74 1a                	je     104cbe <strncmp+0x31>
  104ca4:	8b 45 08             	mov    0x8(%ebp),%eax
  104ca7:	0f b6 00             	movzbl (%eax),%eax
  104caa:	84 c0                	test   %al,%al
  104cac:	74 10                	je     104cbe <strncmp+0x31>
  104cae:	8b 45 08             	mov    0x8(%ebp),%eax
  104cb1:	0f b6 10             	movzbl (%eax),%edx
  104cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
  104cb7:	0f b6 00             	movzbl (%eax),%eax
  104cba:	38 c2                	cmp    %al,%dl
  104cbc:	74 d4                	je     104c92 <strncmp+0x5>
  104cbe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  104cc2:	75 07                	jne    104ccb <strncmp+0x3e>
  104cc4:	b8 00 00 00 00       	mov    $0x0,%eax
  104cc9:	eb 16                	jmp    104ce1 <strncmp+0x54>
  104ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  104cce:	0f b6 00             	movzbl (%eax),%eax
  104cd1:	0f b6 d0             	movzbl %al,%edx
  104cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
  104cd7:	0f b6 00             	movzbl (%eax),%eax
  104cda:	0f b6 c0             	movzbl %al,%eax
  104cdd:	29 c2                	sub    %eax,%edx
  104cdf:	89 d0                	mov    %edx,%eax
  104ce1:	5d                   	pop    %ebp
  104ce2:	c3                   	ret    

00104ce3 <strncpy>:
  104ce3:	55                   	push   %ebp
  104ce4:	89 e5                	mov    %esp,%ebp
  104ce6:	83 ec 10             	sub    $0x10,%esp
  104ce9:	8b 45 08             	mov    0x8(%ebp),%eax
  104cec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104cef:	90                   	nop
  104cf0:	8b 45 10             	mov    0x10(%ebp),%eax
  104cf3:	8d 50 ff             	lea    -0x1(%eax),%edx
  104cf6:	89 55 10             	mov    %edx,0x10(%ebp)
  104cf9:	85 c0                	test   %eax,%eax
  104cfb:	7e 2c                	jle    104d29 <strncpy+0x46>
  104cfd:	8b 55 0c             	mov    0xc(%ebp),%edx
  104d00:	8d 42 01             	lea    0x1(%edx),%eax
  104d03:	89 45 0c             	mov    %eax,0xc(%ebp)
  104d06:	8b 45 08             	mov    0x8(%ebp),%eax
  104d09:	8d 48 01             	lea    0x1(%eax),%ecx
  104d0c:	89 4d 08             	mov    %ecx,0x8(%ebp)
  104d0f:	0f b6 12             	movzbl (%edx),%edx
  104d12:	88 10                	mov    %dl,(%eax)
  104d14:	0f b6 00             	movzbl (%eax),%eax
  104d17:	84 c0                	test   %al,%al
  104d19:	75 d5                	jne    104cf0 <strncpy+0xd>
  104d1b:	eb 0c                	jmp    104d29 <strncpy+0x46>
  104d1d:	8b 45 08             	mov    0x8(%ebp),%eax
  104d20:	8d 50 01             	lea    0x1(%eax),%edx
  104d23:	89 55 08             	mov    %edx,0x8(%ebp)
  104d26:	c6 00 00             	movb   $0x0,(%eax)
  104d29:	8b 45 10             	mov    0x10(%ebp),%eax
  104d2c:	8d 50 ff             	lea    -0x1(%eax),%edx
  104d2f:	89 55 10             	mov    %edx,0x10(%ebp)
  104d32:	85 c0                	test   %eax,%eax
  104d34:	7f e7                	jg     104d1d <strncpy+0x3a>
  104d36:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104d39:	c9                   	leave  
  104d3a:	c3                   	ret    

00104d3b <safestrcpy>:
  104d3b:	55                   	push   %ebp
  104d3c:	89 e5                	mov    %esp,%ebp
  104d3e:	83 ec 10             	sub    $0x10,%esp
  104d41:	8b 45 08             	mov    0x8(%ebp),%eax
  104d44:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104d47:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  104d4b:	7f 05                	jg     104d52 <safestrcpy+0x17>
  104d4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104d50:	eb 31                	jmp    104d83 <safestrcpy+0x48>
  104d52:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  104d56:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  104d5a:	7e 1e                	jle    104d7a <safestrcpy+0x3f>
  104d5c:	8b 55 0c             	mov    0xc(%ebp),%edx
  104d5f:	8d 42 01             	lea    0x1(%edx),%eax
  104d62:	89 45 0c             	mov    %eax,0xc(%ebp)
  104d65:	8b 45 08             	mov    0x8(%ebp),%eax
  104d68:	8d 48 01             	lea    0x1(%eax),%ecx
  104d6b:	89 4d 08             	mov    %ecx,0x8(%ebp)
  104d6e:	0f b6 12             	movzbl (%edx),%edx
  104d71:	88 10                	mov    %dl,(%eax)
  104d73:	0f b6 00             	movzbl (%eax),%eax
  104d76:	84 c0                	test   %al,%al
  104d78:	75 d8                	jne    104d52 <safestrcpy+0x17>
  104d7a:	8b 45 08             	mov    0x8(%ebp),%eax
  104d7d:	c6 00 00             	movb   $0x0,(%eax)
  104d80:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104d83:	c9                   	leave  
  104d84:	c3                   	ret    

00104d85 <strlen>:
  104d85:	55                   	push   %ebp
  104d86:	89 e5                	mov    %esp,%ebp
  104d88:	83 ec 10             	sub    $0x10,%esp
  104d8b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  104d92:	eb 04                	jmp    104d98 <strlen+0x13>
  104d94:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  104d98:	8b 55 fc             	mov    -0x4(%ebp),%edx
  104d9b:	8b 45 08             	mov    0x8(%ebp),%eax
  104d9e:	01 d0                	add    %edx,%eax
  104da0:	0f b6 00             	movzbl (%eax),%eax
  104da3:	84 c0                	test   %al,%al
  104da5:	75 ed                	jne    104d94 <strlen+0xf>
  104da7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104daa:	c9                   	leave  
  104dab:	c3                   	ret    

00104dac <swtch>:
  104dac:	8b 44 24 04          	mov    0x4(%esp),%eax
  104db0:	8b 54 24 08          	mov    0x8(%esp),%edx
  104db4:	55                   	push   %ebp
  104db5:	53                   	push   %ebx
  104db6:	56                   	push   %esi
  104db7:	57                   	push   %edi
  104db8:	89 20                	mov    %esp,(%eax)
  104dba:	89 d4                	mov    %edx,%esp
  104dbc:	5f                   	pop    %edi
  104dbd:	5e                   	pop    %esi
  104dbe:	5b                   	pop    %ebx
  104dbf:	5d                   	pop    %ebp
  104dc0:	c3                   	ret    

00104dc1 <fetchint>:
  104dc1:	55                   	push   %ebp
  104dc2:	89 e5                	mov    %esp,%ebp
  104dc4:	8b 45 08             	mov    0x8(%ebp),%eax
  104dc7:	8b 00                	mov    (%eax),%eax
  104dc9:	39 45 0c             	cmp    %eax,0xc(%ebp)
  104dcc:	73 0f                	jae    104ddd <fetchint+0x1c>
  104dce:	8b 45 0c             	mov    0xc(%ebp),%eax
  104dd1:	8d 50 04             	lea    0x4(%eax),%edx
  104dd4:	8b 45 08             	mov    0x8(%ebp),%eax
  104dd7:	8b 00                	mov    (%eax),%eax
  104dd9:	39 c2                	cmp    %eax,%edx
  104ddb:	76 07                	jbe    104de4 <fetchint+0x23>
  104ddd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104de2:	eb 0f                	jmp    104df3 <fetchint+0x32>
  104de4:	8b 45 0c             	mov    0xc(%ebp),%eax
  104de7:	8b 10                	mov    (%eax),%edx
  104de9:	8b 45 10             	mov    0x10(%ebp),%eax
  104dec:	89 10                	mov    %edx,(%eax)
  104dee:	b8 00 00 00 00       	mov    $0x0,%eax
  104df3:	5d                   	pop    %ebp
  104df4:	c3                   	ret    

00104df5 <fetchstr>:
  104df5:	55                   	push   %ebp
  104df6:	89 e5                	mov    %esp,%ebp
  104df8:	83 ec 10             	sub    $0x10,%esp
  104dfb:	8b 45 08             	mov    0x8(%ebp),%eax
  104dfe:	8b 00                	mov    (%eax),%eax
  104e00:	39 45 0c             	cmp    %eax,0xc(%ebp)
  104e03:	72 07                	jb     104e0c <fetchstr+0x17>
  104e05:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104e0a:	eb 43                	jmp    104e4f <fetchstr+0x5a>
  104e0c:	8b 55 0c             	mov    0xc(%ebp),%edx
  104e0f:	8b 45 10             	mov    0x10(%ebp),%eax
  104e12:	89 10                	mov    %edx,(%eax)
  104e14:	8b 45 08             	mov    0x8(%ebp),%eax
  104e17:	8b 00                	mov    (%eax),%eax
  104e19:	89 45 f8             	mov    %eax,-0x8(%ebp)
  104e1c:	8b 45 10             	mov    0x10(%ebp),%eax
  104e1f:	8b 00                	mov    (%eax),%eax
  104e21:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104e24:	eb 1c                	jmp    104e42 <fetchstr+0x4d>
  104e26:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104e29:	0f b6 00             	movzbl (%eax),%eax
  104e2c:	84 c0                	test   %al,%al
  104e2e:	75 0e                	jne    104e3e <fetchstr+0x49>
  104e30:	8b 55 fc             	mov    -0x4(%ebp),%edx
  104e33:	8b 45 10             	mov    0x10(%ebp),%eax
  104e36:	8b 00                	mov    (%eax),%eax
  104e38:	29 c2                	sub    %eax,%edx
  104e3a:	89 d0                	mov    %edx,%eax
  104e3c:	eb 11                	jmp    104e4f <fetchstr+0x5a>
  104e3e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  104e42:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104e45:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  104e48:	72 dc                	jb     104e26 <fetchstr+0x31>
  104e4a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104e4f:	c9                   	leave  
  104e50:	c3                   	ret    

00104e51 <argint>:
  104e51:	55                   	push   %ebp
  104e52:	89 e5                	mov    %esp,%ebp
  104e54:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104e5a:	8b 40 18             	mov    0x18(%eax),%eax
  104e5d:	8b 40 44             	mov    0x44(%eax),%eax
  104e60:	8b 55 08             	mov    0x8(%ebp),%edx
  104e63:	c1 e2 02             	shl    $0x2,%edx
  104e66:	01 d0                	add    %edx,%eax
  104e68:	8d 50 04             	lea    0x4(%eax),%edx
  104e6b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104e71:	ff 75 0c             	pushl  0xc(%ebp)
  104e74:	52                   	push   %edx
  104e75:	50                   	push   %eax
  104e76:	e8 46 ff ff ff       	call   104dc1 <fetchint>
  104e7b:	83 c4 0c             	add    $0xc,%esp
  104e7e:	c9                   	leave  
  104e7f:	c3                   	ret    

00104e80 <argptr>:
  104e80:	55                   	push   %ebp
  104e81:	89 e5                	mov    %esp,%ebp
  104e83:	83 ec 10             	sub    $0x10,%esp
  104e86:	8d 45 fc             	lea    -0x4(%ebp),%eax
  104e89:	50                   	push   %eax
  104e8a:	ff 75 08             	pushl  0x8(%ebp)
  104e8d:	e8 bf ff ff ff       	call   104e51 <argint>
  104e92:	83 c4 08             	add    $0x8,%esp
  104e95:	85 c0                	test   %eax,%eax
  104e97:	79 07                	jns    104ea0 <argptr+0x20>
  104e99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104e9e:	eb 3b                	jmp    104edb <argptr+0x5b>
  104ea0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104ea6:	8b 00                	mov    (%eax),%eax
  104ea8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  104eab:	39 d0                	cmp    %edx,%eax
  104ead:	76 16                	jbe    104ec5 <argptr+0x45>
  104eaf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104eb2:	89 c2                	mov    %eax,%edx
  104eb4:	8b 45 10             	mov    0x10(%ebp),%eax
  104eb7:	01 c2                	add    %eax,%edx
  104eb9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104ebf:	8b 00                	mov    (%eax),%eax
  104ec1:	39 c2                	cmp    %eax,%edx
  104ec3:	76 07                	jbe    104ecc <argptr+0x4c>
  104ec5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104eca:	eb 0f                	jmp    104edb <argptr+0x5b>
  104ecc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104ecf:	89 c2                	mov    %eax,%edx
  104ed1:	8b 45 0c             	mov    0xc(%ebp),%eax
  104ed4:	89 10                	mov    %edx,(%eax)
  104ed6:	b8 00 00 00 00       	mov    $0x0,%eax
  104edb:	c9                   	leave  
  104edc:	c3                   	ret    

00104edd <argstr>:
  104edd:	55                   	push   %ebp
  104ede:	89 e5                	mov    %esp,%ebp
  104ee0:	83 ec 10             	sub    $0x10,%esp
  104ee3:	8d 45 fc             	lea    -0x4(%ebp),%eax
  104ee6:	50                   	push   %eax
  104ee7:	ff 75 08             	pushl  0x8(%ebp)
  104eea:	e8 62 ff ff ff       	call   104e51 <argint>
  104eef:	83 c4 08             	add    $0x8,%esp
  104ef2:	85 c0                	test   %eax,%eax
  104ef4:	79 07                	jns    104efd <argstr+0x20>
  104ef6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104efb:	eb 18                	jmp    104f15 <argstr+0x38>
  104efd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104f00:	89 c2                	mov    %eax,%edx
  104f02:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104f08:	ff 75 0c             	pushl  0xc(%ebp)
  104f0b:	52                   	push   %edx
  104f0c:	50                   	push   %eax
  104f0d:	e8 e3 fe ff ff       	call   104df5 <fetchstr>
  104f12:	83 c4 0c             	add    $0xc,%esp
  104f15:	c9                   	leave  
  104f16:	c3                   	ret    

00104f17 <syscall>:
  104f17:	55                   	push   %ebp
  104f18:	89 e5                	mov    %esp,%ebp
  104f1a:	83 ec 18             	sub    $0x18,%esp
  104f1d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104f23:	8b 40 18             	mov    0x18(%eax),%eax
  104f26:	8b 40 1c             	mov    0x1c(%eax),%eax
  104f29:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104f2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  104f30:	7e 32                	jle    104f64 <syscall+0x4d>
  104f32:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104f35:	83 f8 17             	cmp    $0x17,%eax
  104f38:	77 2a                	ja     104f64 <syscall+0x4d>
  104f3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104f3d:	8b 04 85 60 c5 10 00 	mov    0x10c560(,%eax,4),%eax
  104f44:	85 c0                	test   %eax,%eax
  104f46:	74 1c                	je     104f64 <syscall+0x4d>
  104f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104f4b:	8b 04 85 60 c5 10 00 	mov    0x10c560(,%eax,4),%eax
  104f52:	ff d0                	call   *%eax
  104f54:	89 c2                	mov    %eax,%edx
  104f56:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104f5c:	8b 40 18             	mov    0x18(%eax),%eax
  104f5f:	89 50 1c             	mov    %edx,0x1c(%eax)
  104f62:	eb 34                	jmp    104f98 <syscall+0x81>
  104f64:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104f6a:	8d 50 6c             	lea    0x6c(%eax),%edx
  104f6d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104f73:	8b 40 10             	mov    0x10(%eax),%eax
  104f76:	ff 75 f4             	pushl  -0xc(%ebp)
  104f79:	52                   	push   %edx
  104f7a:	50                   	push   %eax
  104f7b:	68 e3 91 10 00       	push   $0x1091e3
  104f80:	e8 67 b4 ff ff       	call   1003ec <cprintf>
  104f85:	83 c4 10             	add    $0x10,%esp
  104f88:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104f8e:	8b 40 18             	mov    0x18(%eax),%eax
  104f91:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  104f98:	90                   	nop
  104f99:	c9                   	leave  
  104f9a:	c3                   	ret    

00104f9b <argfd>:
  104f9b:	55                   	push   %ebp
  104f9c:	89 e5                	mov    %esp,%ebp
  104f9e:	83 ec 18             	sub    $0x18,%esp
  104fa1:	83 ec 08             	sub    $0x8,%esp
  104fa4:	8d 45 f0             	lea    -0x10(%ebp),%eax
  104fa7:	50                   	push   %eax
  104fa8:	ff 75 08             	pushl  0x8(%ebp)
  104fab:	e8 a1 fe ff ff       	call   104e51 <argint>
  104fb0:	83 c4 10             	add    $0x10,%esp
  104fb3:	85 c0                	test   %eax,%eax
  104fb5:	79 07                	jns    104fbe <argfd+0x23>
  104fb7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104fbc:	eb 50                	jmp    10500e <argfd+0x73>
  104fbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104fc1:	85 c0                	test   %eax,%eax
  104fc3:	78 21                	js     104fe6 <argfd+0x4b>
  104fc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104fc8:	83 f8 0f             	cmp    $0xf,%eax
  104fcb:	7f 19                	jg     104fe6 <argfd+0x4b>
  104fcd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104fd3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104fd6:	83 c2 08             	add    $0x8,%edx
  104fd9:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  104fdd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104fe0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  104fe4:	75 07                	jne    104fed <argfd+0x52>
  104fe6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104feb:	eb 21                	jmp    10500e <argfd+0x73>
  104fed:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  104ff1:	74 08                	je     104ffb <argfd+0x60>
  104ff3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104ff6:	8b 45 0c             	mov    0xc(%ebp),%eax
  104ff9:	89 10                	mov    %edx,(%eax)
  104ffb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  104fff:	74 08                	je     105009 <argfd+0x6e>
  105001:	8b 45 10             	mov    0x10(%ebp),%eax
  105004:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105007:	89 10                	mov    %edx,(%eax)
  105009:	b8 00 00 00 00       	mov    $0x0,%eax
  10500e:	c9                   	leave  
  10500f:	c3                   	ret    

00105010 <fdalloc>:
  105010:	55                   	push   %ebp
  105011:	89 e5                	mov    %esp,%ebp
  105013:	83 ec 10             	sub    $0x10,%esp
  105016:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10501d:	eb 30                	jmp    10504f <fdalloc+0x3f>
  10501f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105025:	8b 55 fc             	mov    -0x4(%ebp),%edx
  105028:	83 c2 08             	add    $0x8,%edx
  10502b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  10502f:	85 c0                	test   %eax,%eax
  105031:	75 18                	jne    10504b <fdalloc+0x3b>
  105033:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105039:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10503c:	8d 4a 08             	lea    0x8(%edx),%ecx
  10503f:	8b 55 08             	mov    0x8(%ebp),%edx
  105042:	89 54 88 08          	mov    %edx,0x8(%eax,%ecx,4)
  105046:	8b 45 fc             	mov    -0x4(%ebp),%eax
  105049:	eb 0f                	jmp    10505a <fdalloc+0x4a>
  10504b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10504f:	83 7d fc 0f          	cmpl   $0xf,-0x4(%ebp)
  105053:	7e ca                	jle    10501f <fdalloc+0xf>
  105055:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10505a:	c9                   	leave  
  10505b:	c3                   	ret    

0010505c <sys_dup>:
  10505c:	55                   	push   %ebp
  10505d:	89 e5                	mov    %esp,%ebp
  10505f:	83 ec 18             	sub    $0x18,%esp
  105062:	83 ec 04             	sub    $0x4,%esp
  105065:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105068:	50                   	push   %eax
  105069:	6a 00                	push   $0x0
  10506b:	6a 00                	push   $0x0
  10506d:	e8 29 ff ff ff       	call   104f9b <argfd>
  105072:	83 c4 10             	add    $0x10,%esp
  105075:	85 c0                	test   %eax,%eax
  105077:	79 07                	jns    105080 <sys_dup+0x24>
  105079:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10507e:	eb 31                	jmp    1050b1 <sys_dup+0x55>
  105080:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105083:	83 ec 0c             	sub    $0xc,%esp
  105086:	50                   	push   %eax
  105087:	e8 84 ff ff ff       	call   105010 <fdalloc>
  10508c:	83 c4 10             	add    $0x10,%esp
  10508f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105092:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  105096:	79 07                	jns    10509f <sys_dup+0x43>
  105098:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10509d:	eb 12                	jmp    1050b1 <sys_dup+0x55>
  10509f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1050a2:	83 ec 0c             	sub    $0xc,%esp
  1050a5:	50                   	push   %eax
  1050a6:	e8 35 bf ff ff       	call   100fe0 <filedup>
  1050ab:	83 c4 10             	add    $0x10,%esp
  1050ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1050b1:	c9                   	leave  
  1050b2:	c3                   	ret    

001050b3 <sys_read>:
  1050b3:	55                   	push   %ebp
  1050b4:	89 e5                	mov    %esp,%ebp
  1050b6:	83 ec 18             	sub    $0x18,%esp
  1050b9:	83 ec 04             	sub    $0x4,%esp
  1050bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1050bf:	50                   	push   %eax
  1050c0:	6a 00                	push   $0x0
  1050c2:	6a 00                	push   $0x0
  1050c4:	e8 d2 fe ff ff       	call   104f9b <argfd>
  1050c9:	83 c4 10             	add    $0x10,%esp
  1050cc:	85 c0                	test   %eax,%eax
  1050ce:	78 2e                	js     1050fe <sys_read+0x4b>
  1050d0:	83 ec 08             	sub    $0x8,%esp
  1050d3:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1050d6:	50                   	push   %eax
  1050d7:	6a 02                	push   $0x2
  1050d9:	e8 73 fd ff ff       	call   104e51 <argint>
  1050de:	83 c4 10             	add    $0x10,%esp
  1050e1:	85 c0                	test   %eax,%eax
  1050e3:	78 19                	js     1050fe <sys_read+0x4b>
  1050e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1050e8:	83 ec 04             	sub    $0x4,%esp
  1050eb:	50                   	push   %eax
  1050ec:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1050ef:	50                   	push   %eax
  1050f0:	6a 01                	push   $0x1
  1050f2:	e8 89 fd ff ff       	call   104e80 <argptr>
  1050f7:	83 c4 10             	add    $0x10,%esp
  1050fa:	85 c0                	test   %eax,%eax
  1050fc:	79 07                	jns    105105 <sys_read+0x52>
  1050fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105103:	eb 17                	jmp    10511c <sys_read+0x69>
  105105:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  105108:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10510b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10510e:	83 ec 04             	sub    $0x4,%esp
  105111:	51                   	push   %ecx
  105112:	52                   	push   %edx
  105113:	50                   	push   %eax
  105114:	e8 4d c0 ff ff       	call   101166 <fileread>
  105119:	83 c4 10             	add    $0x10,%esp
  10511c:	c9                   	leave  
  10511d:	c3                   	ret    

0010511e <sys_write>:
  10511e:	55                   	push   %ebp
  10511f:	89 e5                	mov    %esp,%ebp
  105121:	83 ec 18             	sub    $0x18,%esp
  105124:	83 ec 04             	sub    $0x4,%esp
  105127:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10512a:	50                   	push   %eax
  10512b:	6a 00                	push   $0x0
  10512d:	6a 00                	push   $0x0
  10512f:	e8 67 fe ff ff       	call   104f9b <argfd>
  105134:	83 c4 10             	add    $0x10,%esp
  105137:	85 c0                	test   %eax,%eax
  105139:	78 2e                	js     105169 <sys_write+0x4b>
  10513b:	83 ec 08             	sub    $0x8,%esp
  10513e:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105141:	50                   	push   %eax
  105142:	6a 02                	push   $0x2
  105144:	e8 08 fd ff ff       	call   104e51 <argint>
  105149:	83 c4 10             	add    $0x10,%esp
  10514c:	85 c0                	test   %eax,%eax
  10514e:	78 19                	js     105169 <sys_write+0x4b>
  105150:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105153:	83 ec 04             	sub    $0x4,%esp
  105156:	50                   	push   %eax
  105157:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10515a:	50                   	push   %eax
  10515b:	6a 01                	push   $0x1
  10515d:	e8 1e fd ff ff       	call   104e80 <argptr>
  105162:	83 c4 10             	add    $0x10,%esp
  105165:	85 c0                	test   %eax,%eax
  105167:	79 07                	jns    105170 <sys_write+0x52>
  105169:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10516e:	eb 17                	jmp    105187 <sys_write+0x69>
  105170:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  105173:	8b 55 ec             	mov    -0x14(%ebp),%edx
  105176:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105179:	83 ec 04             	sub    $0x4,%esp
  10517c:	51                   	push   %ecx
  10517d:	52                   	push   %edx
  10517e:	50                   	push   %eax
  10517f:	e8 9a c0 ff ff       	call   10121e <filewrite>
  105184:	83 c4 10             	add    $0x10,%esp
  105187:	c9                   	leave  
  105188:	c3                   	ret    

00105189 <sys_close>:
  105189:	55                   	push   %ebp
  10518a:	89 e5                	mov    %esp,%ebp
  10518c:	83 ec 18             	sub    $0x18,%esp
  10518f:	83 ec 04             	sub    $0x4,%esp
  105192:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105195:	50                   	push   %eax
  105196:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105199:	50                   	push   %eax
  10519a:	6a 00                	push   $0x0
  10519c:	e8 fa fd ff ff       	call   104f9b <argfd>
  1051a1:	83 c4 10             	add    $0x10,%esp
  1051a4:	85 c0                	test   %eax,%eax
  1051a6:	79 07                	jns    1051af <sys_close+0x26>
  1051a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1051ad:	eb 28                	jmp    1051d7 <sys_close+0x4e>
  1051af:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1051b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1051b8:	83 c2 08             	add    $0x8,%edx
  1051bb:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  1051c2:	00 
  1051c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1051c6:	83 ec 0c             	sub    $0xc,%esp
  1051c9:	50                   	push   %eax
  1051ca:	e8 62 be ff ff       	call   101031 <fileclose>
  1051cf:	83 c4 10             	add    $0x10,%esp
  1051d2:	b8 00 00 00 00       	mov    $0x0,%eax
  1051d7:	c9                   	leave  
  1051d8:	c3                   	ret    

001051d9 <sys_fstat>:
  1051d9:	55                   	push   %ebp
  1051da:	89 e5                	mov    %esp,%ebp
  1051dc:	83 ec 18             	sub    $0x18,%esp
  1051df:	83 ec 04             	sub    $0x4,%esp
  1051e2:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1051e5:	50                   	push   %eax
  1051e6:	6a 00                	push   $0x0
  1051e8:	6a 00                	push   $0x0
  1051ea:	e8 ac fd ff ff       	call   104f9b <argfd>
  1051ef:	83 c4 10             	add    $0x10,%esp
  1051f2:	85 c0                	test   %eax,%eax
  1051f4:	78 17                	js     10520d <sys_fstat+0x34>
  1051f6:	83 ec 04             	sub    $0x4,%esp
  1051f9:	6a 14                	push   $0x14
  1051fb:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1051fe:	50                   	push   %eax
  1051ff:	6a 01                	push   $0x1
  105201:	e8 7a fc ff ff       	call   104e80 <argptr>
  105206:	83 c4 10             	add    $0x10,%esp
  105209:	85 c0                	test   %eax,%eax
  10520b:	79 07                	jns    105214 <sys_fstat+0x3b>
  10520d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105212:	eb 13                	jmp    105227 <sys_fstat+0x4e>
  105214:	8b 55 f0             	mov    -0x10(%ebp),%edx
  105217:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10521a:	83 ec 08             	sub    $0x8,%esp
  10521d:	52                   	push   %edx
  10521e:	50                   	push   %eax
  10521f:	e8 eb be ff ff       	call   10110f <filestat>
  105224:	83 c4 10             	add    $0x10,%esp
  105227:	c9                   	leave  
  105228:	c3                   	ret    

00105229 <sys_link>:
  105229:	55                   	push   %ebp
  10522a:	89 e5                	mov    %esp,%ebp
  10522c:	83 ec 28             	sub    $0x28,%esp
  10522f:	83 ec 08             	sub    $0x8,%esp
  105232:	8d 45 d8             	lea    -0x28(%ebp),%eax
  105235:	50                   	push   %eax
  105236:	6a 00                	push   $0x0
  105238:	e8 a0 fc ff ff       	call   104edd <argstr>
  10523d:	83 c4 10             	add    $0x10,%esp
  105240:	85 c0                	test   %eax,%eax
  105242:	78 15                	js     105259 <sys_link+0x30>
  105244:	83 ec 08             	sub    $0x8,%esp
  105247:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10524a:	50                   	push   %eax
  10524b:	6a 01                	push   $0x1
  10524d:	e8 8b fc ff ff       	call   104edd <argstr>
  105252:	83 c4 10             	add    $0x10,%esp
  105255:	85 c0                	test   %eax,%eax
  105257:	79 0a                	jns    105263 <sys_link+0x3a>
  105259:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10525e:	e9 4f 01 00 00       	jmp    1053b2 <sys_link+0x189>
  105263:	8b 45 d8             	mov    -0x28(%ebp),%eax
  105266:	83 ec 0c             	sub    $0xc,%esp
  105269:	50                   	push   %eax
  10526a:	e8 89 d2 ff ff       	call   1024f8 <namei>
  10526f:	83 c4 10             	add    $0x10,%esp
  105272:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105275:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  105279:	75 0a                	jne    105285 <sys_link+0x5c>
  10527b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105280:	e9 2d 01 00 00       	jmp    1053b2 <sys_link+0x189>
  105285:	83 ec 0c             	sub    $0xc,%esp
  105288:	ff 75 f4             	pushl  -0xc(%ebp)
  10528b:	e8 e5 c5 ff ff       	call   101875 <ilock>
  105290:	83 c4 10             	add    $0x10,%esp
  105293:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105296:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10529a:	66 83 f8 01          	cmp    $0x1,%ax
  10529e:	75 18                	jne    1052b8 <sys_link+0x8f>
  1052a0:	83 ec 0c             	sub    $0xc,%esp
  1052a3:	ff 75 f4             	pushl  -0xc(%ebp)
  1052a6:	e8 9e c8 ff ff       	call   101b49 <iunlockput>
  1052ab:	83 c4 10             	add    $0x10,%esp
  1052ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1052b3:	e9 fa 00 00 00       	jmp    1053b2 <sys_link+0x189>
  1052b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1052bb:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1052bf:	83 c0 01             	add    $0x1,%eax
  1052c2:	89 c2                	mov    %eax,%edx
  1052c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1052c7:	66 89 50 16          	mov    %dx,0x16(%eax)
  1052cb:	83 ec 0c             	sub    $0xc,%esp
  1052ce:	ff 75 f4             	pushl  -0xc(%ebp)
  1052d1:	e8 cb c3 ff ff       	call   1016a1 <iupdate>
  1052d6:	83 c4 10             	add    $0x10,%esp
  1052d9:	83 ec 0c             	sub    $0xc,%esp
  1052dc:	ff 75 f4             	pushl  -0xc(%ebp)
  1052df:	e8 03 c7 ff ff       	call   1019e7 <iunlock>
  1052e4:	83 c4 10             	add    $0x10,%esp
  1052e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1052ea:	83 ec 08             	sub    $0x8,%esp
  1052ed:	8d 55 e2             	lea    -0x1e(%ebp),%edx
  1052f0:	52                   	push   %edx
  1052f1:	50                   	push   %eax
  1052f2:	e8 1d d2 ff ff       	call   102514 <nameiparent>
  1052f7:	83 c4 10             	add    $0x10,%esp
  1052fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1052fd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  105301:	74 6c                	je     10536f <sys_link+0x146>
  105303:	83 ec 0c             	sub    $0xc,%esp
  105306:	ff 75 f0             	pushl  -0x10(%ebp)
  105309:	e8 67 c5 ff ff       	call   101875 <ilock>
  10530e:	83 c4 10             	add    $0x10,%esp
  105311:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105314:	8b 10                	mov    (%eax),%edx
  105316:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105319:	8b 00                	mov    (%eax),%eax
  10531b:	39 c2                	cmp    %eax,%edx
  10531d:	75 1d                	jne    10533c <sys_link+0x113>
  10531f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105322:	8b 40 04             	mov    0x4(%eax),%eax
  105325:	83 ec 04             	sub    $0x4,%esp
  105328:	50                   	push   %eax
  105329:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  10532c:	50                   	push   %eax
  10532d:	ff 75 f0             	pushl  -0x10(%ebp)
  105330:	e8 d4 ce ff ff       	call   102209 <dirlink>
  105335:	83 c4 10             	add    $0x10,%esp
  105338:	85 c0                	test   %eax,%eax
  10533a:	79 10                	jns    10534c <sys_link+0x123>
  10533c:	83 ec 0c             	sub    $0xc,%esp
  10533f:	ff 75 f0             	pushl  -0x10(%ebp)
  105342:	e8 02 c8 ff ff       	call   101b49 <iunlockput>
  105347:	83 c4 10             	add    $0x10,%esp
  10534a:	eb 24                	jmp    105370 <sys_link+0x147>
  10534c:	83 ec 0c             	sub    $0xc,%esp
  10534f:	ff 75 f0             	pushl  -0x10(%ebp)
  105352:	e8 f2 c7 ff ff       	call   101b49 <iunlockput>
  105357:	83 c4 10             	add    $0x10,%esp
  10535a:	83 ec 0c             	sub    $0xc,%esp
  10535d:	ff 75 f4             	pushl  -0xc(%ebp)
  105360:	e8 f4 c6 ff ff       	call   101a59 <iput>
  105365:	83 c4 10             	add    $0x10,%esp
  105368:	b8 00 00 00 00       	mov    $0x0,%eax
  10536d:	eb 43                	jmp    1053b2 <sys_link+0x189>
  10536f:	90                   	nop
  105370:	83 ec 0c             	sub    $0xc,%esp
  105373:	ff 75 f4             	pushl  -0xc(%ebp)
  105376:	e8 fa c4 ff ff       	call   101875 <ilock>
  10537b:	83 c4 10             	add    $0x10,%esp
  10537e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105381:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  105385:	83 e8 01             	sub    $0x1,%eax
  105388:	89 c2                	mov    %eax,%edx
  10538a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10538d:	66 89 50 16          	mov    %dx,0x16(%eax)
  105391:	83 ec 0c             	sub    $0xc,%esp
  105394:	ff 75 f4             	pushl  -0xc(%ebp)
  105397:	e8 05 c3 ff ff       	call   1016a1 <iupdate>
  10539c:	83 c4 10             	add    $0x10,%esp
  10539f:	83 ec 0c             	sub    $0xc,%esp
  1053a2:	ff 75 f4             	pushl  -0xc(%ebp)
  1053a5:	e8 9f c7 ff ff       	call   101b49 <iunlockput>
  1053aa:	83 c4 10             	add    $0x10,%esp
  1053ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1053b2:	c9                   	leave  
  1053b3:	c3                   	ret    

001053b4 <isdirempty>:
  1053b4:	55                   	push   %ebp
  1053b5:	89 e5                	mov    %esp,%ebp
  1053b7:	83 ec 28             	sub    $0x28,%esp
  1053ba:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
  1053c1:	eb 40                	jmp    105403 <isdirempty+0x4f>
  1053c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1053c6:	6a 10                	push   $0x10
  1053c8:	50                   	push   %eax
  1053c9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1053cc:	50                   	push   %eax
  1053cd:	ff 75 08             	pushl  0x8(%ebp)
  1053d0:	e8 1d ca ff ff       	call   101df2 <readi>
  1053d5:	83 c4 10             	add    $0x10,%esp
  1053d8:	83 f8 10             	cmp    $0x10,%eax
  1053db:	74 0d                	je     1053ea <isdirempty+0x36>
  1053dd:	83 ec 0c             	sub    $0xc,%esp
  1053e0:	68 ff 91 10 00       	push   $0x1091ff
  1053e5:	e8 8e b1 ff ff       	call   100578 <panic>
  1053ea:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  1053ee:	66 85 c0             	test   %ax,%ax
  1053f1:	74 07                	je     1053fa <isdirempty+0x46>
  1053f3:	b8 00 00 00 00       	mov    $0x0,%eax
  1053f8:	eb 1b                	jmp    105415 <isdirempty+0x61>
  1053fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1053fd:	83 c0 10             	add    $0x10,%eax
  105400:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105403:	8b 45 08             	mov    0x8(%ebp),%eax
  105406:	8b 50 18             	mov    0x18(%eax),%edx
  105409:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10540c:	39 c2                	cmp    %eax,%edx
  10540e:	77 b3                	ja     1053c3 <isdirempty+0xf>
  105410:	b8 01 00 00 00       	mov    $0x1,%eax
  105415:	c9                   	leave  
  105416:	c3                   	ret    

00105417 <sys_unlink>:
  105417:	55                   	push   %ebp
  105418:	89 e5                	mov    %esp,%ebp
  10541a:	83 ec 38             	sub    $0x38,%esp
  10541d:	83 ec 08             	sub    $0x8,%esp
  105420:	8d 45 cc             	lea    -0x34(%ebp),%eax
  105423:	50                   	push   %eax
  105424:	6a 00                	push   $0x0
  105426:	e8 b2 fa ff ff       	call   104edd <argstr>
  10542b:	83 c4 10             	add    $0x10,%esp
  10542e:	85 c0                	test   %eax,%eax
  105430:	79 0a                	jns    10543c <sys_unlink+0x25>
  105432:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105437:	e9 c9 01 00 00       	jmp    105605 <sys_unlink+0x1ee>
  10543c:	8b 45 cc             	mov    -0x34(%ebp),%eax
  10543f:	83 ec 08             	sub    $0x8,%esp
  105442:	8d 55 d2             	lea    -0x2e(%ebp),%edx
  105445:	52                   	push   %edx
  105446:	50                   	push   %eax
  105447:	e8 c8 d0 ff ff       	call   102514 <nameiparent>
  10544c:	83 c4 10             	add    $0x10,%esp
  10544f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105452:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  105456:	75 0a                	jne    105462 <sys_unlink+0x4b>
  105458:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10545d:	e9 a3 01 00 00       	jmp    105605 <sys_unlink+0x1ee>
  105462:	83 ec 0c             	sub    $0xc,%esp
  105465:	ff 75 f4             	pushl  -0xc(%ebp)
  105468:	e8 08 c4 ff ff       	call   101875 <ilock>
  10546d:	83 c4 10             	add    $0x10,%esp
  105470:	83 ec 08             	sub    $0x8,%esp
  105473:	68 11 92 10 00       	push   $0x109211
  105478:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  10547b:	50                   	push   %eax
  10547c:	e8 51 cc ff ff       	call   1020d2 <namecmp>
  105481:	83 c4 10             	add    $0x10,%esp
  105484:	85 c0                	test   %eax,%eax
  105486:	74 18                	je     1054a0 <sys_unlink+0x89>
  105488:	83 ec 08             	sub    $0x8,%esp
  10548b:	68 13 92 10 00       	push   $0x109213
  105490:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  105493:	50                   	push   %eax
  105494:	e8 39 cc ff ff       	call   1020d2 <namecmp>
  105499:	83 c4 10             	add    $0x10,%esp
  10549c:	85 c0                	test   %eax,%eax
  10549e:	75 18                	jne    1054b8 <sys_unlink+0xa1>
  1054a0:	83 ec 0c             	sub    $0xc,%esp
  1054a3:	ff 75 f4             	pushl  -0xc(%ebp)
  1054a6:	e8 9e c6 ff ff       	call   101b49 <iunlockput>
  1054ab:	83 c4 10             	add    $0x10,%esp
  1054ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1054b3:	e9 4d 01 00 00       	jmp    105605 <sys_unlink+0x1ee>
  1054b8:	83 ec 04             	sub    $0x4,%esp
  1054bb:	8d 45 c8             	lea    -0x38(%ebp),%eax
  1054be:	50                   	push   %eax
  1054bf:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  1054c2:	50                   	push   %eax
  1054c3:	ff 75 f4             	pushl  -0xc(%ebp)
  1054c6:	e8 22 cc ff ff       	call   1020ed <dirlookup>
  1054cb:	83 c4 10             	add    $0x10,%esp
  1054ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1054d1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1054d5:	75 18                	jne    1054ef <sys_unlink+0xd8>
  1054d7:	83 ec 0c             	sub    $0xc,%esp
  1054da:	ff 75 f4             	pushl  -0xc(%ebp)
  1054dd:	e8 67 c6 ff ff       	call   101b49 <iunlockput>
  1054e2:	83 c4 10             	add    $0x10,%esp
  1054e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1054ea:	e9 16 01 00 00       	jmp    105605 <sys_unlink+0x1ee>
  1054ef:	83 ec 0c             	sub    $0xc,%esp
  1054f2:	ff 75 f0             	pushl  -0x10(%ebp)
  1054f5:	e8 7b c3 ff ff       	call   101875 <ilock>
  1054fa:	83 c4 10             	add    $0x10,%esp
  1054fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105500:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  105504:	66 85 c0             	test   %ax,%ax
  105507:	7f 0d                	jg     105516 <sys_unlink+0xff>
  105509:	83 ec 0c             	sub    $0xc,%esp
  10550c:	68 16 92 10 00       	push   $0x109216
  105511:	e8 62 b0 ff ff       	call   100578 <panic>
  105516:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105519:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10551d:	66 83 f8 01          	cmp    $0x1,%ax
  105521:	75 38                	jne    10555b <sys_unlink+0x144>
  105523:	83 ec 0c             	sub    $0xc,%esp
  105526:	ff 75 f0             	pushl  -0x10(%ebp)
  105529:	e8 86 fe ff ff       	call   1053b4 <isdirempty>
  10552e:	83 c4 10             	add    $0x10,%esp
  105531:	85 c0                	test   %eax,%eax
  105533:	75 26                	jne    10555b <sys_unlink+0x144>
  105535:	83 ec 0c             	sub    $0xc,%esp
  105538:	ff 75 f0             	pushl  -0x10(%ebp)
  10553b:	e8 09 c6 ff ff       	call   101b49 <iunlockput>
  105540:	83 c4 10             	add    $0x10,%esp
  105543:	83 ec 0c             	sub    $0xc,%esp
  105546:	ff 75 f4             	pushl  -0xc(%ebp)
  105549:	e8 fb c5 ff ff       	call   101b49 <iunlockput>
  10554e:	83 c4 10             	add    $0x10,%esp
  105551:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105556:	e9 aa 00 00 00       	jmp    105605 <sys_unlink+0x1ee>
  10555b:	83 ec 04             	sub    $0x4,%esp
  10555e:	6a 10                	push   $0x10
  105560:	6a 00                	push   $0x0
  105562:	8d 45 e0             	lea    -0x20(%ebp),%eax
  105565:	50                   	push   %eax
  105566:	e8 1a f6 ff ff       	call   104b85 <memset>
  10556b:	83 c4 10             	add    $0x10,%esp
  10556e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  105571:	6a 10                	push   $0x10
  105573:	50                   	push   %eax
  105574:	8d 45 e0             	lea    -0x20(%ebp),%eax
  105577:	50                   	push   %eax
  105578:	ff 75 f4             	pushl  -0xc(%ebp)
  10557b:	e8 c9 c9 ff ff       	call   101f49 <writei>
  105580:	83 c4 10             	add    $0x10,%esp
  105583:	83 f8 10             	cmp    $0x10,%eax
  105586:	74 0d                	je     105595 <sys_unlink+0x17e>
  105588:	83 ec 0c             	sub    $0xc,%esp
  10558b:	68 28 92 10 00       	push   $0x109228
  105590:	e8 e3 af ff ff       	call   100578 <panic>
  105595:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105598:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10559c:	66 83 f8 01          	cmp    $0x1,%ax
  1055a0:	75 21                	jne    1055c3 <sys_unlink+0x1ac>
  1055a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1055a5:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1055a9:	83 e8 01             	sub    $0x1,%eax
  1055ac:	89 c2                	mov    %eax,%edx
  1055ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1055b1:	66 89 50 16          	mov    %dx,0x16(%eax)
  1055b5:	83 ec 0c             	sub    $0xc,%esp
  1055b8:	ff 75 f4             	pushl  -0xc(%ebp)
  1055bb:	e8 e1 c0 ff ff       	call   1016a1 <iupdate>
  1055c0:	83 c4 10             	add    $0x10,%esp
  1055c3:	83 ec 0c             	sub    $0xc,%esp
  1055c6:	ff 75 f4             	pushl  -0xc(%ebp)
  1055c9:	e8 7b c5 ff ff       	call   101b49 <iunlockput>
  1055ce:	83 c4 10             	add    $0x10,%esp
  1055d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1055d4:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1055d8:	83 e8 01             	sub    $0x1,%eax
  1055db:	89 c2                	mov    %eax,%edx
  1055dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1055e0:	66 89 50 16          	mov    %dx,0x16(%eax)
  1055e4:	83 ec 0c             	sub    $0xc,%esp
  1055e7:	ff 75 f0             	pushl  -0x10(%ebp)
  1055ea:	e8 b2 c0 ff ff       	call   1016a1 <iupdate>
  1055ef:	83 c4 10             	add    $0x10,%esp
  1055f2:	83 ec 0c             	sub    $0xc,%esp
  1055f5:	ff 75 f0             	pushl  -0x10(%ebp)
  1055f8:	e8 4c c5 ff ff       	call   101b49 <iunlockput>
  1055fd:	83 c4 10             	add    $0x10,%esp
  105600:	b8 00 00 00 00       	mov    $0x0,%eax
  105605:	c9                   	leave  
  105606:	c3                   	ret    

00105607 <create>:
  105607:	55                   	push   %ebp
  105608:	89 e5                	mov    %esp,%ebp
  10560a:	83 ec 38             	sub    $0x38,%esp
  10560d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  105610:	8b 55 10             	mov    0x10(%ebp),%edx
  105613:	8b 45 14             	mov    0x14(%ebp),%eax
  105616:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
  10561a:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
  10561e:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  105622:	83 ec 08             	sub    $0x8,%esp
  105625:	8d 45 de             	lea    -0x22(%ebp),%eax
  105628:	50                   	push   %eax
  105629:	ff 75 08             	pushl  0x8(%ebp)
  10562c:	e8 e3 ce ff ff       	call   102514 <nameiparent>
  105631:	83 c4 10             	add    $0x10,%esp
  105634:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105637:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10563b:	75 0a                	jne    105647 <create+0x40>
  10563d:	b8 00 00 00 00       	mov    $0x0,%eax
  105642:	e9 90 01 00 00       	jmp    1057d7 <create+0x1d0>
  105647:	83 ec 0c             	sub    $0xc,%esp
  10564a:	ff 75 f4             	pushl  -0xc(%ebp)
  10564d:	e8 23 c2 ff ff       	call   101875 <ilock>
  105652:	83 c4 10             	add    $0x10,%esp
  105655:	83 ec 04             	sub    $0x4,%esp
  105658:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10565b:	50                   	push   %eax
  10565c:	8d 45 de             	lea    -0x22(%ebp),%eax
  10565f:	50                   	push   %eax
  105660:	ff 75 f4             	pushl  -0xc(%ebp)
  105663:	e8 85 ca ff ff       	call   1020ed <dirlookup>
  105668:	83 c4 10             	add    $0x10,%esp
  10566b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10566e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  105672:	74 50                	je     1056c4 <create+0xbd>
  105674:	83 ec 0c             	sub    $0xc,%esp
  105677:	ff 75 f4             	pushl  -0xc(%ebp)
  10567a:	e8 ca c4 ff ff       	call   101b49 <iunlockput>
  10567f:	83 c4 10             	add    $0x10,%esp
  105682:	83 ec 0c             	sub    $0xc,%esp
  105685:	ff 75 f0             	pushl  -0x10(%ebp)
  105688:	e8 e8 c1 ff ff       	call   101875 <ilock>
  10568d:	83 c4 10             	add    $0x10,%esp
  105690:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
  105695:	75 15                	jne    1056ac <create+0xa5>
  105697:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10569a:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10569e:	66 83 f8 02          	cmp    $0x2,%ax
  1056a2:	75 08                	jne    1056ac <create+0xa5>
  1056a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1056a7:	e9 2b 01 00 00       	jmp    1057d7 <create+0x1d0>
  1056ac:	83 ec 0c             	sub    $0xc,%esp
  1056af:	ff 75 f0             	pushl  -0x10(%ebp)
  1056b2:	e8 92 c4 ff ff       	call   101b49 <iunlockput>
  1056b7:	83 c4 10             	add    $0x10,%esp
  1056ba:	b8 00 00 00 00       	mov    $0x0,%eax
  1056bf:	e9 13 01 00 00       	jmp    1057d7 <create+0x1d0>
  1056c4:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
  1056c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1056cb:	8b 00                	mov    (%eax),%eax
  1056cd:	83 ec 08             	sub    $0x8,%esp
  1056d0:	52                   	push   %edx
  1056d1:	50                   	push   %eax
  1056d2:	e8 e9 be ff ff       	call   1015c0 <ialloc>
  1056d7:	83 c4 10             	add    $0x10,%esp
  1056da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1056dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1056e1:	75 0d                	jne    1056f0 <create+0xe9>
  1056e3:	83 ec 0c             	sub    $0xc,%esp
  1056e6:	68 37 92 10 00       	push   $0x109237
  1056eb:	e8 88 ae ff ff       	call   100578 <panic>
  1056f0:	83 ec 0c             	sub    $0xc,%esp
  1056f3:	ff 75 f0             	pushl  -0x10(%ebp)
  1056f6:	e8 7a c1 ff ff       	call   101875 <ilock>
  1056fb:	83 c4 10             	add    $0x10,%esp
  1056fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105701:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
  105705:	66 89 50 12          	mov    %dx,0x12(%eax)
  105709:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10570c:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
  105710:	66 89 50 14          	mov    %dx,0x14(%eax)
  105714:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105717:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  10571d:	83 ec 0c             	sub    $0xc,%esp
  105720:	ff 75 f0             	pushl  -0x10(%ebp)
  105723:	e8 79 bf ff ff       	call   1016a1 <iupdate>
  105728:	83 c4 10             	add    $0x10,%esp
  10572b:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
  105730:	75 6a                	jne    10579c <create+0x195>
  105732:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105735:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  105739:	83 c0 01             	add    $0x1,%eax
  10573c:	89 c2                	mov    %eax,%edx
  10573e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105741:	66 89 50 16          	mov    %dx,0x16(%eax)
  105745:	83 ec 0c             	sub    $0xc,%esp
  105748:	ff 75 f4             	pushl  -0xc(%ebp)
  10574b:	e8 51 bf ff ff       	call   1016a1 <iupdate>
  105750:	83 c4 10             	add    $0x10,%esp
  105753:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105756:	8b 40 04             	mov    0x4(%eax),%eax
  105759:	83 ec 04             	sub    $0x4,%esp
  10575c:	50                   	push   %eax
  10575d:	68 11 92 10 00       	push   $0x109211
  105762:	ff 75 f0             	pushl  -0x10(%ebp)
  105765:	e8 9f ca ff ff       	call   102209 <dirlink>
  10576a:	83 c4 10             	add    $0x10,%esp
  10576d:	85 c0                	test   %eax,%eax
  10576f:	78 1e                	js     10578f <create+0x188>
  105771:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105774:	8b 40 04             	mov    0x4(%eax),%eax
  105777:	83 ec 04             	sub    $0x4,%esp
  10577a:	50                   	push   %eax
  10577b:	68 13 92 10 00       	push   $0x109213
  105780:	ff 75 f0             	pushl  -0x10(%ebp)
  105783:	e8 81 ca ff ff       	call   102209 <dirlink>
  105788:	83 c4 10             	add    $0x10,%esp
  10578b:	85 c0                	test   %eax,%eax
  10578d:	79 0d                	jns    10579c <create+0x195>
  10578f:	83 ec 0c             	sub    $0xc,%esp
  105792:	68 46 92 10 00       	push   $0x109246
  105797:	e8 dc ad ff ff       	call   100578 <panic>
  10579c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10579f:	8b 40 04             	mov    0x4(%eax),%eax
  1057a2:	83 ec 04             	sub    $0x4,%esp
  1057a5:	50                   	push   %eax
  1057a6:	8d 45 de             	lea    -0x22(%ebp),%eax
  1057a9:	50                   	push   %eax
  1057aa:	ff 75 f4             	pushl  -0xc(%ebp)
  1057ad:	e8 57 ca ff ff       	call   102209 <dirlink>
  1057b2:	83 c4 10             	add    $0x10,%esp
  1057b5:	85 c0                	test   %eax,%eax
  1057b7:	79 0d                	jns    1057c6 <create+0x1bf>
  1057b9:	83 ec 0c             	sub    $0xc,%esp
  1057bc:	68 52 92 10 00       	push   $0x109252
  1057c1:	e8 b2 ad ff ff       	call   100578 <panic>
  1057c6:	83 ec 0c             	sub    $0xc,%esp
  1057c9:	ff 75 f4             	pushl  -0xc(%ebp)
  1057cc:	e8 78 c3 ff ff       	call   101b49 <iunlockput>
  1057d1:	83 c4 10             	add    $0x10,%esp
  1057d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1057d7:	c9                   	leave  
  1057d8:	c3                   	ret    

001057d9 <sys_open>:
  1057d9:	55                   	push   %ebp
  1057da:	89 e5                	mov    %esp,%ebp
  1057dc:	83 ec 28             	sub    $0x28,%esp
  1057df:	83 ec 08             	sub    $0x8,%esp
  1057e2:	8d 45 e8             	lea    -0x18(%ebp),%eax
  1057e5:	50                   	push   %eax
  1057e6:	6a 00                	push   $0x0
  1057e8:	e8 f0 f6 ff ff       	call   104edd <argstr>
  1057ed:	83 c4 10             	add    $0x10,%esp
  1057f0:	85 c0                	test   %eax,%eax
  1057f2:	78 15                	js     105809 <sys_open+0x30>
  1057f4:	83 ec 08             	sub    $0x8,%esp
  1057f7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1057fa:	50                   	push   %eax
  1057fb:	6a 01                	push   $0x1
  1057fd:	e8 4f f6 ff ff       	call   104e51 <argint>
  105802:	83 c4 10             	add    $0x10,%esp
  105805:	85 c0                	test   %eax,%eax
  105807:	79 0a                	jns    105813 <sys_open+0x3a>
  105809:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10580e:	e9 41 01 00 00       	jmp    105954 <sys_open+0x17b>
  105813:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  105816:	25 00 02 00 00       	and    $0x200,%eax
  10581b:	85 c0                	test   %eax,%eax
  10581d:	74 25                	je     105844 <sys_open+0x6b>
  10581f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  105822:	6a 00                	push   $0x0
  105824:	6a 00                	push   $0x0
  105826:	6a 02                	push   $0x2
  105828:	50                   	push   %eax
  105829:	e8 86 26 00 00       	call   107eb4 <vfs_create>
  10582e:	83 c4 10             	add    $0x10,%esp
  105831:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105834:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  105838:	75 64                	jne    10589e <sys_open+0xc5>
  10583a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10583f:	e9 10 01 00 00       	jmp    105954 <sys_open+0x17b>
  105844:	8b 45 e8             	mov    -0x18(%ebp),%eax
  105847:	83 ec 0c             	sub    $0xc,%esp
  10584a:	50                   	push   %eax
  10584b:	e8 31 27 00 00       	call   107f81 <vfs_namei>
  105850:	83 c4 10             	add    $0x10,%esp
  105853:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105856:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10585a:	75 0a                	jne    105866 <sys_open+0x8d>
  10585c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105861:	e9 ee 00 00 00       	jmp    105954 <sys_open+0x17b>
  105866:	83 ec 0c             	sub    $0xc,%esp
  105869:	ff 75 f4             	pushl  -0xc(%ebp)
  10586c:	e8 d1 27 00 00       	call   108042 <vfs_ilock>
  105871:	83 c4 10             	add    $0x10,%esp
  105874:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105877:	8b 40 08             	mov    0x8(%eax),%eax
  10587a:	83 f8 01             	cmp    $0x1,%eax
  10587d:	75 1f                	jne    10589e <sys_open+0xc5>
  10587f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  105882:	85 c0                	test   %eax,%eax
  105884:	74 18                	je     10589e <sys_open+0xc5>
  105886:	83 ec 0c             	sub    $0xc,%esp
  105889:	ff 75 f4             	pushl  -0xc(%ebp)
  10588c:	e8 0e 28 00 00       	call   10809f <vfs_iunlockput>
  105891:	83 c4 10             	add    $0x10,%esp
  105894:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105899:	e9 b6 00 00 00       	jmp    105954 <sys_open+0x17b>
  10589e:	e8 d0 b6 ff ff       	call   100f73 <filealloc>
  1058a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1058a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1058aa:	74 17                	je     1058c3 <sys_open+0xea>
  1058ac:	83 ec 0c             	sub    $0xc,%esp
  1058af:	ff 75 f0             	pushl  -0x10(%ebp)
  1058b2:	e8 59 f7 ff ff       	call   105010 <fdalloc>
  1058b7:	83 c4 10             	add    $0x10,%esp
  1058ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1058bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1058c1:	79 29                	jns    1058ec <sys_open+0x113>
  1058c3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1058c7:	74 0e                	je     1058d7 <sys_open+0xfe>
  1058c9:	83 ec 0c             	sub    $0xc,%esp
  1058cc:	ff 75 f0             	pushl  -0x10(%ebp)
  1058cf:	e8 5d b7 ff ff       	call   101031 <fileclose>
  1058d4:	83 c4 10             	add    $0x10,%esp
  1058d7:	83 ec 0c             	sub    $0xc,%esp
  1058da:	ff 75 f4             	pushl  -0xc(%ebp)
  1058dd:	e8 bd 27 00 00       	call   10809f <vfs_iunlockput>
  1058e2:	83 c4 10             	add    $0x10,%esp
  1058e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1058ea:	eb 68                	jmp    105954 <sys_open+0x17b>
  1058ec:	83 ec 0c             	sub    $0xc,%esp
  1058ef:	ff 75 f4             	pushl  -0xc(%ebp)
  1058f2:	e8 cd 27 00 00       	call   1080c4 <vfs_iunlock>
  1058f7:	83 c4 10             	add    $0x10,%esp
  1058fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1058fd:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  105903:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105906:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105909:	89 50 10             	mov    %edx,0x10(%eax)
  10590c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10590f:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  105916:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  105919:	83 e0 01             	and    $0x1,%eax
  10591c:	85 c0                	test   %eax,%eax
  10591e:	0f 94 c0             	sete   %al
  105921:	89 c2                	mov    %eax,%edx
  105923:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105926:	88 50 08             	mov    %dl,0x8(%eax)
  105929:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10592c:	83 e0 01             	and    $0x1,%eax
  10592f:	85 c0                	test   %eax,%eax
  105931:	75 0a                	jne    10593d <sys_open+0x164>
  105933:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  105936:	83 e0 02             	and    $0x2,%eax
  105939:	85 c0                	test   %eax,%eax
  10593b:	74 07                	je     105944 <sys_open+0x16b>
  10593d:	b8 01 00 00 00       	mov    $0x1,%eax
  105942:	eb 05                	jmp    105949 <sys_open+0x170>
  105944:	b8 00 00 00 00       	mov    $0x0,%eax
  105949:	89 c2                	mov    %eax,%edx
  10594b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10594e:	88 50 09             	mov    %dl,0x9(%eax)
  105951:	8b 45 ec             	mov    -0x14(%ebp),%eax
  105954:	c9                   	leave  
  105955:	c3                   	ret    

00105956 <sys_mkdir>:
  105956:	55                   	push   %ebp
  105957:	89 e5                	mov    %esp,%ebp
  105959:	83 ec 18             	sub    $0x18,%esp
  10595c:	83 ec 08             	sub    $0x8,%esp
  10595f:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105962:	50                   	push   %eax
  105963:	6a 00                	push   $0x0
  105965:	e8 73 f5 ff ff       	call   104edd <argstr>
  10596a:	83 c4 10             	add    $0x10,%esp
  10596d:	85 c0                	test   %eax,%eax
  10596f:	78 1b                	js     10598c <sys_mkdir+0x36>
  105971:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105974:	6a 00                	push   $0x0
  105976:	6a 00                	push   $0x0
  105978:	6a 01                	push   $0x1
  10597a:	50                   	push   %eax
  10597b:	e8 87 fc ff ff       	call   105607 <create>
  105980:	83 c4 10             	add    $0x10,%esp
  105983:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105986:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10598a:	75 07                	jne    105993 <sys_mkdir+0x3d>
  10598c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105991:	eb 13                	jmp    1059a6 <sys_mkdir+0x50>
  105993:	83 ec 0c             	sub    $0xc,%esp
  105996:	ff 75 f4             	pushl  -0xc(%ebp)
  105999:	e8 ab c1 ff ff       	call   101b49 <iunlockput>
  10599e:	83 c4 10             	add    $0x10,%esp
  1059a1:	b8 00 00 00 00       	mov    $0x0,%eax
  1059a6:	c9                   	leave  
  1059a7:	c3                   	ret    

001059a8 <sys_mknod>:
  1059a8:	55                   	push   %ebp
  1059a9:	89 e5                	mov    %esp,%ebp
  1059ab:	83 ec 28             	sub    $0x28,%esp
  1059ae:	83 ec 08             	sub    $0x8,%esp
  1059b1:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1059b4:	50                   	push   %eax
  1059b5:	6a 00                	push   $0x0
  1059b7:	e8 21 f5 ff ff       	call   104edd <argstr>
  1059bc:	83 c4 10             	add    $0x10,%esp
  1059bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1059c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1059c6:	78 4f                	js     105a17 <sys_mknod+0x6f>
  1059c8:	83 ec 08             	sub    $0x8,%esp
  1059cb:	8d 45 e8             	lea    -0x18(%ebp),%eax
  1059ce:	50                   	push   %eax
  1059cf:	6a 01                	push   $0x1
  1059d1:	e8 7b f4 ff ff       	call   104e51 <argint>
  1059d6:	83 c4 10             	add    $0x10,%esp
  1059d9:	85 c0                	test   %eax,%eax
  1059db:	78 3a                	js     105a17 <sys_mknod+0x6f>
  1059dd:	83 ec 08             	sub    $0x8,%esp
  1059e0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1059e3:	50                   	push   %eax
  1059e4:	6a 02                	push   $0x2
  1059e6:	e8 66 f4 ff ff       	call   104e51 <argint>
  1059eb:	83 c4 10             	add    $0x10,%esp
  1059ee:	85 c0                	test   %eax,%eax
  1059f0:	78 25                	js     105a17 <sys_mknod+0x6f>
  1059f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1059f5:	0f bf c8             	movswl %ax,%ecx
  1059f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1059fb:	0f bf d0             	movswl %ax,%edx
  1059fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  105a01:	51                   	push   %ecx
  105a02:	52                   	push   %edx
  105a03:	6a 03                	push   $0x3
  105a05:	50                   	push   %eax
  105a06:	e8 fc fb ff ff       	call   105607 <create>
  105a0b:	83 c4 10             	add    $0x10,%esp
  105a0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  105a11:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  105a15:	75 07                	jne    105a1e <sys_mknod+0x76>
  105a17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105a1c:	eb 13                	jmp    105a31 <sys_mknod+0x89>
  105a1e:	83 ec 0c             	sub    $0xc,%esp
  105a21:	ff 75 f0             	pushl  -0x10(%ebp)
  105a24:	e8 20 c1 ff ff       	call   101b49 <iunlockput>
  105a29:	83 c4 10             	add    $0x10,%esp
  105a2c:	b8 00 00 00 00       	mov    $0x0,%eax
  105a31:	c9                   	leave  
  105a32:	c3                   	ret    

00105a33 <sys_chdir>:
  105a33:	55                   	push   %ebp
  105a34:	89 e5                	mov    %esp,%ebp
  105a36:	83 ec 18             	sub    $0x18,%esp
  105a39:	83 ec 08             	sub    $0x8,%esp
  105a3c:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105a3f:	50                   	push   %eax
  105a40:	6a 00                	push   $0x0
  105a42:	e8 96 f4 ff ff       	call   104edd <argstr>
  105a47:	83 c4 10             	add    $0x10,%esp
  105a4a:	85 c0                	test   %eax,%eax
  105a4c:	78 18                	js     105a66 <sys_chdir+0x33>
  105a4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105a51:	83 ec 0c             	sub    $0xc,%esp
  105a54:	50                   	push   %eax
  105a55:	e8 9e ca ff ff       	call   1024f8 <namei>
  105a5a:	83 c4 10             	add    $0x10,%esp
  105a5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105a60:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  105a64:	75 07                	jne    105a6d <sys_chdir+0x3a>
  105a66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105a6b:	eb 64                	jmp    105ad1 <sys_chdir+0x9e>
  105a6d:	83 ec 0c             	sub    $0xc,%esp
  105a70:	ff 75 f4             	pushl  -0xc(%ebp)
  105a73:	e8 fd bd ff ff       	call   101875 <ilock>
  105a78:	83 c4 10             	add    $0x10,%esp
  105a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105a7e:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  105a82:	66 83 f8 01          	cmp    $0x1,%ax
  105a86:	74 15                	je     105a9d <sys_chdir+0x6a>
  105a88:	83 ec 0c             	sub    $0xc,%esp
  105a8b:	ff 75 f4             	pushl  -0xc(%ebp)
  105a8e:	e8 b6 c0 ff ff       	call   101b49 <iunlockput>
  105a93:	83 c4 10             	add    $0x10,%esp
  105a96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105a9b:	eb 34                	jmp    105ad1 <sys_chdir+0x9e>
  105a9d:	83 ec 0c             	sub    $0xc,%esp
  105aa0:	ff 75 f4             	pushl  -0xc(%ebp)
  105aa3:	e8 3f bf ff ff       	call   1019e7 <iunlock>
  105aa8:	83 c4 10             	add    $0x10,%esp
  105aab:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105ab1:	8b 40 68             	mov    0x68(%eax),%eax
  105ab4:	83 ec 0c             	sub    $0xc,%esp
  105ab7:	50                   	push   %eax
  105ab8:	e8 9c bf ff ff       	call   101a59 <iput>
  105abd:	83 c4 10             	add    $0x10,%esp
  105ac0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105ac6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105ac9:	89 50 68             	mov    %edx,0x68(%eax)
  105acc:	b8 00 00 00 00       	mov    $0x0,%eax
  105ad1:	c9                   	leave  
  105ad2:	c3                   	ret    

00105ad3 <sys_exec>:
  105ad3:	55                   	push   %ebp
  105ad4:	89 e5                	mov    %esp,%ebp
  105ad6:	81 ec 98 00 00 00    	sub    $0x98,%esp
  105adc:	83 ec 08             	sub    $0x8,%esp
  105adf:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105ae2:	50                   	push   %eax
  105ae3:	6a 00                	push   $0x0
  105ae5:	e8 f3 f3 ff ff       	call   104edd <argstr>
  105aea:	83 c4 10             	add    $0x10,%esp
  105aed:	85 c0                	test   %eax,%eax
  105aef:	78 18                	js     105b09 <sys_exec+0x36>
  105af1:	83 ec 08             	sub    $0x8,%esp
  105af4:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
  105afa:	50                   	push   %eax
  105afb:	6a 01                	push   $0x1
  105afd:	e8 4f f3 ff ff       	call   104e51 <argint>
  105b02:	83 c4 10             	add    $0x10,%esp
  105b05:	85 c0                	test   %eax,%eax
  105b07:	79 0a                	jns    105b13 <sys_exec+0x40>
  105b09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105b0e:	e9 d6 00 00 00       	jmp    105be9 <sys_exec+0x116>
  105b13:	83 ec 04             	sub    $0x4,%esp
  105b16:	68 80 00 00 00       	push   $0x80
  105b1b:	6a 00                	push   $0x0
  105b1d:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
  105b23:	50                   	push   %eax
  105b24:	e8 5c f0 ff ff       	call   104b85 <memset>
  105b29:	83 c4 10             	add    $0x10,%esp
  105b2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  105b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105b36:	83 f8 1f             	cmp    $0x1f,%eax
  105b39:	76 0a                	jbe    105b45 <sys_exec+0x72>
  105b3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105b40:	e9 a4 00 00 00       	jmp    105be9 <sys_exec+0x116>
  105b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105b48:	c1 e0 02             	shl    $0x2,%eax
  105b4b:	89 c2                	mov    %eax,%edx
  105b4d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
  105b53:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  105b56:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105b5c:	83 ec 04             	sub    $0x4,%esp
  105b5f:	8d 95 68 ff ff ff    	lea    -0x98(%ebp),%edx
  105b65:	52                   	push   %edx
  105b66:	51                   	push   %ecx
  105b67:	50                   	push   %eax
  105b68:	e8 54 f2 ff ff       	call   104dc1 <fetchint>
  105b6d:	83 c4 10             	add    $0x10,%esp
  105b70:	85 c0                	test   %eax,%eax
  105b72:	79 07                	jns    105b7b <sys_exec+0xa8>
  105b74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105b79:	eb 6e                	jmp    105be9 <sys_exec+0x116>
  105b7b:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
  105b81:	85 c0                	test   %eax,%eax
  105b83:	75 27                	jne    105bac <sys_exec+0xd9>
  105b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105b88:	c7 84 85 70 ff ff ff 	movl   $0x0,-0x90(%ebp,%eax,4)
  105b8f:	00 00 00 00 
  105b93:	90                   	nop
  105b94:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105b97:	83 ec 08             	sub    $0x8,%esp
  105b9a:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
  105ba0:	52                   	push   %edx
  105ba1:	50                   	push   %eax
  105ba2:	e8 db af ff ff       	call   100b82 <exec>
  105ba7:	83 c4 10             	add    $0x10,%esp
  105baa:	eb 3d                	jmp    105be9 <sys_exec+0x116>
  105bac:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
  105bb2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105bb5:	c1 e2 02             	shl    $0x2,%edx
  105bb8:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
  105bbb:	8b 95 68 ff ff ff    	mov    -0x98(%ebp),%edx
  105bc1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105bc7:	83 ec 04             	sub    $0x4,%esp
  105bca:	51                   	push   %ecx
  105bcb:	52                   	push   %edx
  105bcc:	50                   	push   %eax
  105bcd:	e8 23 f2 ff ff       	call   104df5 <fetchstr>
  105bd2:	83 c4 10             	add    $0x10,%esp
  105bd5:	85 c0                	test   %eax,%eax
  105bd7:	79 07                	jns    105be0 <sys_exec+0x10d>
  105bd9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105bde:	eb 09                	jmp    105be9 <sys_exec+0x116>
  105be0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  105be4:	e9 4a ff ff ff       	jmp    105b33 <sys_exec+0x60>
  105be9:	c9                   	leave  
  105bea:	c3                   	ret    

00105beb <sys_pipe>:
  105beb:	55                   	push   %ebp
  105bec:	89 e5                	mov    %esp,%ebp
  105bee:	83 ec 28             	sub    $0x28,%esp
  105bf1:	83 ec 04             	sub    $0x4,%esp
  105bf4:	6a 08                	push   $0x8
  105bf6:	8d 45 ec             	lea    -0x14(%ebp),%eax
  105bf9:	50                   	push   %eax
  105bfa:	6a 00                	push   $0x0
  105bfc:	e8 7f f2 ff ff       	call   104e80 <argptr>
  105c01:	83 c4 10             	add    $0x10,%esp
  105c04:	85 c0                	test   %eax,%eax
  105c06:	79 0a                	jns    105c12 <sys_pipe+0x27>
  105c08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105c0d:	e9 af 00 00 00       	jmp    105cc1 <sys_pipe+0xd6>
  105c12:	83 ec 08             	sub    $0x8,%esp
  105c15:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  105c18:	50                   	push   %eax
  105c19:	8d 45 e8             	lea    -0x18(%ebp),%eax
  105c1c:	50                   	push   %eax
  105c1d:	e8 84 dd ff ff       	call   1039a6 <pipealloc>
  105c22:	83 c4 10             	add    $0x10,%esp
  105c25:	85 c0                	test   %eax,%eax
  105c27:	79 0a                	jns    105c33 <sys_pipe+0x48>
  105c29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105c2e:	e9 8e 00 00 00       	jmp    105cc1 <sys_pipe+0xd6>
  105c33:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  105c3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  105c3d:	83 ec 0c             	sub    $0xc,%esp
  105c40:	50                   	push   %eax
  105c41:	e8 ca f3 ff ff       	call   105010 <fdalloc>
  105c46:	83 c4 10             	add    $0x10,%esp
  105c49:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105c4c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  105c50:	78 18                	js     105c6a <sys_pipe+0x7f>
  105c52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  105c55:	83 ec 0c             	sub    $0xc,%esp
  105c58:	50                   	push   %eax
  105c59:	e8 b2 f3 ff ff       	call   105010 <fdalloc>
  105c5e:	83 c4 10             	add    $0x10,%esp
  105c61:	89 45 f0             	mov    %eax,-0x10(%ebp)
  105c64:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  105c68:	79 3f                	jns    105ca9 <sys_pipe+0xbe>
  105c6a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  105c6e:	78 14                	js     105c84 <sys_pipe+0x99>
  105c70:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105c76:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105c79:	83 c2 08             	add    $0x8,%edx
  105c7c:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  105c83:	00 
  105c84:	8b 45 e8             	mov    -0x18(%ebp),%eax
  105c87:	83 ec 0c             	sub    $0xc,%esp
  105c8a:	50                   	push   %eax
  105c8b:	e8 a1 b3 ff ff       	call   101031 <fileclose>
  105c90:	83 c4 10             	add    $0x10,%esp
  105c93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  105c96:	83 ec 0c             	sub    $0xc,%esp
  105c99:	50                   	push   %eax
  105c9a:	e8 92 b3 ff ff       	call   101031 <fileclose>
  105c9f:	83 c4 10             	add    $0x10,%esp
  105ca2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105ca7:	eb 18                	jmp    105cc1 <sys_pipe+0xd6>
  105ca9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  105cac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105caf:	89 10                	mov    %edx,(%eax)
  105cb1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  105cb4:	8d 50 04             	lea    0x4(%eax),%edx
  105cb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105cba:	89 02                	mov    %eax,(%edx)
  105cbc:	b8 00 00 00 00       	mov    $0x0,%eax
  105cc1:	c9                   	leave  
  105cc2:	c3                   	ret    

00105cc3 <outb>:
  105cc3:	55                   	push   %ebp
  105cc4:	89 e5                	mov    %esp,%ebp
  105cc6:	83 ec 08             	sub    $0x8,%esp
  105cc9:	8b 55 08             	mov    0x8(%ebp),%edx
  105ccc:	8b 45 0c             	mov    0xc(%ebp),%eax
  105ccf:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  105cd3:	88 45 f8             	mov    %al,-0x8(%ebp)
  105cd6:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  105cda:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  105cde:	ee                   	out    %al,(%dx)
  105cdf:	90                   	nop
  105ce0:	c9                   	leave  
  105ce1:	c3                   	ret    

00105ce2 <sys_fork>:
  105ce2:	55                   	push   %ebp
  105ce3:	89 e5                	mov    %esp,%ebp
  105ce5:	83 ec 08             	sub    $0x8,%esp
  105ce8:	e8 d2 e3 ff ff       	call   1040bf <fork>
  105ced:	c9                   	leave  
  105cee:	c3                   	ret    

00105cef <sys_exit>:
  105cef:	55                   	push   %ebp
  105cf0:	89 e5                	mov    %esp,%ebp
  105cf2:	83 ec 08             	sub    $0x8,%esp
  105cf5:	e8 38 e5 ff ff       	call   104232 <exit>
  105cfa:	b8 00 00 00 00       	mov    $0x0,%eax
  105cff:	c9                   	leave  
  105d00:	c3                   	ret    

00105d01 <sys_wait>:
  105d01:	55                   	push   %ebp
  105d02:	89 e5                	mov    %esp,%ebp
  105d04:	83 ec 08             	sub    $0x8,%esp
  105d07:	e8 6a e6 ff ff       	call   104376 <wait>
  105d0c:	c9                   	leave  
  105d0d:	c3                   	ret    

00105d0e <sys_rammake>:
  105d0e:	55                   	push   %ebp
  105d0f:	89 e5                	mov    %esp,%ebp
  105d11:	83 ec 18             	sub    $0x18,%esp
  105d14:	83 ec 08             	sub    $0x8,%esp
  105d17:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105d1a:	50                   	push   %eax
  105d1b:	6a 00                	push   $0x0
  105d1d:	e8 bb f1 ff ff       	call   104edd <argstr>
  105d22:	83 c4 10             	add    $0x10,%esp
  105d25:	85 c0                	test   %eax,%eax
  105d27:	79 07                	jns    105d30 <sys_rammake+0x22>
  105d29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105d2e:	eb 0f                	jmp    105d3f <sys_rammake+0x31>
  105d30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105d33:	83 ec 0c             	sub    $0xc,%esp
  105d36:	50                   	push   %eax
  105d37:	e8 24 e6 ff ff       	call   104360 <rammake>
  105d3c:	83 c4 10             	add    $0x10,%esp
  105d3f:	c9                   	leave  
  105d40:	c3                   	ret    

00105d41 <sys_kill>:
  105d41:	55                   	push   %ebp
  105d42:	89 e5                	mov    %esp,%ebp
  105d44:	83 ec 18             	sub    $0x18,%esp
  105d47:	83 ec 08             	sub    $0x8,%esp
  105d4a:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105d4d:	50                   	push   %eax
  105d4e:	6a 00                	push   $0x0
  105d50:	e8 fc f0 ff ff       	call   104e51 <argint>
  105d55:	83 c4 10             	add    $0x10,%esp
  105d58:	85 c0                	test   %eax,%eax
  105d5a:	79 07                	jns    105d63 <sys_kill+0x22>
  105d5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105d61:	eb 0f                	jmp    105d72 <sys_kill+0x31>
  105d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105d66:	83 ec 0c             	sub    $0xc,%esp
  105d69:	50                   	push   %eax
  105d6a:	e8 02 ea ff ff       	call   104771 <kill>
  105d6f:	83 c4 10             	add    $0x10,%esp
  105d72:	c9                   	leave  
  105d73:	c3                   	ret    

00105d74 <sys_getpid>:
  105d74:	55                   	push   %ebp
  105d75:	89 e5                	mov    %esp,%ebp
  105d77:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105d7d:	8b 40 10             	mov    0x10(%eax),%eax
  105d80:	5d                   	pop    %ebp
  105d81:	c3                   	ret    

00105d82 <sys_sbrk>:
  105d82:	55                   	push   %ebp
  105d83:	89 e5                	mov    %esp,%ebp
  105d85:	83 ec 18             	sub    $0x18,%esp
  105d88:	83 ec 08             	sub    $0x8,%esp
  105d8b:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105d8e:	50                   	push   %eax
  105d8f:	6a 00                	push   $0x0
  105d91:	e8 bb f0 ff ff       	call   104e51 <argint>
  105d96:	83 c4 10             	add    $0x10,%esp
  105d99:	85 c0                	test   %eax,%eax
  105d9b:	79 07                	jns    105da4 <sys_sbrk+0x22>
  105d9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105da2:	eb 28                	jmp    105dcc <sys_sbrk+0x4a>
  105da4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105daa:	8b 00                	mov    (%eax),%eax
  105dac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105daf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105db2:	83 ec 0c             	sub    $0xc,%esp
  105db5:	50                   	push   %eax
  105db6:	e8 61 e2 ff ff       	call   10401c <growproc>
  105dbb:	83 c4 10             	add    $0x10,%esp
  105dbe:	85 c0                	test   %eax,%eax
  105dc0:	79 07                	jns    105dc9 <sys_sbrk+0x47>
  105dc2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105dc7:	eb 03                	jmp    105dcc <sys_sbrk+0x4a>
  105dc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105dcc:	c9                   	leave  
  105dcd:	c3                   	ret    

00105dce <sys_sleep>:
  105dce:	55                   	push   %ebp
  105dcf:	89 e5                	mov    %esp,%ebp
  105dd1:	83 ec 18             	sub    $0x18,%esp
  105dd4:	83 ec 08             	sub    $0x8,%esp
  105dd7:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105dda:	50                   	push   %eax
  105ddb:	6a 00                	push   $0x0
  105ddd:	e8 6f f0 ff ff       	call   104e51 <argint>
  105de2:	83 c4 10             	add    $0x10,%esp
  105de5:	85 c0                	test   %eax,%eax
  105de7:	79 07                	jns    105df0 <sys_sleep+0x22>
  105de9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105dee:	eb 77                	jmp    105e67 <sys_sleep+0x99>
  105df0:	83 ec 0c             	sub    $0xc,%esp
  105df3:	68 00 33 11 00       	push   $0x113300
  105df8:	e8 4b eb ff ff       	call   104948 <acquire>
  105dfd:	83 c4 10             	add    $0x10,%esp
  105e00:	a1 40 3b 11 00       	mov    0x113b40,%eax
  105e05:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105e08:	eb 39                	jmp    105e43 <sys_sleep+0x75>
  105e0a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105e10:	8b 40 24             	mov    0x24(%eax),%eax
  105e13:	85 c0                	test   %eax,%eax
  105e15:	74 17                	je     105e2e <sys_sleep+0x60>
  105e17:	83 ec 0c             	sub    $0xc,%esp
  105e1a:	68 00 33 11 00       	push   $0x113300
  105e1f:	e8 8b eb ff ff       	call   1049af <release>
  105e24:	83 c4 10             	add    $0x10,%esp
  105e27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105e2c:	eb 39                	jmp    105e67 <sys_sleep+0x99>
  105e2e:	83 ec 08             	sub    $0x8,%esp
  105e31:	68 00 33 11 00       	push   $0x113300
  105e36:	68 40 3b 11 00       	push   $0x113b40
  105e3b:	e8 0f e8 ff ff       	call   10464f <sleep>
  105e40:	83 c4 10             	add    $0x10,%esp
  105e43:	a1 40 3b 11 00       	mov    0x113b40,%eax
  105e48:	2b 45 f4             	sub    -0xc(%ebp),%eax
  105e4b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  105e4e:	39 d0                	cmp    %edx,%eax
  105e50:	72 b8                	jb     105e0a <sys_sleep+0x3c>
  105e52:	83 ec 0c             	sub    $0xc,%esp
  105e55:	68 00 33 11 00       	push   $0x113300
  105e5a:	e8 50 eb ff ff       	call   1049af <release>
  105e5f:	83 c4 10             	add    $0x10,%esp
  105e62:	b8 00 00 00 00       	mov    $0x0,%eax
  105e67:	c9                   	leave  
  105e68:	c3                   	ret    

00105e69 <sys_uptime>:
  105e69:	55                   	push   %ebp
  105e6a:	89 e5                	mov    %esp,%ebp
  105e6c:	83 ec 18             	sub    $0x18,%esp
  105e6f:	83 ec 0c             	sub    $0xc,%esp
  105e72:	68 00 33 11 00       	push   $0x113300
  105e77:	e8 cc ea ff ff       	call   104948 <acquire>
  105e7c:	83 c4 10             	add    $0x10,%esp
  105e7f:	a1 40 3b 11 00       	mov    0x113b40,%eax
  105e84:	89 45 f4             	mov    %eax,-0xc(%ebp)
  105e87:	83 ec 0c             	sub    $0xc,%esp
  105e8a:	68 00 33 11 00       	push   $0x113300
  105e8f:	e8 1b eb ff ff       	call   1049af <release>
  105e94:	83 c4 10             	add    $0x10,%esp
  105e97:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105e9a:	c9                   	leave  
  105e9b:	c3                   	ret    

00105e9c <sys_halt>:
  105e9c:	55                   	push   %ebp
  105e9d:	89 e5                	mov    %esp,%ebp
  105e9f:	6a 00                	push   $0x0
  105ea1:	68 f4 00 00 00       	push   $0xf4
  105ea6:	e8 18 fe ff ff       	call   105cc3 <outb>
  105eab:	83 c4 08             	add    $0x8,%esp
  105eae:	b8 00 00 00 00       	mov    $0x0,%eax
  105eb3:	c9                   	leave  
  105eb4:	c3                   	ret    

00105eb5 <outb>:
  105eb5:	55                   	push   %ebp
  105eb6:	89 e5                	mov    %esp,%ebp
  105eb8:	83 ec 08             	sub    $0x8,%esp
  105ebb:	8b 55 08             	mov    0x8(%ebp),%edx
  105ebe:	8b 45 0c             	mov    0xc(%ebp),%eax
  105ec1:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  105ec5:	88 45 f8             	mov    %al,-0x8(%ebp)
  105ec8:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  105ecc:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  105ed0:	ee                   	out    %al,(%dx)
  105ed1:	90                   	nop
  105ed2:	c9                   	leave  
  105ed3:	c3                   	ret    

00105ed4 <timerinit>:
  105ed4:	55                   	push   %ebp
  105ed5:	89 e5                	mov    %esp,%ebp
  105ed7:	83 ec 08             	sub    $0x8,%esp
  105eda:	6a 34                	push   $0x34
  105edc:	6a 43                	push   $0x43
  105ede:	e8 d2 ff ff ff       	call   105eb5 <outb>
  105ee3:	83 c4 08             	add    $0x8,%esp
  105ee6:	68 9c 00 00 00       	push   $0x9c
  105eeb:	6a 40                	push   $0x40
  105eed:	e8 c3 ff ff ff       	call   105eb5 <outb>
  105ef2:	83 c4 08             	add    $0x8,%esp
  105ef5:	6a 2e                	push   $0x2e
  105ef7:	6a 40                	push   $0x40
  105ef9:	e8 b7 ff ff ff       	call   105eb5 <outb>
  105efe:	83 c4 08             	add    $0x8,%esp
  105f01:	83 ec 0c             	sub    $0xc,%esp
  105f04:	6a 00                	push   $0x0
  105f06:	e8 85 d9 ff ff       	call   103890 <picenable>
  105f0b:	83 c4 10             	add    $0x10,%esp
  105f0e:	90                   	nop
  105f0f:	c9                   	leave  
  105f10:	c3                   	ret    

00105f11 <alltraps>:
  105f11:	1e                   	push   %ds
  105f12:	06                   	push   %es
  105f13:	0f a0                	push   %fs
  105f15:	0f a8                	push   %gs
  105f17:	60                   	pusha  
  105f18:	66 b8 10 00          	mov    $0x10,%ax
  105f1c:	8e d8                	mov    %eax,%ds
  105f1e:	8e c0                	mov    %eax,%es
  105f20:	66 b8 18 00          	mov    $0x18,%ax
  105f24:	8e e0                	mov    %eax,%fs
  105f26:	8e e8                	mov    %eax,%gs
  105f28:	54                   	push   %esp
  105f29:	e8 d7 01 00 00       	call   106105 <trap>
  105f2e:	83 c4 04             	add    $0x4,%esp

00105f31 <trapret>:
  105f31:	61                   	popa   
  105f32:	0f a9                	pop    %gs
  105f34:	0f a1                	pop    %fs
  105f36:	07                   	pop    %es
  105f37:	1f                   	pop    %ds
  105f38:	83 c4 08             	add    $0x8,%esp
  105f3b:	cf                   	iret   

00105f3c <lidt>:
  105f3c:	55                   	push   %ebp
  105f3d:	89 e5                	mov    %esp,%ebp
  105f3f:	83 ec 10             	sub    $0x10,%esp
  105f42:	8b 45 0c             	mov    0xc(%ebp),%eax
  105f45:	83 e8 01             	sub    $0x1,%eax
  105f48:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  105f4c:	8b 45 08             	mov    0x8(%ebp),%eax
  105f4f:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  105f53:	8b 45 08             	mov    0x8(%ebp),%eax
  105f56:	c1 e8 10             	shr    $0x10,%eax
  105f59:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  105f5d:	8d 45 fa             	lea    -0x6(%ebp),%eax
  105f60:	0f 01 18             	lidtl  (%eax)
  105f63:	90                   	nop
  105f64:	c9                   	leave  
  105f65:	c3                   	ret    

00105f66 <rcr2>:
  105f66:	55                   	push   %ebp
  105f67:	89 e5                	mov    %esp,%ebp
  105f69:	83 ec 10             	sub    $0x10,%esp
  105f6c:	0f 20 d0             	mov    %cr2,%eax
  105f6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  105f72:	8b 45 fc             	mov    -0x4(%ebp),%eax
  105f75:	c9                   	leave  
  105f76:	c3                   	ret    

00105f77 <tvinit>:
  105f77:	55                   	push   %ebp
  105f78:	89 e5                	mov    %esp,%ebp
  105f7a:	83 ec 18             	sub    $0x18,%esp
  105f7d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  105f84:	e9 c3 00 00 00       	jmp    10604c <tvinit+0xd5>
  105f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105f8c:	8b 04 85 c0 c5 10 00 	mov    0x10c5c0(,%eax,4),%eax
  105f93:	89 c2                	mov    %eax,%edx
  105f95:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105f98:	66 89 14 c5 40 33 11 	mov    %dx,0x113340(,%eax,8)
  105f9f:	00 
  105fa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105fa3:	66 c7 04 c5 42 33 11 	movw   $0x8,0x113342(,%eax,8)
  105faa:	00 08 00 
  105fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105fb0:	0f b6 14 c5 44 33 11 	movzbl 0x113344(,%eax,8),%edx
  105fb7:	00 
  105fb8:	83 e2 e0             	and    $0xffffffe0,%edx
  105fbb:	88 14 c5 44 33 11 00 	mov    %dl,0x113344(,%eax,8)
  105fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105fc5:	0f b6 14 c5 44 33 11 	movzbl 0x113344(,%eax,8),%edx
  105fcc:	00 
  105fcd:	83 e2 1f             	and    $0x1f,%edx
  105fd0:	88 14 c5 44 33 11 00 	mov    %dl,0x113344(,%eax,8)
  105fd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105fda:	0f b6 14 c5 45 33 11 	movzbl 0x113345(,%eax,8),%edx
  105fe1:	00 
  105fe2:	83 e2 f0             	and    $0xfffffff0,%edx
  105fe5:	83 ca 0e             	or     $0xe,%edx
  105fe8:	88 14 c5 45 33 11 00 	mov    %dl,0x113345(,%eax,8)
  105fef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105ff2:	0f b6 14 c5 45 33 11 	movzbl 0x113345(,%eax,8),%edx
  105ff9:	00 
  105ffa:	83 e2 ef             	and    $0xffffffef,%edx
  105ffd:	88 14 c5 45 33 11 00 	mov    %dl,0x113345(,%eax,8)
  106004:	8b 45 f4             	mov    -0xc(%ebp),%eax
  106007:	0f b6 14 c5 45 33 11 	movzbl 0x113345(,%eax,8),%edx
  10600e:	00 
  10600f:	83 e2 9f             	and    $0xffffff9f,%edx
  106012:	88 14 c5 45 33 11 00 	mov    %dl,0x113345(,%eax,8)
  106019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10601c:	0f b6 14 c5 45 33 11 	movzbl 0x113345(,%eax,8),%edx
  106023:	00 
  106024:	83 ca 80             	or     $0xffffff80,%edx
  106027:	88 14 c5 45 33 11 00 	mov    %dl,0x113345(,%eax,8)
  10602e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  106031:	8b 04 85 c0 c5 10 00 	mov    0x10c5c0(,%eax,4),%eax
  106038:	c1 e8 10             	shr    $0x10,%eax
  10603b:	89 c2                	mov    %eax,%edx
  10603d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  106040:	66 89 14 c5 46 33 11 	mov    %dx,0x113346(,%eax,8)
  106047:	00 
  106048:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10604c:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
  106053:	0f 8e 30 ff ff ff    	jle    105f89 <tvinit+0x12>
  106059:	a1 c0 c6 10 00       	mov    0x10c6c0,%eax
  10605e:	66 a3 40 35 11 00    	mov    %ax,0x113540
  106064:	66 c7 05 42 35 11 00 	movw   $0x8,0x113542
  10606b:	08 00 
  10606d:	0f b6 05 44 35 11 00 	movzbl 0x113544,%eax
  106074:	83 e0 e0             	and    $0xffffffe0,%eax
  106077:	a2 44 35 11 00       	mov    %al,0x113544
  10607c:	0f b6 05 44 35 11 00 	movzbl 0x113544,%eax
  106083:	83 e0 1f             	and    $0x1f,%eax
  106086:	a2 44 35 11 00       	mov    %al,0x113544
  10608b:	0f b6 05 45 35 11 00 	movzbl 0x113545,%eax
  106092:	83 c8 0f             	or     $0xf,%eax
  106095:	a2 45 35 11 00       	mov    %al,0x113545
  10609a:	0f b6 05 45 35 11 00 	movzbl 0x113545,%eax
  1060a1:	83 e0 ef             	and    $0xffffffef,%eax
  1060a4:	a2 45 35 11 00       	mov    %al,0x113545
  1060a9:	0f b6 05 45 35 11 00 	movzbl 0x113545,%eax
  1060b0:	83 c8 60             	or     $0x60,%eax
  1060b3:	a2 45 35 11 00       	mov    %al,0x113545
  1060b8:	0f b6 05 45 35 11 00 	movzbl 0x113545,%eax
  1060bf:	83 c8 80             	or     $0xffffff80,%eax
  1060c2:	a2 45 35 11 00       	mov    %al,0x113545
  1060c7:	a1 c0 c6 10 00       	mov    0x10c6c0,%eax
  1060cc:	c1 e8 10             	shr    $0x10,%eax
  1060cf:	66 a3 46 35 11 00    	mov    %ax,0x113546
  1060d5:	83 ec 08             	sub    $0x8,%esp
  1060d8:	68 64 92 10 00       	push   $0x109264
  1060dd:	68 00 33 11 00       	push   $0x113300
  1060e2:	e8 3f e8 ff ff       	call   104926 <initlock>
  1060e7:	83 c4 10             	add    $0x10,%esp
  1060ea:	90                   	nop
  1060eb:	c9                   	leave  
  1060ec:	c3                   	ret    

001060ed <idtinit>:
  1060ed:	55                   	push   %ebp
  1060ee:	89 e5                	mov    %esp,%ebp
  1060f0:	68 00 08 00 00       	push   $0x800
  1060f5:	68 40 33 11 00       	push   $0x113340
  1060fa:	e8 3d fe ff ff       	call   105f3c <lidt>
  1060ff:	83 c4 08             	add    $0x8,%esp
  106102:	90                   	nop
  106103:	c9                   	leave  
  106104:	c3                   	ret    

00106105 <trap>:
  106105:	55                   	push   %ebp
  106106:	89 e5                	mov    %esp,%ebp
  106108:	57                   	push   %edi
  106109:	56                   	push   %esi
  10610a:	53                   	push   %ebx
  10610b:	83 ec 1c             	sub    $0x1c,%esp
  10610e:	8b 45 08             	mov    0x8(%ebp),%eax
  106111:	8b 40 30             	mov    0x30(%eax),%eax
  106114:	83 f8 40             	cmp    $0x40,%eax
  106117:	75 3e                	jne    106157 <trap+0x52>
  106119:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10611f:	8b 40 24             	mov    0x24(%eax),%eax
  106122:	85 c0                	test   %eax,%eax
  106124:	74 05                	je     10612b <trap+0x26>
  106126:	e8 07 e1 ff ff       	call   104232 <exit>
  10612b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  106131:	8b 55 08             	mov    0x8(%ebp),%edx
  106134:	89 50 18             	mov    %edx,0x18(%eax)
  106137:	e8 db ed ff ff       	call   104f17 <syscall>
  10613c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  106142:	8b 40 24             	mov    0x24(%eax),%eax
  106145:	85 c0                	test   %eax,%eax
  106147:	0f 84 27 02 00 00    	je     106374 <trap+0x26f>
  10614d:	e8 e0 e0 ff ff       	call   104232 <exit>
  106152:	e9 1d 02 00 00       	jmp    106374 <trap+0x26f>
  106157:	8b 45 08             	mov    0x8(%ebp),%eax
  10615a:	8b 40 30             	mov    0x30(%eax),%eax
  10615d:	83 e8 20             	sub    $0x20,%eax
  106160:	83 f8 1f             	cmp    $0x1f,%eax
  106163:	0f 87 cf 00 00 00    	ja     106238 <trap+0x133>
  106169:	8b 04 85 0c 93 10 00 	mov    0x10930c(,%eax,4),%eax
  106170:	ff e0                	jmp    *%eax
  106172:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106178:	0f b6 00             	movzbl (%eax),%eax
  10617b:	84 c0                	test   %al,%al
  10617d:	75 3d                	jne    1061bc <trap+0xb7>
  10617f:	83 ec 0c             	sub    $0xc,%esp
  106182:	68 00 33 11 00       	push   $0x113300
  106187:	e8 bc e7 ff ff       	call   104948 <acquire>
  10618c:	83 c4 10             	add    $0x10,%esp
  10618f:	a1 40 3b 11 00       	mov    0x113b40,%eax
  106194:	83 c0 01             	add    $0x1,%eax
  106197:	a3 40 3b 11 00       	mov    %eax,0x113b40
  10619c:	83 ec 0c             	sub    $0xc,%esp
  10619f:	68 40 3b 11 00       	push   $0x113b40
  1061a4:	e8 91 e5 ff ff       	call   10473a <wakeup>
  1061a9:	83 c4 10             	add    $0x10,%esp
  1061ac:	83 ec 0c             	sub    $0xc,%esp
  1061af:	68 00 33 11 00       	push   $0x113300
  1061b4:	e8 f6 e7 ff ff       	call   1049af <release>
  1061b9:	83 c4 10             	add    $0x10,%esp
  1061bc:	e8 ff ce ff ff       	call   1030c0 <lapiceoi>
  1061c1:	e9 28 01 00 00       	jmp    1062ee <trap+0x1e9>
  1061c6:	e8 1e c7 ff ff       	call   1028e9 <ideintr>
  1061cb:	e8 f0 ce ff ff       	call   1030c0 <lapiceoi>
  1061d0:	e9 19 01 00 00       	jmp    1062ee <trap+0x1e9>
  1061d5:	e8 0f c7 ff ff       	call   1028e9 <ideintr>
  1061da:	e8 e1 ce ff ff       	call   1030c0 <lapiceoi>
  1061df:	e9 0a 01 00 00       	jmp    1062ee <trap+0x1e9>
  1061e4:	e8 b0 cc ff ff       	call   102e99 <kbdintr>
  1061e9:	e8 d2 ce ff ff       	call   1030c0 <lapiceoi>
  1061ee:	e9 fb 00 00 00       	jmp    1062ee <trap+0x1e9>
  1061f3:	e8 5d 03 00 00       	call   106555 <uartintr>
  1061f8:	e8 c3 ce ff ff       	call   1030c0 <lapiceoi>
  1061fd:	e9 ec 00 00 00       	jmp    1062ee <trap+0x1e9>
  106202:	8b 45 08             	mov    0x8(%ebp),%eax
  106205:	8b 48 38             	mov    0x38(%eax),%ecx
  106208:	8b 45 08             	mov    0x8(%ebp),%eax
  10620b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10620f:	0f b7 d0             	movzwl %ax,%edx
  106212:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106218:	0f b6 00             	movzbl (%eax),%eax
  10621b:	0f b6 c0             	movzbl %al,%eax
  10621e:	51                   	push   %ecx
  10621f:	52                   	push   %edx
  106220:	50                   	push   %eax
  106221:	68 6c 92 10 00       	push   $0x10926c
  106226:	e8 c1 a1 ff ff       	call   1003ec <cprintf>
  10622b:	83 c4 10             	add    $0x10,%esp
  10622e:	e8 8d ce ff ff       	call   1030c0 <lapiceoi>
  106233:	e9 b6 00 00 00       	jmp    1062ee <trap+0x1e9>
  106238:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10623e:	85 c0                	test   %eax,%eax
  106240:	74 11                	je     106253 <trap+0x14e>
  106242:	8b 45 08             	mov    0x8(%ebp),%eax
  106245:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  106249:	0f b7 c0             	movzwl %ax,%eax
  10624c:	83 e0 03             	and    $0x3,%eax
  10624f:	85 c0                	test   %eax,%eax
  106251:	75 40                	jne    106293 <trap+0x18e>
  106253:	e8 0e fd ff ff       	call   105f66 <rcr2>
  106258:	89 c3                	mov    %eax,%ebx
  10625a:	8b 45 08             	mov    0x8(%ebp),%eax
  10625d:	8b 48 38             	mov    0x38(%eax),%ecx
  106260:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106266:	0f b6 00             	movzbl (%eax),%eax
  106269:	0f b6 d0             	movzbl %al,%edx
  10626c:	8b 45 08             	mov    0x8(%ebp),%eax
  10626f:	8b 40 30             	mov    0x30(%eax),%eax
  106272:	83 ec 0c             	sub    $0xc,%esp
  106275:	53                   	push   %ebx
  106276:	51                   	push   %ecx
  106277:	52                   	push   %edx
  106278:	50                   	push   %eax
  106279:	68 90 92 10 00       	push   $0x109290
  10627e:	e8 69 a1 ff ff       	call   1003ec <cprintf>
  106283:	83 c4 20             	add    $0x20,%esp
  106286:	83 ec 0c             	sub    $0xc,%esp
  106289:	68 c2 92 10 00       	push   $0x1092c2
  10628e:	e8 e5 a2 ff ff       	call   100578 <panic>
  106293:	e8 ce fc ff ff       	call   105f66 <rcr2>
  106298:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10629b:	8b 45 08             	mov    0x8(%ebp),%eax
  10629e:	8b 70 38             	mov    0x38(%eax),%esi
  1062a1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1062a7:	0f b6 00             	movzbl (%eax),%eax
  1062aa:	0f b6 d8             	movzbl %al,%ebx
  1062ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1062b0:	8b 48 34             	mov    0x34(%eax),%ecx
  1062b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1062b6:	8b 50 30             	mov    0x30(%eax),%edx
  1062b9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1062bf:	8d 78 6c             	lea    0x6c(%eax),%edi
  1062c2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1062c8:	8b 40 10             	mov    0x10(%eax),%eax
  1062cb:	ff 75 e4             	pushl  -0x1c(%ebp)
  1062ce:	56                   	push   %esi
  1062cf:	53                   	push   %ebx
  1062d0:	51                   	push   %ecx
  1062d1:	52                   	push   %edx
  1062d2:	57                   	push   %edi
  1062d3:	50                   	push   %eax
  1062d4:	68 c8 92 10 00       	push   $0x1092c8
  1062d9:	e8 0e a1 ff ff       	call   1003ec <cprintf>
  1062de:	83 c4 20             	add    $0x20,%esp
  1062e1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1062e7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  1062ee:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1062f4:	85 c0                	test   %eax,%eax
  1062f6:	74 24                	je     10631c <trap+0x217>
  1062f8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1062fe:	8b 40 24             	mov    0x24(%eax),%eax
  106301:	85 c0                	test   %eax,%eax
  106303:	74 17                	je     10631c <trap+0x217>
  106305:	8b 45 08             	mov    0x8(%ebp),%eax
  106308:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10630c:	0f b7 c0             	movzwl %ax,%eax
  10630f:	83 e0 03             	and    $0x3,%eax
  106312:	83 f8 03             	cmp    $0x3,%eax
  106315:	75 05                	jne    10631c <trap+0x217>
  106317:	e8 16 df ff ff       	call   104232 <exit>
  10631c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  106322:	85 c0                	test   %eax,%eax
  106324:	74 1e                	je     106344 <trap+0x23f>
  106326:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10632c:	8b 40 0c             	mov    0xc(%eax),%eax
  10632f:	83 f8 04             	cmp    $0x4,%eax
  106332:	75 10                	jne    106344 <trap+0x23f>
  106334:	8b 45 08             	mov    0x8(%ebp),%eax
  106337:	8b 40 30             	mov    0x30(%eax),%eax
  10633a:	83 f8 20             	cmp    $0x20,%eax
  10633d:	75 05                	jne    106344 <trap+0x23f>
  10633f:	e8 b7 e2 ff ff       	call   1045fb <yield>
  106344:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10634a:	85 c0                	test   %eax,%eax
  10634c:	74 27                	je     106375 <trap+0x270>
  10634e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  106354:	8b 40 24             	mov    0x24(%eax),%eax
  106357:	85 c0                	test   %eax,%eax
  106359:	74 1a                	je     106375 <trap+0x270>
  10635b:	8b 45 08             	mov    0x8(%ebp),%eax
  10635e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  106362:	0f b7 c0             	movzwl %ax,%eax
  106365:	83 e0 03             	and    $0x3,%eax
  106368:	83 f8 03             	cmp    $0x3,%eax
  10636b:	75 08                	jne    106375 <trap+0x270>
  10636d:	e8 c0 de ff ff       	call   104232 <exit>
  106372:	eb 01                	jmp    106375 <trap+0x270>
  106374:	90                   	nop
  106375:	8d 65 f4             	lea    -0xc(%ebp),%esp
  106378:	5b                   	pop    %ebx
  106379:	5e                   	pop    %esi
  10637a:	5f                   	pop    %edi
  10637b:	5d                   	pop    %ebp
  10637c:	c3                   	ret    

0010637d <inb>:
  10637d:	55                   	push   %ebp
  10637e:	89 e5                	mov    %esp,%ebp
  106380:	83 ec 14             	sub    $0x14,%esp
  106383:	8b 45 08             	mov    0x8(%ebp),%eax
  106386:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10638a:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10638e:	89 c2                	mov    %eax,%edx
  106390:	ec                   	in     (%dx),%al
  106391:	88 45 ff             	mov    %al,-0x1(%ebp)
  106394:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  106398:	c9                   	leave  
  106399:	c3                   	ret    

0010639a <outb>:
  10639a:	55                   	push   %ebp
  10639b:	89 e5                	mov    %esp,%ebp
  10639d:	83 ec 08             	sub    $0x8,%esp
  1063a0:	8b 55 08             	mov    0x8(%ebp),%edx
  1063a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1063a6:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  1063aa:	88 45 f8             	mov    %al,-0x8(%ebp)
  1063ad:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  1063b1:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1063b5:	ee                   	out    %al,(%dx)
  1063b6:	90                   	nop
  1063b7:	c9                   	leave  
  1063b8:	c3                   	ret    

001063b9 <uartinit>:
  1063b9:	55                   	push   %ebp
  1063ba:	89 e5                	mov    %esp,%ebp
  1063bc:	83 ec 18             	sub    $0x18,%esp
  1063bf:	6a 00                	push   $0x0
  1063c1:	68 fa 03 00 00       	push   $0x3fa
  1063c6:	e8 cf ff ff ff       	call   10639a <outb>
  1063cb:	83 c4 08             	add    $0x8,%esp
  1063ce:	68 80 00 00 00       	push   $0x80
  1063d3:	68 fb 03 00 00       	push   $0x3fb
  1063d8:	e8 bd ff ff ff       	call   10639a <outb>
  1063dd:	83 c4 08             	add    $0x8,%esp
  1063e0:	6a 0c                	push   $0xc
  1063e2:	68 f8 03 00 00       	push   $0x3f8
  1063e7:	e8 ae ff ff ff       	call   10639a <outb>
  1063ec:	83 c4 08             	add    $0x8,%esp
  1063ef:	6a 00                	push   $0x0
  1063f1:	68 f9 03 00 00       	push   $0x3f9
  1063f6:	e8 9f ff ff ff       	call   10639a <outb>
  1063fb:	83 c4 08             	add    $0x8,%esp
  1063fe:	6a 03                	push   $0x3
  106400:	68 fb 03 00 00       	push   $0x3fb
  106405:	e8 90 ff ff ff       	call   10639a <outb>
  10640a:	83 c4 08             	add    $0x8,%esp
  10640d:	6a 00                	push   $0x0
  10640f:	68 fc 03 00 00       	push   $0x3fc
  106414:	e8 81 ff ff ff       	call   10639a <outb>
  106419:	83 c4 08             	add    $0x8,%esp
  10641c:	6a 01                	push   $0x1
  10641e:	68 f9 03 00 00       	push   $0x3f9
  106423:	e8 72 ff ff ff       	call   10639a <outb>
  106428:	83 c4 08             	add    $0x8,%esp
  10642b:	68 fd 03 00 00       	push   $0x3fd
  106430:	e8 48 ff ff ff       	call   10637d <inb>
  106435:	83 c4 04             	add    $0x4,%esp
  106438:	3c ff                	cmp    $0xff,%al
  10643a:	74 6e                	je     1064aa <uartinit+0xf1>
  10643c:	c7 05 70 cb 10 00 01 	movl   $0x1,0x10cb70
  106443:	00 00 00 
  106446:	68 fa 03 00 00       	push   $0x3fa
  10644b:	e8 2d ff ff ff       	call   10637d <inb>
  106450:	83 c4 04             	add    $0x4,%esp
  106453:	68 f8 03 00 00       	push   $0x3f8
  106458:	e8 20 ff ff ff       	call   10637d <inb>
  10645d:	83 c4 04             	add    $0x4,%esp
  106460:	83 ec 0c             	sub    $0xc,%esp
  106463:	6a 04                	push   $0x4
  106465:	e8 26 d4 ff ff       	call   103890 <picenable>
  10646a:	83 c4 10             	add    $0x10,%esp
  10646d:	83 ec 08             	sub    $0x8,%esp
  106470:	6a 00                	push   $0x0
  106472:	6a 04                	push   $0x4
  106474:	e8 50 c7 ff ff       	call   102bc9 <ioapicenable>
  106479:	83 c4 10             	add    $0x10,%esp
  10647c:	c7 45 f4 8c 93 10 00 	movl   $0x10938c,-0xc(%ebp)
  106483:	eb 19                	jmp    10649e <uartinit+0xe5>
  106485:	8b 45 f4             	mov    -0xc(%ebp),%eax
  106488:	0f b6 00             	movzbl (%eax),%eax
  10648b:	0f be c0             	movsbl %al,%eax
  10648e:	83 ec 0c             	sub    $0xc,%esp
  106491:	50                   	push   %eax
  106492:	e8 16 00 00 00       	call   1064ad <uartputc>
  106497:	83 c4 10             	add    $0x10,%esp
  10649a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10649e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1064a1:	0f b6 00             	movzbl (%eax),%eax
  1064a4:	84 c0                	test   %al,%al
  1064a6:	75 dd                	jne    106485 <uartinit+0xcc>
  1064a8:	eb 01                	jmp    1064ab <uartinit+0xf2>
  1064aa:	90                   	nop
  1064ab:	c9                   	leave  
  1064ac:	c3                   	ret    

001064ad <uartputc>:
  1064ad:	55                   	push   %ebp
  1064ae:	89 e5                	mov    %esp,%ebp
  1064b0:	83 ec 18             	sub    $0x18,%esp
  1064b3:	a1 70 cb 10 00       	mov    0x10cb70,%eax
  1064b8:	85 c0                	test   %eax,%eax
  1064ba:	74 53                	je     10650f <uartputc+0x62>
  1064bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1064c3:	eb 11                	jmp    1064d6 <uartputc+0x29>
  1064c5:	83 ec 0c             	sub    $0xc,%esp
  1064c8:	6a 0a                	push   $0xa
  1064ca:	e8 0c cc ff ff       	call   1030db <microdelay>
  1064cf:	83 c4 10             	add    $0x10,%esp
  1064d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1064d6:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
  1064da:	7f 1a                	jg     1064f6 <uartputc+0x49>
  1064dc:	83 ec 0c             	sub    $0xc,%esp
  1064df:	68 fd 03 00 00       	push   $0x3fd
  1064e4:	e8 94 fe ff ff       	call   10637d <inb>
  1064e9:	83 c4 10             	add    $0x10,%esp
  1064ec:	0f b6 c0             	movzbl %al,%eax
  1064ef:	83 e0 20             	and    $0x20,%eax
  1064f2:	85 c0                	test   %eax,%eax
  1064f4:	74 cf                	je     1064c5 <uartputc+0x18>
  1064f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1064f9:	0f b6 c0             	movzbl %al,%eax
  1064fc:	83 ec 08             	sub    $0x8,%esp
  1064ff:	50                   	push   %eax
  106500:	68 f8 03 00 00       	push   $0x3f8
  106505:	e8 90 fe ff ff       	call   10639a <outb>
  10650a:	83 c4 10             	add    $0x10,%esp
  10650d:	eb 01                	jmp    106510 <uartputc+0x63>
  10650f:	90                   	nop
  106510:	c9                   	leave  
  106511:	c3                   	ret    

00106512 <uartgetc>:
  106512:	55                   	push   %ebp
  106513:	89 e5                	mov    %esp,%ebp
  106515:	a1 70 cb 10 00       	mov    0x10cb70,%eax
  10651a:	85 c0                	test   %eax,%eax
  10651c:	75 07                	jne    106525 <uartgetc+0x13>
  10651e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  106523:	eb 2e                	jmp    106553 <uartgetc+0x41>
  106525:	68 fd 03 00 00       	push   $0x3fd
  10652a:	e8 4e fe ff ff       	call   10637d <inb>
  10652f:	83 c4 04             	add    $0x4,%esp
  106532:	0f b6 c0             	movzbl %al,%eax
  106535:	83 e0 01             	and    $0x1,%eax
  106538:	85 c0                	test   %eax,%eax
  10653a:	75 07                	jne    106543 <uartgetc+0x31>
  10653c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  106541:	eb 10                	jmp    106553 <uartgetc+0x41>
  106543:	68 f8 03 00 00       	push   $0x3f8
  106548:	e8 30 fe ff ff       	call   10637d <inb>
  10654d:	83 c4 04             	add    $0x4,%esp
  106550:	0f b6 c0             	movzbl %al,%eax
  106553:	c9                   	leave  
  106554:	c3                   	ret    

00106555 <uartintr>:
  106555:	55                   	push   %ebp
  106556:	89 e5                	mov    %esp,%ebp
  106558:	83 ec 08             	sub    $0x8,%esp
  10655b:	83 ec 0c             	sub    $0xc,%esp
  10655e:	68 12 65 10 00       	push   $0x106512
  106563:	e8 a1 a2 ff ff       	call   100809 <consoleintr>
  106568:	83 c4 10             	add    $0x10,%esp
  10656b:	90                   	nop
  10656c:	c9                   	leave  
  10656d:	c3                   	ret    

0010656e <vector0>:
  10656e:	6a 00                	push   $0x0
  106570:	6a 00                	push   $0x0
  106572:	e9 9a f9 ff ff       	jmp    105f11 <alltraps>

00106577 <vector1>:
  106577:	6a 00                	push   $0x0
  106579:	6a 01                	push   $0x1
  10657b:	e9 91 f9 ff ff       	jmp    105f11 <alltraps>

00106580 <vector2>:
  106580:	6a 00                	push   $0x0
  106582:	6a 02                	push   $0x2
  106584:	e9 88 f9 ff ff       	jmp    105f11 <alltraps>

00106589 <vector3>:
  106589:	6a 00                	push   $0x0
  10658b:	6a 03                	push   $0x3
  10658d:	e9 7f f9 ff ff       	jmp    105f11 <alltraps>

00106592 <vector4>:
  106592:	6a 00                	push   $0x0
  106594:	6a 04                	push   $0x4
  106596:	e9 76 f9 ff ff       	jmp    105f11 <alltraps>

0010659b <vector5>:
  10659b:	6a 00                	push   $0x0
  10659d:	6a 05                	push   $0x5
  10659f:	e9 6d f9 ff ff       	jmp    105f11 <alltraps>

001065a4 <vector6>:
  1065a4:	6a 00                	push   $0x0
  1065a6:	6a 06                	push   $0x6
  1065a8:	e9 64 f9 ff ff       	jmp    105f11 <alltraps>

001065ad <vector7>:
  1065ad:	6a 00                	push   $0x0
  1065af:	6a 07                	push   $0x7
  1065b1:	e9 5b f9 ff ff       	jmp    105f11 <alltraps>

001065b6 <vector8>:
  1065b6:	6a 08                	push   $0x8
  1065b8:	e9 54 f9 ff ff       	jmp    105f11 <alltraps>

001065bd <vector9>:
  1065bd:	6a 00                	push   $0x0
  1065bf:	6a 09                	push   $0x9
  1065c1:	e9 4b f9 ff ff       	jmp    105f11 <alltraps>

001065c6 <vector10>:
  1065c6:	6a 0a                	push   $0xa
  1065c8:	e9 44 f9 ff ff       	jmp    105f11 <alltraps>

001065cd <vector11>:
  1065cd:	6a 0b                	push   $0xb
  1065cf:	e9 3d f9 ff ff       	jmp    105f11 <alltraps>

001065d4 <vector12>:
  1065d4:	6a 0c                	push   $0xc
  1065d6:	e9 36 f9 ff ff       	jmp    105f11 <alltraps>

001065db <vector13>:
  1065db:	6a 0d                	push   $0xd
  1065dd:	e9 2f f9 ff ff       	jmp    105f11 <alltraps>

001065e2 <vector14>:
  1065e2:	6a 0e                	push   $0xe
  1065e4:	e9 28 f9 ff ff       	jmp    105f11 <alltraps>

001065e9 <vector15>:
  1065e9:	6a 00                	push   $0x0
  1065eb:	6a 0f                	push   $0xf
  1065ed:	e9 1f f9 ff ff       	jmp    105f11 <alltraps>

001065f2 <vector16>:
  1065f2:	6a 00                	push   $0x0
  1065f4:	6a 10                	push   $0x10
  1065f6:	e9 16 f9 ff ff       	jmp    105f11 <alltraps>

001065fb <vector17>:
  1065fb:	6a 11                	push   $0x11
  1065fd:	e9 0f f9 ff ff       	jmp    105f11 <alltraps>

00106602 <vector18>:
  106602:	6a 00                	push   $0x0
  106604:	6a 12                	push   $0x12
  106606:	e9 06 f9 ff ff       	jmp    105f11 <alltraps>

0010660b <vector19>:
  10660b:	6a 00                	push   $0x0
  10660d:	6a 13                	push   $0x13
  10660f:	e9 fd f8 ff ff       	jmp    105f11 <alltraps>

00106614 <vector20>:
  106614:	6a 00                	push   $0x0
  106616:	6a 14                	push   $0x14
  106618:	e9 f4 f8 ff ff       	jmp    105f11 <alltraps>

0010661d <vector21>:
  10661d:	6a 00                	push   $0x0
  10661f:	6a 15                	push   $0x15
  106621:	e9 eb f8 ff ff       	jmp    105f11 <alltraps>

00106626 <vector22>:
  106626:	6a 00                	push   $0x0
  106628:	6a 16                	push   $0x16
  10662a:	e9 e2 f8 ff ff       	jmp    105f11 <alltraps>

0010662f <vector23>:
  10662f:	6a 00                	push   $0x0
  106631:	6a 17                	push   $0x17
  106633:	e9 d9 f8 ff ff       	jmp    105f11 <alltraps>

00106638 <vector24>:
  106638:	6a 00                	push   $0x0
  10663a:	6a 18                	push   $0x18
  10663c:	e9 d0 f8 ff ff       	jmp    105f11 <alltraps>

00106641 <vector25>:
  106641:	6a 00                	push   $0x0
  106643:	6a 19                	push   $0x19
  106645:	e9 c7 f8 ff ff       	jmp    105f11 <alltraps>

0010664a <vector26>:
  10664a:	6a 00                	push   $0x0
  10664c:	6a 1a                	push   $0x1a
  10664e:	e9 be f8 ff ff       	jmp    105f11 <alltraps>

00106653 <vector27>:
  106653:	6a 00                	push   $0x0
  106655:	6a 1b                	push   $0x1b
  106657:	e9 b5 f8 ff ff       	jmp    105f11 <alltraps>

0010665c <vector28>:
  10665c:	6a 00                	push   $0x0
  10665e:	6a 1c                	push   $0x1c
  106660:	e9 ac f8 ff ff       	jmp    105f11 <alltraps>

00106665 <vector29>:
  106665:	6a 00                	push   $0x0
  106667:	6a 1d                	push   $0x1d
  106669:	e9 a3 f8 ff ff       	jmp    105f11 <alltraps>

0010666e <vector30>:
  10666e:	6a 00                	push   $0x0
  106670:	6a 1e                	push   $0x1e
  106672:	e9 9a f8 ff ff       	jmp    105f11 <alltraps>

00106677 <vector31>:
  106677:	6a 00                	push   $0x0
  106679:	6a 1f                	push   $0x1f
  10667b:	e9 91 f8 ff ff       	jmp    105f11 <alltraps>

00106680 <vector32>:
  106680:	6a 00                	push   $0x0
  106682:	6a 20                	push   $0x20
  106684:	e9 88 f8 ff ff       	jmp    105f11 <alltraps>

00106689 <vector33>:
  106689:	6a 00                	push   $0x0
  10668b:	6a 21                	push   $0x21
  10668d:	e9 7f f8 ff ff       	jmp    105f11 <alltraps>

00106692 <vector34>:
  106692:	6a 00                	push   $0x0
  106694:	6a 22                	push   $0x22
  106696:	e9 76 f8 ff ff       	jmp    105f11 <alltraps>

0010669b <vector35>:
  10669b:	6a 00                	push   $0x0
  10669d:	6a 23                	push   $0x23
  10669f:	e9 6d f8 ff ff       	jmp    105f11 <alltraps>

001066a4 <vector36>:
  1066a4:	6a 00                	push   $0x0
  1066a6:	6a 24                	push   $0x24
  1066a8:	e9 64 f8 ff ff       	jmp    105f11 <alltraps>

001066ad <vector37>:
  1066ad:	6a 00                	push   $0x0
  1066af:	6a 25                	push   $0x25
  1066b1:	e9 5b f8 ff ff       	jmp    105f11 <alltraps>

001066b6 <vector38>:
  1066b6:	6a 00                	push   $0x0
  1066b8:	6a 26                	push   $0x26
  1066ba:	e9 52 f8 ff ff       	jmp    105f11 <alltraps>

001066bf <vector39>:
  1066bf:	6a 00                	push   $0x0
  1066c1:	6a 27                	push   $0x27
  1066c3:	e9 49 f8 ff ff       	jmp    105f11 <alltraps>

001066c8 <vector40>:
  1066c8:	6a 00                	push   $0x0
  1066ca:	6a 28                	push   $0x28
  1066cc:	e9 40 f8 ff ff       	jmp    105f11 <alltraps>

001066d1 <vector41>:
  1066d1:	6a 00                	push   $0x0
  1066d3:	6a 29                	push   $0x29
  1066d5:	e9 37 f8 ff ff       	jmp    105f11 <alltraps>

001066da <vector42>:
  1066da:	6a 00                	push   $0x0
  1066dc:	6a 2a                	push   $0x2a
  1066de:	e9 2e f8 ff ff       	jmp    105f11 <alltraps>

001066e3 <vector43>:
  1066e3:	6a 00                	push   $0x0
  1066e5:	6a 2b                	push   $0x2b
  1066e7:	e9 25 f8 ff ff       	jmp    105f11 <alltraps>

001066ec <vector44>:
  1066ec:	6a 00                	push   $0x0
  1066ee:	6a 2c                	push   $0x2c
  1066f0:	e9 1c f8 ff ff       	jmp    105f11 <alltraps>

001066f5 <vector45>:
  1066f5:	6a 00                	push   $0x0
  1066f7:	6a 2d                	push   $0x2d
  1066f9:	e9 13 f8 ff ff       	jmp    105f11 <alltraps>

001066fe <vector46>:
  1066fe:	6a 00                	push   $0x0
  106700:	6a 2e                	push   $0x2e
  106702:	e9 0a f8 ff ff       	jmp    105f11 <alltraps>

00106707 <vector47>:
  106707:	6a 00                	push   $0x0
  106709:	6a 2f                	push   $0x2f
  10670b:	e9 01 f8 ff ff       	jmp    105f11 <alltraps>

00106710 <vector48>:
  106710:	6a 00                	push   $0x0
  106712:	6a 30                	push   $0x30
  106714:	e9 f8 f7 ff ff       	jmp    105f11 <alltraps>

00106719 <vector49>:
  106719:	6a 00                	push   $0x0
  10671b:	6a 31                	push   $0x31
  10671d:	e9 ef f7 ff ff       	jmp    105f11 <alltraps>

00106722 <vector50>:
  106722:	6a 00                	push   $0x0
  106724:	6a 32                	push   $0x32
  106726:	e9 e6 f7 ff ff       	jmp    105f11 <alltraps>

0010672b <vector51>:
  10672b:	6a 00                	push   $0x0
  10672d:	6a 33                	push   $0x33
  10672f:	e9 dd f7 ff ff       	jmp    105f11 <alltraps>

00106734 <vector52>:
  106734:	6a 00                	push   $0x0
  106736:	6a 34                	push   $0x34
  106738:	e9 d4 f7 ff ff       	jmp    105f11 <alltraps>

0010673d <vector53>:
  10673d:	6a 00                	push   $0x0
  10673f:	6a 35                	push   $0x35
  106741:	e9 cb f7 ff ff       	jmp    105f11 <alltraps>

00106746 <vector54>:
  106746:	6a 00                	push   $0x0
  106748:	6a 36                	push   $0x36
  10674a:	e9 c2 f7 ff ff       	jmp    105f11 <alltraps>

0010674f <vector55>:
  10674f:	6a 00                	push   $0x0
  106751:	6a 37                	push   $0x37
  106753:	e9 b9 f7 ff ff       	jmp    105f11 <alltraps>

00106758 <vector56>:
  106758:	6a 00                	push   $0x0
  10675a:	6a 38                	push   $0x38
  10675c:	e9 b0 f7 ff ff       	jmp    105f11 <alltraps>

00106761 <vector57>:
  106761:	6a 00                	push   $0x0
  106763:	6a 39                	push   $0x39
  106765:	e9 a7 f7 ff ff       	jmp    105f11 <alltraps>

0010676a <vector58>:
  10676a:	6a 00                	push   $0x0
  10676c:	6a 3a                	push   $0x3a
  10676e:	e9 9e f7 ff ff       	jmp    105f11 <alltraps>

00106773 <vector59>:
  106773:	6a 00                	push   $0x0
  106775:	6a 3b                	push   $0x3b
  106777:	e9 95 f7 ff ff       	jmp    105f11 <alltraps>

0010677c <vector60>:
  10677c:	6a 00                	push   $0x0
  10677e:	6a 3c                	push   $0x3c
  106780:	e9 8c f7 ff ff       	jmp    105f11 <alltraps>

00106785 <vector61>:
  106785:	6a 00                	push   $0x0
  106787:	6a 3d                	push   $0x3d
  106789:	e9 83 f7 ff ff       	jmp    105f11 <alltraps>

0010678e <vector62>:
  10678e:	6a 00                	push   $0x0
  106790:	6a 3e                	push   $0x3e
  106792:	e9 7a f7 ff ff       	jmp    105f11 <alltraps>

00106797 <vector63>:
  106797:	6a 00                	push   $0x0
  106799:	6a 3f                	push   $0x3f
  10679b:	e9 71 f7 ff ff       	jmp    105f11 <alltraps>

001067a0 <vector64>:
  1067a0:	6a 00                	push   $0x0
  1067a2:	6a 40                	push   $0x40
  1067a4:	e9 68 f7 ff ff       	jmp    105f11 <alltraps>

001067a9 <vector65>:
  1067a9:	6a 00                	push   $0x0
  1067ab:	6a 41                	push   $0x41
  1067ad:	e9 5f f7 ff ff       	jmp    105f11 <alltraps>

001067b2 <vector66>:
  1067b2:	6a 00                	push   $0x0
  1067b4:	6a 42                	push   $0x42
  1067b6:	e9 56 f7 ff ff       	jmp    105f11 <alltraps>

001067bb <vector67>:
  1067bb:	6a 00                	push   $0x0
  1067bd:	6a 43                	push   $0x43
  1067bf:	e9 4d f7 ff ff       	jmp    105f11 <alltraps>

001067c4 <vector68>:
  1067c4:	6a 00                	push   $0x0
  1067c6:	6a 44                	push   $0x44
  1067c8:	e9 44 f7 ff ff       	jmp    105f11 <alltraps>

001067cd <vector69>:
  1067cd:	6a 00                	push   $0x0
  1067cf:	6a 45                	push   $0x45
  1067d1:	e9 3b f7 ff ff       	jmp    105f11 <alltraps>

001067d6 <vector70>:
  1067d6:	6a 00                	push   $0x0
  1067d8:	6a 46                	push   $0x46
  1067da:	e9 32 f7 ff ff       	jmp    105f11 <alltraps>

001067df <vector71>:
  1067df:	6a 00                	push   $0x0
  1067e1:	6a 47                	push   $0x47
  1067e3:	e9 29 f7 ff ff       	jmp    105f11 <alltraps>

001067e8 <vector72>:
  1067e8:	6a 00                	push   $0x0
  1067ea:	6a 48                	push   $0x48
  1067ec:	e9 20 f7 ff ff       	jmp    105f11 <alltraps>

001067f1 <vector73>:
  1067f1:	6a 00                	push   $0x0
  1067f3:	6a 49                	push   $0x49
  1067f5:	e9 17 f7 ff ff       	jmp    105f11 <alltraps>

001067fa <vector74>:
  1067fa:	6a 00                	push   $0x0
  1067fc:	6a 4a                	push   $0x4a
  1067fe:	e9 0e f7 ff ff       	jmp    105f11 <alltraps>

00106803 <vector75>:
  106803:	6a 00                	push   $0x0
  106805:	6a 4b                	push   $0x4b
  106807:	e9 05 f7 ff ff       	jmp    105f11 <alltraps>

0010680c <vector76>:
  10680c:	6a 00                	push   $0x0
  10680e:	6a 4c                	push   $0x4c
  106810:	e9 fc f6 ff ff       	jmp    105f11 <alltraps>

00106815 <vector77>:
  106815:	6a 00                	push   $0x0
  106817:	6a 4d                	push   $0x4d
  106819:	e9 f3 f6 ff ff       	jmp    105f11 <alltraps>

0010681e <vector78>:
  10681e:	6a 00                	push   $0x0
  106820:	6a 4e                	push   $0x4e
  106822:	e9 ea f6 ff ff       	jmp    105f11 <alltraps>

00106827 <vector79>:
  106827:	6a 00                	push   $0x0
  106829:	6a 4f                	push   $0x4f
  10682b:	e9 e1 f6 ff ff       	jmp    105f11 <alltraps>

00106830 <vector80>:
  106830:	6a 00                	push   $0x0
  106832:	6a 50                	push   $0x50
  106834:	e9 d8 f6 ff ff       	jmp    105f11 <alltraps>

00106839 <vector81>:
  106839:	6a 00                	push   $0x0
  10683b:	6a 51                	push   $0x51
  10683d:	e9 cf f6 ff ff       	jmp    105f11 <alltraps>

00106842 <vector82>:
  106842:	6a 00                	push   $0x0
  106844:	6a 52                	push   $0x52
  106846:	e9 c6 f6 ff ff       	jmp    105f11 <alltraps>

0010684b <vector83>:
  10684b:	6a 00                	push   $0x0
  10684d:	6a 53                	push   $0x53
  10684f:	e9 bd f6 ff ff       	jmp    105f11 <alltraps>

00106854 <vector84>:
  106854:	6a 00                	push   $0x0
  106856:	6a 54                	push   $0x54
  106858:	e9 b4 f6 ff ff       	jmp    105f11 <alltraps>

0010685d <vector85>:
  10685d:	6a 00                	push   $0x0
  10685f:	6a 55                	push   $0x55
  106861:	e9 ab f6 ff ff       	jmp    105f11 <alltraps>

00106866 <vector86>:
  106866:	6a 00                	push   $0x0
  106868:	6a 56                	push   $0x56
  10686a:	e9 a2 f6 ff ff       	jmp    105f11 <alltraps>

0010686f <vector87>:
  10686f:	6a 00                	push   $0x0
  106871:	6a 57                	push   $0x57
  106873:	e9 99 f6 ff ff       	jmp    105f11 <alltraps>

00106878 <vector88>:
  106878:	6a 00                	push   $0x0
  10687a:	6a 58                	push   $0x58
  10687c:	e9 90 f6 ff ff       	jmp    105f11 <alltraps>

00106881 <vector89>:
  106881:	6a 00                	push   $0x0
  106883:	6a 59                	push   $0x59
  106885:	e9 87 f6 ff ff       	jmp    105f11 <alltraps>

0010688a <vector90>:
  10688a:	6a 00                	push   $0x0
  10688c:	6a 5a                	push   $0x5a
  10688e:	e9 7e f6 ff ff       	jmp    105f11 <alltraps>

00106893 <vector91>:
  106893:	6a 00                	push   $0x0
  106895:	6a 5b                	push   $0x5b
  106897:	e9 75 f6 ff ff       	jmp    105f11 <alltraps>

0010689c <vector92>:
  10689c:	6a 00                	push   $0x0
  10689e:	6a 5c                	push   $0x5c
  1068a0:	e9 6c f6 ff ff       	jmp    105f11 <alltraps>

001068a5 <vector93>:
  1068a5:	6a 00                	push   $0x0
  1068a7:	6a 5d                	push   $0x5d
  1068a9:	e9 63 f6 ff ff       	jmp    105f11 <alltraps>

001068ae <vector94>:
  1068ae:	6a 00                	push   $0x0
  1068b0:	6a 5e                	push   $0x5e
  1068b2:	e9 5a f6 ff ff       	jmp    105f11 <alltraps>

001068b7 <vector95>:
  1068b7:	6a 00                	push   $0x0
  1068b9:	6a 5f                	push   $0x5f
  1068bb:	e9 51 f6 ff ff       	jmp    105f11 <alltraps>

001068c0 <vector96>:
  1068c0:	6a 00                	push   $0x0
  1068c2:	6a 60                	push   $0x60
  1068c4:	e9 48 f6 ff ff       	jmp    105f11 <alltraps>

001068c9 <vector97>:
  1068c9:	6a 00                	push   $0x0
  1068cb:	6a 61                	push   $0x61
  1068cd:	e9 3f f6 ff ff       	jmp    105f11 <alltraps>

001068d2 <vector98>:
  1068d2:	6a 00                	push   $0x0
  1068d4:	6a 62                	push   $0x62
  1068d6:	e9 36 f6 ff ff       	jmp    105f11 <alltraps>

001068db <vector99>:
  1068db:	6a 00                	push   $0x0
  1068dd:	6a 63                	push   $0x63
  1068df:	e9 2d f6 ff ff       	jmp    105f11 <alltraps>

001068e4 <vector100>:
  1068e4:	6a 00                	push   $0x0
  1068e6:	6a 64                	push   $0x64
  1068e8:	e9 24 f6 ff ff       	jmp    105f11 <alltraps>

001068ed <vector101>:
  1068ed:	6a 00                	push   $0x0
  1068ef:	6a 65                	push   $0x65
  1068f1:	e9 1b f6 ff ff       	jmp    105f11 <alltraps>

001068f6 <vector102>:
  1068f6:	6a 00                	push   $0x0
  1068f8:	6a 66                	push   $0x66
  1068fa:	e9 12 f6 ff ff       	jmp    105f11 <alltraps>

001068ff <vector103>:
  1068ff:	6a 00                	push   $0x0
  106901:	6a 67                	push   $0x67
  106903:	e9 09 f6 ff ff       	jmp    105f11 <alltraps>

00106908 <vector104>:
  106908:	6a 00                	push   $0x0
  10690a:	6a 68                	push   $0x68
  10690c:	e9 00 f6 ff ff       	jmp    105f11 <alltraps>

00106911 <vector105>:
  106911:	6a 00                	push   $0x0
  106913:	6a 69                	push   $0x69
  106915:	e9 f7 f5 ff ff       	jmp    105f11 <alltraps>

0010691a <vector106>:
  10691a:	6a 00                	push   $0x0
  10691c:	6a 6a                	push   $0x6a
  10691e:	e9 ee f5 ff ff       	jmp    105f11 <alltraps>

00106923 <vector107>:
  106923:	6a 00                	push   $0x0
  106925:	6a 6b                	push   $0x6b
  106927:	e9 e5 f5 ff ff       	jmp    105f11 <alltraps>

0010692c <vector108>:
  10692c:	6a 00                	push   $0x0
  10692e:	6a 6c                	push   $0x6c
  106930:	e9 dc f5 ff ff       	jmp    105f11 <alltraps>

00106935 <vector109>:
  106935:	6a 00                	push   $0x0
  106937:	6a 6d                	push   $0x6d
  106939:	e9 d3 f5 ff ff       	jmp    105f11 <alltraps>

0010693e <vector110>:
  10693e:	6a 00                	push   $0x0
  106940:	6a 6e                	push   $0x6e
  106942:	e9 ca f5 ff ff       	jmp    105f11 <alltraps>

00106947 <vector111>:
  106947:	6a 00                	push   $0x0
  106949:	6a 6f                	push   $0x6f
  10694b:	e9 c1 f5 ff ff       	jmp    105f11 <alltraps>

00106950 <vector112>:
  106950:	6a 00                	push   $0x0
  106952:	6a 70                	push   $0x70
  106954:	e9 b8 f5 ff ff       	jmp    105f11 <alltraps>

00106959 <vector113>:
  106959:	6a 00                	push   $0x0
  10695b:	6a 71                	push   $0x71
  10695d:	e9 af f5 ff ff       	jmp    105f11 <alltraps>

00106962 <vector114>:
  106962:	6a 00                	push   $0x0
  106964:	6a 72                	push   $0x72
  106966:	e9 a6 f5 ff ff       	jmp    105f11 <alltraps>

0010696b <vector115>:
  10696b:	6a 00                	push   $0x0
  10696d:	6a 73                	push   $0x73
  10696f:	e9 9d f5 ff ff       	jmp    105f11 <alltraps>

00106974 <vector116>:
  106974:	6a 00                	push   $0x0
  106976:	6a 74                	push   $0x74
  106978:	e9 94 f5 ff ff       	jmp    105f11 <alltraps>

0010697d <vector117>:
  10697d:	6a 00                	push   $0x0
  10697f:	6a 75                	push   $0x75
  106981:	e9 8b f5 ff ff       	jmp    105f11 <alltraps>

00106986 <vector118>:
  106986:	6a 00                	push   $0x0
  106988:	6a 76                	push   $0x76
  10698a:	e9 82 f5 ff ff       	jmp    105f11 <alltraps>

0010698f <vector119>:
  10698f:	6a 00                	push   $0x0
  106991:	6a 77                	push   $0x77
  106993:	e9 79 f5 ff ff       	jmp    105f11 <alltraps>

00106998 <vector120>:
  106998:	6a 00                	push   $0x0
  10699a:	6a 78                	push   $0x78
  10699c:	e9 70 f5 ff ff       	jmp    105f11 <alltraps>

001069a1 <vector121>:
  1069a1:	6a 00                	push   $0x0
  1069a3:	6a 79                	push   $0x79
  1069a5:	e9 67 f5 ff ff       	jmp    105f11 <alltraps>

001069aa <vector122>:
  1069aa:	6a 00                	push   $0x0
  1069ac:	6a 7a                	push   $0x7a
  1069ae:	e9 5e f5 ff ff       	jmp    105f11 <alltraps>

001069b3 <vector123>:
  1069b3:	6a 00                	push   $0x0
  1069b5:	6a 7b                	push   $0x7b
  1069b7:	e9 55 f5 ff ff       	jmp    105f11 <alltraps>

001069bc <vector124>:
  1069bc:	6a 00                	push   $0x0
  1069be:	6a 7c                	push   $0x7c
  1069c0:	e9 4c f5 ff ff       	jmp    105f11 <alltraps>

001069c5 <vector125>:
  1069c5:	6a 00                	push   $0x0
  1069c7:	6a 7d                	push   $0x7d
  1069c9:	e9 43 f5 ff ff       	jmp    105f11 <alltraps>

001069ce <vector126>:
  1069ce:	6a 00                	push   $0x0
  1069d0:	6a 7e                	push   $0x7e
  1069d2:	e9 3a f5 ff ff       	jmp    105f11 <alltraps>

001069d7 <vector127>:
  1069d7:	6a 00                	push   $0x0
  1069d9:	6a 7f                	push   $0x7f
  1069db:	e9 31 f5 ff ff       	jmp    105f11 <alltraps>

001069e0 <vector128>:
  1069e0:	6a 00                	push   $0x0
  1069e2:	68 80 00 00 00       	push   $0x80
  1069e7:	e9 25 f5 ff ff       	jmp    105f11 <alltraps>

001069ec <vector129>:
  1069ec:	6a 00                	push   $0x0
  1069ee:	68 81 00 00 00       	push   $0x81
  1069f3:	e9 19 f5 ff ff       	jmp    105f11 <alltraps>

001069f8 <vector130>:
  1069f8:	6a 00                	push   $0x0
  1069fa:	68 82 00 00 00       	push   $0x82
  1069ff:	e9 0d f5 ff ff       	jmp    105f11 <alltraps>

00106a04 <vector131>:
  106a04:	6a 00                	push   $0x0
  106a06:	68 83 00 00 00       	push   $0x83
  106a0b:	e9 01 f5 ff ff       	jmp    105f11 <alltraps>

00106a10 <vector132>:
  106a10:	6a 00                	push   $0x0
  106a12:	68 84 00 00 00       	push   $0x84
  106a17:	e9 f5 f4 ff ff       	jmp    105f11 <alltraps>

00106a1c <vector133>:
  106a1c:	6a 00                	push   $0x0
  106a1e:	68 85 00 00 00       	push   $0x85
  106a23:	e9 e9 f4 ff ff       	jmp    105f11 <alltraps>

00106a28 <vector134>:
  106a28:	6a 00                	push   $0x0
  106a2a:	68 86 00 00 00       	push   $0x86
  106a2f:	e9 dd f4 ff ff       	jmp    105f11 <alltraps>

00106a34 <vector135>:
  106a34:	6a 00                	push   $0x0
  106a36:	68 87 00 00 00       	push   $0x87
  106a3b:	e9 d1 f4 ff ff       	jmp    105f11 <alltraps>

00106a40 <vector136>:
  106a40:	6a 00                	push   $0x0
  106a42:	68 88 00 00 00       	push   $0x88
  106a47:	e9 c5 f4 ff ff       	jmp    105f11 <alltraps>

00106a4c <vector137>:
  106a4c:	6a 00                	push   $0x0
  106a4e:	68 89 00 00 00       	push   $0x89
  106a53:	e9 b9 f4 ff ff       	jmp    105f11 <alltraps>

00106a58 <vector138>:
  106a58:	6a 00                	push   $0x0
  106a5a:	68 8a 00 00 00       	push   $0x8a
  106a5f:	e9 ad f4 ff ff       	jmp    105f11 <alltraps>

00106a64 <vector139>:
  106a64:	6a 00                	push   $0x0
  106a66:	68 8b 00 00 00       	push   $0x8b
  106a6b:	e9 a1 f4 ff ff       	jmp    105f11 <alltraps>

00106a70 <vector140>:
  106a70:	6a 00                	push   $0x0
  106a72:	68 8c 00 00 00       	push   $0x8c
  106a77:	e9 95 f4 ff ff       	jmp    105f11 <alltraps>

00106a7c <vector141>:
  106a7c:	6a 00                	push   $0x0
  106a7e:	68 8d 00 00 00       	push   $0x8d
  106a83:	e9 89 f4 ff ff       	jmp    105f11 <alltraps>

00106a88 <vector142>:
  106a88:	6a 00                	push   $0x0
  106a8a:	68 8e 00 00 00       	push   $0x8e
  106a8f:	e9 7d f4 ff ff       	jmp    105f11 <alltraps>

00106a94 <vector143>:
  106a94:	6a 00                	push   $0x0
  106a96:	68 8f 00 00 00       	push   $0x8f
  106a9b:	e9 71 f4 ff ff       	jmp    105f11 <alltraps>

00106aa0 <vector144>:
  106aa0:	6a 00                	push   $0x0
  106aa2:	68 90 00 00 00       	push   $0x90
  106aa7:	e9 65 f4 ff ff       	jmp    105f11 <alltraps>

00106aac <vector145>:
  106aac:	6a 00                	push   $0x0
  106aae:	68 91 00 00 00       	push   $0x91
  106ab3:	e9 59 f4 ff ff       	jmp    105f11 <alltraps>

00106ab8 <vector146>:
  106ab8:	6a 00                	push   $0x0
  106aba:	68 92 00 00 00       	push   $0x92
  106abf:	e9 4d f4 ff ff       	jmp    105f11 <alltraps>

00106ac4 <vector147>:
  106ac4:	6a 00                	push   $0x0
  106ac6:	68 93 00 00 00       	push   $0x93
  106acb:	e9 41 f4 ff ff       	jmp    105f11 <alltraps>

00106ad0 <vector148>:
  106ad0:	6a 00                	push   $0x0
  106ad2:	68 94 00 00 00       	push   $0x94
  106ad7:	e9 35 f4 ff ff       	jmp    105f11 <alltraps>

00106adc <vector149>:
  106adc:	6a 00                	push   $0x0
  106ade:	68 95 00 00 00       	push   $0x95
  106ae3:	e9 29 f4 ff ff       	jmp    105f11 <alltraps>

00106ae8 <vector150>:
  106ae8:	6a 00                	push   $0x0
  106aea:	68 96 00 00 00       	push   $0x96
  106aef:	e9 1d f4 ff ff       	jmp    105f11 <alltraps>

00106af4 <vector151>:
  106af4:	6a 00                	push   $0x0
  106af6:	68 97 00 00 00       	push   $0x97
  106afb:	e9 11 f4 ff ff       	jmp    105f11 <alltraps>

00106b00 <vector152>:
  106b00:	6a 00                	push   $0x0
  106b02:	68 98 00 00 00       	push   $0x98
  106b07:	e9 05 f4 ff ff       	jmp    105f11 <alltraps>

00106b0c <vector153>:
  106b0c:	6a 00                	push   $0x0
  106b0e:	68 99 00 00 00       	push   $0x99
  106b13:	e9 f9 f3 ff ff       	jmp    105f11 <alltraps>

00106b18 <vector154>:
  106b18:	6a 00                	push   $0x0
  106b1a:	68 9a 00 00 00       	push   $0x9a
  106b1f:	e9 ed f3 ff ff       	jmp    105f11 <alltraps>

00106b24 <vector155>:
  106b24:	6a 00                	push   $0x0
  106b26:	68 9b 00 00 00       	push   $0x9b
  106b2b:	e9 e1 f3 ff ff       	jmp    105f11 <alltraps>

00106b30 <vector156>:
  106b30:	6a 00                	push   $0x0
  106b32:	68 9c 00 00 00       	push   $0x9c
  106b37:	e9 d5 f3 ff ff       	jmp    105f11 <alltraps>

00106b3c <vector157>:
  106b3c:	6a 00                	push   $0x0
  106b3e:	68 9d 00 00 00       	push   $0x9d
  106b43:	e9 c9 f3 ff ff       	jmp    105f11 <alltraps>

00106b48 <vector158>:
  106b48:	6a 00                	push   $0x0
  106b4a:	68 9e 00 00 00       	push   $0x9e
  106b4f:	e9 bd f3 ff ff       	jmp    105f11 <alltraps>

00106b54 <vector159>:
  106b54:	6a 00                	push   $0x0
  106b56:	68 9f 00 00 00       	push   $0x9f
  106b5b:	e9 b1 f3 ff ff       	jmp    105f11 <alltraps>

00106b60 <vector160>:
  106b60:	6a 00                	push   $0x0
  106b62:	68 a0 00 00 00       	push   $0xa0
  106b67:	e9 a5 f3 ff ff       	jmp    105f11 <alltraps>

00106b6c <vector161>:
  106b6c:	6a 00                	push   $0x0
  106b6e:	68 a1 00 00 00       	push   $0xa1
  106b73:	e9 99 f3 ff ff       	jmp    105f11 <alltraps>

00106b78 <vector162>:
  106b78:	6a 00                	push   $0x0
  106b7a:	68 a2 00 00 00       	push   $0xa2
  106b7f:	e9 8d f3 ff ff       	jmp    105f11 <alltraps>

00106b84 <vector163>:
  106b84:	6a 00                	push   $0x0
  106b86:	68 a3 00 00 00       	push   $0xa3
  106b8b:	e9 81 f3 ff ff       	jmp    105f11 <alltraps>

00106b90 <vector164>:
  106b90:	6a 00                	push   $0x0
  106b92:	68 a4 00 00 00       	push   $0xa4
  106b97:	e9 75 f3 ff ff       	jmp    105f11 <alltraps>

00106b9c <vector165>:
  106b9c:	6a 00                	push   $0x0
  106b9e:	68 a5 00 00 00       	push   $0xa5
  106ba3:	e9 69 f3 ff ff       	jmp    105f11 <alltraps>

00106ba8 <vector166>:
  106ba8:	6a 00                	push   $0x0
  106baa:	68 a6 00 00 00       	push   $0xa6
  106baf:	e9 5d f3 ff ff       	jmp    105f11 <alltraps>

00106bb4 <vector167>:
  106bb4:	6a 00                	push   $0x0
  106bb6:	68 a7 00 00 00       	push   $0xa7
  106bbb:	e9 51 f3 ff ff       	jmp    105f11 <alltraps>

00106bc0 <vector168>:
  106bc0:	6a 00                	push   $0x0
  106bc2:	68 a8 00 00 00       	push   $0xa8
  106bc7:	e9 45 f3 ff ff       	jmp    105f11 <alltraps>

00106bcc <vector169>:
  106bcc:	6a 00                	push   $0x0
  106bce:	68 a9 00 00 00       	push   $0xa9
  106bd3:	e9 39 f3 ff ff       	jmp    105f11 <alltraps>

00106bd8 <vector170>:
  106bd8:	6a 00                	push   $0x0
  106bda:	68 aa 00 00 00       	push   $0xaa
  106bdf:	e9 2d f3 ff ff       	jmp    105f11 <alltraps>

00106be4 <vector171>:
  106be4:	6a 00                	push   $0x0
  106be6:	68 ab 00 00 00       	push   $0xab
  106beb:	e9 21 f3 ff ff       	jmp    105f11 <alltraps>

00106bf0 <vector172>:
  106bf0:	6a 00                	push   $0x0
  106bf2:	68 ac 00 00 00       	push   $0xac
  106bf7:	e9 15 f3 ff ff       	jmp    105f11 <alltraps>

00106bfc <vector173>:
  106bfc:	6a 00                	push   $0x0
  106bfe:	68 ad 00 00 00       	push   $0xad
  106c03:	e9 09 f3 ff ff       	jmp    105f11 <alltraps>

00106c08 <vector174>:
  106c08:	6a 00                	push   $0x0
  106c0a:	68 ae 00 00 00       	push   $0xae
  106c0f:	e9 fd f2 ff ff       	jmp    105f11 <alltraps>

00106c14 <vector175>:
  106c14:	6a 00                	push   $0x0
  106c16:	68 af 00 00 00       	push   $0xaf
  106c1b:	e9 f1 f2 ff ff       	jmp    105f11 <alltraps>

00106c20 <vector176>:
  106c20:	6a 00                	push   $0x0
  106c22:	68 b0 00 00 00       	push   $0xb0
  106c27:	e9 e5 f2 ff ff       	jmp    105f11 <alltraps>

00106c2c <vector177>:
  106c2c:	6a 00                	push   $0x0
  106c2e:	68 b1 00 00 00       	push   $0xb1
  106c33:	e9 d9 f2 ff ff       	jmp    105f11 <alltraps>

00106c38 <vector178>:
  106c38:	6a 00                	push   $0x0
  106c3a:	68 b2 00 00 00       	push   $0xb2
  106c3f:	e9 cd f2 ff ff       	jmp    105f11 <alltraps>

00106c44 <vector179>:
  106c44:	6a 00                	push   $0x0
  106c46:	68 b3 00 00 00       	push   $0xb3
  106c4b:	e9 c1 f2 ff ff       	jmp    105f11 <alltraps>

00106c50 <vector180>:
  106c50:	6a 00                	push   $0x0
  106c52:	68 b4 00 00 00       	push   $0xb4
  106c57:	e9 b5 f2 ff ff       	jmp    105f11 <alltraps>

00106c5c <vector181>:
  106c5c:	6a 00                	push   $0x0
  106c5e:	68 b5 00 00 00       	push   $0xb5
  106c63:	e9 a9 f2 ff ff       	jmp    105f11 <alltraps>

00106c68 <vector182>:
  106c68:	6a 00                	push   $0x0
  106c6a:	68 b6 00 00 00       	push   $0xb6
  106c6f:	e9 9d f2 ff ff       	jmp    105f11 <alltraps>

00106c74 <vector183>:
  106c74:	6a 00                	push   $0x0
  106c76:	68 b7 00 00 00       	push   $0xb7
  106c7b:	e9 91 f2 ff ff       	jmp    105f11 <alltraps>

00106c80 <vector184>:
  106c80:	6a 00                	push   $0x0
  106c82:	68 b8 00 00 00       	push   $0xb8
  106c87:	e9 85 f2 ff ff       	jmp    105f11 <alltraps>

00106c8c <vector185>:
  106c8c:	6a 00                	push   $0x0
  106c8e:	68 b9 00 00 00       	push   $0xb9
  106c93:	e9 79 f2 ff ff       	jmp    105f11 <alltraps>

00106c98 <vector186>:
  106c98:	6a 00                	push   $0x0
  106c9a:	68 ba 00 00 00       	push   $0xba
  106c9f:	e9 6d f2 ff ff       	jmp    105f11 <alltraps>

00106ca4 <vector187>:
  106ca4:	6a 00                	push   $0x0
  106ca6:	68 bb 00 00 00       	push   $0xbb
  106cab:	e9 61 f2 ff ff       	jmp    105f11 <alltraps>

00106cb0 <vector188>:
  106cb0:	6a 00                	push   $0x0
  106cb2:	68 bc 00 00 00       	push   $0xbc
  106cb7:	e9 55 f2 ff ff       	jmp    105f11 <alltraps>

00106cbc <vector189>:
  106cbc:	6a 00                	push   $0x0
  106cbe:	68 bd 00 00 00       	push   $0xbd
  106cc3:	e9 49 f2 ff ff       	jmp    105f11 <alltraps>

00106cc8 <vector190>:
  106cc8:	6a 00                	push   $0x0
  106cca:	68 be 00 00 00       	push   $0xbe
  106ccf:	e9 3d f2 ff ff       	jmp    105f11 <alltraps>

00106cd4 <vector191>:
  106cd4:	6a 00                	push   $0x0
  106cd6:	68 bf 00 00 00       	push   $0xbf
  106cdb:	e9 31 f2 ff ff       	jmp    105f11 <alltraps>

00106ce0 <vector192>:
  106ce0:	6a 00                	push   $0x0
  106ce2:	68 c0 00 00 00       	push   $0xc0
  106ce7:	e9 25 f2 ff ff       	jmp    105f11 <alltraps>

00106cec <vector193>:
  106cec:	6a 00                	push   $0x0
  106cee:	68 c1 00 00 00       	push   $0xc1
  106cf3:	e9 19 f2 ff ff       	jmp    105f11 <alltraps>

00106cf8 <vector194>:
  106cf8:	6a 00                	push   $0x0
  106cfa:	68 c2 00 00 00       	push   $0xc2
  106cff:	e9 0d f2 ff ff       	jmp    105f11 <alltraps>

00106d04 <vector195>:
  106d04:	6a 00                	push   $0x0
  106d06:	68 c3 00 00 00       	push   $0xc3
  106d0b:	e9 01 f2 ff ff       	jmp    105f11 <alltraps>

00106d10 <vector196>:
  106d10:	6a 00                	push   $0x0
  106d12:	68 c4 00 00 00       	push   $0xc4
  106d17:	e9 f5 f1 ff ff       	jmp    105f11 <alltraps>

00106d1c <vector197>:
  106d1c:	6a 00                	push   $0x0
  106d1e:	68 c5 00 00 00       	push   $0xc5
  106d23:	e9 e9 f1 ff ff       	jmp    105f11 <alltraps>

00106d28 <vector198>:
  106d28:	6a 00                	push   $0x0
  106d2a:	68 c6 00 00 00       	push   $0xc6
  106d2f:	e9 dd f1 ff ff       	jmp    105f11 <alltraps>

00106d34 <vector199>:
  106d34:	6a 00                	push   $0x0
  106d36:	68 c7 00 00 00       	push   $0xc7
  106d3b:	e9 d1 f1 ff ff       	jmp    105f11 <alltraps>

00106d40 <vector200>:
  106d40:	6a 00                	push   $0x0
  106d42:	68 c8 00 00 00       	push   $0xc8
  106d47:	e9 c5 f1 ff ff       	jmp    105f11 <alltraps>

00106d4c <vector201>:
  106d4c:	6a 00                	push   $0x0
  106d4e:	68 c9 00 00 00       	push   $0xc9
  106d53:	e9 b9 f1 ff ff       	jmp    105f11 <alltraps>

00106d58 <vector202>:
  106d58:	6a 00                	push   $0x0
  106d5a:	68 ca 00 00 00       	push   $0xca
  106d5f:	e9 ad f1 ff ff       	jmp    105f11 <alltraps>

00106d64 <vector203>:
  106d64:	6a 00                	push   $0x0
  106d66:	68 cb 00 00 00       	push   $0xcb
  106d6b:	e9 a1 f1 ff ff       	jmp    105f11 <alltraps>

00106d70 <vector204>:
  106d70:	6a 00                	push   $0x0
  106d72:	68 cc 00 00 00       	push   $0xcc
  106d77:	e9 95 f1 ff ff       	jmp    105f11 <alltraps>

00106d7c <vector205>:
  106d7c:	6a 00                	push   $0x0
  106d7e:	68 cd 00 00 00       	push   $0xcd
  106d83:	e9 89 f1 ff ff       	jmp    105f11 <alltraps>

00106d88 <vector206>:
  106d88:	6a 00                	push   $0x0
  106d8a:	68 ce 00 00 00       	push   $0xce
  106d8f:	e9 7d f1 ff ff       	jmp    105f11 <alltraps>

00106d94 <vector207>:
  106d94:	6a 00                	push   $0x0
  106d96:	68 cf 00 00 00       	push   $0xcf
  106d9b:	e9 71 f1 ff ff       	jmp    105f11 <alltraps>

00106da0 <vector208>:
  106da0:	6a 00                	push   $0x0
  106da2:	68 d0 00 00 00       	push   $0xd0
  106da7:	e9 65 f1 ff ff       	jmp    105f11 <alltraps>

00106dac <vector209>:
  106dac:	6a 00                	push   $0x0
  106dae:	68 d1 00 00 00       	push   $0xd1
  106db3:	e9 59 f1 ff ff       	jmp    105f11 <alltraps>

00106db8 <vector210>:
  106db8:	6a 00                	push   $0x0
  106dba:	68 d2 00 00 00       	push   $0xd2
  106dbf:	e9 4d f1 ff ff       	jmp    105f11 <alltraps>

00106dc4 <vector211>:
  106dc4:	6a 00                	push   $0x0
  106dc6:	68 d3 00 00 00       	push   $0xd3
  106dcb:	e9 41 f1 ff ff       	jmp    105f11 <alltraps>

00106dd0 <vector212>:
  106dd0:	6a 00                	push   $0x0
  106dd2:	68 d4 00 00 00       	push   $0xd4
  106dd7:	e9 35 f1 ff ff       	jmp    105f11 <alltraps>

00106ddc <vector213>:
  106ddc:	6a 00                	push   $0x0
  106dde:	68 d5 00 00 00       	push   $0xd5
  106de3:	e9 29 f1 ff ff       	jmp    105f11 <alltraps>

00106de8 <vector214>:
  106de8:	6a 00                	push   $0x0
  106dea:	68 d6 00 00 00       	push   $0xd6
  106def:	e9 1d f1 ff ff       	jmp    105f11 <alltraps>

00106df4 <vector215>:
  106df4:	6a 00                	push   $0x0
  106df6:	68 d7 00 00 00       	push   $0xd7
  106dfb:	e9 11 f1 ff ff       	jmp    105f11 <alltraps>

00106e00 <vector216>:
  106e00:	6a 00                	push   $0x0
  106e02:	68 d8 00 00 00       	push   $0xd8
  106e07:	e9 05 f1 ff ff       	jmp    105f11 <alltraps>

00106e0c <vector217>:
  106e0c:	6a 00                	push   $0x0
  106e0e:	68 d9 00 00 00       	push   $0xd9
  106e13:	e9 f9 f0 ff ff       	jmp    105f11 <alltraps>

00106e18 <vector218>:
  106e18:	6a 00                	push   $0x0
  106e1a:	68 da 00 00 00       	push   $0xda
  106e1f:	e9 ed f0 ff ff       	jmp    105f11 <alltraps>

00106e24 <vector219>:
  106e24:	6a 00                	push   $0x0
  106e26:	68 db 00 00 00       	push   $0xdb
  106e2b:	e9 e1 f0 ff ff       	jmp    105f11 <alltraps>

00106e30 <vector220>:
  106e30:	6a 00                	push   $0x0
  106e32:	68 dc 00 00 00       	push   $0xdc
  106e37:	e9 d5 f0 ff ff       	jmp    105f11 <alltraps>

00106e3c <vector221>:
  106e3c:	6a 00                	push   $0x0
  106e3e:	68 dd 00 00 00       	push   $0xdd
  106e43:	e9 c9 f0 ff ff       	jmp    105f11 <alltraps>

00106e48 <vector222>:
  106e48:	6a 00                	push   $0x0
  106e4a:	68 de 00 00 00       	push   $0xde
  106e4f:	e9 bd f0 ff ff       	jmp    105f11 <alltraps>

00106e54 <vector223>:
  106e54:	6a 00                	push   $0x0
  106e56:	68 df 00 00 00       	push   $0xdf
  106e5b:	e9 b1 f0 ff ff       	jmp    105f11 <alltraps>

00106e60 <vector224>:
  106e60:	6a 00                	push   $0x0
  106e62:	68 e0 00 00 00       	push   $0xe0
  106e67:	e9 a5 f0 ff ff       	jmp    105f11 <alltraps>

00106e6c <vector225>:
  106e6c:	6a 00                	push   $0x0
  106e6e:	68 e1 00 00 00       	push   $0xe1
  106e73:	e9 99 f0 ff ff       	jmp    105f11 <alltraps>

00106e78 <vector226>:
  106e78:	6a 00                	push   $0x0
  106e7a:	68 e2 00 00 00       	push   $0xe2
  106e7f:	e9 8d f0 ff ff       	jmp    105f11 <alltraps>

00106e84 <vector227>:
  106e84:	6a 00                	push   $0x0
  106e86:	68 e3 00 00 00       	push   $0xe3
  106e8b:	e9 81 f0 ff ff       	jmp    105f11 <alltraps>

00106e90 <vector228>:
  106e90:	6a 00                	push   $0x0
  106e92:	68 e4 00 00 00       	push   $0xe4
  106e97:	e9 75 f0 ff ff       	jmp    105f11 <alltraps>

00106e9c <vector229>:
  106e9c:	6a 00                	push   $0x0
  106e9e:	68 e5 00 00 00       	push   $0xe5
  106ea3:	e9 69 f0 ff ff       	jmp    105f11 <alltraps>

00106ea8 <vector230>:
  106ea8:	6a 00                	push   $0x0
  106eaa:	68 e6 00 00 00       	push   $0xe6
  106eaf:	e9 5d f0 ff ff       	jmp    105f11 <alltraps>

00106eb4 <vector231>:
  106eb4:	6a 00                	push   $0x0
  106eb6:	68 e7 00 00 00       	push   $0xe7
  106ebb:	e9 51 f0 ff ff       	jmp    105f11 <alltraps>

00106ec0 <vector232>:
  106ec0:	6a 00                	push   $0x0
  106ec2:	68 e8 00 00 00       	push   $0xe8
  106ec7:	e9 45 f0 ff ff       	jmp    105f11 <alltraps>

00106ecc <vector233>:
  106ecc:	6a 00                	push   $0x0
  106ece:	68 e9 00 00 00       	push   $0xe9
  106ed3:	e9 39 f0 ff ff       	jmp    105f11 <alltraps>

00106ed8 <vector234>:
  106ed8:	6a 00                	push   $0x0
  106eda:	68 ea 00 00 00       	push   $0xea
  106edf:	e9 2d f0 ff ff       	jmp    105f11 <alltraps>

00106ee4 <vector235>:
  106ee4:	6a 00                	push   $0x0
  106ee6:	68 eb 00 00 00       	push   $0xeb
  106eeb:	e9 21 f0 ff ff       	jmp    105f11 <alltraps>

00106ef0 <vector236>:
  106ef0:	6a 00                	push   $0x0
  106ef2:	68 ec 00 00 00       	push   $0xec
  106ef7:	e9 15 f0 ff ff       	jmp    105f11 <alltraps>

00106efc <vector237>:
  106efc:	6a 00                	push   $0x0
  106efe:	68 ed 00 00 00       	push   $0xed
  106f03:	e9 09 f0 ff ff       	jmp    105f11 <alltraps>

00106f08 <vector238>:
  106f08:	6a 00                	push   $0x0
  106f0a:	68 ee 00 00 00       	push   $0xee
  106f0f:	e9 fd ef ff ff       	jmp    105f11 <alltraps>

00106f14 <vector239>:
  106f14:	6a 00                	push   $0x0
  106f16:	68 ef 00 00 00       	push   $0xef
  106f1b:	e9 f1 ef ff ff       	jmp    105f11 <alltraps>

00106f20 <vector240>:
  106f20:	6a 00                	push   $0x0
  106f22:	68 f0 00 00 00       	push   $0xf0
  106f27:	e9 e5 ef ff ff       	jmp    105f11 <alltraps>

00106f2c <vector241>:
  106f2c:	6a 00                	push   $0x0
  106f2e:	68 f1 00 00 00       	push   $0xf1
  106f33:	e9 d9 ef ff ff       	jmp    105f11 <alltraps>

00106f38 <vector242>:
  106f38:	6a 00                	push   $0x0
  106f3a:	68 f2 00 00 00       	push   $0xf2
  106f3f:	e9 cd ef ff ff       	jmp    105f11 <alltraps>

00106f44 <vector243>:
  106f44:	6a 00                	push   $0x0
  106f46:	68 f3 00 00 00       	push   $0xf3
  106f4b:	e9 c1 ef ff ff       	jmp    105f11 <alltraps>

00106f50 <vector244>:
  106f50:	6a 00                	push   $0x0
  106f52:	68 f4 00 00 00       	push   $0xf4
  106f57:	e9 b5 ef ff ff       	jmp    105f11 <alltraps>

00106f5c <vector245>:
  106f5c:	6a 00                	push   $0x0
  106f5e:	68 f5 00 00 00       	push   $0xf5
  106f63:	e9 a9 ef ff ff       	jmp    105f11 <alltraps>

00106f68 <vector246>:
  106f68:	6a 00                	push   $0x0
  106f6a:	68 f6 00 00 00       	push   $0xf6
  106f6f:	e9 9d ef ff ff       	jmp    105f11 <alltraps>

00106f74 <vector247>:
  106f74:	6a 00                	push   $0x0
  106f76:	68 f7 00 00 00       	push   $0xf7
  106f7b:	e9 91 ef ff ff       	jmp    105f11 <alltraps>

00106f80 <vector248>:
  106f80:	6a 00                	push   $0x0
  106f82:	68 f8 00 00 00       	push   $0xf8
  106f87:	e9 85 ef ff ff       	jmp    105f11 <alltraps>

00106f8c <vector249>:
  106f8c:	6a 00                	push   $0x0
  106f8e:	68 f9 00 00 00       	push   $0xf9
  106f93:	e9 79 ef ff ff       	jmp    105f11 <alltraps>

00106f98 <vector250>:
  106f98:	6a 00                	push   $0x0
  106f9a:	68 fa 00 00 00       	push   $0xfa
  106f9f:	e9 6d ef ff ff       	jmp    105f11 <alltraps>

00106fa4 <vector251>:
  106fa4:	6a 00                	push   $0x0
  106fa6:	68 fb 00 00 00       	push   $0xfb
  106fab:	e9 61 ef ff ff       	jmp    105f11 <alltraps>

00106fb0 <vector252>:
  106fb0:	6a 00                	push   $0x0
  106fb2:	68 fc 00 00 00       	push   $0xfc
  106fb7:	e9 55 ef ff ff       	jmp    105f11 <alltraps>

00106fbc <vector253>:
  106fbc:	6a 00                	push   $0x0
  106fbe:	68 fd 00 00 00       	push   $0xfd
  106fc3:	e9 49 ef ff ff       	jmp    105f11 <alltraps>

00106fc8 <vector254>:
  106fc8:	6a 00                	push   $0x0
  106fca:	68 fe 00 00 00       	push   $0xfe
  106fcf:	e9 3d ef ff ff       	jmp    105f11 <alltraps>

00106fd4 <vector255>:
  106fd4:	6a 00                	push   $0x0
  106fd6:	68 ff 00 00 00       	push   $0xff
  106fdb:	e9 31 ef ff ff       	jmp    105f11 <alltraps>

00106fe0 <lgdt>:
  106fe0:	55                   	push   %ebp
  106fe1:	89 e5                	mov    %esp,%ebp
  106fe3:	83 ec 10             	sub    $0x10,%esp
  106fe6:	8b 45 0c             	mov    0xc(%ebp),%eax
  106fe9:	83 e8 01             	sub    $0x1,%eax
  106fec:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  106ff0:	8b 45 08             	mov    0x8(%ebp),%eax
  106ff3:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  106ff7:	8b 45 08             	mov    0x8(%ebp),%eax
  106ffa:	c1 e8 10             	shr    $0x10,%eax
  106ffd:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  107001:	8d 45 fa             	lea    -0x6(%ebp),%eax
  107004:	0f 01 10             	lgdtl  (%eax)
  107007:	90                   	nop
  107008:	c9                   	leave  
  107009:	c3                   	ret    

0010700a <ltr>:
  10700a:	55                   	push   %ebp
  10700b:	89 e5                	mov    %esp,%ebp
  10700d:	83 ec 04             	sub    $0x4,%esp
  107010:	8b 45 08             	mov    0x8(%ebp),%eax
  107013:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  107017:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  10701b:	0f 00 d8             	ltr    %ax
  10701e:	90                   	nop
  10701f:	c9                   	leave  
  107020:	c3                   	ret    

00107021 <loadgs>:
  107021:	55                   	push   %ebp
  107022:	89 e5                	mov    %esp,%ebp
  107024:	83 ec 04             	sub    $0x4,%esp
  107027:	8b 45 08             	mov    0x8(%ebp),%eax
  10702a:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  10702e:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  107032:	8e e8                	mov    %eax,%gs
  107034:	90                   	nop
  107035:	c9                   	leave  
  107036:	c3                   	ret    

00107037 <lcr0>:
  107037:	55                   	push   %ebp
  107038:	89 e5                	mov    %esp,%ebp
  10703a:	8b 45 08             	mov    0x8(%ebp),%eax
  10703d:	0f 22 c0             	mov    %eax,%cr0
  107040:	90                   	nop
  107041:	5d                   	pop    %ebp
  107042:	c3                   	ret    

00107043 <rcr0>:
  107043:	55                   	push   %ebp
  107044:	89 e5                	mov    %esp,%ebp
  107046:	83 ec 10             	sub    $0x10,%esp
  107049:	0f 20 c0             	mov    %cr0,%eax
  10704c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10704f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  107052:	c9                   	leave  
  107053:	c3                   	ret    

00107054 <lcr3>:
  107054:	55                   	push   %ebp
  107055:	89 e5                	mov    %esp,%ebp
  107057:	8b 45 08             	mov    0x8(%ebp),%eax
  10705a:	0f 22 d8             	mov    %eax,%cr3
  10705d:	90                   	nop
  10705e:	5d                   	pop    %ebp
  10705f:	c3                   	ret    

00107060 <kvmalloc>:
  107060:	55                   	push   %ebp
  107061:	89 e5                	mov    %esp,%ebp
  107063:	83 ec 08             	sub    $0x8,%esp
  107066:	e8 99 05 00 00       	call   107604 <setupkvm>
  10706b:	a3 74 cb 10 00       	mov    %eax,0x10cb74
  107070:	90                   	nop
  107071:	c9                   	leave  
  107072:	c3                   	ret    

00107073 <seginit>:
  107073:	55                   	push   %ebp
  107074:	89 e5                	mov    %esp,%ebp
  107076:	53                   	push   %ebx
  107077:	83 ec 14             	sub    $0x14,%esp
  10707a:	e8 e8 bf ff ff       	call   103067 <cpunum>
  10707f:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  107085:	05 c0 0d 11 00       	add    $0x110dc0,%eax
  10708a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10708d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107090:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
  107096:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107099:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
  10709f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070a2:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
  1070a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070a9:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
  1070ad:	83 e2 f0             	and    $0xfffffff0,%edx
  1070b0:	83 ca 0a             	or     $0xa,%edx
  1070b3:	88 50 7d             	mov    %dl,0x7d(%eax)
  1070b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070b9:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
  1070bd:	83 ca 10             	or     $0x10,%edx
  1070c0:	88 50 7d             	mov    %dl,0x7d(%eax)
  1070c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070c6:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
  1070ca:	83 e2 9f             	and    $0xffffff9f,%edx
  1070cd:	88 50 7d             	mov    %dl,0x7d(%eax)
  1070d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070d3:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
  1070d7:	83 ca 80             	or     $0xffffff80,%edx
  1070da:	88 50 7d             	mov    %dl,0x7d(%eax)
  1070dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070e0:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
  1070e4:	83 ca 0f             	or     $0xf,%edx
  1070e7:	88 50 7e             	mov    %dl,0x7e(%eax)
  1070ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070ed:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
  1070f1:	83 e2 ef             	and    $0xffffffef,%edx
  1070f4:	88 50 7e             	mov    %dl,0x7e(%eax)
  1070f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1070fa:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
  1070fe:	83 e2 df             	and    $0xffffffdf,%edx
  107101:	88 50 7e             	mov    %dl,0x7e(%eax)
  107104:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107107:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
  10710b:	83 ca 40             	or     $0x40,%edx
  10710e:	88 50 7e             	mov    %dl,0x7e(%eax)
  107111:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107114:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
  107118:	83 ca 80             	or     $0xffffff80,%edx
  10711b:	88 50 7e             	mov    %dl,0x7e(%eax)
  10711e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107121:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  107125:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107128:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
  10712f:	ff ff 
  107131:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107134:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
  10713b:	00 00 
  10713d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107140:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
  107147:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10714a:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
  107151:	83 e2 f0             	and    $0xfffffff0,%edx
  107154:	83 ca 02             	or     $0x2,%edx
  107157:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
  10715d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107160:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
  107167:	83 ca 10             	or     $0x10,%edx
  10716a:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
  107170:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107173:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
  10717a:	83 e2 9f             	and    $0xffffff9f,%edx
  10717d:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
  107183:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107186:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
  10718d:	83 ca 80             	or     $0xffffff80,%edx
  107190:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
  107196:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107199:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
  1071a0:	83 ca 0f             	or     $0xf,%edx
  1071a3:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
  1071a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1071ac:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
  1071b3:	83 e2 ef             	and    $0xffffffef,%edx
  1071b6:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
  1071bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1071bf:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
  1071c6:	83 e2 df             	and    $0xffffffdf,%edx
  1071c9:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
  1071cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1071d2:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
  1071d9:	83 ca 40             	or     $0x40,%edx
  1071dc:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
  1071e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1071e5:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
  1071ec:	83 ca 80             	or     $0xffffff80,%edx
  1071ef:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
  1071f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1071f8:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  1071ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107202:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
  107209:	ff ff 
  10720b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10720e:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
  107215:	00 00 
  107217:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10721a:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
  107221:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107224:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
  10722b:	83 e2 f0             	and    $0xfffffff0,%edx
  10722e:	83 ca 0a             	or     $0xa,%edx
  107231:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
  107237:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10723a:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
  107241:	83 ca 10             	or     $0x10,%edx
  107244:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
  10724a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10724d:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
  107254:	83 ca 60             	or     $0x60,%edx
  107257:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
  10725d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107260:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
  107267:	83 ca 80             	or     $0xffffff80,%edx
  10726a:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
  107270:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107273:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
  10727a:	83 ca 0f             	or     $0xf,%edx
  10727d:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
  107283:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107286:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
  10728d:	83 e2 ef             	and    $0xffffffef,%edx
  107290:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
  107296:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107299:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
  1072a0:	83 e2 df             	and    $0xffffffdf,%edx
  1072a3:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
  1072a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1072ac:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
  1072b3:	83 ca 40             	or     $0x40,%edx
  1072b6:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
  1072bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1072bf:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
  1072c6:	83 ca 80             	or     $0xffffff80,%edx
  1072c9:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
  1072cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1072d2:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  1072d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1072dc:	66 c7 80 98 00 00 00 	movw   $0xffff,0x98(%eax)
  1072e3:	ff ff 
  1072e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1072e8:	66 c7 80 9a 00 00 00 	movw   $0x0,0x9a(%eax)
  1072ef:	00 00 
  1072f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1072f4:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
  1072fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1072fe:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
  107305:	83 e2 f0             	and    $0xfffffff0,%edx
  107308:	83 ca 02             	or     $0x2,%edx
  10730b:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
  107311:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107314:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
  10731b:	83 ca 10             	or     $0x10,%edx
  10731e:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
  107324:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107327:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
  10732e:	83 ca 60             	or     $0x60,%edx
  107331:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
  107337:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10733a:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
  107341:	83 ca 80             	or     $0xffffff80,%edx
  107344:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
  10734a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10734d:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
  107354:	83 ca 0f             	or     $0xf,%edx
  107357:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
  10735d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107360:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
  107367:	83 e2 ef             	and    $0xffffffef,%edx
  10736a:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
  107370:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107373:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
  10737a:	83 e2 df             	and    $0xffffffdf,%edx
  10737d:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
  107383:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107386:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
  10738d:	83 ca 40             	or     $0x40,%edx
  107390:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
  107396:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107399:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
  1073a0:	83 ca 80             	or     $0xffffff80,%edx
  1073a3:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
  1073a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073ac:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)
  1073b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073b6:	05 b4 00 00 00       	add    $0xb4,%eax
  1073bb:	89 c3                	mov    %eax,%ebx
  1073bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073c0:	05 b4 00 00 00       	add    $0xb4,%eax
  1073c5:	c1 e8 10             	shr    $0x10,%eax
  1073c8:	89 c2                	mov    %eax,%edx
  1073ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073cd:	05 b4 00 00 00       	add    $0xb4,%eax
  1073d2:	c1 e8 18             	shr    $0x18,%eax
  1073d5:	89 c1                	mov    %eax,%ecx
  1073d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073da:	66 c7 80 88 00 00 00 	movw   $0x0,0x88(%eax)
  1073e1:	00 00 
  1073e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073e6:	66 89 98 8a 00 00 00 	mov    %bx,0x8a(%eax)
  1073ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073f0:	88 90 8c 00 00 00    	mov    %dl,0x8c(%eax)
  1073f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1073f9:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
  107400:	83 e2 f0             	and    $0xfffffff0,%edx
  107403:	83 ca 02             	or     $0x2,%edx
  107406:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
  10740c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10740f:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
  107416:	83 ca 10             	or     $0x10,%edx
  107419:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
  10741f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107422:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
  107429:	83 e2 9f             	and    $0xffffff9f,%edx
  10742c:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
  107432:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107435:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
  10743c:	83 ca 80             	or     $0xffffff80,%edx
  10743f:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
  107445:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107448:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
  10744f:	83 e2 f0             	and    $0xfffffff0,%edx
  107452:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
  107458:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10745b:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
  107462:	83 e2 ef             	and    $0xffffffef,%edx
  107465:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
  10746b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10746e:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
  107475:	83 e2 df             	and    $0xffffffdf,%edx
  107478:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
  10747e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107481:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
  107488:	83 ca 40             	or     $0x40,%edx
  10748b:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
  107491:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107494:	0f b6 90 8e 00 00 00 	movzbl 0x8e(%eax),%edx
  10749b:	83 ca 80             	or     $0xffffff80,%edx
  10749e:	88 90 8e 00 00 00    	mov    %dl,0x8e(%eax)
  1074a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1074a7:	88 88 8f 00 00 00    	mov    %cl,0x8f(%eax)
  1074ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1074b0:	83 c0 70             	add    $0x70,%eax
  1074b3:	83 ec 08             	sub    $0x8,%esp
  1074b6:	6a 38                	push   $0x38
  1074b8:	50                   	push   %eax
  1074b9:	e8 22 fb ff ff       	call   106fe0 <lgdt>
  1074be:	83 c4 10             	add    $0x10,%esp
  1074c1:	83 ec 0c             	sub    $0xc,%esp
  1074c4:	6a 18                	push   $0x18
  1074c6:	e8 56 fb ff ff       	call   107021 <loadgs>
  1074cb:	83 c4 10             	add    $0x10,%esp
  1074ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1074d1:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  1074d7:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
  1074de:	00 00 00 00 
  1074e2:	90                   	nop
  1074e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1074e6:	c9                   	leave  
  1074e7:	c3                   	ret    

001074e8 <walkpgdir>:
  1074e8:	55                   	push   %ebp
  1074e9:	89 e5                	mov    %esp,%ebp
  1074eb:	83 ec 18             	sub    $0x18,%esp
  1074ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1074f1:	c1 e8 16             	shr    $0x16,%eax
  1074f4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1074fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1074fe:	01 d0                	add    %edx,%eax
  107500:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107503:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107506:	8b 00                	mov    (%eax),%eax
  107508:	83 e0 01             	and    $0x1,%eax
  10750b:	85 c0                	test   %eax,%eax
  10750d:	74 0f                	je     10751e <walkpgdir+0x36>
  10750f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107512:	8b 00                	mov    (%eax),%eax
  107514:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107519:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10751c:	eb 3d                	jmp    10755b <walkpgdir+0x73>
  10751e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  107522:	74 0e                	je     107532 <walkpgdir+0x4a>
  107524:	e8 c1 b7 ff ff       	call   102cea <kalloc>
  107529:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10752c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  107530:	75 07                	jne    107539 <walkpgdir+0x51>
  107532:	b8 00 00 00 00       	mov    $0x0,%eax
  107537:	eb 39                	jmp    107572 <walkpgdir+0x8a>
  107539:	83 ec 04             	sub    $0x4,%esp
  10753c:	68 00 10 00 00       	push   $0x1000
  107541:	6a 00                	push   $0x0
  107543:	ff 75 f4             	pushl  -0xc(%ebp)
  107546:	e8 3a d6 ff ff       	call   104b85 <memset>
  10754b:	83 c4 10             	add    $0x10,%esp
  10754e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107551:	83 c8 07             	or     $0x7,%eax
  107554:	89 c2                	mov    %eax,%edx
  107556:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107559:	89 10                	mov    %edx,(%eax)
  10755b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10755e:	c1 e8 0c             	shr    $0xc,%eax
  107561:	25 ff 03 00 00       	and    $0x3ff,%eax
  107566:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  10756d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107570:	01 d0                	add    %edx,%eax
  107572:	c9                   	leave  
  107573:	c3                   	ret    

00107574 <mappages>:
  107574:	55                   	push   %ebp
  107575:	89 e5                	mov    %esp,%ebp
  107577:	83 ec 18             	sub    $0x18,%esp
  10757a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10757d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107582:	89 45 f4             	mov    %eax,-0xc(%ebp)
  107585:	8b 45 10             	mov    0x10(%ebp),%eax
  107588:	8d 50 ff             	lea    -0x1(%eax),%edx
  10758b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10758e:	01 d0                	add    %edx,%eax
  107590:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107595:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107598:	83 ec 04             	sub    $0x4,%esp
  10759b:	6a 01                	push   $0x1
  10759d:	ff 75 f4             	pushl  -0xc(%ebp)
  1075a0:	ff 75 08             	pushl  0x8(%ebp)
  1075a3:	e8 40 ff ff ff       	call   1074e8 <walkpgdir>
  1075a8:	83 c4 10             	add    $0x10,%esp
  1075ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1075ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1075b2:	75 07                	jne    1075bb <mappages+0x47>
  1075b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1075b9:	eb 47                	jmp    107602 <mappages+0x8e>
  1075bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1075be:	8b 00                	mov    (%eax),%eax
  1075c0:	83 e0 01             	and    $0x1,%eax
  1075c3:	85 c0                	test   %eax,%eax
  1075c5:	74 0d                	je     1075d4 <mappages+0x60>
  1075c7:	83 ec 0c             	sub    $0xc,%esp
  1075ca:	68 94 93 10 00       	push   $0x109394
  1075cf:	e8 a4 8f ff ff       	call   100578 <panic>
  1075d4:	8b 45 18             	mov    0x18(%ebp),%eax
  1075d7:	0b 45 14             	or     0x14(%ebp),%eax
  1075da:	83 c8 01             	or     $0x1,%eax
  1075dd:	89 c2                	mov    %eax,%edx
  1075df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1075e2:	89 10                	mov    %edx,(%eax)
  1075e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1075e7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1075ea:	74 10                	je     1075fc <mappages+0x88>
  1075ec:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  1075f3:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
  1075fa:	eb 9c                	jmp    107598 <mappages+0x24>
  1075fc:	90                   	nop
  1075fd:	b8 00 00 00 00       	mov    $0x0,%eax
  107602:	c9                   	leave  
  107603:	c3                   	ret    

00107604 <setupkvm>:
  107604:	55                   	push   %ebp
  107605:	89 e5                	mov    %esp,%ebp
  107607:	53                   	push   %ebx
  107608:	83 ec 14             	sub    $0x14,%esp
  10760b:	e8 da b6 ff ff       	call   102cea <kalloc>
  107610:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107613:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  107617:	75 07                	jne    107620 <setupkvm+0x1c>
  107619:	b8 00 00 00 00       	mov    $0x0,%eax
  10761e:	eb 77                	jmp    107697 <setupkvm+0x93>
  107620:	83 ec 04             	sub    $0x4,%esp
  107623:	68 00 10 00 00       	push   $0x1000
  107628:	6a 00                	push   $0x0
  10762a:	ff 75 f0             	pushl  -0x10(%ebp)
  10762d:	e8 53 d5 ff ff       	call   104b85 <memset>
  107632:	83 c4 10             	add    $0x10,%esp
  107635:	c7 45 f4 c0 c9 10 00 	movl   $0x10c9c0,-0xc(%ebp)
  10763c:	c7 45 f4 c0 c9 10 00 	movl   $0x10c9c0,-0xc(%ebp)
  107643:	eb 46                	jmp    10768b <setupkvm+0x87>
  107645:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107648:	8b 50 08             	mov    0x8(%eax),%edx
  10764b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10764e:	8b 00                	mov    (%eax),%eax
  107650:	89 c3                	mov    %eax,%ebx
  107652:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107655:	8b 40 04             	mov    0x4(%eax),%eax
  107658:	89 c1                	mov    %eax,%ecx
  10765a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10765d:	8b 00                	mov    (%eax),%eax
  10765f:	29 c1                	sub    %eax,%ecx
  107661:	89 c8                	mov    %ecx,%eax
  107663:	89 c1                	mov    %eax,%ecx
  107665:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107668:	8b 00                	mov    (%eax),%eax
  10766a:	83 ec 0c             	sub    $0xc,%esp
  10766d:	52                   	push   %edx
  10766e:	53                   	push   %ebx
  10766f:	51                   	push   %ecx
  107670:	50                   	push   %eax
  107671:	ff 75 f0             	pushl  -0x10(%ebp)
  107674:	e8 fb fe ff ff       	call   107574 <mappages>
  107679:	83 c4 20             	add    $0x20,%esp
  10767c:	85 c0                	test   %eax,%eax
  10767e:	79 07                	jns    107687 <setupkvm+0x83>
  107680:	b8 00 00 00 00       	mov    $0x0,%eax
  107685:	eb 10                	jmp    107697 <setupkvm+0x93>
  107687:	83 45 f4 0c          	addl   $0xc,-0xc(%ebp)
  10768b:	81 7d f4 f0 c9 10 00 	cmpl   $0x10c9f0,-0xc(%ebp)
  107692:	72 b1                	jb     107645 <setupkvm+0x41>
  107694:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107697:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10769a:	c9                   	leave  
  10769b:	c3                   	ret    

0010769c <vmenable>:
  10769c:	55                   	push   %ebp
  10769d:	89 e5                	mov    %esp,%ebp
  10769f:	83 ec 18             	sub    $0x18,%esp
  1076a2:	e8 20 00 00 00       	call   1076c7 <switchkvm>
  1076a7:	e8 97 f9 ff ff       	call   107043 <rcr0>
  1076ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1076af:	81 4d f4 00 00 00 80 	orl    $0x80000000,-0xc(%ebp)
  1076b6:	83 ec 0c             	sub    $0xc,%esp
  1076b9:	ff 75 f4             	pushl  -0xc(%ebp)
  1076bc:	e8 76 f9 ff ff       	call   107037 <lcr0>
  1076c1:	83 c4 10             	add    $0x10,%esp
  1076c4:	90                   	nop
  1076c5:	c9                   	leave  
  1076c6:	c3                   	ret    

001076c7 <switchkvm>:
  1076c7:	55                   	push   %ebp
  1076c8:	89 e5                	mov    %esp,%ebp
  1076ca:	a1 74 cb 10 00       	mov    0x10cb74,%eax
  1076cf:	50                   	push   %eax
  1076d0:	e8 7f f9 ff ff       	call   107054 <lcr3>
  1076d5:	83 c4 04             	add    $0x4,%esp
  1076d8:	90                   	nop
  1076d9:	c9                   	leave  
  1076da:	c3                   	ret    

001076db <switchuvm>:
  1076db:	55                   	push   %ebp
  1076dc:	89 e5                	mov    %esp,%ebp
  1076de:	56                   	push   %esi
  1076df:	53                   	push   %ebx
  1076e0:	e8 c0 d3 ff ff       	call   104aa5 <pushcli>
  1076e5:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1076eb:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1076f2:	83 c2 08             	add    $0x8,%edx
  1076f5:	89 d6                	mov    %edx,%esi
  1076f7:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1076fe:	83 c2 08             	add    $0x8,%edx
  107701:	c1 ea 10             	shr    $0x10,%edx
  107704:	89 d3                	mov    %edx,%ebx
  107706:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  10770d:	83 c2 08             	add    $0x8,%edx
  107710:	c1 ea 18             	shr    $0x18,%edx
  107713:	89 d1                	mov    %edx,%ecx
  107715:	66 c7 80 a0 00 00 00 	movw   $0x67,0xa0(%eax)
  10771c:	67 00 
  10771e:	66 89 b0 a2 00 00 00 	mov    %si,0xa2(%eax)
  107725:	88 98 a4 00 00 00    	mov    %bl,0xa4(%eax)
  10772b:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
  107732:	83 e2 f0             	and    $0xfffffff0,%edx
  107735:	83 ca 09             	or     $0x9,%edx
  107738:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  10773e:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
  107745:	83 ca 10             	or     $0x10,%edx
  107748:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  10774e:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
  107755:	83 e2 9f             	and    $0xffffff9f,%edx
  107758:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  10775e:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
  107765:	83 ca 80             	or     $0xffffff80,%edx
  107768:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  10776e:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
  107775:	83 e2 f0             	and    $0xfffffff0,%edx
  107778:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
  10777e:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
  107785:	83 e2 ef             	and    $0xffffffef,%edx
  107788:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
  10778e:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
  107795:	83 e2 df             	and    $0xffffffdf,%edx
  107798:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
  10779e:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
  1077a5:	83 ca 40             	or     $0x40,%edx
  1077a8:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
  1077ae:	0f b6 90 a6 00 00 00 	movzbl 0xa6(%eax),%edx
  1077b5:	83 e2 7f             	and    $0x7f,%edx
  1077b8:	88 90 a6 00 00 00    	mov    %dl,0xa6(%eax)
  1077be:	88 88 a7 00 00 00    	mov    %cl,0xa7(%eax)
  1077c4:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1077ca:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
  1077d1:	83 e2 ef             	and    $0xffffffef,%edx
  1077d4:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  1077da:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1077e0:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  1077e6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1077ec:	8b 40 08             	mov    0x8(%eax),%eax
  1077ef:	89 c2                	mov    %eax,%edx
  1077f1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1077f7:	81 c2 00 10 00 00    	add    $0x1000,%edx
  1077fd:	89 50 0c             	mov    %edx,0xc(%eax)
  107800:	83 ec 0c             	sub    $0xc,%esp
  107803:	6a 30                	push   $0x30
  107805:	e8 00 f8 ff ff       	call   10700a <ltr>
  10780a:	83 c4 10             	add    $0x10,%esp
  10780d:	8b 45 08             	mov    0x8(%ebp),%eax
  107810:	8b 40 04             	mov    0x4(%eax),%eax
  107813:	85 c0                	test   %eax,%eax
  107815:	75 0d                	jne    107824 <switchuvm+0x149>
  107817:	83 ec 0c             	sub    $0xc,%esp
  10781a:	68 9a 93 10 00       	push   $0x10939a
  10781f:	e8 54 8d ff ff       	call   100578 <panic>
  107824:	8b 45 08             	mov    0x8(%ebp),%eax
  107827:	8b 40 04             	mov    0x4(%eax),%eax
  10782a:	83 ec 0c             	sub    $0xc,%esp
  10782d:	50                   	push   %eax
  10782e:	e8 21 f8 ff ff       	call   107054 <lcr3>
  107833:	83 c4 10             	add    $0x10,%esp
  107836:	e8 af d2 ff ff       	call   104aea <popcli>
  10783b:	90                   	nop
  10783c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10783f:	5b                   	pop    %ebx
  107840:	5e                   	pop    %esi
  107841:	5d                   	pop    %ebp
  107842:	c3                   	ret    

00107843 <inituvm>:
  107843:	55                   	push   %ebp
  107844:	89 e5                	mov    %esp,%ebp
  107846:	83 ec 18             	sub    $0x18,%esp
  107849:	81 7d 10 ff 0f 00 00 	cmpl   $0xfff,0x10(%ebp)
  107850:	76 0d                	jbe    10785f <inituvm+0x1c>
  107852:	83 ec 0c             	sub    $0xc,%esp
  107855:	68 ae 93 10 00       	push   $0x1093ae
  10785a:	e8 19 8d ff ff       	call   100578 <panic>
  10785f:	e8 86 b4 ff ff       	call   102cea <kalloc>
  107864:	89 45 f4             	mov    %eax,-0xc(%ebp)
  107867:	83 ec 04             	sub    $0x4,%esp
  10786a:	68 00 10 00 00       	push   $0x1000
  10786f:	6a 00                	push   $0x0
  107871:	ff 75 f4             	pushl  -0xc(%ebp)
  107874:	e8 0c d3 ff ff       	call   104b85 <memset>
  107879:	83 c4 10             	add    $0x10,%esp
  10787c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10787f:	83 ec 0c             	sub    $0xc,%esp
  107882:	6a 06                	push   $0x6
  107884:	50                   	push   %eax
  107885:	68 00 10 00 00       	push   $0x1000
  10788a:	6a 00                	push   $0x0
  10788c:	ff 75 08             	pushl  0x8(%ebp)
  10788f:	e8 e0 fc ff ff       	call   107574 <mappages>
  107894:	83 c4 20             	add    $0x20,%esp
  107897:	83 ec 04             	sub    $0x4,%esp
  10789a:	ff 75 10             	pushl  0x10(%ebp)
  10789d:	ff 75 0c             	pushl  0xc(%ebp)
  1078a0:	ff 75 f4             	pushl  -0xc(%ebp)
  1078a3:	e8 4f d3 ff ff       	call   104bf7 <memmove>
  1078a8:	83 c4 10             	add    $0x10,%esp
  1078ab:	90                   	nop
  1078ac:	c9                   	leave  
  1078ad:	c3                   	ret    

001078ae <loaduvm>:
  1078ae:	55                   	push   %ebp
  1078af:	89 e5                	mov    %esp,%ebp
  1078b1:	83 ec 18             	sub    $0x18,%esp
  1078b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1078b7:	25 ff 0f 00 00       	and    $0xfff,%eax
  1078bc:	85 c0                	test   %eax,%eax
  1078be:	74 0d                	je     1078cd <loaduvm+0x1f>
  1078c0:	83 ec 0c             	sub    $0xc,%esp
  1078c3:	68 c8 93 10 00       	push   $0x1093c8
  1078c8:	e8 ab 8c ff ff       	call   100578 <panic>
  1078cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1078d4:	e9 89 00 00 00       	jmp    107962 <loaduvm+0xb4>
  1078d9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1078dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1078df:	01 d0                	add    %edx,%eax
  1078e1:	83 ec 04             	sub    $0x4,%esp
  1078e4:	6a 00                	push   $0x0
  1078e6:	50                   	push   %eax
  1078e7:	ff 75 08             	pushl  0x8(%ebp)
  1078ea:	e8 f9 fb ff ff       	call   1074e8 <walkpgdir>
  1078ef:	83 c4 10             	add    $0x10,%esp
  1078f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1078f5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1078f9:	75 0d                	jne    107908 <loaduvm+0x5a>
  1078fb:	83 ec 0c             	sub    $0xc,%esp
  1078fe:	68 eb 93 10 00       	push   $0x1093eb
  107903:	e8 70 8c ff ff       	call   100578 <panic>
  107908:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10790b:	8b 00                	mov    (%eax),%eax
  10790d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107912:	89 45 e8             	mov    %eax,-0x18(%ebp)
  107915:	8b 45 18             	mov    0x18(%ebp),%eax
  107918:	2b 45 f4             	sub    -0xc(%ebp),%eax
  10791b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  107920:	77 0b                	ja     10792d <loaduvm+0x7f>
  107922:	8b 45 18             	mov    0x18(%ebp),%eax
  107925:	2b 45 f4             	sub    -0xc(%ebp),%eax
  107928:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10792b:	eb 07                	jmp    107934 <loaduvm+0x86>
  10792d:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
  107934:	8b 55 14             	mov    0x14(%ebp),%edx
  107937:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10793a:	01 c2                	add    %eax,%edx
  10793c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10793f:	ff 75 f0             	pushl  -0x10(%ebp)
  107942:	52                   	push   %edx
  107943:	50                   	push   %eax
  107944:	ff 75 10             	pushl  0x10(%ebp)
  107947:	e8 a6 a4 ff ff       	call   101df2 <readi>
  10794c:	83 c4 10             	add    $0x10,%esp
  10794f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  107952:	74 07                	je     10795b <loaduvm+0xad>
  107954:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  107959:	eb 18                	jmp    107973 <loaduvm+0xc5>
  10795b:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  107962:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107965:	3b 45 18             	cmp    0x18(%ebp),%eax
  107968:	0f 82 6b ff ff ff    	jb     1078d9 <loaduvm+0x2b>
  10796e:	b8 00 00 00 00       	mov    $0x0,%eax
  107973:	c9                   	leave  
  107974:	c3                   	ret    

00107975 <allocuvm>:
  107975:	55                   	push   %ebp
  107976:	89 e5                	mov    %esp,%ebp
  107978:	83 ec 18             	sub    $0x18,%esp
  10797b:	81 7d 10 00 00 0a 00 	cmpl   $0xa0000,0x10(%ebp)
  107982:	76 0a                	jbe    10798e <allocuvm+0x19>
  107984:	b8 00 00 00 00       	mov    $0x0,%eax
  107989:	e9 9f 00 00 00       	jmp    107a2d <allocuvm+0xb8>
  10798e:	8b 45 10             	mov    0x10(%ebp),%eax
  107991:	3b 45 0c             	cmp    0xc(%ebp),%eax
  107994:	73 08                	jae    10799e <allocuvm+0x29>
  107996:	8b 45 0c             	mov    0xc(%ebp),%eax
  107999:	e9 8f 00 00 00       	jmp    107a2d <allocuvm+0xb8>
  10799e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1079a1:	05 ff 0f 00 00       	add    $0xfff,%eax
  1079a6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1079ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1079ae:	eb 72                	jmp    107a22 <allocuvm+0xad>
  1079b0:	e8 35 b3 ff ff       	call   102cea <kalloc>
  1079b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1079b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1079bc:	75 2b                	jne    1079e9 <allocuvm+0x74>
  1079be:	83 ec 0c             	sub    $0xc,%esp
  1079c1:	68 09 94 10 00       	push   $0x109409
  1079c6:	e8 21 8a ff ff       	call   1003ec <cprintf>
  1079cb:	83 c4 10             	add    $0x10,%esp
  1079ce:	83 ec 04             	sub    $0x4,%esp
  1079d1:	ff 75 0c             	pushl  0xc(%ebp)
  1079d4:	ff 75 10             	pushl  0x10(%ebp)
  1079d7:	ff 75 08             	pushl  0x8(%ebp)
  1079da:	e8 50 00 00 00       	call   107a2f <deallocuvm>
  1079df:	83 c4 10             	add    $0x10,%esp
  1079e2:	b8 00 00 00 00       	mov    $0x0,%eax
  1079e7:	eb 44                	jmp    107a2d <allocuvm+0xb8>
  1079e9:	83 ec 04             	sub    $0x4,%esp
  1079ec:	68 00 10 00 00       	push   $0x1000
  1079f1:	6a 00                	push   $0x0
  1079f3:	ff 75 f0             	pushl  -0x10(%ebp)
  1079f6:	e8 8a d1 ff ff       	call   104b85 <memset>
  1079fb:	83 c4 10             	add    $0x10,%esp
  1079fe:	8b 55 f0             	mov    -0x10(%ebp),%edx
  107a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107a04:	83 ec 0c             	sub    $0xc,%esp
  107a07:	6a 06                	push   $0x6
  107a09:	52                   	push   %edx
  107a0a:	68 00 10 00 00       	push   $0x1000
  107a0f:	50                   	push   %eax
  107a10:	ff 75 08             	pushl  0x8(%ebp)
  107a13:	e8 5c fb ff ff       	call   107574 <mappages>
  107a18:	83 c4 20             	add    $0x20,%esp
  107a1b:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  107a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107a25:	3b 45 10             	cmp    0x10(%ebp),%eax
  107a28:	72 86                	jb     1079b0 <allocuvm+0x3b>
  107a2a:	8b 45 10             	mov    0x10(%ebp),%eax
  107a2d:	c9                   	leave  
  107a2e:	c3                   	ret    

00107a2f <deallocuvm>:
  107a2f:	55                   	push   %ebp
  107a30:	89 e5                	mov    %esp,%ebp
  107a32:	83 ec 18             	sub    $0x18,%esp
  107a35:	8b 45 10             	mov    0x10(%ebp),%eax
  107a38:	3b 45 0c             	cmp    0xc(%ebp),%eax
  107a3b:	72 08                	jb     107a45 <deallocuvm+0x16>
  107a3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  107a40:	e9 85 00 00 00       	jmp    107aca <deallocuvm+0x9b>
  107a45:	8b 45 10             	mov    0x10(%ebp),%eax
  107a48:	05 ff 0f 00 00       	add    $0xfff,%eax
  107a4d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107a52:	89 45 f4             	mov    %eax,-0xc(%ebp)
  107a55:	eb 68                	jmp    107abf <deallocuvm+0x90>
  107a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107a5a:	83 ec 04             	sub    $0x4,%esp
  107a5d:	6a 00                	push   $0x0
  107a5f:	50                   	push   %eax
  107a60:	ff 75 08             	pushl  0x8(%ebp)
  107a63:	e8 80 fa ff ff       	call   1074e8 <walkpgdir>
  107a68:	83 c4 10             	add    $0x10,%esp
  107a6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107a6e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  107a72:	74 44                	je     107ab8 <deallocuvm+0x89>
  107a74:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107a77:	8b 00                	mov    (%eax),%eax
  107a79:	83 e0 01             	and    $0x1,%eax
  107a7c:	85 c0                	test   %eax,%eax
  107a7e:	74 38                	je     107ab8 <deallocuvm+0x89>
  107a80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107a83:	8b 00                	mov    (%eax),%eax
  107a85:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107a8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  107a8d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  107a91:	75 0d                	jne    107aa0 <deallocuvm+0x71>
  107a93:	83 ec 0c             	sub    $0xc,%esp
  107a96:	68 21 94 10 00       	push   $0x109421
  107a9b:	e8 d8 8a ff ff       	call   100578 <panic>
  107aa0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107aa3:	83 ec 0c             	sub    $0xc,%esp
  107aa6:	50                   	push   %eax
  107aa7:	e8 bb b1 ff ff       	call   102c67 <kfree>
  107aac:	83 c4 10             	add    $0x10,%esp
  107aaf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107ab2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  107ab8:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  107abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107ac2:	3b 45 0c             	cmp    0xc(%ebp),%eax
  107ac5:	72 90                	jb     107a57 <deallocuvm+0x28>
  107ac7:	8b 45 10             	mov    0x10(%ebp),%eax
  107aca:	c9                   	leave  
  107acb:	c3                   	ret    

00107acc <freevm>:
  107acc:	55                   	push   %ebp
  107acd:	89 e5                	mov    %esp,%ebp
  107acf:	83 ec 18             	sub    $0x18,%esp
  107ad2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  107ad6:	75 0d                	jne    107ae5 <freevm+0x19>
  107ad8:	83 ec 0c             	sub    $0xc,%esp
  107adb:	68 27 94 10 00       	push   $0x109427
  107ae0:	e8 93 8a ff ff       	call   100578 <panic>
  107ae5:	83 ec 04             	sub    $0x4,%esp
  107ae8:	6a 00                	push   $0x0
  107aea:	68 00 00 0a 00       	push   $0xa0000
  107aef:	ff 75 08             	pushl  0x8(%ebp)
  107af2:	e8 38 ff ff ff       	call   107a2f <deallocuvm>
  107af7:	83 c4 10             	add    $0x10,%esp
  107afa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  107b01:	eb 3e                	jmp    107b41 <freevm+0x75>
  107b03:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107b06:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  107b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  107b10:	01 d0                	add    %edx,%eax
  107b12:	8b 00                	mov    (%eax),%eax
  107b14:	83 e0 01             	and    $0x1,%eax
  107b17:	85 c0                	test   %eax,%eax
  107b19:	74 22                	je     107b3d <freevm+0x71>
  107b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107b1e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  107b25:	8b 45 08             	mov    0x8(%ebp),%eax
  107b28:	01 d0                	add    %edx,%eax
  107b2a:	8b 00                	mov    (%eax),%eax
  107b2c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107b31:	83 ec 0c             	sub    $0xc,%esp
  107b34:	50                   	push   %eax
  107b35:	e8 2d b1 ff ff       	call   102c67 <kfree>
  107b3a:	83 c4 10             	add    $0x10,%esp
  107b3d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  107b41:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  107b48:	76 b9                	jbe    107b03 <freevm+0x37>
  107b4a:	83 ec 0c             	sub    $0xc,%esp
  107b4d:	ff 75 08             	pushl  0x8(%ebp)
  107b50:	e8 12 b1 ff ff       	call   102c67 <kfree>
  107b55:	83 c4 10             	add    $0x10,%esp
  107b58:	90                   	nop
  107b59:	c9                   	leave  
  107b5a:	c3                   	ret    

00107b5b <copyuvm>:
  107b5b:	55                   	push   %ebp
  107b5c:	89 e5                	mov    %esp,%ebp
  107b5e:	83 ec 28             	sub    $0x28,%esp
  107b61:	e8 9e fa ff ff       	call   107604 <setupkvm>
  107b66:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107b69:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  107b6d:	75 0a                	jne    107b79 <copyuvm+0x1e>
  107b6f:	b8 00 00 00 00       	mov    $0x0,%eax
  107b74:	e9 d1 00 00 00       	jmp    107c4a <copyuvm+0xef>
  107b79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  107b80:	e9 9d 00 00 00       	jmp    107c22 <copyuvm+0xc7>
  107b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107b88:	83 ec 04             	sub    $0x4,%esp
  107b8b:	6a 00                	push   $0x0
  107b8d:	50                   	push   %eax
  107b8e:	ff 75 08             	pushl  0x8(%ebp)
  107b91:	e8 52 f9 ff ff       	call   1074e8 <walkpgdir>
  107b96:	83 c4 10             	add    $0x10,%esp
  107b99:	89 45 ec             	mov    %eax,-0x14(%ebp)
  107b9c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  107ba0:	75 0d                	jne    107baf <copyuvm+0x54>
  107ba2:	83 ec 0c             	sub    $0xc,%esp
  107ba5:	68 38 94 10 00       	push   $0x109438
  107baa:	e8 c9 89 ff ff       	call   100578 <panic>
  107baf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107bb2:	8b 00                	mov    (%eax),%eax
  107bb4:	83 e0 01             	and    $0x1,%eax
  107bb7:	85 c0                	test   %eax,%eax
  107bb9:	75 0d                	jne    107bc8 <copyuvm+0x6d>
  107bbb:	83 ec 0c             	sub    $0xc,%esp
  107bbe:	68 52 94 10 00       	push   $0x109452
  107bc3:	e8 b0 89 ff ff       	call   100578 <panic>
  107bc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107bcb:	8b 00                	mov    (%eax),%eax
  107bcd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107bd2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  107bd5:	e8 10 b1 ff ff       	call   102cea <kalloc>
  107bda:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  107bdd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  107be1:	74 50                	je     107c33 <copyuvm+0xd8>
  107be3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  107be6:	83 ec 04             	sub    $0x4,%esp
  107be9:	68 00 10 00 00       	push   $0x1000
  107bee:	50                   	push   %eax
  107bef:	ff 75 e4             	pushl  -0x1c(%ebp)
  107bf2:	e8 00 d0 ff ff       	call   104bf7 <memmove>
  107bf7:	83 c4 10             	add    $0x10,%esp
  107bfa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  107bfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107c00:	83 ec 0c             	sub    $0xc,%esp
  107c03:	6a 06                	push   $0x6
  107c05:	52                   	push   %edx
  107c06:	68 00 10 00 00       	push   $0x1000
  107c0b:	50                   	push   %eax
  107c0c:	ff 75 f0             	pushl  -0x10(%ebp)
  107c0f:	e8 60 f9 ff ff       	call   107574 <mappages>
  107c14:	83 c4 20             	add    $0x20,%esp
  107c17:	85 c0                	test   %eax,%eax
  107c19:	78 1b                	js     107c36 <copyuvm+0xdb>
  107c1b:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  107c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107c25:	3b 45 0c             	cmp    0xc(%ebp),%eax
  107c28:	0f 82 57 ff ff ff    	jb     107b85 <copyuvm+0x2a>
  107c2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107c31:	eb 17                	jmp    107c4a <copyuvm+0xef>
  107c33:	90                   	nop
  107c34:	eb 01                	jmp    107c37 <copyuvm+0xdc>
  107c36:	90                   	nop
  107c37:	83 ec 0c             	sub    $0xc,%esp
  107c3a:	ff 75 f0             	pushl  -0x10(%ebp)
  107c3d:	e8 8a fe ff ff       	call   107acc <freevm>
  107c42:	83 c4 10             	add    $0x10,%esp
  107c45:	b8 00 00 00 00       	mov    $0x0,%eax
  107c4a:	c9                   	leave  
  107c4b:	c3                   	ret    

00107c4c <uva2ka>:
  107c4c:	55                   	push   %ebp
  107c4d:	89 e5                	mov    %esp,%ebp
  107c4f:	83 ec 18             	sub    $0x18,%esp
  107c52:	83 ec 04             	sub    $0x4,%esp
  107c55:	6a 00                	push   $0x0
  107c57:	ff 75 0c             	pushl  0xc(%ebp)
  107c5a:	ff 75 08             	pushl  0x8(%ebp)
  107c5d:	e8 86 f8 ff ff       	call   1074e8 <walkpgdir>
  107c62:	83 c4 10             	add    $0x10,%esp
  107c65:	89 45 f4             	mov    %eax,-0xc(%ebp)
  107c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107c6b:	8b 00                	mov    (%eax),%eax
  107c6d:	83 e0 01             	and    $0x1,%eax
  107c70:	85 c0                	test   %eax,%eax
  107c72:	75 07                	jne    107c7b <uva2ka+0x2f>
  107c74:	b8 00 00 00 00       	mov    $0x0,%eax
  107c79:	eb 1d                	jmp    107c98 <uva2ka+0x4c>
  107c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107c7e:	8b 00                	mov    (%eax),%eax
  107c80:	83 e0 04             	and    $0x4,%eax
  107c83:	85 c0                	test   %eax,%eax
  107c85:	75 07                	jne    107c8e <uva2ka+0x42>
  107c87:	b8 00 00 00 00       	mov    $0x0,%eax
  107c8c:	eb 0a                	jmp    107c98 <uva2ka+0x4c>
  107c8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107c91:	8b 00                	mov    (%eax),%eax
  107c93:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107c98:	c9                   	leave  
  107c99:	c3                   	ret    

00107c9a <copyout>:
  107c9a:	55                   	push   %ebp
  107c9b:	89 e5                	mov    %esp,%ebp
  107c9d:	83 ec 18             	sub    $0x18,%esp
  107ca0:	8b 45 10             	mov    0x10(%ebp),%eax
  107ca3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  107ca6:	eb 7f                	jmp    107d27 <copyout+0x8d>
  107ca8:	8b 45 0c             	mov    0xc(%ebp),%eax
  107cab:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  107cb0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  107cb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107cb6:	83 ec 08             	sub    $0x8,%esp
  107cb9:	50                   	push   %eax
  107cba:	ff 75 08             	pushl  0x8(%ebp)
  107cbd:	e8 8a ff ff ff       	call   107c4c <uva2ka>
  107cc2:	83 c4 10             	add    $0x10,%esp
  107cc5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  107cc8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  107ccc:	75 07                	jne    107cd5 <copyout+0x3b>
  107cce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  107cd3:	eb 61                	jmp    107d36 <copyout+0x9c>
  107cd5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107cd8:	2b 45 0c             	sub    0xc(%ebp),%eax
  107cdb:	05 00 10 00 00       	add    $0x1000,%eax
  107ce0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107ce3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107ce6:	3b 45 14             	cmp    0x14(%ebp),%eax
  107ce9:	76 06                	jbe    107cf1 <copyout+0x57>
  107ceb:	8b 45 14             	mov    0x14(%ebp),%eax
  107cee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107cf1:	8b 45 0c             	mov    0xc(%ebp),%eax
  107cf4:	2b 45 ec             	sub    -0x14(%ebp),%eax
  107cf7:	89 c2                	mov    %eax,%edx
  107cf9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  107cfc:	01 d0                	add    %edx,%eax
  107cfe:	83 ec 04             	sub    $0x4,%esp
  107d01:	ff 75 f0             	pushl  -0x10(%ebp)
  107d04:	ff 75 f4             	pushl  -0xc(%ebp)
  107d07:	50                   	push   %eax
  107d08:	e8 ea ce ff ff       	call   104bf7 <memmove>
  107d0d:	83 c4 10             	add    $0x10,%esp
  107d10:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107d13:	29 45 14             	sub    %eax,0x14(%ebp)
  107d16:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107d19:	01 45 f4             	add    %eax,-0xc(%ebp)
  107d1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107d1f:	05 00 10 00 00       	add    $0x1000,%eax
  107d24:	89 45 0c             	mov    %eax,0xc(%ebp)
  107d27:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  107d2b:	0f 85 77 ff ff ff    	jne    107ca8 <copyout+0xe>
  107d31:	b8 00 00 00 00       	mov    $0x0,%eax
  107d36:	c9                   	leave  
  107d37:	c3                   	ret    

00107d38 <vfsinit>:
  107d38:	55                   	push   %ebp
  107d39:	89 e5                	mov    %esp,%ebp
  107d3b:	83 ec 08             	sub    $0x8,%esp
  107d3e:	83 ec 08             	sub    $0x8,%esp
  107d41:	68 6c 94 10 00       	push   $0x10946c
  107d46:	68 60 3b 11 00       	push   $0x113b60
  107d4b:	e8 d6 cb ff ff       	call   104926 <initlock>
  107d50:	83 c4 10             	add    $0x10,%esp
  107d53:	90                   	nop
  107d54:	c9                   	leave  
  107d55:	c3                   	ret    

00107d56 <vfile_lookup>:
  107d56:	55                   	push   %ebp
  107d57:	89 e5                	mov    %esp,%ebp
  107d59:	83 ec 18             	sub    $0x18,%esp
  107d5c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  107d63:	83 ec 0c             	sub    $0xc,%esp
  107d66:	68 60 3b 11 00       	push   $0x113b60
  107d6b:	e8 d8 cb ff ff       	call   104948 <acquire>
  107d70:	83 c4 10             	add    $0x10,%esp
  107d73:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  107d7a:	eb 3c                	jmp    107db8 <vfile_lookup+0x62>
  107d7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107d7f:	83 c0 03             	add    $0x3,%eax
  107d82:	c1 e0 04             	shl    $0x4,%eax
  107d85:	05 68 3b 11 00       	add    $0x113b68,%eax
  107d8a:	8b 00                	mov    (%eax),%eax
  107d8c:	39 45 08             	cmp    %eax,0x8(%ebp)
  107d8f:	75 23                	jne    107db4 <vfile_lookup+0x5e>
  107d91:	8b 45 f0             	mov    -0x10(%ebp),%eax
  107d94:	83 c0 03             	add    $0x3,%eax
  107d97:	c1 e0 04             	shl    $0x4,%eax
  107d9a:	05 60 3b 11 00       	add    $0x113b60,%eax
  107d9f:	83 c0 04             	add    $0x4,%eax
  107da2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  107da5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107da8:	8b 00                	mov    (%eax),%eax
  107daa:	8d 50 01             	lea    0x1(%eax),%edx
  107dad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107db0:	89 10                	mov    %edx,(%eax)
  107db2:	eb 0a                	jmp    107dbe <vfile_lookup+0x68>
  107db4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  107db8:	83 7d f0 63          	cmpl   $0x63,-0x10(%ebp)
  107dbc:	7e be                	jle    107d7c <vfile_lookup+0x26>
  107dbe:	83 ec 0c             	sub    $0xc,%esp
  107dc1:	68 60 3b 11 00       	push   $0x113b60
  107dc6:	e8 e4 cb ff ff       	call   1049af <release>
  107dcb:	83 c4 10             	add    $0x10,%esp
  107dce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107dd1:	c9                   	leave  
  107dd2:	c3                   	ret    

00107dd3 <vfile_alloc>:
  107dd3:	55                   	push   %ebp
  107dd4:	89 e5                	mov    %esp,%ebp
  107dd6:	83 ec 18             	sub    $0x18,%esp
  107dd9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  107ddd:	75 0d                	jne    107dec <vfile_alloc+0x19>
  107ddf:	83 ec 0c             	sub    $0xc,%esp
  107de2:	68 70 94 10 00       	push   $0x109470
  107de7:	e8 8c 87 ff ff       	call   100578 <panic>
  107dec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  107df0:	75 0d                	jne    107dff <vfile_alloc+0x2c>
  107df2:	83 ec 0c             	sub    $0xc,%esp
  107df5:	68 89 94 10 00       	push   $0x109489
  107dfa:	e8 79 87 ff ff       	call   100578 <panic>
  107dff:	83 ec 0c             	sub    $0xc,%esp
  107e02:	68 60 3b 11 00       	push   $0x113b60
  107e07:	e8 3c cb ff ff       	call   104948 <acquire>
  107e0c:	83 c4 10             	add    $0x10,%esp
  107e0f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  107e16:	eb 77                	jmp    107e8f <vfile_alloc+0xbc>
  107e18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107e1b:	83 c0 03             	add    $0x3,%eax
  107e1e:	c1 e0 04             	shl    $0x4,%eax
  107e21:	05 64 3b 11 00       	add    $0x113b64,%eax
  107e26:	8b 00                	mov    (%eax),%eax
  107e28:	85 c0                	test   %eax,%eax
  107e2a:	75 5f                	jne    107e8b <vfile_alloc+0xb8>
  107e2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107e2f:	83 c0 03             	add    $0x3,%eax
  107e32:	c1 e0 04             	shl    $0x4,%eax
  107e35:	8d 90 68 3b 11 00    	lea    0x113b68(%eax),%edx
  107e3b:	8b 45 08             	mov    0x8(%ebp),%eax
  107e3e:	89 02                	mov    %eax,(%edx)
  107e40:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107e43:	83 c0 03             	add    $0x3,%eax
  107e46:	c1 e0 04             	shl    $0x4,%eax
  107e49:	8d 90 70 3b 11 00    	lea    0x113b70(%eax),%edx
  107e4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  107e52:	89 02                	mov    %eax,(%edx)
  107e54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107e57:	83 c0 03             	add    $0x3,%eax
  107e5a:	c1 e0 04             	shl    $0x4,%eax
  107e5d:	05 64 3b 11 00       	add    $0x113b64,%eax
  107e62:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  107e68:	83 ec 0c             	sub    $0xc,%esp
  107e6b:	68 60 3b 11 00       	push   $0x113b60
  107e70:	e8 3a cb ff ff       	call   1049af <release>
  107e75:	83 c4 10             	add    $0x10,%esp
  107e78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  107e7b:	83 c0 03             	add    $0x3,%eax
  107e7e:	c1 e0 04             	shl    $0x4,%eax
  107e81:	05 60 3b 11 00       	add    $0x113b60,%eax
  107e86:	83 c0 04             	add    $0x4,%eax
  107e89:	eb 27                	jmp    107eb2 <vfile_alloc+0xdf>
  107e8b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  107e8f:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
  107e93:	7e 83                	jle    107e18 <vfile_alloc+0x45>
  107e95:	83 ec 0c             	sub    $0xc,%esp
  107e98:	68 60 3b 11 00       	push   $0x113b60
  107e9d:	e8 0d cb ff ff       	call   1049af <release>
  107ea2:	83 c4 10             	add    $0x10,%esp
  107ea5:	83 ec 0c             	sub    $0xc,%esp
  107ea8:	68 a4 94 10 00       	push   $0x1094a4
  107ead:	e8 c6 86 ff ff       	call   100578 <panic>
  107eb2:	c9                   	leave  
  107eb3:	c3                   	ret    

00107eb4 <vfs_create>:
  107eb4:	55                   	push   %ebp
  107eb5:	89 e5                	mov    %esp,%ebp
  107eb7:	83 ec 28             	sub    $0x28,%esp
  107eba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  107ebd:	8b 55 10             	mov    0x10(%ebp),%edx
  107ec0:	8b 45 14             	mov    0x14(%ebp),%eax
  107ec3:	66 89 4d e4          	mov    %cx,-0x1c(%ebp)
  107ec7:	66 89 55 e0          	mov    %dx,-0x20(%ebp)
  107ecb:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
  107ecf:	83 ec 0c             	sub    $0xc,%esp
  107ed2:	ff 75 08             	pushl  0x8(%ebp)
  107ed5:	e8 f1 0b 00 00       	call   108acb <has_ram>
  107eda:	83 c4 10             	add    $0x10,%esp
  107edd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  107ee0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  107ee4:	74 1c                	je     107f02 <vfs_create+0x4e>
  107ee6:	0f bf 4d dc          	movswl -0x24(%ebp),%ecx
  107eea:	0f bf 55 e0          	movswl -0x20(%ebp),%edx
  107eee:	0f bf 45 e4          	movswl -0x1c(%ebp),%eax
  107ef2:	51                   	push   %ecx
  107ef3:	52                   	push   %edx
  107ef4:	50                   	push   %eax
  107ef5:	ff 75 08             	pushl  0x8(%ebp)
  107ef8:	e8 e4 01 00 00       	call   1080e1 <xv6fs_create>
  107efd:	83 c4 10             	add    $0x10,%esp
  107f00:	eb 1a                	jmp    107f1c <vfs_create+0x68>
  107f02:	0f bf 4d dc          	movswl -0x24(%ebp),%ecx
  107f06:	0f bf 55 e0          	movswl -0x20(%ebp),%edx
  107f0a:	0f bf 45 e4          	movswl -0x1c(%ebp),%eax
  107f0e:	51                   	push   %ecx
  107f0f:	52                   	push   %edx
  107f10:	50                   	push   %eax
  107f11:	ff 75 08             	pushl  0x8(%ebp)
  107f14:	e8 e4 02 00 00       	call   1081fd <ramfs_create>
  107f19:	83 c4 10             	add    $0x10,%esp
  107f1c:	c9                   	leave  
  107f1d:	c3                   	ret    

00107f1e <vfs_write>:
  107f1e:	55                   	push   %ebp
  107f1f:	89 e5                	mov    %esp,%ebp
  107f21:	83 ec 08             	sub    $0x8,%esp
  107f24:	8b 45 08             	mov    0x8(%ebp),%eax
  107f27:	8b 40 0c             	mov    0xc(%eax),%eax
  107f2a:	8b 40 10             	mov    0x10(%eax),%eax
  107f2d:	ff 75 14             	pushl  0x14(%ebp)
  107f30:	ff 75 10             	pushl  0x10(%ebp)
  107f33:	ff 75 0c             	pushl  0xc(%ebp)
  107f36:	ff 75 08             	pushl  0x8(%ebp)
  107f39:	ff d0                	call   *%eax
  107f3b:	83 c4 10             	add    $0x10,%esp
  107f3e:	c9                   	leave  
  107f3f:	c3                   	ret    

00107f40 <vfs_read>:
  107f40:	55                   	push   %ebp
  107f41:	89 e5                	mov    %esp,%ebp
  107f43:	83 ec 08             	sub    $0x8,%esp
  107f46:	8b 45 08             	mov    0x8(%ebp),%eax
  107f49:	8b 40 0c             	mov    0xc(%eax),%eax
  107f4c:	8b 40 14             	mov    0x14(%eax),%eax
  107f4f:	ff 75 14             	pushl  0x14(%ebp)
  107f52:	ff 75 10             	pushl  0x10(%ebp)
  107f55:	ff 75 0c             	pushl  0xc(%ebp)
  107f58:	ff 75 08             	pushl  0x8(%ebp)
  107f5b:	ff d0                	call   *%eax
  107f5d:	83 c4 10             	add    $0x10,%esp
  107f60:	c9                   	leave  
  107f61:	c3                   	ret    

00107f62 <vfs_stat>:
  107f62:	55                   	push   %ebp
  107f63:	89 e5                	mov    %esp,%ebp
  107f65:	83 ec 08             	sub    $0x8,%esp
  107f68:	8b 45 08             	mov    0x8(%ebp),%eax
  107f6b:	8b 40 0c             	mov    0xc(%eax),%eax
  107f6e:	8b 00                	mov    (%eax),%eax
  107f70:	83 ec 08             	sub    $0x8,%esp
  107f73:	ff 75 0c             	pushl  0xc(%ebp)
  107f76:	ff 75 08             	pushl  0x8(%ebp)
  107f79:	ff d0                	call   *%eax
  107f7b:	83 c4 10             	add    $0x10,%esp
  107f7e:	90                   	nop
  107f7f:	c9                   	leave  
  107f80:	c3                   	ret    

00107f81 <vfs_namei>:
  107f81:	55                   	push   %ebp
  107f82:	89 e5                	mov    %esp,%ebp
  107f84:	83 ec 28             	sub    $0x28,%esp
  107f87:	83 ec 0c             	sub    $0xc,%esp
  107f8a:	ff 75 08             	pushl  0x8(%ebp)
  107f8d:	e8 39 0b 00 00       	call   108acb <has_ram>
  107f92:	83 c4 10             	add    $0x10,%esp
  107f95:	85 c0                	test   %eax,%eax
  107f97:	75 59                	jne    107ff2 <vfs_namei+0x71>
  107f99:	83 ec 0c             	sub    $0xc,%esp
  107f9c:	ff 75 08             	pushl  0x8(%ebp)
  107f9f:	e8 8a 04 00 00       	call   10842e <ram_search>
  107fa4:	83 c4 10             	add    $0x10,%esp
  107fa7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  107faa:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  107fae:	74 42                	je     107ff2 <vfs_namei+0x71>
  107fb0:	83 ec 0c             	sub    $0xc,%esp
  107fb3:	ff 75 f0             	pushl  -0x10(%ebp)
  107fb6:	e8 0b 07 00 00       	call   1086c6 <ram_get>
  107fbb:	83 c4 10             	add    $0x10,%esp
  107fbe:	89 45 ec             	mov    %eax,-0x14(%ebp)
  107fc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107fc4:	8b 40 58             	mov    0x58(%eax),%eax
  107fc7:	83 f8 01             	cmp    $0x1,%eax
  107fca:	75 07                	jne    107fd3 <vfs_namei+0x52>
  107fcc:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
  107fd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  107fd6:	8b 40 18             	mov    0x18(%eax),%eax
  107fd9:	83 ec 08             	sub    $0x8,%esp
  107fdc:	68 08 ca 10 00       	push   $0x10ca08
  107fe1:	50                   	push   %eax
  107fe2:	e8 ec fd ff ff       	call   107dd3 <vfile_alloc>
  107fe7:	83 c4 10             	add    $0x10,%esp
  107fea:	89 45 e8             	mov    %eax,-0x18(%ebp)
  107fed:	8b 45 e8             	mov    -0x18(%ebp),%eax
  107ff0:	eb 4e                	jmp    108040 <vfs_namei+0xbf>
  107ff2:	83 ec 0c             	sub    $0xc,%esp
  107ff5:	ff 75 08             	pushl  0x8(%ebp)
  107ff8:	e8 fb a4 ff ff       	call   1024f8 <namei>
  107ffd:	83 c4 10             	add    $0x10,%esp
  108000:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  108003:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  108007:	75 07                	jne    108010 <vfs_namei+0x8f>
  108009:	b8 00 00 00 00       	mov    $0x0,%eax
  10800e:	eb 30                	jmp    108040 <vfs_namei+0xbf>
  108010:	83 ec 0c             	sub    $0xc,%esp
  108013:	ff 75 e4             	pushl  -0x1c(%ebp)
  108016:	e8 3b fd ff ff       	call   107d56 <vfile_lookup>
  10801b:	83 c4 10             	add    $0x10,%esp
  10801e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  108021:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  108025:	75 16                	jne    10803d <vfs_namei+0xbc>
  108027:	83 ec 08             	sub    $0x8,%esp
  10802a:	68 f0 c9 10 00       	push   $0x10c9f0
  10802f:	ff 75 e4             	pushl  -0x1c(%ebp)
  108032:	e8 9c fd ff ff       	call   107dd3 <vfile_alloc>
  108037:	83 c4 10             	add    $0x10,%esp
  10803a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10803d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108040:	c9                   	leave  
  108041:	c3                   	ret    

00108042 <vfs_ilock>:
  108042:	55                   	push   %ebp
  108043:	89 e5                	mov    %esp,%ebp
  108045:	83 ec 08             	sub    $0x8,%esp
  108048:	8b 45 08             	mov    0x8(%ebp),%eax
  10804b:	8b 40 0c             	mov    0xc(%eax),%eax
  10804e:	8b 40 04             	mov    0x4(%eax),%eax
  108051:	83 ec 0c             	sub    $0xc,%esp
  108054:	ff 75 08             	pushl  0x8(%ebp)
  108057:	ff d0                	call   *%eax
  108059:	83 c4 10             	add    $0x10,%esp
  10805c:	90                   	nop
  10805d:	c9                   	leave  
  10805e:	c3                   	ret    

0010805f <vfs_iput>:
  10805f:	55                   	push   %ebp
  108060:	89 e5                	mov    %esp,%ebp
  108062:	83 ec 08             	sub    $0x8,%esp
  108065:	8b 45 08             	mov    0x8(%ebp),%eax
  108068:	8b 00                	mov    (%eax),%eax
  10806a:	85 c0                	test   %eax,%eax
  10806c:	75 0d                	jne    10807b <vfs_iput+0x1c>
  10806e:	83 ec 0c             	sub    $0xc,%esp
  108071:	68 cc 94 10 00       	push   $0x1094cc
  108076:	e8 fd 84 ff ff       	call   100578 <panic>
  10807b:	8b 45 08             	mov    0x8(%ebp),%eax
  10807e:	8b 40 0c             	mov    0xc(%eax),%eax
  108081:	8b 40 0c             	mov    0xc(%eax),%eax
  108084:	83 ec 0c             	sub    $0xc,%esp
  108087:	ff 75 08             	pushl  0x8(%ebp)
  10808a:	ff d0                	call   *%eax
  10808c:	83 c4 10             	add    $0x10,%esp
  10808f:	8b 45 08             	mov    0x8(%ebp),%eax
  108092:	8b 00                	mov    (%eax),%eax
  108094:	8d 50 ff             	lea    -0x1(%eax),%edx
  108097:	8b 45 08             	mov    0x8(%ebp),%eax
  10809a:	89 10                	mov    %edx,(%eax)
  10809c:	90                   	nop
  10809d:	c9                   	leave  
  10809e:	c3                   	ret    

0010809f <vfs_iunlockput>:
  10809f:	55                   	push   %ebp
  1080a0:	89 e5                	mov    %esp,%ebp
  1080a2:	83 ec 08             	sub    $0x8,%esp
  1080a5:	83 ec 0c             	sub    $0xc,%esp
  1080a8:	ff 75 08             	pushl  0x8(%ebp)
  1080ab:	e8 14 00 00 00       	call   1080c4 <vfs_iunlock>
  1080b0:	83 c4 10             	add    $0x10,%esp
  1080b3:	83 ec 0c             	sub    $0xc,%esp
  1080b6:	ff 75 08             	pushl  0x8(%ebp)
  1080b9:	e8 a1 ff ff ff       	call   10805f <vfs_iput>
  1080be:	83 c4 10             	add    $0x10,%esp
  1080c1:	90                   	nop
  1080c2:	c9                   	leave  
  1080c3:	c3                   	ret    

001080c4 <vfs_iunlock>:
  1080c4:	55                   	push   %ebp
  1080c5:	89 e5                	mov    %esp,%ebp
  1080c7:	83 ec 08             	sub    $0x8,%esp
  1080ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1080cd:	8b 40 0c             	mov    0xc(%eax),%eax
  1080d0:	8b 40 08             	mov    0x8(%eax),%eax
  1080d3:	83 ec 0c             	sub    $0xc,%esp
  1080d6:	ff 75 08             	pushl  0x8(%ebp)
  1080d9:	ff d0                	call   *%eax
  1080db:	83 c4 10             	add    $0x10,%esp
  1080de:	90                   	nop
  1080df:	c9                   	leave  
  1080e0:	c3                   	ret    

001080e1 <xv6fs_create>:
  1080e1:	55                   	push   %ebp
  1080e2:	89 e5                	mov    %esp,%ebp
  1080e4:	83 ec 28             	sub    $0x28,%esp
  1080e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1080ea:	8b 55 10             	mov    0x10(%ebp),%edx
  1080ed:	8b 45 14             	mov    0x14(%ebp),%eax
  1080f0:	66 89 4d e4          	mov    %cx,-0x1c(%ebp)
  1080f4:	66 89 55 e0          	mov    %dx,-0x20(%ebp)
  1080f8:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
  1080fc:	0f bf 4d dc          	movswl -0x24(%ebp),%ecx
  108100:	0f bf 55 e0          	movswl -0x20(%ebp),%edx
  108104:	0f bf 45 e4          	movswl -0x1c(%ebp),%eax
  108108:	51                   	push   %ecx
  108109:	52                   	push   %edx
  10810a:	50                   	push   %eax
  10810b:	ff 75 08             	pushl  0x8(%ebp)
  10810e:	e8 f4 d4 ff ff       	call   105607 <create>
  108113:	83 c4 10             	add    $0x10,%esp
  108116:	89 45 f4             	mov    %eax,-0xc(%ebp)
  108119:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10811d:	75 07                	jne    108126 <xv6fs_create+0x45>
  10811f:	b8 00 00 00 00       	mov    $0x0,%eax
  108124:	eb 13                	jmp    108139 <xv6fs_create+0x58>
  108126:	83 ec 08             	sub    $0x8,%esp
  108129:	68 f0 c9 10 00       	push   $0x10c9f0
  10812e:	ff 75 f4             	pushl  -0xc(%ebp)
  108131:	e8 9d fc ff ff       	call   107dd3 <vfile_alloc>
  108136:	83 c4 10             	add    $0x10,%esp
  108139:	c9                   	leave  
  10813a:	c3                   	ret    

0010813b <xv6fs_stati>:
  10813b:	55                   	push   %ebp
  10813c:	89 e5                	mov    %esp,%ebp
  10813e:	83 ec 08             	sub    $0x8,%esp
  108141:	8b 45 08             	mov    0x8(%ebp),%eax
  108144:	8b 40 04             	mov    0x4(%eax),%eax
  108147:	83 ec 08             	sub    $0x8,%esp
  10814a:	ff 75 0c             	pushl  0xc(%ebp)
  10814d:	50                   	push   %eax
  10814e:	e8 59 9c ff ff       	call   101dac <stati>
  108153:	83 c4 10             	add    $0x10,%esp
  108156:	90                   	nop
  108157:	c9                   	leave  
  108158:	c3                   	ret    

00108159 <xv6fs_ilock>:
  108159:	55                   	push   %ebp
  10815a:	89 e5                	mov    %esp,%ebp
  10815c:	83 ec 08             	sub    $0x8,%esp
  10815f:	8b 45 08             	mov    0x8(%ebp),%eax
  108162:	8b 40 04             	mov    0x4(%eax),%eax
  108165:	83 ec 0c             	sub    $0xc,%esp
  108168:	50                   	push   %eax
  108169:	e8 07 97 ff ff       	call   101875 <ilock>
  10816e:	83 c4 10             	add    $0x10,%esp
  108171:	8b 45 08             	mov    0x8(%ebp),%eax
  108174:	8b 40 04             	mov    0x4(%eax),%eax
  108177:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10817b:	0f bf d0             	movswl %ax,%edx
  10817e:	8b 45 08             	mov    0x8(%ebp),%eax
  108181:	89 50 08             	mov    %edx,0x8(%eax)
  108184:	90                   	nop
  108185:	c9                   	leave  
  108186:	c3                   	ret    

00108187 <xv6fs_iunlock>:
  108187:	55                   	push   %ebp
  108188:	89 e5                	mov    %esp,%ebp
  10818a:	83 ec 08             	sub    $0x8,%esp
  10818d:	8b 45 08             	mov    0x8(%ebp),%eax
  108190:	8b 40 04             	mov    0x4(%eax),%eax
  108193:	83 ec 0c             	sub    $0xc,%esp
  108196:	50                   	push   %eax
  108197:	e8 4b 98 ff ff       	call   1019e7 <iunlock>
  10819c:	83 c4 10             	add    $0x10,%esp
  10819f:	90                   	nop
  1081a0:	c9                   	leave  
  1081a1:	c3                   	ret    

001081a2 <xv6fs_iput>:
  1081a2:	55                   	push   %ebp
  1081a3:	89 e5                	mov    %esp,%ebp
  1081a5:	83 ec 08             	sub    $0x8,%esp
  1081a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1081ab:	8b 40 04             	mov    0x4(%eax),%eax
  1081ae:	83 ec 0c             	sub    $0xc,%esp
  1081b1:	50                   	push   %eax
  1081b2:	e8 a2 98 ff ff       	call   101a59 <iput>
  1081b7:	83 c4 10             	add    $0x10,%esp
  1081ba:	90                   	nop
  1081bb:	c9                   	leave  
  1081bc:	c3                   	ret    

001081bd <xv6fs_writei>:
  1081bd:	55                   	push   %ebp
  1081be:	89 e5                	mov    %esp,%ebp
  1081c0:	83 ec 08             	sub    $0x8,%esp
  1081c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1081c6:	8b 40 04             	mov    0x4(%eax),%eax
  1081c9:	ff 75 14             	pushl  0x14(%ebp)
  1081cc:	ff 75 10             	pushl  0x10(%ebp)
  1081cf:	ff 75 0c             	pushl  0xc(%ebp)
  1081d2:	50                   	push   %eax
  1081d3:	e8 71 9d ff ff       	call   101f49 <writei>
  1081d8:	83 c4 10             	add    $0x10,%esp
  1081db:	c9                   	leave  
  1081dc:	c3                   	ret    

001081dd <xv6fs_readi>:
  1081dd:	55                   	push   %ebp
  1081de:	89 e5                	mov    %esp,%ebp
  1081e0:	83 ec 08             	sub    $0x8,%esp
  1081e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1081e6:	8b 40 04             	mov    0x4(%eax),%eax
  1081e9:	ff 75 14             	pushl  0x14(%ebp)
  1081ec:	ff 75 10             	pushl  0x10(%ebp)
  1081ef:	ff 75 0c             	pushl  0xc(%ebp)
  1081f2:	50                   	push   %eax
  1081f3:	e8 fa 9b ff ff       	call   101df2 <readi>
  1081f8:	83 c4 10             	add    $0x10,%esp
  1081fb:	c9                   	leave  
  1081fc:	c3                   	ret    

001081fd <ramfs_create>:
  1081fd:	55                   	push   %ebp
  1081fe:	89 e5                	mov    %esp,%ebp
  108200:	57                   	push   %edi
  108201:	56                   	push   %esi
  108202:	81 ec a0 00 00 00    	sub    $0xa0,%esp
  108208:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10820b:	8b 55 10             	mov    0x10(%ebp),%edx
  10820e:	8b 45 14             	mov    0x14(%ebp),%eax
  108211:	66 89 8d 64 ff ff ff 	mov    %cx,-0x9c(%ebp)
  108218:	66 89 95 60 ff ff ff 	mov    %dx,-0xa0(%ebp)
  10821f:	66 89 85 5c ff ff ff 	mov    %ax,-0xa4(%ebp)
  108226:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  10822d:	eb 3d                	jmp    10826c <ramfs_create+0x6f>
  10822f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  108232:	8b 45 08             	mov    0x8(%ebp),%eax
  108235:	01 c2                	add    %eax,%edx
  108237:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10823a:	8d 4d d2             	lea    -0x2e(%ebp),%ecx
  10823d:	01 c8                	add    %ecx,%eax
  10823f:	83 ec 04             	sub    $0x4,%esp
  108242:	6a 01                	push   $0x1
  108244:	52                   	push   %edx
  108245:	50                   	push   %eax
  108246:	e8 98 ca ff ff       	call   104ce3 <strncpy>
  10824b:	83 c4 10             	add    $0x10,%esp
  10824e:	8d 55 d2             	lea    -0x2e(%ebp),%edx
  108251:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108254:	01 d0                	add    %edx,%eax
  108256:	0f b6 00             	movzbl (%eax),%eax
  108259:	88 45 eb             	mov    %al,-0x15(%ebp)
  10825c:	80 7d eb 2f          	cmpb   $0x2f,-0x15(%ebp)
  108260:	75 06                	jne    108268 <ramfs_create+0x6b>
  108262:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  108266:	7f 0c                	jg     108274 <ramfs_create+0x77>
  108268:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10826c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  108270:	79 bd                	jns    10822f <ramfs_create+0x32>
  108272:	eb 01                	jmp    108275 <ramfs_create+0x78>
  108274:	90                   	nop
  108275:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108278:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10827b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  108282:	eb 49                	jmp    1082cd <ramfs_create+0xd0>
  108284:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  108287:	83 e8 01             	sub    $0x1,%eax
  10828a:	89 c1                	mov    %eax,%ecx
  10828c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10828f:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  108295:	05 b0 07 00 00       	add    $0x7b0,%eax
  10829a:	05 e0 41 11 00       	add    $0x1141e0,%eax
  10829f:	8d 50 04             	lea    0x4(%eax),%edx
  1082a2:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  1082a5:	83 c0 01             	add    $0x1,%eax
  1082a8:	83 ec 04             	sub    $0x4,%esp
  1082ab:	51                   	push   %ecx
  1082ac:	52                   	push   %edx
  1082ad:	50                   	push   %eax
  1082ae:	e8 da c9 ff ff       	call   104c8d <strncmp>
  1082b3:	83 c4 10             	add    $0x10,%esp
  1082b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1082b9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  1082bd:	75 0a                	jne    1082c9 <ramfs_create+0xcc>
  1082bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1082c2:	a3 2c 59 11 00       	mov    %eax,0x11592c
  1082c7:	eb 0a                	jmp    1082d3 <ramfs_create+0xd6>
  1082c9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1082cd:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  1082d1:	7e b1                	jle    108284 <ramfs_create+0x87>
  1082d3:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
  1082d9:	b8 00 00 00 00       	mov    $0x0,%eax
  1082de:	b9 18 00 00 00       	mov    $0x18,%ecx
  1082e3:	89 d7                	mov    %edx,%edi
  1082e5:	f3 ab                	rep stos %eax,%es:(%edi)
  1082e7:	c7 85 70 ff ff ff 6c 	movl   $0x6c6f6c,-0x90(%ebp)
  1082ee:	6f 6c 00 
  1082f1:	c7 85 74 ff ff ff 00 	movl   $0x0,-0x8c(%ebp)
  1082f8:	00 00 00 
  1082fb:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
  108302:	00 00 00 
  108305:	66 c7 85 7c ff ff ff 	movw   $0x0,-0x84(%ebp)
  10830c:	00 00 
  10830e:	c6 85 7e ff ff ff 00 	movb   $0x0,-0x82(%ebp)
  108315:	c7 45 80 00 10 00 00 	movl   $0x1000,-0x80(%ebp)
  10831c:	e8 c9 a9 ff ff       	call   102cea <kalloc>
  108321:	89 45 88             	mov    %eax,-0x78(%ebp)
  108324:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
  10832b:	83 ec 0c             	sub    $0xc,%esp
  10832e:	ff 75 08             	pushl  0x8(%ebp)
  108331:	e8 4f ca ff ff       	call   104d85 <strlen>
  108336:	83 c4 10             	add    $0x10,%esp
  108339:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10833c:	83 7d f0 0e          	cmpl   $0xe,-0x10(%ebp)
  108340:	7e 07                	jle    108349 <ramfs_create+0x14c>
  108342:	c7 45 f0 0e 00 00 00 	movl   $0xe,-0x10(%ebp)
  108349:	83 ec 04             	sub    $0x4,%esp
  10834c:	ff 75 f0             	pushl  -0x10(%ebp)
  10834f:	ff 75 08             	pushl  0x8(%ebp)
  108352:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
  108358:	50                   	push   %eax
  108359:	e8 85 c9 ff ff       	call   104ce3 <strncpy>
  10835e:	83 c4 10             	add    $0x10,%esp
  108361:	a1 2c 59 11 00       	mov    0x11592c,%eax
  108366:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  10836c:	05 e0 41 11 00       	add    $0x1141e0,%eax
  108371:	83 ec 0c             	sub    $0xc,%esp
  108374:	50                   	push   %eax
  108375:	e8 ce c5 ff ff       	call   104948 <acquire>
  10837a:	83 c4 10             	add    $0x10,%esp
  10837d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  108384:	eb 6b                	jmp    1083f1 <ramfs_create+0x1f4>
  108386:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  10838c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10838f:	89 d0                	mov    %edx,%eax
  108391:	01 c0                	add    %eax,%eax
  108393:	01 d0                	add    %edx,%eax
  108395:	c1 e0 05             	shl    $0x5,%eax
  108398:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  10839e:	01 d0                	add    %edx,%eax
  1083a0:	05 2c 42 11 00       	add    $0x11422c,%eax
  1083a5:	8b 00                	mov    (%eax),%eax
  1083a7:	85 c0                	test   %eax,%eax
  1083a9:	75 35                	jne    1083e0 <ramfs_create+0x1e3>
  1083ab:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  1083b1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1083b4:	89 d0                	mov    %edx,%eax
  1083b6:	01 c0                	add    %eax,%eax
  1083b8:	01 d0                	add    %edx,%eax
  1083ba:	c1 e0 05             	shl    $0x5,%eax
  1083bd:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  1083c3:	01 d0                	add    %edx,%eax
  1083c5:	05 10 42 11 00       	add    $0x114210,%eax
  1083ca:	8d 50 04             	lea    0x4(%eax),%edx
  1083cd:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
  1083d3:	b9 18 00 00 00       	mov    $0x18,%ecx
  1083d8:	89 d7                	mov    %edx,%edi
  1083da:	89 c6                	mov    %eax,%esi
  1083dc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1083de:	eb 17                	jmp    1083f7 <ramfs_create+0x1fa>
  1083e0:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  1083e4:	75 07                	jne    1083ed <ramfs_create+0x1f0>
  1083e6:	b8 00 00 00 00       	mov    $0x0,%eax
  1083eb:	eb 3a                	jmp    108427 <ramfs_create+0x22a>
  1083ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  1083f1:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  1083f5:	7e 8f                	jle    108386 <ramfs_create+0x189>
  1083f7:	a1 2c 59 11 00       	mov    0x11592c,%eax
  1083fc:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  108402:	05 e0 41 11 00       	add    $0x1141e0,%eax
  108407:	83 ec 0c             	sub    $0xc,%esp
  10840a:	50                   	push   %eax
  10840b:	e8 9f c5 ff ff       	call   1049af <release>
  108410:	83 c4 10             	add    $0x10,%esp
  108413:	8b 45 88             	mov    -0x78(%ebp),%eax
  108416:	83 ec 08             	sub    $0x8,%esp
  108419:	68 08 ca 10 00       	push   $0x10ca08
  10841e:	50                   	push   %eax
  10841f:	e8 af f9 ff ff       	call   107dd3 <vfile_alloc>
  108424:	83 c4 10             	add    $0x10,%esp
  108427:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10842a:	5e                   	pop    %esi
  10842b:	5f                   	pop    %edi
  10842c:	5d                   	pop    %ebp
  10842d:	c3                   	ret    

0010842e <ram_search>:
  10842e:	55                   	push   %ebp
  10842f:	89 e5                	mov    %esp,%ebp
  108431:	53                   	push   %ebx
  108432:	83 ec 34             	sub    $0x34,%esp
  108435:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  10843c:	eb 3d                	jmp    10847b <ram_search+0x4d>
  10843e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  108441:	8b 45 08             	mov    0x8(%ebp),%eax
  108444:	01 c2                	add    %eax,%edx
  108446:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108449:	8d 4d d6             	lea    -0x2a(%ebp),%ecx
  10844c:	01 c8                	add    %ecx,%eax
  10844e:	83 ec 04             	sub    $0x4,%esp
  108451:	6a 01                	push   $0x1
  108453:	52                   	push   %edx
  108454:	50                   	push   %eax
  108455:	e8 89 c8 ff ff       	call   104ce3 <strncpy>
  10845a:	83 c4 10             	add    $0x10,%esp
  10845d:	8d 55 d6             	lea    -0x2a(%ebp),%edx
  108460:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108463:	01 d0                	add    %edx,%eax
  108465:	0f b6 00             	movzbl (%eax),%eax
  108468:	88 45 ef             	mov    %al,-0x11(%ebp)
  10846b:	80 7d ef 2f          	cmpb   $0x2f,-0x11(%ebp)
  10846f:	75 06                	jne    108477 <ram_search+0x49>
  108471:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  108475:	7f 0c                	jg     108483 <ram_search+0x55>
  108477:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10847b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10847f:	79 bd                	jns    10843e <ram_search+0x10>
  108481:	eb 01                	jmp    108484 <ram_search+0x56>
  108483:	90                   	nop
  108484:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108487:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10848a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  108491:	eb 49                	jmp    1084dc <ram_search+0xae>
  108493:	8b 45 e8             	mov    -0x18(%ebp),%eax
  108496:	83 e8 01             	sub    $0x1,%eax
  108499:	89 c1                	mov    %eax,%ecx
  10849b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10849e:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  1084a4:	05 b0 07 00 00       	add    $0x7b0,%eax
  1084a9:	05 e0 41 11 00       	add    $0x1141e0,%eax
  1084ae:	8d 50 04             	lea    0x4(%eax),%edx
  1084b1:	8d 45 d6             	lea    -0x2a(%ebp),%eax
  1084b4:	83 c0 01             	add    $0x1,%eax
  1084b7:	83 ec 04             	sub    $0x4,%esp
  1084ba:	51                   	push   %ecx
  1084bb:	52                   	push   %edx
  1084bc:	50                   	push   %eax
  1084bd:	e8 cb c7 ff ff       	call   104c8d <strncmp>
  1084c2:	83 c4 10             	add    $0x10,%esp
  1084c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1084c8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1084cc:	75 0a                	jne    1084d8 <ram_search+0xaa>
  1084ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1084d1:	a3 2c 59 11 00       	mov    %eax,0x11592c
  1084d6:	eb 0a                	jmp    1084e2 <ram_search+0xb4>
  1084d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1084dc:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  1084e0:	7e b1                	jle    108493 <ram_search+0x65>
  1084e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1084e9:	e9 a4 00 00 00       	jmp    108592 <ram_search+0x164>
  1084ee:	83 ec 0c             	sub    $0xc,%esp
  1084f1:	ff 75 08             	pushl  0x8(%ebp)
  1084f4:	e8 8c c8 ff ff       	call   104d85 <strlen>
  1084f9:	83 c4 10             	add    $0x10,%esp
  1084fc:	89 c3                	mov    %eax,%ebx
  1084fe:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  108504:	8b 55 f0             	mov    -0x10(%ebp),%edx
  108507:	89 d0                	mov    %edx,%eax
  108509:	01 c0                	add    %eax,%eax
  10850b:	01 d0                	add    %edx,%eax
  10850d:	c1 e0 05             	shl    $0x5,%eax
  108510:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108516:	01 d0                	add    %edx,%eax
  108518:	83 c0 30             	add    $0x30,%eax
  10851b:	05 e0 41 11 00       	add    $0x1141e0,%eax
  108520:	83 c0 04             	add    $0x4,%eax
  108523:	83 ec 04             	sub    $0x4,%esp
  108526:	53                   	push   %ebx
  108527:	ff 75 08             	pushl  0x8(%ebp)
  10852a:	50                   	push   %eax
  10852b:	e8 5d c7 ff ff       	call   104c8d <strncmp>
  108530:	83 c4 10             	add    $0x10,%esp
  108533:	85 c0                	test   %eax,%eax
  108535:	75 57                	jne    10858e <ram_search+0x160>
  108537:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  10853d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  108540:	89 d0                	mov    %edx,%eax
  108542:	01 c0                	add    %eax,%eax
  108544:	01 d0                	add    %edx,%eax
  108546:	c1 e0 05             	shl    $0x5,%eax
  108549:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  10854f:	01 d0                	add    %edx,%eax
  108551:	05 28 42 11 00       	add    $0x114228,%eax
  108556:	8b 00                	mov    (%eax),%eax
  108558:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  10855e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  108564:	85 c0                	test   %eax,%eax
  108566:	0f 48 c2             	cmovs  %edx,%eax
  108569:	c1 f8 0c             	sar    $0xc,%eax
  10856c:	89 c3                	mov    %eax,%ebx
  10856e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  108571:	89 d0                	mov    %edx,%eax
  108573:	01 c0                	add    %eax,%eax
  108575:	01 d0                	add    %edx,%eax
  108577:	c1 e0 05             	shl    $0x5,%eax
  10857a:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108580:	01 d0                	add    %edx,%eax
  108582:	05 6c 42 11 00       	add    $0x11426c,%eax
  108587:	89 18                	mov    %ebx,(%eax)
  108589:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10858c:	eb 13                	jmp    1085a1 <ram_search+0x173>
  10858e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  108592:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
  108596:	0f 8e 52 ff ff ff    	jle    1084ee <ram_search+0xc0>
  10859c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1085a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1085a4:	c9                   	leave  
  1085a5:	c3                   	ret    

001085a6 <ram_init>:
  1085a6:	55                   	push   %ebp
  1085a7:	89 e5                	mov    %esp,%ebp
  1085a9:	83 ec 08             	sub    $0x8,%esp
  1085ac:	83 ec 08             	sub    $0x8,%esp
  1085af:	68 e4 94 10 00       	push   $0x1094e4
  1085b4:	68 e0 41 11 00       	push   $0x1141e0
  1085b9:	e8 68 c3 ff ff       	call   104926 <initlock>
  1085be:	83 c4 10             	add    $0x10,%esp
  1085c1:	c7 05 2c 59 11 00 00 	movl   $0x0,0x11592c
  1085c8:	00 00 00 
  1085cb:	c6 05 94 49 11 00 72 	movb   $0x72,0x114994
  1085d2:	c6 05 95 49 11 00 61 	movb   $0x61,0x114995
  1085d9:	c6 05 96 49 11 00 6d 	movb   $0x6d,0x114996
  1085e0:	90                   	nop
  1085e1:	c9                   	leave  
  1085e2:	c3                   	ret    

001085e3 <add_ram>:
  1085e3:	55                   	push   %ebp
  1085e4:	89 e5                	mov    %esp,%ebp
  1085e6:	83 ec 18             	sub    $0x18,%esp
  1085e9:	a1 30 59 11 00       	mov    0x115930,%eax
  1085ee:	83 f8 02             	cmp    $0x2,%eax
  1085f1:	75 0a                	jne    1085fd <add_ram+0x1a>
  1085f3:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  1085f8:	e9 c7 00 00 00       	jmp    1086c4 <add_ram+0xe1>
  1085fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  108604:	eb 39                	jmp    10863f <add_ram+0x5c>
  108606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108609:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  10860f:	05 b0 07 00 00       	add    $0x7b0,%eax
  108614:	05 e0 41 11 00       	add    $0x1141e0,%eax
  108619:	83 c0 04             	add    $0x4,%eax
  10861c:	83 ec 04             	sub    $0x4,%esp
  10861f:	6a 0e                	push   $0xe
  108621:	ff 75 08             	pushl  0x8(%ebp)
  108624:	50                   	push   %eax
  108625:	e8 63 c6 ff ff       	call   104c8d <strncmp>
  10862a:	83 c4 10             	add    $0x10,%esp
  10862d:	85 c0                	test   %eax,%eax
  10862f:	75 0a                	jne    10863b <add_ram+0x58>
  108631:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  108636:	e9 89 00 00 00       	jmp    1086c4 <add_ram+0xe1>
  10863b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10863f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  108643:	7e c1                	jle    108606 <add_ram+0x23>
  108645:	a1 30 59 11 00       	mov    0x115930,%eax
  10864a:	83 c0 01             	add    $0x1,%eax
  10864d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  108650:	a1 30 59 11 00       	mov    0x115930,%eax
  108655:	83 c0 01             	add    $0x1,%eax
  108658:	a3 30 59 11 00       	mov    %eax,0x115930
  10865d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  108660:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  108666:	05 e0 41 11 00       	add    $0x1141e0,%eax
  10866b:	83 ec 08             	sub    $0x8,%esp
  10866e:	ff 75 08             	pushl  0x8(%ebp)
  108671:	50                   	push   %eax
  108672:	e8 af c2 ff ff       	call   104926 <initlock>
  108677:	83 c4 10             	add    $0x10,%esp
  10867a:	83 ec 0c             	sub    $0xc,%esp
  10867d:	ff 75 08             	pushl  0x8(%ebp)
  108680:	e8 00 c7 ff ff       	call   104d85 <strlen>
  108685:	83 c4 10             	add    $0x10,%esp
  108688:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10868b:	83 7d ec 0e          	cmpl   $0xe,-0x14(%ebp)
  10868f:	7e 07                	jle    108698 <add_ram+0xb5>
  108691:	c7 45 ec 0e 00 00 00 	movl   $0xe,-0x14(%ebp)
  108698:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10869b:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  1086a1:	05 b0 07 00 00       	add    $0x7b0,%eax
  1086a6:	05 e0 41 11 00       	add    $0x1141e0,%eax
  1086ab:	83 c0 04             	add    $0x4,%eax
  1086ae:	83 ec 04             	sub    $0x4,%esp
  1086b1:	6a 0e                	push   $0xe
  1086b3:	ff 75 08             	pushl  0x8(%ebp)
  1086b6:	50                   	push   %eax
  1086b7:	e8 27 c6 ff ff       	call   104ce3 <strncpy>
  1086bc:	83 c4 10             	add    $0x10,%esp
  1086bf:	b8 00 00 00 00       	mov    $0x0,%eax
  1086c4:	c9                   	leave  
  1086c5:	c3                   	ret    

001086c6 <ram_get>:
  1086c6:	55                   	push   %ebp
  1086c7:	89 e5                	mov    %esp,%ebp
  1086c9:	83 ec 10             	sub    $0x10,%esp
  1086cc:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  1086d2:	8b 55 08             	mov    0x8(%ebp),%edx
  1086d5:	89 d0                	mov    %edx,%eax
  1086d7:	01 c0                	add    %eax,%eax
  1086d9:	01 d0                	add    %edx,%eax
  1086db:	c1 e0 05             	shl    $0x5,%eax
  1086de:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  1086e4:	01 d0                	add    %edx,%eax
  1086e6:	83 c0 30             	add    $0x30,%eax
  1086e9:	05 e0 41 11 00       	add    $0x1141e0,%eax
  1086ee:	83 c0 04             	add    $0x4,%eax
  1086f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1086f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1086f7:	c9                   	leave  
  1086f8:	c3                   	ret    

001086f9 <ramfs_stati>:
  1086f9:	55                   	push   %ebp
  1086fa:	89 e5                	mov    %esp,%ebp
  1086fc:	83 ec 10             	sub    $0x10,%esp
  1086ff:	8b 45 08             	mov    0x8(%ebp),%eax
  108702:	8b 40 04             	mov    0x4(%eax),%eax
  108705:	89 45 fc             	mov    %eax,-0x4(%ebp)
  108708:	8b 45 0c             	mov    0xc(%ebp),%eax
  10870b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  108712:	8b 45 0c             	mov    0xc(%ebp),%eax
  108715:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  10871c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10871f:	66 c7 00 00 00       	movw   $0x0,(%eax)
  108724:	8b 45 0c             	mov    0xc(%ebp),%eax
  108727:	66 c7 40 0c 00 00    	movw   $0x0,0xc(%eax)
  10872d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  108730:	8b 40 14             	mov    0x14(%eax),%eax
  108733:	89 c2                	mov    %eax,%edx
  108735:	8b 45 0c             	mov    0xc(%ebp),%eax
  108738:	89 50 10             	mov    %edx,0x10(%eax)
  10873b:	90                   	nop
  10873c:	c9                   	leave  
  10873d:	c3                   	ret    

0010873e <getdiv>:
  10873e:	55                   	push   %ebp
  10873f:	89 e5                	mov    %esp,%ebp
  108741:	83 ec 10             	sub    $0x10,%esp
  108744:	8b 45 08             	mov    0x8(%ebp),%eax
  108747:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  10874d:	85 c0                	test   %eax,%eax
  10874f:	0f 48 c2             	cmovs  %edx,%eax
  108752:	c1 f8 0c             	sar    $0xc,%eax
  108755:	89 45 fc             	mov    %eax,-0x4(%ebp)
  108758:	8b 45 0c             	mov    0xc(%ebp),%eax
  10875b:	01 45 08             	add    %eax,0x8(%ebp)
  10875e:	8b 45 08             	mov    0x8(%ebp),%eax
  108761:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  108767:	85 c0                	test   %eax,%eax
  108769:	0f 48 c2             	cmovs  %edx,%eax
  10876c:	c1 f8 0c             	sar    $0xc,%eax
  10876f:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  108772:	7d 14                	jge    108788 <getdiv+0x4a>
  108774:	8b 45 08             	mov    0x8(%ebp),%eax
  108777:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  10877d:	85 c0                	test   %eax,%eax
  10877f:	0f 48 c2             	cmovs  %edx,%eax
  108782:	c1 f8 0c             	sar    $0xc,%eax
  108785:	89 45 fc             	mov    %eax,-0x4(%ebp)
  108788:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10878b:	c9                   	leave  
  10878c:	c3                   	ret    

0010878d <get_currdisc>:
  10878d:	55                   	push   %ebp
  10878e:	89 e5                	mov    %esp,%ebp
  108790:	83 ec 10             	sub    $0x10,%esp
  108793:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10879a:	eb 47                	jmp    1087e3 <get_currdisc+0x56>
  10879c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1087a3:	eb 34                	jmp    1087d9 <get_currdisc+0x4c>
  1087a5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1087a8:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  1087ab:	89 d0                	mov    %edx,%eax
  1087ad:	01 c0                	add    %eax,%eax
  1087af:	01 d0                	add    %edx,%eax
  1087b1:	c1 e0 05             	shl    $0x5,%eax
  1087b4:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  1087ba:	01 d0                	add    %edx,%eax
  1087bc:	05 2c 42 11 00       	add    $0x11422c,%eax
  1087c1:	8b 00                	mov    (%eax),%eax
  1087c3:	39 45 08             	cmp    %eax,0x8(%ebp)
  1087c6:	75 0d                	jne    1087d5 <get_currdisc+0x48>
  1087c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1087cb:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1087ce:	89 10                	mov    %edx,(%eax)
  1087d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1087d3:	eb 19                	jmp    1087ee <get_currdisc+0x61>
  1087d5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1087d9:	83 7d f8 13          	cmpl   $0x13,-0x8(%ebp)
  1087dd:	7e c6                	jle    1087a5 <get_currdisc+0x18>
  1087df:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1087e3:	83 7d fc 02          	cmpl   $0x2,-0x4(%ebp)
  1087e7:	7e b3                	jle    10879c <get_currdisc+0xf>
  1087e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1087ee:	c9                   	leave  
  1087ef:	c3                   	ret    

001087f0 <ramfs_ilock>:
  1087f0:	55                   	push   %ebp
  1087f1:	89 e5                	mov    %esp,%ebp
  1087f3:	90                   	nop
  1087f4:	5d                   	pop    %ebp
  1087f5:	c3                   	ret    

001087f6 <ramfs_iunlock>:
  1087f6:	55                   	push   %ebp
  1087f7:	89 e5                	mov    %esp,%ebp
  1087f9:	90                   	nop
  1087fa:	5d                   	pop    %ebp
  1087fb:	c3                   	ret    

001087fc <ramfs_iput>:
  1087fc:	55                   	push   %ebp
  1087fd:	89 e5                	mov    %esp,%ebp
  1087ff:	90                   	nop
  108800:	5d                   	pop    %ebp
  108801:	c3                   	ret    

00108802 <ramfs_writei>:
  108802:	55                   	push   %ebp
  108803:	89 e5                	mov    %esp,%ebp
  108805:	53                   	push   %ebx
  108806:	83 ec 24             	sub    $0x24,%esp
  108809:	8b 45 08             	mov    0x8(%ebp),%eax
  10880c:	8b 40 04             	mov    0x4(%eax),%eax
  10880f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  108812:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  108819:	81 7d 14 00 10 00 00 	cmpl   $0x1000,0x14(%ebp)
  108820:	75 06                	jne    108828 <ramfs_writei+0x26>
  108822:	8b 45 14             	mov    0x14(%ebp),%eax
  108825:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  108828:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10882b:	50                   	push   %eax
  10882c:	ff 75 f0             	pushl  -0x10(%ebp)
  10882f:	e8 59 ff ff ff       	call   10878d <get_currdisc>
  108834:	83 c4 08             	add    $0x8,%esp
  108837:	a3 2c 59 11 00       	mov    %eax,0x11592c
  10883c:	8b 5d 14             	mov    0x14(%ebp),%ebx
  10883f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  108842:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  108845:	a1 2c 59 11 00       	mov    0x11592c,%eax
  10884a:	53                   	push   %ebx
  10884b:	51                   	push   %ecx
  10884c:	52                   	push   %edx
  10884d:	50                   	push   %eax
  10884e:	e8 5a 04 00 00       	call   108cad <getchunk>
  108853:	83 c4 10             	add    $0x10,%esp
  108856:	89 45 ec             	mov    %eax,-0x14(%ebp)
  108859:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  10885d:	75 0a                	jne    108869 <ramfs_writei+0x67>
  10885f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  108864:	e9 f8 00 00 00       	jmp    108961 <ramfs_writei+0x15f>
  108869:	8b 55 10             	mov    0x10(%ebp),%edx
  10886c:	8b 45 14             	mov    0x14(%ebp),%eax
  10886f:	01 d0                	add    %edx,%eax
  108871:	89 45 e8             	mov    %eax,-0x18(%ebp)
  108874:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10887b:	e9 d2 00 00 00       	jmp    108952 <ramfs_writei+0x150>
  108880:	81 7d 10 ff 2f 00 00 	cmpl   $0x2fff,0x10(%ebp)
  108887:	75 06                	jne    10888f <ramfs_writei+0x8d>
  108889:	8b 45 14             	mov    0x14(%ebp),%eax
  10888c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10888f:	8b 5d 14             	mov    0x14(%ebp),%ebx
  108892:	8b 4d 10             	mov    0x10(%ebp),%ecx
  108895:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  108898:	a1 2c 59 11 00       	mov    0x11592c,%eax
  10889d:	53                   	push   %ebx
  10889e:	51                   	push   %ecx
  10889f:	52                   	push   %edx
  1088a0:	50                   	push   %eax
  1088a1:	e8 07 04 00 00       	call   108cad <getchunk>
  1088a6:	83 c4 10             	add    $0x10,%esp
  1088a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1088ac:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  1088b0:	75 0a                	jne    1088bc <ramfs_writei+0xba>
  1088b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1088b7:	e9 a5 00 00 00       	jmp    108961 <ramfs_writei+0x15f>
  1088bc:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  1088c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1088c5:	89 d0                	mov    %edx,%eax
  1088c7:	01 c0                	add    %eax,%eax
  1088c9:	01 d0                	add    %edx,%eax
  1088cb:	c1 e0 03             	shl    $0x3,%eax
  1088ce:	69 d1 f1 01 00 00    	imul   $0x1f1,%ecx,%edx
  1088d4:	01 c2                	add    %eax,%edx
  1088d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1088d9:	01 d0                	add    %edx,%eax
  1088db:	83 c0 10             	add    $0x10,%eax
  1088de:	8b 04 85 ec 41 11 00 	mov    0x1141ec(,%eax,4),%eax
  1088e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1088e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1088eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1088ee:	01 c2                	add    %eax,%edx
  1088f0:	8b 45 10             	mov    0x10(%ebp),%eax
  1088f3:	25 ff 0f 00 00       	and    $0xfff,%eax
  1088f8:	89 c1                	mov    %eax,%ecx
  1088fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1088fd:	01 c8                	add    %ecx,%eax
  1088ff:	83 ec 04             	sub    $0x4,%esp
  108902:	6a 01                	push   $0x1
  108904:	52                   	push   %edx
  108905:	50                   	push   %eax
  108906:	e8 ec c2 ff ff       	call   104bf7 <memmove>
  10890b:	83 c4 10             	add    $0x10,%esp
  10890e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  108912:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  108916:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  10891c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10891f:	89 d0                	mov    %edx,%eax
  108921:	01 c0                	add    %eax,%eax
  108923:	01 d0                	add    %edx,%eax
  108925:	c1 e0 05             	shl    $0x5,%eax
  108928:	69 d9 c4 07 00 00    	imul   $0x7c4,%ecx,%ebx
  10892e:	01 d8                	add    %ebx,%eax
  108930:	05 28 42 11 00       	add    $0x114228,%eax
  108935:	8b 00                	mov    (%eax),%eax
  108937:	8d 58 01             	lea    0x1(%eax),%ebx
  10893a:	89 d0                	mov    %edx,%eax
  10893c:	01 c0                	add    %eax,%eax
  10893e:	01 d0                	add    %edx,%eax
  108940:	c1 e0 05             	shl    $0x5,%eax
  108943:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108949:	01 d0                	add    %edx,%eax
  10894b:	05 28 42 11 00       	add    $0x114228,%eax
  108950:	89 18                	mov    %ebx,(%eax)
  108952:	8b 45 e8             	mov    -0x18(%ebp),%eax
  108955:	39 45 10             	cmp    %eax,0x10(%ebp)
  108958:	0f 82 22 ff ff ff    	jb     108880 <ramfs_writei+0x7e>
  10895e:	8b 45 14             	mov    0x14(%ebp),%eax
  108961:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  108964:	c9                   	leave  
  108965:	c3                   	ret    

00108966 <ramfs_readi>:
  108966:	55                   	push   %ebp
  108967:	89 e5                	mov    %esp,%ebp
  108969:	53                   	push   %ebx
  10896a:	83 ec 24             	sub    $0x24,%esp
  10896d:	8b 45 08             	mov    0x8(%ebp),%eax
  108970:	8b 40 04             	mov    0x4(%eax),%eax
  108973:	89 45 ec             	mov    %eax,-0x14(%ebp)
  108976:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10897d:	8d 45 dc             	lea    -0x24(%ebp),%eax
  108980:	50                   	push   %eax
  108981:	ff 75 ec             	pushl  -0x14(%ebp)
  108984:	e8 04 fe ff ff       	call   10878d <get_currdisc>
  108989:	83 c4 08             	add    $0x8,%esp
  10898c:	a3 2c 59 11 00       	mov    %eax,0x11592c
  108991:	81 7d 10 fe 21 00 00 	cmpl   $0x21fe,0x10(%ebp)
  108998:	75 0c                	jne    1089a6 <ramfs_readi+0x40>
  10899a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10899d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1089a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1089a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1089a6:	8b 5d 14             	mov    0x14(%ebp),%ebx
  1089a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1089ac:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1089af:	a1 2c 59 11 00       	mov    0x11592c,%eax
  1089b4:	53                   	push   %ebx
  1089b5:	51                   	push   %ecx
  1089b6:	52                   	push   %edx
  1089b7:	50                   	push   %eax
  1089b8:	e8 f0 02 00 00       	call   108cad <getchunk>
  1089bd:	83 c4 10             	add    $0x10,%esp
  1089c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1089c3:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
  1089c7:	75 0a                	jne    1089d3 <ramfs_readi+0x6d>
  1089c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1089ce:	e9 f3 00 00 00       	jmp    108ac6 <ramfs_readi+0x160>
  1089d3:	8b 55 10             	mov    0x10(%ebp),%edx
  1089d6:	8b 45 14             	mov    0x14(%ebp),%eax
  1089d9:	01 d0                	add    %edx,%eax
  1089db:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1089de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1089e5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1089ec:	e9 c6 00 00 00       	jmp    108ab7 <ramfs_readi+0x151>
  1089f1:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  1089f7:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1089fa:	89 d0                	mov    %edx,%eax
  1089fc:	01 c0                	add    %eax,%eax
  1089fe:	01 d0                	add    %edx,%eax
  108a00:	c1 e0 05             	shl    $0x5,%eax
  108a03:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108a09:	01 d0                	add    %edx,%eax
  108a0b:	05 28 42 11 00       	add    $0x114228,%eax
  108a10:	8b 00                	mov    (%eax),%eax
  108a12:	39 45 10             	cmp    %eax,0x10(%ebp)
  108a15:	72 08                	jb     108a1f <ramfs_readi+0xb9>
  108a17:	8b 45 f0             	mov    -0x10(%ebp),%eax
  108a1a:	e9 a7 00 00 00       	jmp    108ac6 <ramfs_readi+0x160>
  108a1f:	81 7d 10 00 20 00 00 	cmpl   $0x2000,0x10(%ebp)
  108a26:	75 07                	jne    108a2f <ramfs_readi+0xc9>
  108a28:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  108a2f:	8b 5d 14             	mov    0x14(%ebp),%ebx
  108a32:	8b 4d 10             	mov    0x10(%ebp),%ecx
  108a35:	8b 55 dc             	mov    -0x24(%ebp),%edx
  108a38:	a1 2c 59 11 00       	mov    0x11592c,%eax
  108a3d:	53                   	push   %ebx
  108a3e:	51                   	push   %ecx
  108a3f:	52                   	push   %edx
  108a40:	50                   	push   %eax
  108a41:	e8 67 02 00 00       	call   108cad <getchunk>
  108a46:	83 c4 10             	add    $0x10,%esp
  108a49:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  108a4c:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
  108a50:	75 07                	jne    108a59 <ramfs_readi+0xf3>
  108a52:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  108a57:	eb 6d                	jmp    108ac6 <ramfs_readi+0x160>
  108a59:	8b 0d 2c 59 11 00    	mov    0x11592c,%ecx
  108a5f:	8b 55 dc             	mov    -0x24(%ebp),%edx
  108a62:	89 d0                	mov    %edx,%eax
  108a64:	01 c0                	add    %eax,%eax
  108a66:	01 d0                	add    %edx,%eax
  108a68:	c1 e0 03             	shl    $0x3,%eax
  108a6b:	69 d1 f1 01 00 00    	imul   $0x1f1,%ecx,%edx
  108a71:	01 c2                	add    %eax,%edx
  108a73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  108a76:	01 d0                	add    %edx,%eax
  108a78:	83 c0 10             	add    $0x10,%eax
  108a7b:	8b 04 85 ec 41 11 00 	mov    0x1141ec(,%eax,4),%eax
  108a82:	89 45 ec             	mov    %eax,-0x14(%ebp)
  108a85:	8b 45 10             	mov    0x10(%ebp),%eax
  108a88:	25 ff 0f 00 00       	and    $0xfff,%eax
  108a8d:	89 c2                	mov    %eax,%edx
  108a8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  108a92:	01 c2                	add    %eax,%edx
  108a94:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  108a97:	8b 45 0c             	mov    0xc(%ebp),%eax
  108a9a:	01 c8                	add    %ecx,%eax
  108a9c:	83 ec 04             	sub    $0x4,%esp
  108a9f:	6a 01                	push   $0x1
  108aa1:	52                   	push   %edx
  108aa2:	50                   	push   %eax
  108aa3:	e8 4f c1 ff ff       	call   104bf7 <memmove>
  108aa8:	83 c4 10             	add    $0x10,%esp
  108aab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  108aaf:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  108ab3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  108ab7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  108aba:	39 45 10             	cmp    %eax,0x10(%ebp)
  108abd:	0f 82 2e ff ff ff    	jb     1089f1 <ramfs_readi+0x8b>
  108ac3:	8b 45 14             	mov    0x14(%ebp),%eax
  108ac6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  108ac9:	c9                   	leave  
  108aca:	c3                   	ret    

00108acb <has_ram>:
  108acb:	55                   	push   %ebp
  108acc:	89 e5                	mov    %esp,%ebp
  108ace:	83 ec 18             	sub    $0x18,%esp
  108ad1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  108ad8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  108adf:	eb 19                	jmp    108afa <has_ram+0x2f>
  108ae1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  108ae4:	8b 45 08             	mov    0x8(%ebp),%eax
  108ae7:	01 d0                	add    %edx,%eax
  108ae9:	0f b6 00             	movzbl (%eax),%eax
  108aec:	3c 2f                	cmp    $0x2f,%al
  108aee:	75 06                	jne    108af6 <has_ram+0x2b>
  108af0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  108af4:	7f 1c                	jg     108b12 <has_ram+0x47>
  108af6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  108afa:	83 ec 0c             	sub    $0xc,%esp
  108afd:	ff 75 08             	pushl  0x8(%ebp)
  108b00:	e8 80 c2 ff ff       	call   104d85 <strlen>
  108b05:	83 c4 10             	add    $0x10,%esp
  108b08:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  108b0b:	7c d4                	jl     108ae1 <has_ram+0x16>
  108b0d:	e9 80 00 00 00       	jmp    108b92 <has_ram+0xc7>
  108b12:	90                   	nop
  108b13:	eb 7d                	jmp    108b92 <has_ram+0xc7>
  108b15:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
  108b19:	75 36                	jne    108b51 <has_ram+0x86>
  108b1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  108b1e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  108b21:	69 d2 c4 07 00 00    	imul   $0x7c4,%edx,%edx
  108b27:	81 c2 b0 07 00 00    	add    $0x7b0,%edx
  108b2d:	81 c2 e0 41 11 00    	add    $0x1141e0,%edx
  108b33:	83 c2 04             	add    $0x4,%edx
  108b36:	83 ec 04             	sub    $0x4,%esp
  108b39:	50                   	push   %eax
  108b3a:	ff 75 08             	pushl  0x8(%ebp)
  108b3d:	52                   	push   %edx
  108b3e:	e8 4a c1 ff ff       	call   104c8d <strncmp>
  108b43:	83 c4 10             	add    $0x10,%esp
  108b46:	85 c0                	test   %eax,%eax
  108b48:	75 44                	jne    108b8e <has_ram+0xc3>
  108b4a:	b8 00 00 00 00       	mov    $0x0,%eax
  108b4f:	eb 50                	jmp    108ba1 <has_ram+0xd6>
  108b51:	8b 45 f0             	mov    -0x10(%ebp),%eax
  108b54:	83 e8 01             	sub    $0x1,%eax
  108b57:	89 c1                	mov    %eax,%ecx
  108b59:	8b 45 08             	mov    0x8(%ebp),%eax
  108b5c:	8d 50 01             	lea    0x1(%eax),%edx
  108b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108b62:	69 c0 c4 07 00 00    	imul   $0x7c4,%eax,%eax
  108b68:	05 b0 07 00 00       	add    $0x7b0,%eax
  108b6d:	05 e0 41 11 00       	add    $0x1141e0,%eax
  108b72:	83 c0 04             	add    $0x4,%eax
  108b75:	83 ec 04             	sub    $0x4,%esp
  108b78:	51                   	push   %ecx
  108b79:	52                   	push   %edx
  108b7a:	50                   	push   %eax
  108b7b:	e8 0d c1 ff ff       	call   104c8d <strncmp>
  108b80:	83 c4 10             	add    $0x10,%esp
  108b83:	85 c0                	test   %eax,%eax
  108b85:	75 07                	jne    108b8e <has_ram+0xc3>
  108b87:	b8 00 00 00 00       	mov    $0x0,%eax
  108b8c:	eb 13                	jmp    108ba1 <has_ram+0xd6>
  108b8e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  108b92:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  108b96:	0f 8e 79 ff ff ff    	jle    108b15 <has_ram+0x4a>
  108b9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  108ba1:	c9                   	leave  
  108ba2:	c3                   	ret    

00108ba3 <allocnew>:
  108ba3:	55                   	push   %ebp
  108ba4:	89 e5                	mov    %esp,%ebp
  108ba6:	53                   	push   %ebx
  108ba7:	83 ec 14             	sub    $0x14,%esp
  108baa:	8b 55 0c             	mov    0xc(%ebp),%edx
  108bad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108bb0:	89 d0                	mov    %edx,%eax
  108bb2:	01 c0                	add    %eax,%eax
  108bb4:	01 d0                	add    %edx,%eax
  108bb6:	c1 e0 05             	shl    $0x5,%eax
  108bb9:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108bbf:	01 d0                	add    %edx,%eax
  108bc1:	05 6c 42 11 00       	add    $0x11426c,%eax
  108bc6:	8b 00                	mov    (%eax),%eax
  108bc8:	83 c0 01             	add    $0x1,%eax
  108bcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  108bce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  108bd5:	eb 6c                	jmp    108c43 <allocnew+0xa0>
  108bd7:	e8 0e a1 ff ff       	call   102cea <kalloc>
  108bdc:	89 c3                	mov    %eax,%ebx
  108bde:	8b 55 0c             	mov    0xc(%ebp),%edx
  108be1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108be4:	89 d0                	mov    %edx,%eax
  108be6:	01 c0                	add    %eax,%eax
  108be8:	01 d0                	add    %edx,%eax
  108bea:	c1 e0 03             	shl    $0x3,%eax
  108bed:	69 d1 f1 01 00 00    	imul   $0x1f1,%ecx,%edx
  108bf3:	01 c2                	add    %eax,%edx
  108bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108bf8:	01 d0                	add    %edx,%eax
  108bfa:	83 c0 10             	add    $0x10,%eax
  108bfd:	89 1c 85 ec 41 11 00 	mov    %ebx,0x1141ec(,%eax,4)
  108c04:	8b 55 0c             	mov    0xc(%ebp),%edx
  108c07:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108c0a:	89 d0                	mov    %edx,%eax
  108c0c:	01 c0                	add    %eax,%eax
  108c0e:	01 d0                	add    %edx,%eax
  108c10:	c1 e0 03             	shl    $0x3,%eax
  108c13:	69 d1 f1 01 00 00    	imul   $0x1f1,%ecx,%edx
  108c19:	01 c2                	add    %eax,%edx
  108c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108c1e:	01 d0                	add    %edx,%eax
  108c20:	83 c0 10             	add    $0x10,%eax
  108c23:	8b 04 85 ec 41 11 00 	mov    0x1141ec(,%eax,4),%eax
  108c2a:	83 ec 08             	sub    $0x8,%esp
  108c2d:	68 08 ca 10 00       	push   $0x10ca08
  108c32:	50                   	push   %eax
  108c33:	e8 9b f1 ff ff       	call   107dd3 <vfile_alloc>
  108c38:	83 c4 10             	add    $0x10,%esp
  108c3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  108c3f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  108c43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108c46:	3b 45 14             	cmp    0x14(%ebp),%eax
  108c49:	7e 8c                	jle    108bd7 <allocnew+0x34>
  108c4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  108c4e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108c51:	89 d0                	mov    %edx,%eax
  108c53:	01 c0                	add    %eax,%eax
  108c55:	01 d0                	add    %edx,%eax
  108c57:	c1 e0 05             	shl    $0x5,%eax
  108c5a:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108c60:	01 d0                	add    %edx,%eax
  108c62:	05 6c 42 11 00       	add    $0x11426c,%eax
  108c67:	8b 00                	mov    (%eax),%eax
  108c69:	8d 48 01             	lea    0x1(%eax),%ecx
  108c6c:	8b 55 0c             	mov    0xc(%ebp),%edx
  108c6f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  108c72:	89 d0                	mov    %edx,%eax
  108c74:	01 c0                	add    %eax,%eax
  108c76:	01 d0                	add    %edx,%eax
  108c78:	c1 e0 05             	shl    $0x5,%eax
  108c7b:	69 d3 c4 07 00 00    	imul   $0x7c4,%ebx,%edx
  108c81:	01 d0                	add    %edx,%eax
  108c83:	05 6c 42 11 00       	add    $0x11426c,%eax
  108c88:	89 08                	mov    %ecx,(%eax)
  108c8a:	8b 55 0c             	mov    0xc(%ebp),%edx
  108c8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108c90:	89 d0                	mov    %edx,%eax
  108c92:	01 c0                	add    %eax,%eax
  108c94:	01 d0                	add    %edx,%eax
  108c96:	c1 e0 05             	shl    $0x5,%eax
  108c99:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108c9f:	01 d0                	add    %edx,%eax
  108ca1:	05 6c 42 11 00       	add    $0x11426c,%eax
  108ca6:	8b 00                	mov    (%eax),%eax
  108ca8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  108cab:	c9                   	leave  
  108cac:	c3                   	ret    

00108cad <getchunk>:
  108cad:	55                   	push   %ebp
  108cae:	89 e5                	mov    %esp,%ebp
  108cb0:	53                   	push   %ebx
  108cb1:	83 ec 14             	sub    $0x14,%esp
  108cb4:	8b 45 10             	mov    0x10(%ebp),%eax
  108cb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  108cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108cbd:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  108cc3:	85 c0                	test   %eax,%eax
  108cc5:	0f 48 c2             	cmovs  %edx,%eax
  108cc8:	c1 f8 0c             	sar    $0xc,%eax
  108ccb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  108cce:	8b 55 0c             	mov    0xc(%ebp),%edx
  108cd1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108cd4:	89 d0                	mov    %edx,%eax
  108cd6:	01 c0                	add    %eax,%eax
  108cd8:	01 d0                	add    %edx,%eax
  108cda:	c1 e0 05             	shl    $0x5,%eax
  108cdd:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108ce3:	01 d0                	add    %edx,%eax
  108ce5:	05 70 42 11 00       	add    $0x114270,%eax
  108cea:	8b 00                	mov    (%eax),%eax
  108cec:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  108cef:	7d 08                	jge    108cf9 <getchunk+0x4c>
  108cf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  108cf4:	e9 df 00 00 00       	jmp    108dd8 <getchunk+0x12b>
  108cf9:	8b 55 0c             	mov    0xc(%ebp),%edx
  108cfc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108cff:	89 d0                	mov    %edx,%eax
  108d01:	01 c0                	add    %eax,%eax
  108d03:	01 d0                	add    %edx,%eax
  108d05:	c1 e0 05             	shl    $0x5,%eax
  108d08:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108d0e:	01 d0                	add    %edx,%eax
  108d10:	05 70 42 11 00       	add    $0x114270,%eax
  108d15:	8b 00                	mov    (%eax),%eax
  108d17:	89 45 f0             	mov    %eax,-0x10(%ebp)
  108d1a:	83 7d f0 10          	cmpl   $0x10,-0x10(%ebp)
  108d1e:	75 0a                	jne    108d2a <getchunk+0x7d>
  108d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  108d25:	e9 ae 00 00 00       	jmp    108dd8 <getchunk+0x12b>
  108d2a:	e8 bb 9f ff ff       	call   102cea <kalloc>
  108d2f:	89 c3                	mov    %eax,%ebx
  108d31:	8b 55 0c             	mov    0xc(%ebp),%edx
  108d34:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108d37:	89 d0                	mov    %edx,%eax
  108d39:	01 c0                	add    %eax,%eax
  108d3b:	01 d0                	add    %edx,%eax
  108d3d:	c1 e0 03             	shl    $0x3,%eax
  108d40:	69 d1 f1 01 00 00    	imul   $0x1f1,%ecx,%edx
  108d46:	01 c2                	add    %eax,%edx
  108d48:	8b 45 f0             	mov    -0x10(%ebp),%eax
  108d4b:	01 d0                	add    %edx,%eax
  108d4d:	83 c0 10             	add    $0x10,%eax
  108d50:	89 1c 85 ec 41 11 00 	mov    %ebx,0x1141ec(,%eax,4)
  108d57:	8b 55 0c             	mov    0xc(%ebp),%edx
  108d5a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108d5d:	89 d0                	mov    %edx,%eax
  108d5f:	01 c0                	add    %eax,%eax
  108d61:	01 d0                	add    %edx,%eax
  108d63:	c1 e0 05             	shl    $0x5,%eax
  108d66:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108d6c:	01 d0                	add    %edx,%eax
  108d6e:	05 70 42 11 00       	add    $0x114270,%eax
  108d73:	8b 00                	mov    (%eax),%eax
  108d75:	8d 48 01             	lea    0x1(%eax),%ecx
  108d78:	8b 55 0c             	mov    0xc(%ebp),%edx
  108d7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  108d7e:	89 d0                	mov    %edx,%eax
  108d80:	01 c0                	add    %eax,%eax
  108d82:	01 d0                	add    %edx,%eax
  108d84:	c1 e0 05             	shl    $0x5,%eax
  108d87:	69 d3 c4 07 00 00    	imul   $0x7c4,%ebx,%edx
  108d8d:	01 d0                	add    %edx,%eax
  108d8f:	05 70 42 11 00       	add    $0x114270,%eax
  108d94:	89 08                	mov    %ecx,(%eax)
  108d96:	8b 55 0c             	mov    0xc(%ebp),%edx
  108d99:	8b 4d 08             	mov    0x8(%ebp),%ecx
  108d9c:	89 d0                	mov    %edx,%eax
  108d9e:	01 c0                	add    %eax,%eax
  108da0:	01 d0                	add    %edx,%eax
  108da2:	c1 e0 05             	shl    $0x5,%eax
  108da5:	69 d1 c4 07 00 00    	imul   $0x7c4,%ecx,%edx
  108dab:	01 d0                	add    %edx,%eax
  108dad:	05 6c 42 11 00       	add    $0x11426c,%eax
  108db2:	8b 00                	mov    (%eax),%eax
  108db4:	8d 48 01             	lea    0x1(%eax),%ecx
  108db7:	8b 55 0c             	mov    0xc(%ebp),%edx
  108dba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  108dbd:	89 d0                	mov    %edx,%eax
  108dbf:	01 c0                	add    %eax,%eax
  108dc1:	01 d0                	add    %edx,%eax
  108dc3:	c1 e0 05             	shl    $0x5,%eax
  108dc6:	69 d3 c4 07 00 00    	imul   $0x7c4,%ebx,%edx
  108dcc:	01 d0                	add    %edx,%eax
  108dce:	05 6c 42 11 00       	add    $0x11426c,%eax
  108dd3:	89 08                	mov    %ecx,(%eax)
  108dd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  108dd8:	83 c4 14             	add    $0x14,%esp
  108ddb:	5b                   	pop    %ebx
  108ddc:	5d                   	pop    %ebp
  108ddd:	c3                   	ret    
