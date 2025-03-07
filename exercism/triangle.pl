/*

triangle(A, B, C, R).
	Es cierto si R unifica con "equilateral"
	y A, B y C y corresponden a la longitud de un triangulo equilatero.
	
	Es cierto si R unifica con "isosceles"
	y A, B y C y corresponden a la longitud de un triangulo isosceles.
	
	Es cierto si R unifica con "scalene"
	y A, B y C y corresponden a la longitud de un triangulo escaleno.
	
	Note
	For a shape to be a triangle at all, all sides have to be of length > 0, and the sum of the lengths 
	of any two sides must be greater than or equal to the length of the third side.

	In equations:

	Let a, b, and c be sides of the triangle. Then all three of the following expressions must be true:

	a + b ≥ c
	b + c ≥ a
	a + c ≥ b

Simplificación

triangle(A, B, C) 
	Es cierto si A, B y C corresponden a las longitudes de los lados de un triangulo


*/

triangle(A, B, C):- A > 0, B > 0, C > 0, A + B >= C, B + C >= A, A + C >= B.

triangle(A, B, C, "equilateral"):- triangle(A, B, C), A == B, A == C, B == C.

triangle(A, B, C, "isosceles"):- triangle(A, B, C), A == B.
triangle(A, B, C, "isosceles"):- triangle(A, B, C), B == C.
triangle(A, B, C, "isosceles"):- triangle(A, B, C), A == C.

triangle(A, B, C, "scalene"):- triangle(A, B, C), A \= B, A \= C, B \= C.

