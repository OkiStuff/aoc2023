.assembly PartOne
{
}

.module PartOne.exe

.class private PartOne.Program
{
	.method public hidebysig static bool isNumber(char a) cil managed
	{
		.maxstack 8
		// a < '0' return false
		ldarg.0
		ldc.i4.s 48
		blt.s RET_FALSE
		
		// a > '9' return false
		ldarg.0
		ldc.i4.s 57
		bgt.s RET_FALSE
		
		RET_TRUE:
			ldc.i4.1
			ret
		
		RET_FALSE:
			ldc.i4.0
			ret
	}
	
	.method public hidebysig static int32 charToNumber(char a) cil managed
	{
		.maxstack 4
		ldarg.0
		ldc.i4.s 48 // '0'
		sub
		ret
	}
	
	.method public hidebysig static int32 concatToInt(char a, char b) cil managed
	{
		.maxstack 8
		.locals init (
			[0] char[] chararr
		)
		
		// Concat the characters
		ldc.i4.2
		newarr [mscorlib]System.Char
		stloc.0
		
		ldloc.0
		ldc.i4.0
		ldarg.0
		stelem.i4
		
		ldloc.0
		ldc.i4.1
		ldarg.1
		stelem.i4
		
		ldloc.0
		newobj instance void [mscorlib]System.String::.ctor(char[])
		call int32 [mscorlib]System.Int32::Parse(string)
		ret
	}

	.method private hidebysig static void Main(string[] args) cil managed
	{
		.entrypoint
		.maxstack 8
		.locals init (
			[0] int32 result,
			[1] char num1,
			[2] class [mscorlib]System.IO.StreamReader reader,
			[3] char[] buffer,
			[4] int32 index,
			[5] char num2
		)
		
		// Load File
		ldstr "Puzzle.txt"
		newobj instance void [mscorlib]System.IO.StreamReader::.ctor(string)
		stloc.2
		ldloc.2
		
		// Read File
		callvirt instance class [mscorlib]System.IO.Stream [mscorlib]System.IO.StreamReader::get_BaseStream()
		callvirt instance int64 [mscorlib]System.IO.Stream::get_Length()
		conv.i4
		newarr [mscorlib]System.Char
		stloc.3
		ldloc.2
		ldloc.3
		ldc.i4.0
		ldloc.2
		callvirt instance class [mscorlib]System.IO.Stream [mscorlib]System.IO.StreamReader::get_BaseStream()
		callvirt instance int64 [mscorlib]System.IO.Stream::get_Length()
		conv.i4
		callvirt instance int32 [mscorlib]System.IO.TextReader::Read(char[], int32, int32)
		pop
		
		// Close File
		ldloc.2
		callvirt instance void [mscorlib]System.IO.TextReader::Close()
		
		// Parse
		/// Initialize Values
		ldc.i4.0
		stloc.0
		
		ldc.i4.0
		stloc.1
		
		ldc.i4.0
		stloc 5
		
		ldc.i4.0
		stloc 4
		
		PARSE_LOOP_BEGIN:
			ldloc.3
			ldlen
			conv.i4
			bge.s AFTER_PARSE // if index >= length: exit
			
		PARSE_LOOP_CHECK_NEWLINE:
			ldc.i4.s 10 // '\n'
			ldloc.3
			ldloc 4
			ldelem.u2
			ceq
			brzero.s PARSE_LOOP_CONTINUE
			
			// TODO: Check if currnum == -1: result += new String(lastnum + lastnum).toInteger()
			ldloc 5
			brzero.s CONCAT_NUMONE
			ldloc.1
			ldloc 5
			br.s CONCAT
		
		CONCAT_NUMONE:
			ldloc.1
			ldloc.1
		
		CONCAT:
			call int32 PartOne.Program::concatToInt(char, char)
			ldloc.0
			add
			stloc.0
			
			ldc.i4.0
			stloc.1
			
			ldc.i4.0
			stloc 5
		
		PARSE_LOOP_RESTART:
			// index++
			ldloc 4
			ldc.i4.1
			add
			stloc 4
			br.s PARSE_LOOP_BEGIN
			
		PARSE_LOOP_CONTINUE:
			ldloc.3
			ldloc 4
			ldelem.u2
			call bool PartOne.Program::isNumber(char)
			brfalse.s PARSE_LOOP_RESTART
			
			// if num1 == null: num1 = buffer[index]
			ldloc.1
			brzero.s SET_NUMONE
			ldloc.3
			ldloc 4
			ldelem.u2
			stloc 5
			br.s PARSE_LOOP_RESTART
		
		SET_NUMONE:
			ldloc.3
			ldloc 4
			ldelem.u2
			stloc.1
			br.s PARSE_LOOP_RESTART
			
		AFTER_PARSE:
			ldstr "The sum of all of the calibration values is: "
			call void [mscorlib]System.Console::Write(string)
			ldloc.0
			call void [mscorlib]System.Console::WriteLine(int32)
			ret
	}
	
	.method public hidebysig specialname rtspecialname instance void .ctor() cil managed
	{
		.maxstack 8
		ldarg.0
		call instance void [mscorlib]System.Object::ctor()
		ret
	}
}