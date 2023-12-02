.assembly HelloWorld
{
}

.module HelloWorld.exe

.class private HelloWorld.Program
{
	.method private hidebysig static void Main(string[] args) cil managed
	{
		.entrypoint
		.maxstack 8
		nop
		ldstr "Hello, World!"
		call void [mscorlib]System.Console::WriteLine(string)
		nop
		ret
	}
	
	.method public hidebysig specialname rtspecialname instance void .ctor() cil managed
	{
		.maxstack 8
		IL_0000: ldarg.0
		IL_0001: call instance void [mscorlib]System.Object::.ctor()
		IL_0006: ret
	}
}
