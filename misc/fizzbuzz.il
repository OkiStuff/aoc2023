.assembly FizzBuzz
{
}

.module FizzBuzz.exe

.class private FizzBuzz.Program
{
	.method private hidebysig static void Main(string[] args) cil managed
	{
		.entrypoint
		.maxstack 8
		.locals init (
			[0] int32 num
		)
		
		L_0000: ldc.i4.1 // Push 0 to stack for counter
		L_0001: stloc.0 // Pop 0 from stack and put into local variable [0]
		L_0002: ldloc.0 // Pushes the value of variable [0] into stack
		L_0003: ldc.i4 100 // Pushes 100 to stack
		L_0004: clt // i < 100
		L_0005: brfalse.s L_00ee // if not i < 100: goto L_00ee
		L_0006: ldloc.0
		L_0007: ldc.i4.3
		L_0008: rem
		L_0009: ldc.i4.0
		L_000a: ceq
		L_000b: brtrue.s L_00a0
		L_000c: ldloc.0
		L_000d: ldc.i4.5
		L_000e: rem
		L_000f: ldc.i4.0
		L_0010: ceq
		L_0011: brtrue.s L_00b0
		L_0012: ldloc.0
		L_0013: call void [mscorlib]System.Console::Write(int32)
		L_0014: ldstr "\n"
		L_0015: call void [mscorlib]System.Console::Write(string)
		L_0016: ldloc.0
		L_0017: ldc.i4.1
		L_0018: add
		L_0019: stloc.0
		L_001a: br.s L_0002
		
		// if i % 3 == 0:
		L_00a0: ldstr "Fizz"
		L_00a1: call void [mscorlib]System.Console::Write(string)
		L_00a2: ldloc.0
		L_00a3: ldc.i4.5
		L_00a4: rem
		L_00a5: ldc.i4.0
		L_00a6: ceq
		L_00a7: brtrue.s L_00b0
		L_00a8: br.s L_0014
		
		// if i % 5 == 0:
		L_00b0: ldstr "Buzz"
		L_00b1: call void [mscorlib]System.Console::Write(string)
		L_00b2: br.s L_0014
		
	    L_00ee: ret
	}
	
	.method public hidebysig specialname rtspecialname instance void .ctor() cil managed
	{
		.maxstack 8
		IL_0000: ldarg.0
		IL_0001: call instance void [mscorlib]System.Object::.ctor()
		IL_0006: ret
	}
}