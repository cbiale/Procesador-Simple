# Procesador monociclo

Autor: Claudio Omar Biale

## Arquitectura propuesta

- Procesador monociclo, basado en arquitectura RISC y Harvard de 16 bits.
- 8 registros de 16 bits (`r0`..`r8`).
- Memoria de instrucciones direccionable de 16 bits con ancho de memoria de 16 bits.
- Memoria de datos direccionable de 16 bits con ancho de memoria de 16 bits.

## Instrucciones:

| Instrucción        | Descripción                                       |
|--------------------|---------------------------------------------------|
| sum rd, rf1, rf2   | Suma rf1 y rf2, almacena en rd                    |
| sub rd, rf1, rf2   | Resta rf1 de rf2, almacena en rd                  |
| je rf1, rf2, inm   | Salta a pc+inm si rf1 es igual a rf2              |
| jne rf1, rf2, inm  | Salta a pc+inm si rf1 no es igual a rf2           |
| load rd, rf1, rf2  | Carga en rd el valor de la dirección rf1 + rf2    |
| store rd, rf1, rf2 | Almacena en rd el valor de la dirección rf1 + rf2 |
| in rd              | Obtiene de la UART el valor de rd                 |
| out rd             | Envía a la UART el valor de rd                    |

Formato de instrucciones:

| Instrucción        | opcode | rf1    | rf2    | rd     | 0      |
|--------------------|--------|--------|--------|--------|--------|
| sum rd, rf1, rf2   | 3 bits | 3 bits | 3 bits | 3 bits | 4 bits |
| sub rd, rf1, rf2   | 3 bits | 3 bits | 3 bits | 3 bits | 4 bits |
| load rd, rf1, rf2  | 3 bits | 3 bits | 3 bits | 3 bits | 4 bits |
| store rd, rf1, rf2 | 3 bits | 3 bits | 3 bits | 3 bits | 4 bits |

| Instrucción        | opcode | rf1    | rf2    | inm    |
|--------------------|--------|--------|--------|--------|
| je rf1, rf2, inm   | 3 bits | 3 bits | 3 bits | 7 bits |
| jne rf1, rf2, inm  | 3 bits | 3 bits | 3 bits | 7 bits |

| Instrucción      | opcode | 0      | rd      | 0       |
|------------------|--------|--------|---------|---------|
| in rd            | 3 bits | 6 bits | 3 bits  | 4 bits  |
| out rd           | 3 bits | 6 bits | 3 bits  | 4 bits  |

Opcodes:

- sum: 000
- sub: 001
- load: 010
- store: 011
- je: 100
- jne: 101
- in: 110
- out: 111

## Esquema

(Pendiente)

## Cambios a futuro

- Realizar pruebas de la memoria de instrucciones y memoria de datos.
- Se ha agregado reset al procesador (pero no se ha implementado en todos los niveles).
- Agregar `loadi`, implica ampliar opcode a 4 bits o cambiar formato de instrucciones de `add` y `sub` y ver si es solo `inm`  o `rf1 + inm`.
- Implementar `in` y `out`.
